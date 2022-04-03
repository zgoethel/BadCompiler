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
%type <InstrSeq> StmtSeq
%type <InstrSeq> Stmt

%token IDENT
%token INT_LIT
%token EQUALS
%token INT
%token IF
%token PRINT

%%
Prog            : Declarations StmtSeq                      { Finish($2); } 
Declarations    : Dec Declarations                          {  }
                |                                           {  }
Dec             : INT Id ';'                                { enterName(table, $2); }
StmtSeq         : Stmt StmtSeq                              { $$ = AppendSeq($1, $2); }
                |                                           { $$ = NULL; }
Stmt            : PRINT ExprA ';'                           { $$ = doPrint($2); }
                | Id '=' ExprA ';'                          { $$ = doAssign($1, $3); }
                | IF '(' ExprA ')' '{' StmtSeq '}'          { $$ = doIf($3, $6); }
// Top of expression tree (lowest precedence)
ExprA           : ExprB EQUALS ExprB                        { $$ = doBExpr($1, $3); }
                | ExprB                                     { $$ = $1; }
ExprB           : ExprB '+' ExprC                           { $$ = doAdd($1, $3); }
                | ExprC                                     { $$ = $1; }
ExprC           : ExprC '*' ExprD                           { $$ = doMult($1, $3); }
                | ExprD                                     { $$ = $1; }
ExprD           : INT_LIT                                   { $$ = doIntLit(yytext); }
                | IDENT                                     { $$ = doRval(yytext); }
                | '(' ExprA ')'                             { $$ = $2; }
// Bottom of expression tree (highest precedence)
Id              : IDENT                                     { $$ = strdup(yytext); }
%%

int yyerror(char *s) {
    writeMessage(NULL);
    writeIndicator(getCurrentColumnNum() - 1);
    writeMessage("Syntax error; unexpected token near here");
    writeMessage(yytext);

    return 1;
}