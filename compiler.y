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
    struct type_descriptor_t *TypeDesc;
    struct arr_expr_t *ArrExpr;
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
%type <TypeDesc> Type
%type <TypeDesc> Arr
%type <TypeDesc> ArrSeq
%type <InstrSeq> PrintSeq
%type <InstrSeq> ReadSeq
%type <string> StrLit
%type <string> IntLit
%type <InstrSeq> Assignment
%type <string> Ident
%type <ArrExpr> ArrExpr
%type <ArrExpr> ArrSeqExpr

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
%token READ
%token PR_LINES
%token PR_SPACES
%token STR_LIT
%token ELSE
%token WHILE
%token FOR
%token RETURN
%token VOID

%%
Prog            : StmtSeq                                   { Finish($1); }
StmtSeq         : Stmt StmtSeq                              { $$ = AppendSeq($1, $2); }
                |                                           { $$ = NULL; }
Stmt            : PRINT '(' PrintSeq ')' ';'                { $$ = $3; }
                | READ '(' ReadSeq ')' ';'                  { $$ = $3; }
                | PR_LINES '(' Expr ')' ';'                 { $$ = doPrintLines($3); }
                | PR_SPACES '(' Expr ')' ';'                { $$ = doPrintSpaces($3); }
                | Assignment ';'                            { $$ = $1; }
                | IF '(' Expr ')' '{' StmtSeq '}'           { $$ = doIf($3, $6); }
                | IF '(' Expr ')' '{' StmtSeq '}'
                  ELSE '{' StmtSeq '}'                      { $$ = doIfElse($3, $6, $10); }
                | WHILE '(' Expr ')' '{' StmtSeq '}'        { $$ = doWhile($3, $6); }
                | FOR '(' Assignment ';' Expr ';' Assignment ')'
                  '{' StmtSeq '}'                           { $$ = doFor($3, $5, $7, $10); }
Assignment      : VAR Id ':' Type '=' Expr                  { enterName(table, $2); setCurrentAttr(table, $4); $$ = doAssign($2, NULL, $6); }
                | VAR Id ':' Type                           { enterName(table, $2); setCurrentAttr(table, $4); $$ = NULL; }
                | Id ArrSeqExpr '=' Expr                    { $$ = doAssign($1, $2, $4); }
ReadSeq         : ReadSeq ',' Id                            { $$ = AppendSeq($1, doReadId($3)); }
                | Id                                        { $$ = doReadId($1); }
PrintSeq        : PrintSeq ',' Expr                         { $$ = AppendSeq($1, doPrint($3)); }
                | Expr                                      { $$ = doPrint($1); }
                | PrintSeq ',' StrLit                       { $$ = AppendSeq($1, doPrintStr($3)); }
                | StrLit                                    { $$ = doPrintStr($1); }
                | PrintSeq ',' LT Id GT                     { $$ = AppendSeq($1, doReadId($4)); }
                | LT Id GT                                  { $$ = doReadId($2); }
StrLit          : STR_LIT                                   { $$ = doStringLit(yytext); } 
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
                | '!' ExprF                                 { $$ = doLogNegate($2); }
                | ExprF                                     { $$ = $1; }
ExprF           : IntLit                                    { $$ = doIntLit($1); }
                | Ident ArrSeqExpr                          { $$ = doRval($1, $2); }
                | '(' ExprA ')'                             { $$ = $2; }                
// Bottom of expression tree (highest precedence)
Id              : IDENT                                     { $$ = strdup(yytext); }
Type            : Id ArrSeq                                 { if ($2 != NULL) { $2->name = $1; $$ = $2; } else $$ = doTypeDescriptor($1, 0, NULL); }
ArrSeq          : ArrSeq Arr                                { $$ = doArrSeq($1, $2, 0); }
                |                                           { $$ = NULL; }
Arr             : '[' IntLit ']'                            { int i; sscanf($2, "%d", &i); $$ = doArrSeq(NULL, NULL, i); }
ArrSeqExpr      : ArrSeqExpr ArrExpr                        { $$ = doArrSeqExpr($1, $2, NULL); }
                |                                           { $$ = NULL; }
ArrExpr         : '[' Expr ']'                              { $$ = doArrSeqExpr(NULL, NULL, $2); }
IntLit          : INT_LIT                                   { $$ = strdup(yytext); }
Ident           : IDENT                                     { $$ = strdup(yytext); }

%%

int yyerror(char *s) {
    writeMessage(NULL);
    writeIndicator(getCurrentColumnNum() - 1);
    writeMessage("Syntax error; unexpected token near here");
    writeMessage(yytext);

    return 1;
}