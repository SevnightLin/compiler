// A Bison parser, made by GNU Bison 3.7.6.

// Skeleton implementation for Bison LALR(1) parsers in C++

// Copyright (C) 2002-2015, 2018-2021 Free Software Foundation, Inc.

// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.

// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.

// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

// As a special exception, you may create a larger work that contains
// part or all of the Bison parser skeleton and distribute that work
// under terms of your choice, so long as that work isn't itself a
// parser generator using the skeleton or a modified version thereof
// as a parser skeleton.  Alternatively, if you modify or redistribute
// the parser skeleton itself, you may (at your option) remove this
// special exception, which will cause the skeleton and the resulting
// Bison output files to be licensed under the GNU General Public
// License without this special exception.

// This special exception was added by the Free Software Foundation in
// version 2.2 of Bison.

// DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
// especially those whose name start with YY_ or yy_.  They are
// private implementation details that can be changed or removed.



// First part of user prologue.
#line 121 "frontend/parser.y"

  /* we have to include scanner.hpp here... */
#define YY_NO_UNISTD_H 1

#line 46 "parser.cpp"


#include "parser.hpp"


// Unqualified %code blocks.
#line 42 "frontend/parser.y"

  #include "compiler.hpp"

#line 57 "parser.cpp"


#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> // FIXME: INFRINGES ON USER NAME SPACE.
#   define YY_(msgid) dgettext ("bison-runtime", msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(msgid) msgid
# endif
#endif


// Whether we are compiled with exception support.
#ifndef YY_EXCEPTIONS
# if defined __GNUC__ && !defined __EXCEPTIONS
#  define YY_EXCEPTIONS 0
# else
#  define YY_EXCEPTIONS 1
# endif
#endif

#define YYRHSLOC(Rhs, K) ((Rhs)[K].location)
/* YYLLOC_DEFAULT -- Set CURRENT to span from RHS[1] to RHS[N].
   If N is 0, then set CURRENT to the empty location which ends
   the previous symbol: RHS[0] (always defined).  */

# ifndef YYLLOC_DEFAULT
#  define YYLLOC_DEFAULT(Current, Rhs, N)                               \
    do                                                                  \
      if (N)                                                            \
        {                                                               \
          (Current).begin  = YYRHSLOC (Rhs, 1).begin;                   \
          (Current).end    = YYRHSLOC (Rhs, N).end;                     \
        }                                                               \
      else                                                              \
        {                                                               \
          (Current).begin = (Current).end = YYRHSLOC (Rhs, 0).end;      \
        }                                                               \
    while (false)
# endif


// Enable debugging if requested.
#if YYDEBUG

// A pseudo ostream that takes yydebug_ into account.
# define YYCDEBUG if (yydebug_) (*yycdebug_)

# define YY_SYMBOL_PRINT(Title, Symbol)         \
  do {                                          \
    if (yydebug_)                               \
    {                                           \
      *yycdebug_ << Title << ' ';               \
      yy_print_ (*yycdebug_, Symbol);           \
      *yycdebug_ << '\n';                       \
    }                                           \
  } while (false)

# define YY_REDUCE_PRINT(Rule)          \
  do {                                  \
    if (yydebug_)                       \
      yy_reduce_print_ (Rule);          \
  } while (false)

# define YY_STACK_PRINT()               \
  do {                                  \
    if (yydebug_)                       \
      yy_stack_print_ ();                \
  } while (false)

#else // !YYDEBUG

# define YYCDEBUG if (false) std::cerr
# define YY_SYMBOL_PRINT(Title, Symbol)  YY_USE (Symbol)
# define YY_REDUCE_PRINT(Rule)           static_cast<void> (0)
# define YY_STACK_PRINT()                static_cast<void> (0)

#endif // !YYDEBUG

#define yyerrok         (yyerrstatus_ = 0)
#define yyclearin       (yyla.clear ())

#define YYACCEPT        goto yyacceptlab
#define YYABORT         goto yyabortlab
#define YYERROR         goto yyerrorlab
#define YYRECOVERING()  (!!yyerrstatus_)

namespace yy {
#line 149 "parser.cpp"

  /// Build a parser object.
  parser::parser ()
#if YYDEBUG
    : yydebug_ (false),
      yycdebug_ (&std::cerr)
#else

#endif
  {}

  parser::~parser ()
  {}

  parser::syntax_error::~syntax_error () YY_NOEXCEPT YY_NOTHROW
  {}

  /*---------------.
  | symbol kinds.  |
  `---------------*/



  // by_state.
  parser::by_state::by_state () YY_NOEXCEPT
    : state (empty_state)
  {}

  parser::by_state::by_state (const by_state& that) YY_NOEXCEPT
    : state (that.state)
  {}

  void
  parser::by_state::clear () YY_NOEXCEPT
  {
    state = empty_state;
  }

  void
  parser::by_state::move (by_state& that)
  {
    state = that.state;
    that.clear ();
  }

  parser::by_state::by_state (state_type s) YY_NOEXCEPT
    : state (s)
  {}

  parser::symbol_kind_type
  parser::by_state::kind () const YY_NOEXCEPT
  {
    if (state == empty_state)
      return symbol_kind::S_YYEMPTY;
    else
      return YY_CAST (symbol_kind_type, yystos_[+state]);
  }

  parser::stack_symbol_type::stack_symbol_type ()
  {}

  parser::stack_symbol_type::stack_symbol_type (YY_RVREF (stack_symbol_type) that)
    : super_type (YY_MOVE (that.state), YY_MOVE (that.location))
  {
    switch (that.kind ())
    {
      case symbol_kind::S_ICONST: // "iconst"
        value.YY_MOVE_OR_COPY< int > (YY_MOVE (that.value));
        break;

      case symbol_kind::S_Index: // Index
        value.YY_MOVE_OR_COPY< mind::ast::DimList*  > (YY_MOVE (that.value));
        break;

      case symbol_kind::S_ForExpr: // ForExpr
      case symbol_kind::S_LvalueExpr: // LvalueExpr
      case symbol_kind::S_Expr: // Expr
        value.YY_MOVE_OR_COPY< mind::ast::Expr* > (YY_MOVE (that.value));
        break;

      case symbol_kind::S_ExprList: // ExprList
        value.YY_MOVE_OR_COPY< mind::ast::ExprList*  > (YY_MOVE (that.value));
        break;

      case symbol_kind::S_FuncDefn: // FuncDefn
        value.YY_MOVE_OR_COPY< mind::ast::FuncDefn*  > (YY_MOVE (that.value));
        break;

      case symbol_kind::S_IndexExpr: // IndexExpr
        value.YY_MOVE_OR_COPY< mind::ast::IndexExpr* > (YY_MOVE (that.value));
        break;

      case symbol_kind::S_Program: // Program
      case symbol_kind::S_FoDList: // FoDList
        value.YY_MOVE_OR_COPY< mind::ast::Program*  > (YY_MOVE (that.value));
        break;

      case symbol_kind::S_Stmt: // Stmt
      case symbol_kind::S_CompStmt: // CompStmt
      case symbol_kind::S_WhileStmt: // WhileStmt
      case symbol_kind::S_ForStmt: // ForStmt
      case symbol_kind::S_IfStmt: // IfStmt
      case symbol_kind::S_DeclStmt: // DeclStmt
      case symbol_kind::S_ReturnStmt: // ReturnStmt
      case symbol_kind::S_ExprStmt: // ExprStmt
        value.YY_MOVE_OR_COPY< mind::ast::Statement* > (YY_MOVE (that.value));
        break;

      case symbol_kind::S_StmtList: // StmtList
        value.YY_MOVE_OR_COPY< mind::ast::StmtList* > (YY_MOVE (that.value));
        break;

      case symbol_kind::S_Type: // Type
        value.YY_MOVE_OR_COPY< mind::ast::Type* > (YY_MOVE (that.value));
        break;

      case symbol_kind::S_FormalList: // FormalList
      case symbol_kind::S_ParameterList: // ParameterList
        value.YY_MOVE_OR_COPY< mind::ast::VarList*  > (YY_MOVE (that.value));
        break;

      case symbol_kind::S_VarRef: // VarRef
        value.YY_MOVE_OR_COPY< mind::ast::VarRef* > (YY_MOVE (that.value));
        break;

      case symbol_kind::S_IDENTIFIER: // "identifier"
        value.YY_MOVE_OR_COPY< std::string > (YY_MOVE (that.value));
        break;

      default:
        break;
    }

#if 201103L <= YY_CPLUSPLUS
    // that is emptied.
    that.state = empty_state;
#endif
  }

  parser::stack_symbol_type::stack_symbol_type (state_type s, YY_MOVE_REF (symbol_type) that)
    : super_type (s, YY_MOVE (that.location))
  {
    switch (that.kind ())
    {
      case symbol_kind::S_ICONST: // "iconst"
        value.move< int > (YY_MOVE (that.value));
        break;

      case symbol_kind::S_Index: // Index
        value.move< mind::ast::DimList*  > (YY_MOVE (that.value));
        break;

      case symbol_kind::S_ForExpr: // ForExpr
      case symbol_kind::S_LvalueExpr: // LvalueExpr
      case symbol_kind::S_Expr: // Expr
        value.move< mind::ast::Expr* > (YY_MOVE (that.value));
        break;

      case symbol_kind::S_ExprList: // ExprList
        value.move< mind::ast::ExprList*  > (YY_MOVE (that.value));
        break;

      case symbol_kind::S_FuncDefn: // FuncDefn
        value.move< mind::ast::FuncDefn*  > (YY_MOVE (that.value));
        break;

      case symbol_kind::S_IndexExpr: // IndexExpr
        value.move< mind::ast::IndexExpr* > (YY_MOVE (that.value));
        break;

      case symbol_kind::S_Program: // Program
      case symbol_kind::S_FoDList: // FoDList
        value.move< mind::ast::Program*  > (YY_MOVE (that.value));
        break;

      case symbol_kind::S_Stmt: // Stmt
      case symbol_kind::S_CompStmt: // CompStmt
      case symbol_kind::S_WhileStmt: // WhileStmt
      case symbol_kind::S_ForStmt: // ForStmt
      case symbol_kind::S_IfStmt: // IfStmt
      case symbol_kind::S_DeclStmt: // DeclStmt
      case symbol_kind::S_ReturnStmt: // ReturnStmt
      case symbol_kind::S_ExprStmt: // ExprStmt
        value.move< mind::ast::Statement* > (YY_MOVE (that.value));
        break;

      case symbol_kind::S_StmtList: // StmtList
        value.move< mind::ast::StmtList* > (YY_MOVE (that.value));
        break;

      case symbol_kind::S_Type: // Type
        value.move< mind::ast::Type* > (YY_MOVE (that.value));
        break;

      case symbol_kind::S_FormalList: // FormalList
      case symbol_kind::S_ParameterList: // ParameterList
        value.move< mind::ast::VarList*  > (YY_MOVE (that.value));
        break;

      case symbol_kind::S_VarRef: // VarRef
        value.move< mind::ast::VarRef* > (YY_MOVE (that.value));
        break;

      case symbol_kind::S_IDENTIFIER: // "identifier"
        value.move< std::string > (YY_MOVE (that.value));
        break;

      default:
        break;
    }

    // that is emptied.
    that.kind_ = symbol_kind::S_YYEMPTY;
  }

#if YY_CPLUSPLUS < 201103L
  parser::stack_symbol_type&
  parser::stack_symbol_type::operator= (const stack_symbol_type& that)
  {
    state = that.state;
    switch (that.kind ())
    {
      case symbol_kind::S_ICONST: // "iconst"
        value.copy< int > (that.value);
        break;

      case symbol_kind::S_Index: // Index
        value.copy< mind::ast::DimList*  > (that.value);
        break;

      case symbol_kind::S_ForExpr: // ForExpr
      case symbol_kind::S_LvalueExpr: // LvalueExpr
      case symbol_kind::S_Expr: // Expr
        value.copy< mind::ast::Expr* > (that.value);
        break;

      case symbol_kind::S_ExprList: // ExprList
        value.copy< mind::ast::ExprList*  > (that.value);
        break;

      case symbol_kind::S_FuncDefn: // FuncDefn
        value.copy< mind::ast::FuncDefn*  > (that.value);
        break;

      case symbol_kind::S_IndexExpr: // IndexExpr
        value.copy< mind::ast::IndexExpr* > (that.value);
        break;

      case symbol_kind::S_Program: // Program
      case symbol_kind::S_FoDList: // FoDList
        value.copy< mind::ast::Program*  > (that.value);
        break;

      case symbol_kind::S_Stmt: // Stmt
      case symbol_kind::S_CompStmt: // CompStmt
      case symbol_kind::S_WhileStmt: // WhileStmt
      case symbol_kind::S_ForStmt: // ForStmt
      case symbol_kind::S_IfStmt: // IfStmt
      case symbol_kind::S_DeclStmt: // DeclStmt
      case symbol_kind::S_ReturnStmt: // ReturnStmt
      case symbol_kind::S_ExprStmt: // ExprStmt
        value.copy< mind::ast::Statement* > (that.value);
        break;

      case symbol_kind::S_StmtList: // StmtList
        value.copy< mind::ast::StmtList* > (that.value);
        break;

      case symbol_kind::S_Type: // Type
        value.copy< mind::ast::Type* > (that.value);
        break;

      case symbol_kind::S_FormalList: // FormalList
      case symbol_kind::S_ParameterList: // ParameterList
        value.copy< mind::ast::VarList*  > (that.value);
        break;

      case symbol_kind::S_VarRef: // VarRef
        value.copy< mind::ast::VarRef* > (that.value);
        break;

      case symbol_kind::S_IDENTIFIER: // "identifier"
        value.copy< std::string > (that.value);
        break;

      default:
        break;
    }

    location = that.location;
    return *this;
  }

  parser::stack_symbol_type&
  parser::stack_symbol_type::operator= (stack_symbol_type& that)
  {
    state = that.state;
    switch (that.kind ())
    {
      case symbol_kind::S_ICONST: // "iconst"
        value.move< int > (that.value);
        break;

      case symbol_kind::S_Index: // Index
        value.move< mind::ast::DimList*  > (that.value);
        break;

      case symbol_kind::S_ForExpr: // ForExpr
      case symbol_kind::S_LvalueExpr: // LvalueExpr
      case symbol_kind::S_Expr: // Expr
        value.move< mind::ast::Expr* > (that.value);
        break;

      case symbol_kind::S_ExprList: // ExprList
        value.move< mind::ast::ExprList*  > (that.value);
        break;

      case symbol_kind::S_FuncDefn: // FuncDefn
        value.move< mind::ast::FuncDefn*  > (that.value);
        break;

      case symbol_kind::S_IndexExpr: // IndexExpr
        value.move< mind::ast::IndexExpr* > (that.value);
        break;

      case symbol_kind::S_Program: // Program
      case symbol_kind::S_FoDList: // FoDList
        value.move< mind::ast::Program*  > (that.value);
        break;

      case symbol_kind::S_Stmt: // Stmt
      case symbol_kind::S_CompStmt: // CompStmt
      case symbol_kind::S_WhileStmt: // WhileStmt
      case symbol_kind::S_ForStmt: // ForStmt
      case symbol_kind::S_IfStmt: // IfStmt
      case symbol_kind::S_DeclStmt: // DeclStmt
      case symbol_kind::S_ReturnStmt: // ReturnStmt
      case symbol_kind::S_ExprStmt: // ExprStmt
        value.move< mind::ast::Statement* > (that.value);
        break;

      case symbol_kind::S_StmtList: // StmtList
        value.move< mind::ast::StmtList* > (that.value);
        break;

      case symbol_kind::S_Type: // Type
        value.move< mind::ast::Type* > (that.value);
        break;

      case symbol_kind::S_FormalList: // FormalList
      case symbol_kind::S_ParameterList: // ParameterList
        value.move< mind::ast::VarList*  > (that.value);
        break;

      case symbol_kind::S_VarRef: // VarRef
        value.move< mind::ast::VarRef* > (that.value);
        break;

      case symbol_kind::S_IDENTIFIER: // "identifier"
        value.move< std::string > (that.value);
        break;

      default:
        break;
    }

    location = that.location;
    // that is emptied.
    that.state = empty_state;
    return *this;
  }
#endif

  template <typename Base>
  void
  parser::yy_destroy_ (const char* yymsg, basic_symbol<Base>& yysym) const
  {
    if (yymsg)
      YY_SYMBOL_PRINT (yymsg, yysym);
  }

#if YYDEBUG
  template <typename Base>
  void
  parser::yy_print_ (std::ostream& yyo, const basic_symbol<Base>& yysym) const
  {
    std::ostream& yyoutput = yyo;
    YY_USE (yyoutput);
    if (yysym.empty ())
      yyo << "empty symbol";
    else
      {
        symbol_kind_type yykind = yysym.kind ();
        yyo << (yykind < YYNTOKENS ? "token" : "nterm")
            << ' ' << yysym.name () << " ("
            << yysym.location << ": ";
        YY_USE (yykind);
        yyo << ')';
      }
  }
#endif

  void
  parser::yypush_ (const char* m, YY_MOVE_REF (stack_symbol_type) sym)
  {
    if (m)
      YY_SYMBOL_PRINT (m, sym);
    yystack_.push (YY_MOVE (sym));
  }

  void
  parser::yypush_ (const char* m, state_type s, YY_MOVE_REF (symbol_type) sym)
  {
#if 201103L <= YY_CPLUSPLUS
    yypush_ (m, stack_symbol_type (s, std::move (sym)));
#else
    stack_symbol_type ss (s, sym);
    yypush_ (m, ss);
#endif
  }

  void
  parser::yypop_ (int n)
  {
    yystack_.pop (n);
  }

#if YYDEBUG
  std::ostream&
  parser::debug_stream () const
  {
    return *yycdebug_;
  }

  void
  parser::set_debug_stream (std::ostream& o)
  {
    yycdebug_ = &o;
  }


  parser::debug_level_type
  parser::debug_level () const
  {
    return yydebug_;
  }

  void
  parser::set_debug_level (debug_level_type l)
  {
    yydebug_ = l;
  }
#endif // YYDEBUG

  parser::state_type
  parser::yy_lr_goto_state_ (state_type yystate, int yysym)
  {
    int yyr = yypgoto_[yysym - YYNTOKENS] + yystate;
    if (0 <= yyr && yyr <= yylast_ && yycheck_[yyr] == yystate)
      return yytable_[yyr];
    else
      return yydefgoto_[yysym - YYNTOKENS];
  }

  bool
  parser::yy_pact_value_is_default_ (int yyvalue)
  {
    return yyvalue == yypact_ninf_;
  }

  bool
  parser::yy_table_value_is_error_ (int yyvalue)
  {
    return yyvalue == yytable_ninf_;
  }

  int
  parser::operator() ()
  {
    return parse ();
  }

  int
  parser::parse ()
  {
    int yyn;
    /// Length of the RHS of the rule being reduced.
    int yylen = 0;

    // Error handling.
    int yynerrs_ = 0;
    int yyerrstatus_ = 0;

    /// The lookahead symbol.
    symbol_type yyla;

    /// The locations where the error started and ended.
    stack_symbol_type yyerror_range[3];

    /// The return value of parse ().
    int yyresult;

#if YY_EXCEPTIONS
    try
#endif // YY_EXCEPTIONS
      {
    YYCDEBUG << "Starting parse\n";


    /* Initialize the stack.  The initial state will be set in
       yynewstate, since the latter expects the semantical and the
       location values to have been already stored, initialize these
       stacks with a primary value.  */
    yystack_.clear ();
    yypush_ (YY_NULLPTR, 0, YY_MOVE (yyla));

  /*-----------------------------------------------.
  | yynewstate -- push a new symbol on the stack.  |
  `-----------------------------------------------*/
  yynewstate:
    YYCDEBUG << "Entering state " << int (yystack_[0].state) << '\n';
    YY_STACK_PRINT ();

    // Accept?
    if (yystack_[0].state == yyfinal_)
      YYACCEPT;

    goto yybackup;


  /*-----------.
  | yybackup.  |
  `-----------*/
  yybackup:
    // Try to take a decision without lookahead.
    yyn = yypact_[+yystack_[0].state];
    if (yy_pact_value_is_default_ (yyn))
      goto yydefault;

    // Read a lookahead token.
    if (yyla.empty ())
      {
        YYCDEBUG << "Reading a token\n";
#if YY_EXCEPTIONS
        try
#endif // YY_EXCEPTIONS
          {
            symbol_type yylookahead (yylex ());
            yyla.move (yylookahead);
          }
#if YY_EXCEPTIONS
        catch (const syntax_error& yyexc)
          {
            YYCDEBUG << "Caught exception: " << yyexc.what() << '\n';
            error (yyexc);
            goto yyerrlab1;
          }
#endif // YY_EXCEPTIONS
      }
    YY_SYMBOL_PRINT ("Next token is", yyla);

    if (yyla.kind () == symbol_kind::S_YYerror)
    {
      // The scanner already issued an error message, process directly
      // to error recovery.  But do not keep the error token as
      // lookahead, it is too special and may lead us to an endless
      // loop in error recovery. */
      yyla.kind_ = symbol_kind::S_YYUNDEF;
      goto yyerrlab1;
    }

    /* If the proper action on seeing token YYLA.TYPE is to reduce or
       to detect an error, take that action.  */
    yyn += yyla.kind ();
    if (yyn < 0 || yylast_ < yyn || yycheck_[yyn] != yyla.kind ())
      {
        goto yydefault;
      }

    // Reduce or error.
    yyn = yytable_[yyn];
    if (yyn <= 0)
      {
        if (yy_table_value_is_error_ (yyn))
          goto yyerrlab;
        yyn = -yyn;
        goto yyreduce;
      }

    // Count tokens shifted since error; after three, turn off error status.
    if (yyerrstatus_)
      --yyerrstatus_;

    // Shift the lookahead token.
    yypush_ ("Shifting", state_type (yyn), YY_MOVE (yyla));
    goto yynewstate;


  /*-----------------------------------------------------------.
  | yydefault -- do the default action for the current state.  |
  `-----------------------------------------------------------*/
  yydefault:
    yyn = yydefact_[+yystack_[0].state];
    if (yyn == 0)
      goto yyerrlab;
    goto yyreduce;


  /*-----------------------------.
  | yyreduce -- do a reduction.  |
  `-----------------------------*/
  yyreduce:
    yylen = yyr2_[yyn];
    {
      stack_symbol_type yylhs;
      yylhs.state = yy_lr_goto_state_ (yystack_[yylen].state, yyr1_[yyn]);
      /* Variants are always initialized to an empty instance of the
         correct type. The default '$$ = $1' action is NOT applied
         when using variants.  */
      switch (yyr1_[yyn])
    {
      case symbol_kind::S_ICONST: // "iconst"
        yylhs.value.emplace< int > ();
        break;

      case symbol_kind::S_Index: // Index
        yylhs.value.emplace< mind::ast::DimList*  > ();
        break;

      case symbol_kind::S_ForExpr: // ForExpr
      case symbol_kind::S_LvalueExpr: // LvalueExpr
      case symbol_kind::S_Expr: // Expr
        yylhs.value.emplace< mind::ast::Expr* > ();
        break;

      case symbol_kind::S_ExprList: // ExprList
        yylhs.value.emplace< mind::ast::ExprList*  > ();
        break;

      case symbol_kind::S_FuncDefn: // FuncDefn
        yylhs.value.emplace< mind::ast::FuncDefn*  > ();
        break;

      case symbol_kind::S_IndexExpr: // IndexExpr
        yylhs.value.emplace< mind::ast::IndexExpr* > ();
        break;

      case symbol_kind::S_Program: // Program
      case symbol_kind::S_FoDList: // FoDList
        yylhs.value.emplace< mind::ast::Program*  > ();
        break;

      case symbol_kind::S_Stmt: // Stmt
      case symbol_kind::S_CompStmt: // CompStmt
      case symbol_kind::S_WhileStmt: // WhileStmt
      case symbol_kind::S_ForStmt: // ForStmt
      case symbol_kind::S_IfStmt: // IfStmt
      case symbol_kind::S_DeclStmt: // DeclStmt
      case symbol_kind::S_ReturnStmt: // ReturnStmt
      case symbol_kind::S_ExprStmt: // ExprStmt
        yylhs.value.emplace< mind::ast::Statement* > ();
        break;

      case symbol_kind::S_StmtList: // StmtList
        yylhs.value.emplace< mind::ast::StmtList* > ();
        break;

      case symbol_kind::S_Type: // Type
        yylhs.value.emplace< mind::ast::Type* > ();
        break;

      case symbol_kind::S_FormalList: // FormalList
      case symbol_kind::S_ParameterList: // ParameterList
        yylhs.value.emplace< mind::ast::VarList*  > ();
        break;

      case symbol_kind::S_VarRef: // VarRef
        yylhs.value.emplace< mind::ast::VarRef* > ();
        break;

      case symbol_kind::S_IDENTIFIER: // "identifier"
        yylhs.value.emplace< std::string > ();
        break;

      default:
        break;
    }


      // Default location.
      {
        stack_type::slice range (yystack_, yylen);
        YYLLOC_DEFAULT (yylhs.location, range, yylen);
        yyerror_range[1].location = yylhs.location;
      }

      // Perform the reduction.
      YY_REDUCE_PRINT (yyn);
#if YY_EXCEPTIONS
      try
#endif // YY_EXCEPTIONS
        {
          switch (yyn)
            {
  case 2: // Program: FoDList
#line 132 "frontend/parser.y"
                { /* we don't write $$ = XXX here. */
				  setParseTree(yystack_[0].value.as < mind::ast::Program*  > ()); }
#line 858 "parser.cpp"
    break;

  case 3: // FoDList: FuncDefn
#line 137 "frontend/parser.y"
                {yylhs.value.as < mind::ast::Program*  > () = new ast::Program(yystack_[0].value.as < mind::ast::FuncDefn*  > (),POS(yystack_[0].location)); }
#line 864 "parser.cpp"
    break;

  case 4: // FoDList: FoDList FuncDefn
#line 138 "frontend/parser.y"
                            {
                 {yystack_[1].value.as < mind::ast::Program*  > ()->func_and_globals->append(yystack_[0].value.as < mind::ast::FuncDefn*  > ());
                  yylhs.value.as < mind::ast::Program*  > () = yystack_[1].value.as < mind::ast::Program*  > (); }
                }
#line 873 "parser.cpp"
    break;

  case 5: // FoDList: DeclStmt
#line 143 "frontend/parser.y"
                { yylhs.value.as < mind::ast::Program*  > () = new ast::Program(yystack_[0].value.as < mind::ast::Statement* > (), POS(yystack_[0].location)); }
#line 879 "parser.cpp"
    break;

  case 6: // FoDList: FoDList DeclStmt
#line 144 "frontend/parser.y"
                            {
                yystack_[1].value.as < mind::ast::Program*  > ()->func_and_globals->append(yystack_[0].value.as < mind::ast::Statement* > ());
                yylhs.value.as < mind::ast::Program*  > () = yystack_[1].value.as < mind::ast::Program*  > ();
            }
#line 888 "parser.cpp"
    break;

  case 7: // FuncDefn: Type "identifier" "(" FormalList ")" "{" StmtList "}"
#line 149 "frontend/parser.y"
                                                                           {
              yylhs.value.as < mind::ast::FuncDefn*  > () = new ast::FuncDefn(yystack_[6].value.as < std::string > (),yystack_[7].value.as < mind::ast::Type* > (),yystack_[4].value.as < mind::ast::VarList*  > (),yystack_[1].value.as < mind::ast::StmtList* > (),POS(yystack_[7].location));
          }
#line 896 "parser.cpp"
    break;

  case 8: // FuncDefn: Type "identifier" "(" FormalList ")" ";"
#line 152 "frontend/parser.y"
                                                            {
              yylhs.value.as < mind::ast::FuncDefn*  > () = new ast::FuncDefn(yystack_[4].value.as < std::string > (),yystack_[5].value.as < mind::ast::Type* > (),yystack_[2].value.as < mind::ast::VarList*  > (),new ast::EmptyStmt(POS(yystack_[0].location)),POS(yystack_[5].location));
          }
#line 904 "parser.cpp"
    break;

  case 9: // FormalList: %empty
#line 156 "frontend/parser.y"
            { yylhs.value.as < mind::ast::VarList*  > () = new ast::VarList(); }
#line 910 "parser.cpp"
    break;

  case 10: // FormalList: ParameterList
#line 158 "frontend/parser.y"
            { yylhs.value.as < mind::ast::VarList*  > () = yystack_[0].value.as < mind::ast::VarList*  > (); }
#line 916 "parser.cpp"
    break;

  case 11: // ParameterList: Type "identifier"
#line 161 "frontend/parser.y"
                { yylhs.value.as < mind::ast::VarList*  > () = new ast::VarList();
                  yylhs.value.as < mind::ast::VarList*  > ()->append(new ast::VarDecl(yystack_[0].value.as < std::string > (), yystack_[1].value.as < mind::ast::Type* > (), POS(yystack_[1].location))); }
#line 923 "parser.cpp"
    break;

  case 12: // ParameterList: Type "identifier" "," ParameterList
#line 164 "frontend/parser.y"
                { yystack_[0].value.as < mind::ast::VarList*  > ()->append(new ast::VarDecl(yystack_[2].value.as < std::string > (), yystack_[3].value.as < mind::ast::Type* > (), POS(yystack_[3].location))); 
                  yylhs.value.as < mind::ast::VarList*  > () = yystack_[0].value.as < mind::ast::VarList*  > ();
                }
#line 931 "parser.cpp"
    break;

  case 13: // Type: "int"
#line 169 "frontend/parser.y"
                { yylhs.value.as < mind::ast::Type* > () = new ast::IntType(POS(yystack_[0].location)); }
#line 937 "parser.cpp"
    break;

  case 14: // Type: "const" "int"
#line 171 "frontend/parser.y"
                { yylhs.value.as < mind::ast::Type* > () = new ast::IntType(POS(yystack_[1].location)); }
#line 943 "parser.cpp"
    break;

  case 15: // StmtList: %empty
#line 173 "frontend/parser.y"
                { yylhs.value.as < mind::ast::StmtList* > () = new ast::StmtList(); }
#line 949 "parser.cpp"
    break;

  case 16: // StmtList: StmtList Stmt
#line 175 "frontend/parser.y"
                { yystack_[1].value.as < mind::ast::StmtList* > ()->append(yystack_[0].value.as < mind::ast::Statement* > ());
                  yylhs.value.as < mind::ast::StmtList* > () = yystack_[1].value.as < mind::ast::StmtList* > (); }
#line 956 "parser.cpp"
    break;

  case 17: // StmtList: StmtList DeclStmt
#line 178 "frontend/parser.y"
                { yystack_[1].value.as < mind::ast::StmtList* > ()->append(yystack_[0].value.as < mind::ast::Statement* > ());
                  yylhs.value.as < mind::ast::StmtList* > () = yystack_[1].value.as < mind::ast::StmtList* > ();
                }
#line 964 "parser.cpp"
    break;

  case 18: // Stmt: ReturnStmt
#line 183 "frontend/parser.y"
                         {yylhs.value.as < mind::ast::Statement* > () = yystack_[0].value.as < mind::ast::Statement* > ();}
#line 970 "parser.cpp"
    break;

  case 19: // Stmt: ExprStmt
#line 184 "frontend/parser.y"
                         {yylhs.value.as < mind::ast::Statement* > () = yystack_[0].value.as < mind::ast::Statement* > ();}
#line 976 "parser.cpp"
    break;

  case 20: // Stmt: IfStmt
#line 185 "frontend/parser.y"
                         {yylhs.value.as < mind::ast::Statement* > () = yystack_[0].value.as < mind::ast::Statement* > ();}
#line 982 "parser.cpp"
    break;

  case 21: // Stmt: WhileStmt
#line 186 "frontend/parser.y"
                         {yylhs.value.as < mind::ast::Statement* > () = yystack_[0].value.as < mind::ast::Statement* > ();}
#line 988 "parser.cpp"
    break;

  case 22: // Stmt: CompStmt
#line 187 "frontend/parser.y"
                         {yylhs.value.as < mind::ast::Statement* > () = yystack_[0].value.as < mind::ast::Statement* > ();}
#line 994 "parser.cpp"
    break;

  case 23: // Stmt: ForStmt
#line 188 "frontend/parser.y"
                         {yylhs.value.as < mind::ast::Statement* > () = yystack_[0].value.as < mind::ast::Statement* > ();}
#line 1000 "parser.cpp"
    break;

  case 24: // Stmt: "break" ";"
#line 191 "frontend/parser.y"
                {yylhs.value.as < mind::ast::Statement* > () = new ast::BreakStmt(POS(yystack_[1].location));}
#line 1006 "parser.cpp"
    break;

  case 25: // Stmt: "continue" ";"
#line 193 "frontend/parser.y"
                {yylhs.value.as < mind::ast::Statement* > () = new ast::ContinueStmt(POS(yystack_[1].location));}
#line 1012 "parser.cpp"
    break;

  case 26: // Stmt: ";"
#line 195 "frontend/parser.y"
                {yylhs.value.as < mind::ast::Statement* > () = new ast::EmptyStmt(POS(yystack_[0].location));}
#line 1018 "parser.cpp"
    break;

  case 27: // CompStmt: "{" StmtList "}"
#line 199 "frontend/parser.y"
                {yylhs.value.as < mind::ast::Statement* > () = new ast::CompStmt(yystack_[1].value.as < mind::ast::StmtList* > (),POS(yystack_[2].location));}
#line 1024 "parser.cpp"
    break;

  case 28: // WhileStmt: "while" "(" Expr ")" Stmt
#line 202 "frontend/parser.y"
                { yylhs.value.as < mind::ast::Statement* > () = new ast::WhileStmt(yystack_[2].value.as < mind::ast::Expr* > (), yystack_[0].value.as < mind::ast::Statement* > (), POS(yystack_[4].location)); }
#line 1030 "parser.cpp"
    break;

  case 29: // ForStmt: "for" "(" ForExpr ";" ForExpr ";" ForExpr ")" Stmt
#line 205 "frontend/parser.y"
                { yylhs.value.as < mind::ast::Statement* > () = new ast::ForStmt(yystack_[6].value.as < mind::ast::Expr* > (), yystack_[4].value.as < mind::ast::Expr* > (), yystack_[2].value.as < mind::ast::Expr* > (), yystack_[0].value.as < mind::ast::Statement* > (), POS(yystack_[8].location)); }
#line 1036 "parser.cpp"
    break;

  case 30: // ForStmt: "for" "(" DeclStmt ForExpr ";" ForExpr ")" Stmt
#line 207 "frontend/parser.y"
                { yylhs.value.as < mind::ast::Statement* > () = new ast::ForStmt(yystack_[5].value.as < mind::ast::Statement* > (), yystack_[4].value.as < mind::ast::Expr* > (), yystack_[2].value.as < mind::ast::Expr* > (), yystack_[0].value.as < mind::ast::Statement* > (), POS(yystack_[7].location)); }
#line 1042 "parser.cpp"
    break;

  case 31: // ForStmt: "do" Stmt "while" "(" Expr ")" ";"
#line 209 "frontend/parser.y"
                { yylhs.value.as < mind::ast::Statement* > () = new ast::ForStmt(yystack_[2].value.as < mind::ast::Expr* > (), yystack_[5].value.as < mind::ast::Statement* > (), POS(yystack_[6].location)); }
#line 1048 "parser.cpp"
    break;

  case 32: // ForExpr: %empty
#line 213 "frontend/parser.y"
                { yylhs.value.as < mind::ast::Expr* > () = NULL; }
#line 1054 "parser.cpp"
    break;

  case 33: // ForExpr: Expr
#line 215 "frontend/parser.y"
                { yylhs.value.as < mind::ast::Expr* > () = yystack_[0].value.as < mind::ast::Expr* > (); }
#line 1060 "parser.cpp"
    break;

  case 34: // IfStmt: "if" "(" Expr ")" Stmt
#line 219 "frontend/parser.y"
                { yylhs.value.as < mind::ast::Statement* > () = new ast::IfStmt(yystack_[2].value.as < mind::ast::Expr* > (), yystack_[0].value.as < mind::ast::Statement* > (), new ast::EmptyStmt(POS(yystack_[0].location)), POS(yystack_[4].location)); }
#line 1066 "parser.cpp"
    break;

  case 35: // IfStmt: "if" "(" Expr ")" Stmt "else" Stmt
#line 221 "frontend/parser.y"
                { yylhs.value.as < mind::ast::Statement* > () = new ast::IfStmt(yystack_[4].value.as < mind::ast::Expr* > (), yystack_[2].value.as < mind::ast::Statement* > (), yystack_[0].value.as < mind::ast::Statement* > (), POS(yystack_[6].location)); }
#line 1072 "parser.cpp"
    break;

  case 36: // DeclStmt: Type "identifier" ";"
#line 226 "frontend/parser.y"
                { yylhs.value.as < mind::ast::Statement* > () = new ast::VarDecl(yystack_[1].value.as < std::string > (), yystack_[2].value.as < mind::ast::Type* > (), POS(yystack_[2].location)); }
#line 1078 "parser.cpp"
    break;

  case 37: // DeclStmt: Type "identifier" "=" Expr ";"
#line 228 "frontend/parser.y"
                { yylhs.value.as < mind::ast::Statement* > () = new ast::VarDecl(yystack_[3].value.as < std::string > (), yystack_[4].value.as < mind::ast::Type* > (), yystack_[1].value.as < mind::ast::Expr* > (), POS(yystack_[4].location)); }
#line 1084 "parser.cpp"
    break;

  case 38: // DeclStmt: Type "identifier" Index ";"
#line 230 "frontend/parser.y"
                { yylhs.value.as < mind::ast::Statement* > () = new ast::VarDecl(yystack_[2].value.as < std::string > (), yystack_[3].value.as < mind::ast::Type* > (), yystack_[1].value.as < mind::ast::DimList*  > (), POS(yystack_[3].location)); }
#line 1090 "parser.cpp"
    break;

  case 39: // Index: "[" "iconst" "]" Index
#line 235 "frontend/parser.y"
                { yylhs.value.as < mind::ast::DimList*  > () = yystack_[0].value.as < mind::ast::DimList*  > ();
                  yylhs.value.as < mind::ast::DimList*  > ()->append(yystack_[2].value.as < int > ());
                }
#line 1098 "parser.cpp"
    break;

  case 40: // Index: "[" "iconst" "]"
#line 239 "frontend/parser.y"
                { yylhs.value.as < mind::ast::DimList*  > () = new ast::DimList();
                  yylhs.value.as < mind::ast::DimList*  > ()->append(yystack_[1].value.as < int > ());
                }
#line 1106 "parser.cpp"
    break;

  case 41: // ReturnStmt: "return" Expr ";"
#line 244 "frontend/parser.y"
                { yylhs.value.as < mind::ast::Statement* > () = new ast::ReturnStmt(yystack_[1].value.as < mind::ast::Expr* > (), POS(yystack_[2].location)); }
#line 1112 "parser.cpp"
    break;

  case 42: // ExprStmt: Expr ";"
#line 247 "frontend/parser.y"
                { yylhs.value.as < mind::ast::Statement* > () = new ast::ExprStmt(yystack_[1].value.as < mind::ast::Expr* > (), POS(yystack_[1].location)); }
#line 1118 "parser.cpp"
    break;

  case 43: // VarRef: "identifier"
#line 251 "frontend/parser.y"
                { yylhs.value.as < mind::ast::VarRef* > () = new ast::VarRef(yystack_[0].value.as < std::string > (), POS(yystack_[0].location)); }
#line 1124 "parser.cpp"
    break;

  case 44: // VarRef: "identifier" IndexExpr
#line 253 "frontend/parser.y"
                { yylhs.value.as < mind::ast::VarRef* > () = new ast::VarRef(yystack_[1].value.as < std::string > (), yystack_[0].value.as < mind::ast::IndexExpr* > (), POS(yystack_[1].location)); }
#line 1130 "parser.cpp"
    break;

  case 45: // LvalueExpr: VarRef
#line 257 "frontend/parser.y"
                { yylhs.value.as < mind::ast::Expr* > () = new ast::LvalueExpr(yystack_[0].value.as < mind::ast::VarRef* > (), POS(yystack_[0].location)); }
#line 1136 "parser.cpp"
    break;

  case 46: // LvalueExpr: VarRef "=" Expr
#line 259 "frontend/parser.y"
                { yylhs.value.as < mind::ast::Expr* > () = new ast::AssignExpr(yystack_[2].value.as < mind::ast::VarRef* > (), yystack_[0].value.as < mind::ast::Expr* > (), POS(yystack_[1].location)); }
#line 1142 "parser.cpp"
    break;

  case 47: // IndexExpr: "[" Expr "]" IndexExpr
#line 264 "frontend/parser.y"
                { yylhs.value.as < mind::ast::IndexExpr* > () = new ast::IndexExpr(yystack_[2].value.as < mind::ast::Expr* > (), yystack_[0].value.as < mind::ast::IndexExpr* > ()->expr_list, POS(yystack_[3].location)); }
#line 1148 "parser.cpp"
    break;

  case 48: // IndexExpr: "[" Expr "]"
#line 266 "frontend/parser.y"
                { yylhs.value.as < mind::ast::IndexExpr* > () = new ast::IndexExpr(yystack_[1].value.as < mind::ast::Expr* > (), new ast::ExprList(), POS(yystack_[2].location)); }
#line 1154 "parser.cpp"
    break;

  case 49: // ExprList: Expr
#line 269 "frontend/parser.y"
                { yylhs.value.as < mind::ast::ExprList*  > () = new ast::ExprList(); 
                  yylhs.value.as < mind::ast::ExprList*  > ()->append(yystack_[0].value.as < mind::ast::Expr* > ());
                }
#line 1162 "parser.cpp"
    break;

  case 50: // ExprList: Expr "," ExprList
#line 273 "frontend/parser.y"
                { yystack_[0].value.as < mind::ast::ExprList*  > ()->append(yystack_[2].value.as < mind::ast::Expr* > ());
                  yylhs.value.as < mind::ast::ExprList*  > () = yystack_[0].value.as < mind::ast::ExprList*  > ();
                }
#line 1170 "parser.cpp"
    break;

  case 51: // Expr: "iconst"
#line 279 "frontend/parser.y"
                { yylhs.value.as < mind::ast::Expr* > () = new ast::IntConst(yystack_[0].value.as < int > (), POS(yystack_[0].location)); }
#line 1176 "parser.cpp"
    break;

  case 52: // Expr: LvalueExpr
#line 281 "frontend/parser.y"
                { yylhs.value.as < mind::ast::Expr* > () = yystack_[0].value.as < mind::ast::Expr* > (); }
#line 1182 "parser.cpp"
    break;

  case 53: // Expr: "identifier" "(" ExprList ")"
#line 283 "frontend/parser.y"
                { yylhs.value.as < mind::ast::Expr* > () = new ast::CallExpr(yystack_[1].value.as < mind::ast::ExprList*  > (), yystack_[3].value.as < std::string > (), POS(yystack_[3].location)); }
#line 1188 "parser.cpp"
    break;

  case 54: // Expr: "identifier" "(" ")"
#line 285 "frontend/parser.y"
                { yylhs.value.as < mind::ast::Expr* > () = new ast::CallExpr(new ast::ExprList(), yystack_[2].value.as < std::string > (), POS(yystack_[2].location)); }
#line 1194 "parser.cpp"
    break;

  case 55: // Expr: "(" Expr ")"
#line 287 "frontend/parser.y"
                { yylhs.value.as < mind::ast::Expr* > () = yystack_[1].value.as < mind::ast::Expr* > (); }
#line 1200 "parser.cpp"
    break;

  case 56: // Expr: Expr "!=" Expr
#line 289 "frontend/parser.y"
                { yylhs.value.as < mind::ast::Expr* > () = new ast::NeqExpr(yystack_[2].value.as < mind::ast::Expr* > (), yystack_[0].value.as < mind::ast::Expr* > (), POS(yystack_[1].location)); }
#line 1206 "parser.cpp"
    break;

  case 57: // Expr: Expr "==" Expr
#line 291 "frontend/parser.y"
                { yylhs.value.as < mind::ast::Expr* > () = new ast::EquExpr(yystack_[2].value.as < mind::ast::Expr* > (), yystack_[0].value.as < mind::ast::Expr* > (), POS(yystack_[1].location)); }
#line 1212 "parser.cpp"
    break;

  case 58: // Expr: Expr ">=" Expr
#line 293 "frontend/parser.y"
                { yylhs.value.as < mind::ast::Expr* > () = new ast::GeqExpr(yystack_[2].value.as < mind::ast::Expr* > (), yystack_[0].value.as < mind::ast::Expr* > (), POS(yystack_[1].location)); }
#line 1218 "parser.cpp"
    break;

  case 59: // Expr: Expr ">" Expr
#line 295 "frontend/parser.y"
                { yylhs.value.as < mind::ast::Expr* > () = new ast::GrtExpr(yystack_[2].value.as < mind::ast::Expr* > (), yystack_[0].value.as < mind::ast::Expr* > (), POS(yystack_[1].location)); }
#line 1224 "parser.cpp"
    break;

  case 60: // Expr: Expr "<=" Expr
#line 297 "frontend/parser.y"
                { yylhs.value.as < mind::ast::Expr* > () = new ast::GeqExpr(yystack_[0].value.as < mind::ast::Expr* > (), yystack_[2].value.as < mind::ast::Expr* > (), POS(yystack_[1].location)); }
#line 1230 "parser.cpp"
    break;

  case 61: // Expr: Expr "<" Expr
#line 299 "frontend/parser.y"
                { yylhs.value.as < mind::ast::Expr* > () = new ast::GrtExpr(yystack_[0].value.as < mind::ast::Expr* > (), yystack_[2].value.as < mind::ast::Expr* > (), POS(yystack_[1].location)); }
#line 1236 "parser.cpp"
    break;

  case 62: // Expr: Expr "&&" Expr
#line 301 "frontend/parser.y"
                { yylhs.value.as < mind::ast::Expr* > () = new ast::AndExpr(yystack_[2].value.as < mind::ast::Expr* > (), yystack_[0].value.as < mind::ast::Expr* > (), POS(yystack_[1].location)); }
#line 1242 "parser.cpp"
    break;

  case 63: // Expr: Expr "||" Expr
#line 303 "frontend/parser.y"
                { yylhs.value.as < mind::ast::Expr* > () = new ast::OrExpr(yystack_[2].value.as < mind::ast::Expr* > (), yystack_[0].value.as < mind::ast::Expr* > (), POS(yystack_[1].location)); }
#line 1248 "parser.cpp"
    break;

  case 64: // Expr: Expr "+" Expr
#line 305 "frontend/parser.y"
                { yylhs.value.as < mind::ast::Expr* > () = new ast::AddExpr(yystack_[2].value.as < mind::ast::Expr* > (), yystack_[0].value.as < mind::ast::Expr* > (), POS(yystack_[1].location)); }
#line 1254 "parser.cpp"
    break;

  case 65: // Expr: Expr "-" Expr
#line 307 "frontend/parser.y"
                { yylhs.value.as < mind::ast::Expr* > () = new ast::SubExpr(yystack_[2].value.as < mind::ast::Expr* > (), yystack_[0].value.as < mind::ast::Expr* > (), POS(yystack_[1].location)); }
#line 1260 "parser.cpp"
    break;

  case 66: // Expr: Expr "*" Expr
#line 309 "frontend/parser.y"
                { yylhs.value.as < mind::ast::Expr* > () = new ast::MulExpr(yystack_[2].value.as < mind::ast::Expr* > (), yystack_[0].value.as < mind::ast::Expr* > (), POS(yystack_[1].location)); }
#line 1266 "parser.cpp"
    break;

  case 67: // Expr: Expr "/" Expr
#line 311 "frontend/parser.y"
                { yylhs.value.as < mind::ast::Expr* > () = new ast::DivExpr(yystack_[2].value.as < mind::ast::Expr* > (), yystack_[0].value.as < mind::ast::Expr* > (), POS(yystack_[1].location)); }
#line 1272 "parser.cpp"
    break;

  case 68: // Expr: Expr "%" Expr
#line 313 "frontend/parser.y"
                { yylhs.value.as < mind::ast::Expr* > () = new ast::ModExpr(yystack_[2].value.as < mind::ast::Expr* > (), yystack_[0].value.as < mind::ast::Expr* > (), POS(yystack_[1].location)); }
#line 1278 "parser.cpp"
    break;

  case 69: // Expr: Expr "?" Expr ":" Expr
#line 315 "frontend/parser.y"
                { yylhs.value.as < mind::ast::Expr* > () = new ast::IfExpr(yystack_[4].value.as < mind::ast::Expr* > (),yystack_[2].value.as < mind::ast::Expr* > (),yystack_[0].value.as < mind::ast::Expr* > (),POS(yystack_[3].location)); }
#line 1284 "parser.cpp"
    break;

  case 70: // Expr: "-" Expr
#line 317 "frontend/parser.y"
                { yylhs.value.as < mind::ast::Expr* > () = new ast::NegExpr(yystack_[0].value.as < mind::ast::Expr* > (), POS(yystack_[1].location)); }
#line 1290 "parser.cpp"
    break;

  case 71: // Expr: "~" Expr
#line 319 "frontend/parser.y"
                { yylhs.value.as < mind::ast::Expr* > () = new ast::BitNotExpr(yystack_[0].value.as < mind::ast::Expr* > (), POS(yystack_[1].location)); }
#line 1296 "parser.cpp"
    break;

  case 72: // Expr: "!" Expr
#line 321 "frontend/parser.y"
                { yylhs.value.as < mind::ast::Expr* > () = new ast::NotExpr(yystack_[0].value.as < mind::ast::Expr* > (), POS(yystack_[1].location)); }
#line 1302 "parser.cpp"
    break;


#line 1306 "parser.cpp"

            default:
              break;
            }
        }
#if YY_EXCEPTIONS
      catch (const syntax_error& yyexc)
        {
          YYCDEBUG << "Caught exception: " << yyexc.what() << '\n';
          error (yyexc);
          YYERROR;
        }
#endif // YY_EXCEPTIONS
      YY_SYMBOL_PRINT ("-> $$ =", yylhs);
      yypop_ (yylen);
      yylen = 0;

      // Shift the result of the reduction.
      yypush_ (YY_NULLPTR, YY_MOVE (yylhs));
    }
    goto yynewstate;


  /*--------------------------------------.
  | yyerrlab -- here on detecting error.  |
  `--------------------------------------*/
  yyerrlab:
    // If not already recovering from an error, report this error.
    if (!yyerrstatus_)
      {
        ++yynerrs_;
        std::string msg = YY_("syntax error");
        error (yyla.location, YY_MOVE (msg));
      }


    yyerror_range[1].location = yyla.location;
    if (yyerrstatus_ == 3)
      {
        /* If just tried and failed to reuse lookahead token after an
           error, discard it.  */

        // Return failure if at end of input.
        if (yyla.kind () == symbol_kind::S_YYEOF)
          YYABORT;
        else if (!yyla.empty ())
          {
            yy_destroy_ ("Error: discarding", yyla);
            yyla.clear ();
          }
      }

    // Else will try to reuse lookahead token after shifting the error token.
    goto yyerrlab1;


  /*---------------------------------------------------.
  | yyerrorlab -- error raised explicitly by YYERROR.  |
  `---------------------------------------------------*/
  yyerrorlab:
    /* Pacify compilers when the user code never invokes YYERROR and
       the label yyerrorlab therefore never appears in user code.  */
    if (false)
      YYERROR;

    /* Do not reclaim the symbols of the rule whose action triggered
       this YYERROR.  */
    yypop_ (yylen);
    yylen = 0;
    YY_STACK_PRINT ();
    goto yyerrlab1;


  /*-------------------------------------------------------------.
  | yyerrlab1 -- common code for both syntax error and YYERROR.  |
  `-------------------------------------------------------------*/
  yyerrlab1:
    yyerrstatus_ = 3;   // Each real token shifted decrements this.
    // Pop stack until we find a state that shifts the error token.
    for (;;)
      {
        yyn = yypact_[+yystack_[0].state];
        if (!yy_pact_value_is_default_ (yyn))
          {
            yyn += symbol_kind::S_YYerror;
            if (0 <= yyn && yyn <= yylast_
                && yycheck_[yyn] == symbol_kind::S_YYerror)
              {
                yyn = yytable_[yyn];
                if (0 < yyn)
                  break;
              }
          }

        // Pop the current state because it cannot handle the error token.
        if (yystack_.size () == 1)
          YYABORT;

        yyerror_range[1].location = yystack_[0].location;
        yy_destroy_ ("Error: popping", yystack_[0]);
        yypop_ ();
        YY_STACK_PRINT ();
      }
    {
      stack_symbol_type error_token;

      yyerror_range[2].location = yyla.location;
      YYLLOC_DEFAULT (error_token.location, yyerror_range, 2);

      // Shift the error token.
      error_token.state = state_type (yyn);
      yypush_ ("Shifting", YY_MOVE (error_token));
    }
    goto yynewstate;


  /*-------------------------------------.
  | yyacceptlab -- YYACCEPT comes here.  |
  `-------------------------------------*/
  yyacceptlab:
    yyresult = 0;
    goto yyreturn;


  /*-----------------------------------.
  | yyabortlab -- YYABORT comes here.  |
  `-----------------------------------*/
  yyabortlab:
    yyresult = 1;
    goto yyreturn;


  /*-----------------------------------------------------.
  | yyreturn -- parsing is finished, return the result.  |
  `-----------------------------------------------------*/
  yyreturn:
    if (!yyla.empty ())
      yy_destroy_ ("Cleanup: discarding lookahead", yyla);

    /* Do not reclaim the symbols of the rule whose action triggered
       this YYABORT or YYACCEPT.  */
    yypop_ (yylen);
    YY_STACK_PRINT ();
    while (1 < yystack_.size ())
      {
        yy_destroy_ ("Cleanup: popping", yystack_[0]);
        yypop_ ();
      }

    return yyresult;
  }
#if YY_EXCEPTIONS
    catch (...)
      {
        YYCDEBUG << "Exception caught: cleaning lookahead and stack\n";
        // Do not try to display the values of the reclaimed symbols,
        // as their printers might throw an exception.
        if (!yyla.empty ())
          yy_destroy_ (YY_NULLPTR, yyla);

        while (1 < yystack_.size ())
          {
            yy_destroy_ (YY_NULLPTR, yystack_[0]);
            yypop_ ();
          }
        throw;
      }
#endif // YY_EXCEPTIONS
  }

  void
  parser::error (const syntax_error& yyexc)
  {
    error (yyexc.location, yyexc.what ());
  }

#if YYDEBUG || 0
  const char *
  parser::symbol_name (symbol_kind_type yysymbol)
  {
    return yytname_[yysymbol];
  }
#endif // #if YYDEBUG || 0





  const signed char parser::yypact_ninf_ = -91;

  const signed char parser::yytable_ninf_ = -1;

  const short
  parser::yypact_[] =
  {
       6,   -91,    -3,     2,     6,   -91,   -27,   -91,   -91,   -91,
     -91,   -91,   -16,   -91,   297,     6,   -23,    -6,   297,   297,
     297,   297,   -19,   -91,    12,   -91,   327,    10,   -91,    13,
      14,   -91,   -91,   -91,   -91,   220,    79,   297,   -91,   297,
     297,   297,   297,   297,   297,   297,   297,   297,   297,   297,
     297,   297,   297,   -91,   297,    15,    17,    32,   -91,   -91,
      37,   348,   195,   432,   471,   471,   462,   449,    83,    83,
      57,    57,   -91,   -91,   -91,    83,    83,   369,   -91,   -91,
       6,   -91,   -91,   297,    39,   297,    54,   -91,   -91,   -91,
     432,   297,    42,   165,    50,    51,    23,    46,   -91,   -91,
     -91,    45,   -91,   -91,   -91,   -91,   -91,   -91,   -91,   -91,
     390,   411,   297,    78,   297,   127,   -91,   -91,   124,    16,
     -91,   -91,   243,    56,   266,    64,   297,   432,   -91,   165,
     297,   165,   297,    70,   102,   289,   -91,    84,   297,   165,
      88,   297,    75,   -91,   -91,    82,   165,   165,   -91,   -91
  };

  const signed char
  parser::yydefact_[] =
  {
       0,    13,     0,     0,     2,     3,     0,     5,    14,     1,
       4,     6,     0,    36,     0,     9,     0,     0,     0,     0,
       0,     0,    43,    51,    45,    52,     0,     0,    10,     0,
       0,    38,    70,    72,    71,     0,     0,     0,    44,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    37,     0,     0,    11,    40,    55,    54,
       0,    49,     0,    46,    57,    56,    62,    63,    60,    58,
      64,    65,    66,    67,    68,    61,    59,     0,     8,    15,
       0,    39,    53,     0,    48,     0,     0,    12,    50,    47,
      69,     0,     0,     0,     0,     0,     0,     0,    26,    15,
       7,     0,    16,    22,    21,    23,    20,    17,    18,    19,
       0,     0,     0,     0,     0,    32,    24,    25,     0,     0,
      42,    41,     0,     0,     0,     0,    32,    33,    27,     0,
       0,     0,    32,     0,    34,     0,    28,     0,    32,     0,
       0,    32,     0,    35,    31,     0,     0,     0,    30,    29
  };

  const signed char
  parser::yypgoto_[] =
  {
     -91,   -91,   -91,   115,   -91,    58,     9,    26,   -90,   -91,
     -91,   -91,   -71,   -91,     8,    65,   -91,   -91,   -91,   -91,
      53,    43,   -14
  };

  const signed char
  parser::yydefgoto_[] =
  {
       0,     3,     4,     5,    27,    28,   101,    86,   102,   103,
     104,   105,   125,   106,   107,    17,   108,   109,    24,    25,
      38,    60,   110
  };

  const unsigned char
  parser::yytable_[] =
  {
      26,     8,     9,   113,    32,    33,    34,    35,     7,     6,
       1,    13,    11,     6,    12,    36,    14,    37,    15,    30,
      16,    31,    61,    62,    29,    63,    64,    65,    66,    67,
      68,    69,    70,    71,    72,    73,    74,    75,    76,   134,
      77,   136,    78,    13,    39,    55,     2,    80,    14,   143,
     116,    57,    16,    79,    56,   133,   148,   149,     1,    91,
      92,   137,    93,    94,    95,    96,    97,   142,    16,    61,
     145,    90,    82,   117,    18,    37,   112,   111,    48,    49,
      50,    98,    19,    20,   114,   115,   119,   123,    21,    29,
     130,   132,    99,   100,     2,    22,    23,   138,   122,    18,
     124,   127,    46,    47,    48,    49,    50,    19,    20,   139,
     146,   141,   127,    21,    59,   144,   135,   147,   127,    10,
      22,    23,    81,   126,   127,   118,    88,   127,     1,    91,
      92,     1,    93,    94,    95,    96,    97,    89,    87,     0,
       0,     0,     0,     0,    18,     0,     0,    18,     0,     0,
       0,    98,    19,    20,     0,    19,    20,     0,    21,     0,
       0,    21,    99,   128,     2,    22,    23,     2,    22,    23,
      91,    92,     0,    93,    94,    95,    96,    97,     0,     0,
       0,     0,     0,     0,     0,    18,     0,     0,     0,     0,
       0,     0,    98,    19,    20,     0,     0,     0,     0,    21,
       0,     0,     0,    99,     0,     0,    22,    23,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      52,     0,     0,     0,     0,     0,     0,     0,    54,     0,
       0,     0,    84,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    51,    52,     0,     0,     0,     0,
       0,     0,     0,    54,     0,    58,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    51,    52,     0,
       0,     0,     0,     0,     0,     0,    54,     0,   129,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      51,    52,     0,     0,     0,     0,     0,     0,     0,    54,
       0,   131,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    51,    52,     0,     0,    18,     0,     0,
       0,     0,    54,     0,   140,    19,    20,     0,     0,     0,
       0,    21,     0,     0,     0,     0,     0,     0,    22,    23,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    51,    52,     0,    53,     0,     0,     0,     0,     0,
      54,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    51,    52,     0,     0,     0,     0,    83,     0,
       0,    54,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    51,    52,    85,     0,     0,     0,     0,
       0,     0,    54,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    51,    52,     0,   120,     0,     0,
       0,     0,     0,    54,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    51,    52,     0,   121,     0,
       0,     0,     0,     0,    54,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    52,     0,     0,
       0,     0,    40,    41,    42,    54,    44,    45,    46,    47,
      48,    49,    50,    51,    52,    40,    41,     0,     0,    44,
      45,    46,    47,    48,    49,    50,    51,    52,    44,    45,
      46,    47,    48,    49,    50,    51,    52
  };

  const short
  parser::yycheck_[] =
  {
      14,     4,     0,    93,    18,    19,    20,    21,     0,     0,
       4,    27,     4,     4,    41,    34,    32,    36,    34,    42,
      36,    27,    36,    37,    15,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    51,    52,   129,
      54,   131,    27,    27,    32,    35,    40,    30,    32,   139,
      27,    37,    36,    38,    41,   126,   146,   147,     4,     5,
       6,   132,     8,     9,    10,    11,    12,   138,    36,    83,
     141,    85,    35,    27,    20,    36,    34,    91,    21,    22,
      23,    27,    28,    29,    34,    34,    41,     9,    34,    80,
      34,    27,    38,    39,    40,    41,    42,    27,   112,    20,
     114,   115,    19,    20,    21,    22,    23,    28,    29,     7,
      35,    27,   126,    34,    35,    27,   130,    35,   132,     4,
      41,    42,    57,   115,   138,    99,    83,   141,     4,     5,
       6,     4,     8,     9,    10,    11,    12,    84,    80,    -1,
      -1,    -1,    -1,    -1,    20,    -1,    -1,    20,    -1,    -1,
      -1,    27,    28,    29,    -1,    28,    29,    -1,    34,    -1,
      -1,    34,    38,    39,    40,    41,    42,    40,    41,    42,
       5,     6,    -1,     8,     9,    10,    11,    12,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    20,    -1,    -1,    -1,    -1,
      -1,    -1,    27,    28,    29,    -1,    -1,    -1,    -1,    34,
      -1,    -1,    -1,    38,    -1,    -1,    41,    42,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    33,    -1,
      -1,    -1,    37,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,    25,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    33,    -1,    35,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,    25,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    33,    -1,    35,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,    25,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    33,
      -1,    35,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,    25,    -1,    -1,    20,    -1,    -1,
      -1,    -1,    33,    -1,    35,    28,    29,    -1,    -1,    -1,
      -1,    34,    -1,    -1,    -1,    -1,    -1,    -1,    41,    42,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,    25,    -1,    27,    -1,    -1,    -1,    -1,    -1,
      33,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,    25,    -1,    -1,    -1,    -1,    30,    -1,
      -1,    33,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,    25,    26,    -1,    -1,    -1,    -1,
      -1,    -1,    33,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,    25,    -1,    27,    -1,    -1,
      -1,    -1,    -1,    33,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,    25,    -1,    27,    -1,
      -1,    -1,    -1,    -1,    33,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,    25,    -1,    -1,
      -1,    -1,    13,    14,    15,    33,    17,    18,    19,    20,
      21,    22,    23,    24,    25,    13,    14,    -1,    -1,    17,
      18,    19,    20,    21,    22,    23,    24,    25,    17,    18,
      19,    20,    21,    22,    23,    24,    25
  };

  const signed char
  parser::yystos_[] =
  {
       0,     4,    40,    45,    46,    47,    50,    58,     4,     0,
      47,    58,    41,    27,    32,    34,    36,    59,    20,    28,
      29,    34,    41,    42,    62,    63,    66,    48,    49,    50,
      42,    27,    66,    66,    66,    66,    34,    36,    64,    32,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,    25,    27,    33,    35,    41,    37,    35,    35,
      65,    66,    66,    66,    66,    66,    66,    66,    66,    66,
      66,    66,    66,    66,    66,    66,    66,    66,    27,    38,
      30,    59,    35,    30,    37,    26,    51,    49,    65,    64,
      66,     5,     6,     8,     9,    10,    11,    12,    27,    38,
      39,    50,    52,    53,    54,    55,    57,    58,    60,    61,
      66,    66,    34,    52,    34,    34,    27,    27,    51,    41,
      27,    27,    66,     9,    66,    56,    58,    66,    39,    35,
      34,    35,    27,    56,    52,    66,    52,    56,    27,     7,
      35,    27,    56,    52,    27,    56,    35,    35,    52,    52
  };

  const signed char
  parser::yyr1_[] =
  {
       0,    44,    45,    46,    46,    46,    46,    47,    47,    48,
      48,    49,    49,    50,    50,    51,    51,    51,    52,    52,
      52,    52,    52,    52,    52,    52,    52,    53,    54,    55,
      55,    55,    56,    56,    57,    57,    58,    58,    58,    59,
      59,    60,    61,    62,    62,    63,    63,    64,    64,    65,
      65,    66,    66,    66,    66,    66,    66,    66,    66,    66,
      66,    66,    66,    66,    66,    66,    66,    66,    66,    66,
      66,    66,    66
  };

  const signed char
  parser::yyr2_[] =
  {
       0,     2,     1,     1,     2,     1,     2,     8,     6,     0,
       1,     2,     4,     1,     2,     0,     2,     2,     1,     1,
       1,     1,     1,     1,     2,     2,     1,     3,     5,     9,
       8,     7,     0,     1,     5,     7,     3,     5,     4,     4,
       3,     3,     2,     1,     2,     1,     3,     4,     3,     1,
       3,     1,     1,     4,     3,     3,     3,     3,     3,     3,
       3,     3,     3,     3,     3,     3,     3,     3,     3,     5,
       2,     2,     2
  };


#if YYDEBUG
  // YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
  // First, the terminals, then, starting at \a YYNTOKENS, nonterminals.
  const char*
  const parser::yytname_[] =
  {
  "\"end of file\"", "error", "\"invalid token\"", "\"bool\"", "\"int\"",
  "\"return\"", "\"if\"", "\"else\"", "\"do\"", "\"while\"", "\"for\"",
  "\"break\"", "\"continue\"", "\"==\"", "\"!=\"", "\"&&\"", "\"||\"",
  "\"<=\"", "\">=\"", "\"+\"", "\"-\"", "\"*\"", "\"/\"", "\"%\"", "\"<\"",
  "\">\"", "\":\"", "\";\"", "\"!\"", "\"~\"", "\",\"", "\".\"", "\"=\"",
  "\"?\"", "\"(\"", "\")\"", "\"[\"", "\"]\"", "\"{\"", "\"}\"",
  "\"const\"", "\"identifier\"", "\"iconst\"", "NEG", "$accept", "Program",
  "FoDList", "FuncDefn", "FormalList", "ParameterList", "Type", "StmtList",
  "Stmt", "CompStmt", "WhileStmt", "ForStmt", "ForExpr", "IfStmt",
  "DeclStmt", "Index", "ReturnStmt", "ExprStmt", "VarRef", "LvalueExpr",
  "IndexExpr", "ExprList", "Expr", YY_NULLPTR
  };
#endif


#if YYDEBUG
  const short
  parser::yyrline_[] =
  {
       0,   131,   131,   136,   138,   142,   144,   149,   152,   156,
     157,   160,   163,   168,   170,   173,   174,   177,   183,   184,
     185,   186,   187,   188,   190,   192,   194,   198,   201,   204,
     206,   208,   213,   214,   218,   220,   225,   227,   229,   234,
     238,   243,   246,   250,   252,   256,   258,   263,   265,   268,
     272,   278,   280,   282,   284,   286,   288,   290,   292,   294,
     296,   298,   300,   302,   304,   306,   308,   310,   312,   314,
     316,   318,   320
  };

  void
  parser::yy_stack_print_ () const
  {
    *yycdebug_ << "Stack now";
    for (stack_type::const_iterator
           i = yystack_.begin (),
           i_end = yystack_.end ();
         i != i_end; ++i)
      *yycdebug_ << ' ' << int (i->state);
    *yycdebug_ << '\n';
  }

  void
  parser::yy_reduce_print_ (int yyrule) const
  {
    int yylno = yyrline_[yyrule];
    int yynrhs = yyr2_[yyrule];
    // Print the symbols being reduced, and their result.
    *yycdebug_ << "Reducing stack by rule " << yyrule - 1
               << " (line " << yylno << "):\n";
    // The symbols being reduced.
    for (int yyi = 0; yyi < yynrhs; yyi++)
      YY_SYMBOL_PRINT ("   $" << yyi + 1 << " =",
                       yystack_[(yynrhs) - (yyi + 1)]);
  }
#endif // YYDEBUG


} // yy
#line 1776 "parser.cpp"

#line 324 "frontend/parser.y"


/* SECTION IV: customized section */
#include "compiler.hpp"
#include <cstdio>

static ast::Program* ptree = NULL;
//static ast::Scope* scope = new Scope;
extern int myline, mycol;   // defined in scanner.l

// bison will generate code to invoke me
void yyerror (char const *msg) {
  err::issue(new Location(myline, mycol), new err::SyntaxError(msg));
  scan_end();
  std::exit(1);
}

// call me when the Program symbol is reduced
void setParseTree(ast::Program* tree) {
  ptree = tree;
}

/* Parses a given mind source file.
 *
 * PARAMETERS:
 *   filename - name of the source file
 * RETURNS:
 *   the parse tree (in the form of abstract syntax tree)
 * NOTE:
 *   should any syntax error occur, this function would not return.
 */
ast::Program* mind::MindCompiler::parseFile(const char* filename) {  
  scan_begin(filename);
  /* if (NULL == filename)
	yyin = stdin;
  else
	yyin = std::fopen(filename, "r"); */
  yy::parser parse;
  parse();
  scan_end();
  /* if (yyin != stdin)
	std::fclose(yyin); */
  
  return ptree;
}

void yy::parser::error (const location_type& l, const std::string& m)
{
  //std::cerr << l << ": " << m << '\n';
  err::issue(new Location(l.begin.line, l.begin.column), new err::SyntaxError(m));
  
  scan_end();
  std::exit(1);
}
