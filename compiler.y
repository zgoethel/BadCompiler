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
%type <ExprRes> ExprA
%type <ExprRes> ExprB
%type <ExprRes> ExprC
%type <ExprRes> ExprD
%type <ExprRes> ExprE
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

%%
Prog            : Declarations StmtSeq                      { Finish($2); } 
Declarations    : Dec Declarations                          {  }
                |                                           {  }
Dec             : VAR Id ':' Type ';'                       { enterName(table, $2); }
StmtSeq         : Stmt StmtSeq                              { $$ = AppendSeq($1, $2); }
                |                                           { $$ = NULL; }
Stmt            : PRINT '(' ExprA ')' ';'                   { $$ = doPrint($3); }
                | Id '=' ExprA ';'                          { $$ = doAssign($1, $3); }
                | IF '(' ExprA ')' '{' StmtSeq '}'          { $$ = doIf($3, $6); }
// Top of expression tree (lowest precedence)
ExprA           : ExprB EQUALS ExprB                        { $$ = doBExpr($1, $3); }
                | ExprB                                     { $$ = $1; }
ExprB           : ExprB '+' ExprC                           { $$ = doAdd($1, $3); }
                | ExprC                                     { $$ = $1; }
ExprC           : ExprC '*' ExprD                           { $$ = doMult($1, $3); }
                | ExprD                                     { $$ = $1; }
ExprD           : '-' ExprE                                 { $$ = doNegate($2); }
                | ExprE                                     { $$ = $1; }
ExprE           : INT_LIT                                   { $$ = doIntLit(yytext); }
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