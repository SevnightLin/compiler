# 试点班编译器实验

## 一、编译器结构

### 1.词法分析

工具：**flex**

->tokens

### 2.语法分析

工具：**bison**

->抽象语法树ast

### 3.语义分析

#### 3.1 建立符号表和作用域

对ast进行**第一遍**递归遍历

访问每个ast结点时进行**创建相应符号**并通过ASTNode对象的ATTR(sym)属性进行**绑定**，方便后续调用，同时也将符号**加入作用域**

**作用域主要定义**：

```c++
class Scope {
  protected:
    // the underlying map
    std::unordered_map<std::string, symb::Symbol *> _syms;

  public:
    // kind of the scopes
    typedef enum { GLOBAL, FUNCTION, LOCAL } kind_t;
```

简单来说作用域就是一个存储符号和符号名的**map**，分成三种类型**全局、函数、局部**，并且具有层次结构，便于查找

例如**访问函数定义**或**全局变量**时会将相应**符号**加入全局作用域

#### 3.2 类型检查

对ast进行**第二遍**递归遍历

主要判断类型是否**匹配**

### 4.生成IR

IR为**三地址码**

在这里，我们定义了一个TransHelper来帮助我们生成ir，主要功能有**分配临时变量和标签、获取临时变量和标签、生成每个指令的ir**

我们这时对ast结点进行**第三次**递归遍历，生成三地址码（**Piece list**）

tac结点以链表的形式存储（通过**chain**函数），每个**函数**或**全局变量**为一个**Piece**，便于后续优化

### 5.生成riscv汇编

Piece有两类，分别是函数FUNCTY和全局变量GLOBAL，全局变量生成汇编较为容易

函数生成汇编时：

1. 创建栈帧管理器

2. 建立CFG （划分基本块等）

3. 对CFG进行简单优化（计算入度并消除入度为0的块）

4. **活跃性分析**（计算LiveOut）

   ![img](https://decaf-lang.github.io/minidecaf-tutorial/docs/step7/pics/formula.png)

5. 在栈帧中保存活跃变量

6. 对基本块进行活跃性分析，分配寄存器生成汇编

优化：

+ 无关代码消除

## 二、实现功能

### 1.一元操作

| 节点         | 成员       | 含义     |
| ------------ | ---------- | -------- |
| `NegExpr`    | 操作数 `e` | 一元负号 |
| `NotExpr`    | 操作数 `e` | 逻辑取反 |
| `BitNotExpr` | 操作数 `e` | 按位取反 |

1.1 一元负号`NegExpr`

```c++
//翻译，第三次遍历
void Translation::visit(ast::NegExpr *e) {
    e->e->accept(this);

    e->ATTR(val) = tr->genNeg(e->e->ATTR(val));	//绑定新申请的临时变量
}

//生成tac
Temp TransHelper::genNeg(Temp src) {
    Temp c = getNewTempI4();
    //加入tac链
    chainUp(Tac::Neg(c, src));
    return c;
}

Tac *Tac::Neg(Temp dest, Temp src) {
    REQUIRE_I4(dest);
    REQUIRE_I4(src);

    Tac *t = allocateNewTac(Tac::NEG);
    t->op0.var = dest;	//目的操作数
    t->op1.var = src;	//源操作数

    return t;
}

//生成汇编
case Tac::NEG:
        emitUnaryTac(RiscvInstr::NEG, t);
        break;

void RiscvDesc::emitUnaryTac(RiscvInstr::OpCode op, Tac *t) {
    // eliminates useless assignments
    if (!t->LiveOut->contains(t->op0.var))
        return;

    int r1 = getRegForRead(t->op1.var, 0, t->LiveOut);
    int r0 = getRegForWrite(t->op0.var, r1, 0, t->LiveOut);

    addInstr(op, _reg[r0], _reg[r1], NULL, 0, EMPTY_STR, NULL);
}
```

### 2.二元运算

#### 2.1 加减乘除模

语法分析时进行优先级定义：

```
%left     ASSIGN
%nonassoc QUESTION
%left     OR
%left     AND
%left EQU NEQ
%left LEQ GEQ LT GT
%left     PLUS MINUS
%left     TIMES SLASH MOD
%nonassoc LNOT NEG BNOT
%nonassoc LBRACK DOT
```

```c++
void Translation::visit(ast::AddExpr *e) {
    e->e1->accept(this);
    e->e2->accept(this);
    e->ATTR(val) = tr->genAdd(e->e1->ATTR(val), e->e2->ATTR(val));
}

Temp TransHelper::genAdd(Temp a, Temp b) {
    Temp c = getNewTempI4();
    chainUp(Tac::Add(c, a, b));
    return c;
}

Tac *Tac::Add(Temp dest, Temp op1, Temp op2) {
    REQUIRE_I4(dest);
    REQUIRE_I4(op1);
    REQUIRE_I4(op2);

    Tac *t = allocateNewTac(Tac::ADD);
    t->op0.var = dest;
    t->op1.var = op1;
    t->op2.var = op2;

    return t;
}

case Tac::ADD:
        emitBinaryTac(RiscvInstr::ADD, t);
        break;

void RiscvDesc::emitBinaryTac(RiscvInstr::OpCode op, Tac *t) {
    // eliminates useless assignments
    if (!t->LiveOut->contains(t->op0.var))
        return;

    Set<Temp>* liveness = t->LiveOut->clone();
    liveness->add(t->op1.var);
    liveness->add(t->op2.var);
    //不希望倒霉蛋是op1或op2
    int r1 = getRegForRead(t->op1.var, 0, liveness);
    int r2 = getRegForRead(t->op2.var, r1, liveness);
    int r0 = getRegForWrite(t->op0.var, r1, r2, liveness);

    addInstr(op, _reg[r0], _reg[r1], _reg[r2], 0, EMPTY_STR, NULL);
}

case RiscvInstr::ADD:
        oss << "add" << i->r0->name << ", " << i->r1->name << ", " << i->r2->name;
        break;
```

#### 2.2 逻辑运算

实现了逻辑**与**和逻辑**或**，在生成汇编时实现

逻辑与：

```assembly
snez d, s1
sub d, zero, d
and d, d, s2
snez d, d;
```

逻辑或:

```assembly
or t3,t1,t2 
snez t3,t3
```

实际代码：

```c++
case RiscvInstr::AND:
        //oss << "and" << i->r0->name << ", " << i->r1->name << "," << i->r2->name;
        oss << "snez" << i->r0->name << ", " << i->r1->name;
        newLine(oss);
        oss << "          ";
        oss << std::left << std::setw(6);
        oss << "sub" << i->r0->name << ", " << "zero" << ", " << i->r0->name;
        newLine(oss);
        oss << "          ";
        oss << std::left << std::setw(6);
        oss << "and" << i->r0->name << ", " << i->r0->name << "," << i->r2->name;
        newLine(oss);
        oss << "          ";
        oss << std::left << std::setw(6);
        oss << "snez" << i->r0->name << ", " << i->r0->name;
        break;
    
    case RiscvInstr::OR:
        //oss << "or" << i->r0->name << ", " << i->r1->name << "," << i->r2->name;
        oss << "or" << i->r0->name << ", " << i->r1->name << "," << i->r2->name;
        newLine(oss);
        oss << "          ";
        oss << std::left << std::setw(6);
        oss << "snez" << i->r0->name << ", " << i->r0->name;
        break; 
```
**短路求值**
```c++
/* Translating an ast::AndExpr node.
 */
void Translation::visit(ast::AndExpr *e) {
    // e->e1->accept(this);
    // e->e2->accept(this);
    // e->ATTR(val) = tr->genLAnd(e->e1->ATTR(val), e->e2->ATTR(val));
    Label L1 = tr->getNewLabel(); 
    Label L2 = tr->getNewLabel(); 
    e->e1->accept(this);

    tr->genJumpOnZero(L1, e->e1->ATTR(val));
    e->e2->accept(this);
    //tr->genJumpOnZero(L1, e->e2->ATTR(val));
    e->ATTR(val) = tr->genLAnd(e->e1->ATTR(val), e->e2->ATTR(val));
    tr->genJump(L2); // done

    tr->genMarkLabel(L1);
    //temp = tr->genSnez(temp);
    tr->genSnez(e->ATTR(val),e->e1->ATTR(val));
    tr->genMarkLabel(L2);
}
```
#### 2.3 比较运算

实现了小于LesExpr、大于GrtExpr、小于等于LeqExpr、大于等于GeqExpr、等于EquExpr、不等于NeqExpr，和加减乘除类似

### 3.变量的定义和赋值

支持**整型**和**整型数组**

数组只支持单个元素赋值

### 4.作用域与块语句

+ 全局作用域
+ 函数作用域
+ 局部作用域

通过作用域栈来维护

### 5.条件语句

```c++
void Translation::visit(ast::IfExpr *e){
    Label L1 = tr->getNewLabel(); // entry of the false branch
    Label L2 = tr->getNewLabel(); // exit
    e->condition->accept(this);
    Temp temp = tr->getNewTempI4();
    tr->genJumpOnZero(L1, e->condition->ATTR(val));		//跳转到false branch

    e->true_brch->accept(this);			//true branch
    tr->genAssign(temp, e->true_brch->ATTR(val));
    tr->genJump(L2); // 执行完true branch跳转到L2

    tr->genMarkLabel(L1);				//false branch的标签
    e->false_brch->accept(this);		//false branch
    tr->genAssign(temp, e->false_brch->ATTR(val));

    tr->genMarkLabel(L2);				//走出if
    
    e->ATTR(val) = temp;
}
```

### 6.循环语句

实现了**for**循环和**while**循环

以及**break**和**continue**语句

```c++
void Translation::visit(ast::WhileStmt *s) {
    Label L1 = tr->getNewLabel();
    Label L2 = tr->getNewLabel();
    //保存之前的标签
    Label old_break = current_break_label;
    Label old_continue = current_continue_label;
    current_break_label = L2;   //循环后标签
    current_continue_label = L1;    //循环前标签

    tr->genMarkLabel(L1);
    s->condition->accept(this);
    tr->genJumpOnZero(L2, s->condition->ATTR(val)); //条件不满足则跳出循环

    s->loop_body->accept(this);     //循环体
    tr->genJump(L1);    //跳转回循环开始

    tr->genMarkLabel(L2);
    //恢复之前的标签
    current_break_label = old_break;    //更新
    current_continue_label = old_continue;
}

/* Translating an ast::BreakStmt node.
 */
void Translation::visit(ast::BreakStmt *s) { tr->genJump(current_break_label); }
/* Translating an ast::ContinueStmt node.
 */
void Translation::visit(ast::ContinueStmt *s) { tr->genJump(current_continue_label); }
```

### 7.函数

#### 7.1 函数定义

建立符号表时开启函数作用域并且将参数加入

类型检查时检查返回值

翻译时计算偏移，建立Piece

#### 7.2 函数调用

在类型检查时绑定符号，并检查参数个数

翻译时生成参数，call函数的entry lable

### 8.未实现功能

1. 数组整体初始化
2. 输入输出
3. 一元运算符有问题