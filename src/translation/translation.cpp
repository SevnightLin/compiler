/*****************************************************
 *  Implementation of the third translation pass.
 *
 *  In the third pass, we will:
 *    translate all the statements and expressions
 *
 *  Keltin Leung 
 */

#include "translation.hpp"
#include "asm/offset_counter.hpp"
#include "ast/ast.hpp"
#include "compiler.hpp"
#include "config.hpp"
#include "scope/scope.hpp"
#include "symb/symbol.hpp"
#include "tac/tac.hpp"
#include "tac/trans_helper.hpp"
#include "type/type.hpp"

using namespace mind;
using namespace mind::symb;
using namespace mind::tac;
using namespace mind::type;
using namespace mind::assembly;

/* Constructor.
 *
 * PARAMETERS:
 *   helper - the translation helper
 */
Translation::Translation(tac::TransHelper *helper) {
    mind_assert(NULL != helper);

    tr = helper;
}

/* Translating an ast::Program node.
 */
void Translation::visit(ast::Program *p) {
    for (auto it = p->func_and_globals->begin();
         it != p->func_and_globals->end(); ++it)
        (*it)->accept(this);
}

// three sugars for parameter offset management
#define RESET_OFFSET() tr->getOffsetCounter()->reset(OffsetCounter::PARAMETER)
#define NEXT_OFFSET(x) tr->getOffsetCounter()->next(OffsetCounter::PARAMETER, x)

/* Translating an ast::FuncDefn node.
 *
 * NOTE:
 *   call tr->startFunc() before translating the statements and
 *   call tr->endFunc() after all the statements have been translated
 */
void Translation::visit(ast::FuncDefn *f) {
    Function *fun = f->ATTR(sym);

    // attaching function entry label
    fun->attachEntryLabel(tr->getNewEntryLabel(fun));

    // arguments
    int order = 0;
    for (auto it = f->formals->begin(); it != f->formals->end(); ++it) {
        auto v = (*it)->ATTR(sym);
        v->setOrder(order++);
        v->attachTemp(tr->getNewTempI4());
    }

    fun->offset = fun->getOrder() * POINTER_SIZE;

    RESET_OFFSET();

    // the other formal arguments
    for (ast::VarList::iterator it = f->formals->begin();
         it != f->formals->end(); ++it) {
        Variable *v = (*it)->ATTR(sym);
        v->offset = NEXT_OFFSET(v->getTemp()->size);
    }
    //生成piece
    tr->startFunc(fun);

    // translates statement by statement
    for (auto it = f->stmts->begin(); it != f->stmts->end(); ++it)
        (*it)->accept(this);

    tr->genReturn(tr->genLoadImm4(0)); // Return 0 by default

    tr->endFunc();
}

/* Translating an ast::CallExpr node.
 */
void Translation::visit(ast::CallExpr *e){
    //递归参数表达式
    for(auto expr : *(e->expr_list)){
        expr->accept(this); 
        //tr->genAssign(tr->getNewTempI4(), expr->ATTR(val));
        //e->ATTR(val) = expr->ATTR(val);
        assert(expr->ATTR(val) != NULL);
    }
    //生成参数
    for(auto expr : *(e->expr_list)){
        tr->genParam(expr->ATTR(val)); 
    }
    e->ATTR(val) = tr->genCall(e->ATTR(sym)->getEntryLabel());
    assert(e->ATTR(val) != NULL);
    /*for(auto expr : *(e->expr_list)){
        tr->genPop();
    }*/
}

/* Translating an ast::AssignStmt node.
 *
 * NOTE:
 *   different kinds of Lvalue require different translation
 */
void Translation::visit(ast::AssignExpr *s) {
    s->left->accept(this);
    s->e->accept(this);
    ast::VarRef *ref = (ast::VarRef *)(s->left);
    if(ref->ATTR(sym)->isGlobalVar()){
        Temp temp = tr->genLoadSymbol(ref->var);
        if(ref->ATTR(lv_kind) == ast::Lvalue::ARRAY_ELE)    //数组赋值
            temp = tr->genAdd(temp, ref->expr->ATTR(val));  
        tr->genStore(s->e->ATTR(val), temp, 0);
    }
    else{
        if(ref->ATTR(lv_kind) == ast::Lvalue::ARRAY_ELE){
            Temp temp = tr->genAdd(ref->ATTR(sym)->getTemp(), ref->expr->ATTR(val));
            tr->genStore(s->e->ATTR(val), temp, 0);
        }
        else {
            Temp temp = ref->ATTR(sym)->getTemp();
            tr->genAssign(temp, s->e->ATTR(val)); 
        }
    }
    s->ATTR(val) = s->e->ATTR(val);
}

/* Translating an ast::ExprStmt node.
 */
void Translation::visit(ast::ExprStmt *s) { s->e->accept(this); }

/* Translating an ast::IfStmt node.
 *
 * NOTE:
 *   you don't need to test whether the false_brch is empty
 */
void Translation::visit(ast::IfStmt *s) {
    Label L1 = tr->getNewLabel(); // entry of the false branch
    Label L2 = tr->getNewLabel(); // exit
    s->condition->accept(this);
    tr->genJumpOnZero(L1, s->condition->ATTR(val));

    s->true_brch->accept(this);
    tr->genJump(L2); // done

    tr->genMarkLabel(L1);
    s->false_brch->accept(this);

    tr->genMarkLabel(L2);
}
/* Translating an ast::WhileStmt node.
 */
void Translation::visit(ast::WhileStmt *s) {
    Label L1 = tr->getNewLabel();
    Label L2 = tr->getNewLabel();
    //保存之前的标签
    Label old_break = current_break_label;
    Label old_continue = current_continue_label;
    current_break_label = L2;   //循环后标签
    current_continue_label = L1;    //循环前标签

    tr->genMarkLabel(L1);       //入口
    s->condition->accept(this);
    tr->genJumpOnZero(L2, s->condition->ATTR(val)); //条件不满足则跳出循环

    s->loop_body->accept(this);     //循环体
    tr->genJump(L1);    //跳转回循环开始

    tr->genMarkLabel(L2);       //出口
    //恢复之前的标签
    current_break_label = old_break;    //更新
    current_continue_label = old_continue;
}
/* Translating an ast::ForStmt node.
 */
void Translation::visit(ast::ForStmt *s) {
    if(s->init != NULL){
        s->init->accept(this);
    }
    Label L1 = tr->getNewLabel();
    Label L2 = tr->getNewLabel();
    Label L3 = tr->getNewLabel();

    Label old_break = current_break_label;
    Label old_continue = current_continue_label;
    current_break_label = L2;
    current_continue_label = L3;

    if(s->first_condition != NULL){
        s->first_condition->accept(this);
        tr->genJumpOnZero(L2, s->first_condition->ATTR(val));
    }
    
    tr->genMarkLabel(L1);

    s->loop_body->accept(this);

    tr->genMarkLabel(L3);
    if(s->update != NULL)
        s->update->accept(this);

    if(s->condition != NULL){
        s->condition->accept(this);
        tr->genJumpOnZero(L2, s->condition->ATTR(val));
    }
    tr->genJump(L1);
    tr->genMarkLabel(L2);

    current_break_label = old_break;
    current_continue_label = old_continue;
}
/* Translating an ast::BreakStmt node.
 */
void Translation::visit(ast::BreakStmt *s) { tr->genJump(current_break_label); }
/* Translating an ast::ContinueStmt node.
 */
void Translation::visit(ast::ContinueStmt *s) { tr->genJump(current_continue_label); }
/* Translating an ast::CompStmt node.
 */
void Translation::visit(ast::CompStmt *c) {
    // translates statement by statement
    for (auto it = c->stmts->begin(); it != c->stmts->end(); ++it)
        (*it)->accept(this);
}
/* Translating an ast::ReturnStmt node.
 */
void Translation::visit(ast::ReturnStmt *s) {
    s->e->accept(this);
    tr->genReturn(s->e->ATTR(val));
}
/* Translating an ast::EquExpr node.
 */
void Translation::visit(ast::EquExpr *e) {
    e->e1->accept(this);
    e->e2->accept(this);
    e->ATTR(val) = tr->genEqu(e->e1->ATTR(val), e->e2->ATTR(val));
}

/* Translating an ast::NeqExpr node.
 */
void Translation::visit(ast::NeqExpr *e) {
    e->e1->accept(this);
    e->e2->accept(this);
    e->ATTR(val) = tr->genNeq(e->e1->ATTR(val), e->e2->ATTR(val));
}

/* Translating an ast::AndExpr node.
 */
void Translation::visit(ast::AndExpr *e) {
    // e->e1->accept(this);
    // e->e2->accept(this);
    // e->ATTR(val) = tr->genLAnd(e->e1->ATTR(val), e->e2->ATTR(val));
    Label L1 = tr->getNewLabel(); // entry of the false branch
    Label L2 = tr->getNewLabel(); // exit
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
/* Translating an ast::OrExpr node.
 */
void Translation::visit(ast::OrExpr *e) {
    e->e1->accept(this);
    e->e2->accept(this);
    e->ATTR(val) = tr->genLOr(e->e1->ATTR(val), e->e2->ATTR(val));

    // Label L1 = tr->getNewLabel(); // entry of the false branch
    // Label L2 = tr->getNewLabel(); // exit
    // e->e1->accept(this);

    // tr->genJumpOnZero(L1, e->e1->ATTR(val));
    // tr->genSnez(e->ATTR(val),e->e1->ATTR(val));
    // tr->genJump(L2); // done

    // tr->genMarkLabel(L1);
    // //temp = tr->genSnez(temp);
    // e->e2->accept(this);
    // //tr->genJumpOnZero(L1, e->e2->ATTR(val));
    // //e->ATTR(val) = tr->genLOr(e->e1->ATTR(val), e->e2->ATTR(val));
    // tr->genSnez(e->ATTR(val),e->e2->ATTR(val));
    // tr->genMarkLabel(L2);
}

/* Translating an ast::GeqExpr node.
 */
void Translation::visit(ast::GeqExpr *e) {
    e->e1->accept(this);
    e->e2->accept(this);
    e->ATTR(val) = tr->genGeq(e->e1->ATTR(val), e->e2->ATTR(val));
}

/* Translating an ast::GrtExpr node.
 */
void Translation::visit(ast::GrtExpr *e) {
    e->e1->accept(this);
    e->e2->accept(this);
    e->ATTR(val) = tr->genGtr(e->e1->ATTR(val), e->e2->ATTR(val));
}

/* Translating an ast::AddExpr node.
 */
void Translation::visit(ast::AddExpr *e) {
    e->e1->accept(this);
    e->e2->accept(this);
    e->ATTR(val) = tr->genAdd(e->e1->ATTR(val), e->e2->ATTR(val));
}

/* Translating an ast::SubExpr node.
 */
void Translation::visit(ast::SubExpr *e) {
    e->e1->accept(this);
    e->e2->accept(this);

    e->ATTR(val) = tr->genSub(e->e1->ATTR(val), e->e2->ATTR(val));
}

/* Translating an ast::MulExpr node.
 */
void Translation::visit(ast::MulExpr *e) {
    e->e1->accept(this);
    e->e2->accept(this);

    e->ATTR(val) = tr->genMul(e->e1->ATTR(val), e->e2->ATTR(val));
}

/* Translating an ast::DivExpr node.
 */
void Translation::visit(ast::DivExpr *e) {
    e->e1->accept(this);
    e->e2->accept(this);

    e->ATTR(val) = tr->genDiv(e->e1->ATTR(val), e->e2->ATTR(val));
}

/* Translating an ast::ModExpr node.
 */
void Translation::visit(ast::ModExpr *e){
    e->e1->accept(this);
    e->e2->accept(this);

    e->ATTR(val) = tr->genMod(e->e1->ATTR(val), e->e2->ATTR(val));
}

/* Translating an ast::IfExpr node.
 */
void Translation::visit(ast::IfExpr *e){
    Label L1 = tr->getNewLabel(); // entry of the false branch
    Label L2 = tr->getNewLabel(); // exit
    e->condition->accept(this);
    Temp temp = tr->getNewTempI4();
    tr->genJumpOnZero(L1, e->condition->ATTR(val));

    e->true_brch->accept(this);
    tr->genAssign(temp, e->true_brch->ATTR(val));
    tr->genJump(L2); // done

    tr->genMarkLabel(L1);
    e->false_brch->accept(this);
    tr->genAssign(temp, e->false_brch->ATTR(val));

    tr->genMarkLabel(L2);
    
    e->ATTR(val) = temp;
}
/* Translating an ast::IntConst node.
 */
void Translation::visit(ast::IntConst *e) {
    e->ATTR(val) = tr->genLoadImm4(e->value);
}

/* Translating an ast::NegExpr node.
 */
void Translation::visit(ast::NegExpr *e) {
    e->e->accept(this);
    //绑定新申请的临时变量
    e->ATTR(val) = tr->genNeg(e->e->ATTR(val));
}

/* Translating an ast::BitNot node.
 */
void Translation::visit(ast::BitNotExpr *e) {
    e->e->accept(this);

    e->ATTR(val) = tr->genBNot(e->e->ATTR(val));
}

/* Translating an ast::BitNot node.
 */
void Translation::visit(ast::NotExpr *e) {
    e->e->accept(this);

    e->ATTR(val) = tr->genLNot(e->e->ATTR(val));
}

/* Translating an ast::LvalueExpr node.
 *
 * NOTE:
 *   different Lvalue kinds need different translation
 */
void Translation::visit(ast::LvalueExpr *e) {
    e->lvalue->accept(this);
    switch (e->lvalue->getKind()) {
        case ast::ASTNode::VAR_REF:{
            ast::VarRef *ref = (ast::VarRef *)e->lvalue;
            if(ref->ATTR(sym)->isGlobalVar()){
                Temp temp = tr->genLoadSymbol(ref->ATTR(sym)->getName());
                if(ref->ATTR(lv_kind) == ast::Lvalue::ARRAY_ELE)
                    temp = tr->genAdd(temp, ref->expr->ATTR(val));
                e->ATTR(val) = tr->genLoad(temp, 0);
            }
            else {
                if(ref->ATTR(lv_kind) == ast::Lvalue::ARRAY_ELE){
                    Temp temp = tr->genAdd(ref->ATTR(sym)->getTemp(), ref->expr->ATTR(val));
                    e->ATTR(val) = tr->genLoad(temp, 0);
                }
                else e->ATTR(val) = ref->ATTR(sym)->getTemp();
            }
            break;
        }
        default:
            mind_assert(false);
    }
    //((ast::VarRef *)(e->lvalue))->ATTR(sym)
}

void Translation::visit(ast::IndexExpr *e){
    mind_assert(e->expr_list->length() == e->ATTR(dim)->length());
    auto expr = e->expr_list->begin();
    auto dim = e->ATTR(dim)->begin();
    (*expr)->accept(this);
    Temp temp = (*expr)->ATTR(val); ++expr;
    for(int i = 1; i < e->expr_list->length(); ++expr, ++dim, ++i){
        (*expr)->accept(this);
        //printf("<%d>", *dim);
        Temp t = tr->genLoadImm4(*dim);
        temp = tr->genMul(temp, t);
        temp = tr->genAdd(temp, (*expr)->ATTR(val));
    }
    Temp t = tr->genLoadImm4(4);
    temp = tr->genMul(temp, t);
    e->ATTR(val) = temp;
}

/* Translating an ast::VarRef node.
 *
 * NOTE:
 *   there are two kinds of variable reference: member variables or simple
 * variables
 */

void Translation::visit(ast::VarRef *ref) {
    switch (ref->ATTR(lv_kind)) {
    case ast::Lvalue::SIMPLE_VAR:
        // nothing to do
    //ref->ATTR(val) = ref->ATTR(sym)->getTemp();
        break;
    case ast::Lvalue::ARRAY_ELE:
        ref->expr->accept(this);
        break;
    default:
        mind_assert(false); // impossible
    }
    // actually it is so simple :-)
}

/* Translating an ast::VarDecl node.
 */
void Translation::visit(ast::VarDecl *decl){
    if(decl->ATTR(sym)->isGlobalVar()){
        if(decl->init == NULL){
            tr->genGlobalVarible(decl->name, 0, decl->type->ATTR(type)->getSize());
        }
        else {
            assert(decl->init->getKind() == ast::ASTNode::INT_CONST);
            tr->genGlobalVarible(decl->name, ((ast::IntConst *)(decl->init))->value, decl->type->ATTR(type)->getSize());
        }
    }
    else {
        if(decl->type->ATTR(type)->isArrayType()){
            //printf("[%d]\n", decl->type->ATTR(type)->getSize());
            decl->ATTR(sym)->attachTemp(tr->allocNewTempI4(decl->type->ATTR(type)->getSize()));
        }
        else {
            decl->ATTR(sym)->attachTemp(tr->getNewTempI4());

            if(decl->init != NULL){
                decl->init->accept(this);
                tr->genAssign(decl->ATTR(sym)->getTemp(), decl->init->ATTR(val));
            }
        }
    }
}

/* Translates an entire AST into a Piece list.
 *
 * PARAMETERS:
 *   tree  - the AST
 * RETURNS:
 *   the result Piece list (represented by the first node)
 */
Piece *MindCompiler::translate(ast::Program *tree) {
    TransHelper *helper = new TransHelper(md);
    tree->accept(new Translation(helper));

    return helper->getPiece();
}