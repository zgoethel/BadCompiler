%{
    #include "IOMngr.h"
    #include "SymTab.h"
    #include "Semantics.h"
    #include "CodeGen.h"

    #include <string.h>
    #include <stdio.h>
    #include <stdbool.h>

    extern int yylex();
    extern char *yytext;
    extern int yyerror(char *s);
%}

%union {
    unsigned int count;
    long val;
    char *string;
    struct ExprRes *ExprRes;
    struct InstrSeq *InstrSeq;
}

%type <string> Id
%type <ExprRes> Expr
%type <ExprRes> ExprA
%type <ExprRes> ExprB
%type <ExprRes> ExprC
%type <ExprRes> ExprD
%type <ExprRes> ExprE
%type <ExprRes> ExprF
%type <InstrSeq> StmtSeq
%type <InstrSeq> Stmt
%type <string> Type
%type <count> Arr
%type <count> ArrSeq

%token IDENT
%token INT_LIT
%token EQUALS
%token IF
%token PRINT
%token VAR
%token LT
%token LTE
%token GT
%token GTE
%token N_EQUALS
%token AND
%token OR

%%
Prog            : Declarations StmtSeq                      { Finish($2); } 
Declarations    : Dec Declarations                          {  }
                |                                           {  }
Dec             : VAR Id ':' Type ';'                       { enterName(table, $2); }
StmtSeq         : Stmt StmtSeq                              { $$ = AppendSeq($1, $2); }
                |                                           { $$ = NULL; }
Stmt            : PRINT '(' Expr ')' ';'                    { $$ = doPrint($3); }
                | Id '=' Expr ';'                           { $$ = doAssign($1, $3); }
                | IF '(' Expr ')' '{' StmtSeq '}'           { $$ = doIf($3, $6); }
// Top of expression tree (lowest precedence)
Expr            : ExprA AND ExprA                           { $$ = doAnd($1, $3); }
                | ExprA OR ExprA                            { $$ = doOr($1, $3); }
                | ExprA                                     { $$ = $1; }
ExprA           : ExprB EQUALS ExprB                        { $$ = doBExpr($1, $3); }
                | ExprB LT ExprB                            { $$ = doLessThan($1, $3); }
                | ExprB LTE ExprB                           { $$ = doLessEquals($1, $3); }
                | ExprB GT ExprB                            { $$ = doGreaterThan($1, $3); }
                | ExprB GTE ExprB                           { $$ = doGreaterEquals($1, $3); }
                | ExprB N_EQUALS ExprB                      { $$ = doNotEquals($1, $3); }
                | ExprB                                     { $$ = $1; }
ExprB           : ExprB '+' ExprC                           { $$ = doAdd($1, $3); }
                | ExprB '-' ExprC                           { $$ = doSubtract($1, $3); }
                | ExprC                                     { $$ = $1; }
ExprC           : ExprC '*' ExprD                           { $$ = doMult($1, $3); }
                | ExprC '/' ExprD                           { $$ = doDivide($1, $3); }
                | ExprC '%' ExprD                           { $$ = doModulo($1, $3); }
                | ExprD                                     { $$ = $1; }
ExprD           : ExprE '^' ExprD                           { $$ = doPower($1, $3); }
                | ExprE                                     { $$ = $1; }
ExprE           : '-' ExprF                                 { $$ = doNegate($2); }
                | ExprF                                     { $$ = $1; }
ExprF           : INT_LIT                                   { $$ = doIntLit(yytext); }
                | IDENT                                     { $$ = doRval(yytext); }
                | '(' ExprA ')'                             { $$ = $2; }
// Bottom of expression tree (highest precedence)
Id              : IDENT                                     { $$ = strdup(yytext); }
Type            : Id ArrSeq                                 { $$ = $1; }
ArrSeq          : ArrSeq Arr                                { $$ = $1 + $2; }
                |                                           { $$ = 0; }
Arr             : '[' ']'                                   { $$ = 1; }

%%

int yyerror(char *s) {
    writeMessage(NULL);
    writeIndicator(getCurrentColumnNum() - 1);
    writeMessage("Syntax error; unexpected token near here");
    writeMessage(yytext);

    return 1;
}