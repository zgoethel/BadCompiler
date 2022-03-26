%{
    #include "IOMngr.h"
    #include "h3Semantics.h"

    #include <string.h>
    #include <stdio.h>
    #include <stdbool.h>

    extern int yylex();
    extern char *yytext;
    extern int yyerror(char *s);
%}

%union {
    void *SymTab;
    char *string;
}

%type <string> Id
%type <string> SetLit
%type <SymTab> Expr
%type <SymTab> Term
%type <SymTab> Factor

%token IDENT
%token EQUALS
%token SEMI_C
%token OPEN_P
%token CLOSE_P
%token UNION
%token INTERS
%token EMPTY_SET
%token SET_LIT

%%
Prog : StmtSeq                  {  __PRINT_TABLE(); }
StmtSeq : Stmt StmtSeq          { }
    |                           { }
Stmt : Id EQUALS Expr SEMI_C    { __STORE_VAL($1, $3); }
Expr : Expr UNION Term          { $$ = __UNION($1, $3); }
    | Term                      { $$ = $1; }
Term : Term INTERS Factor       { $$ = __INTERS($1, $3); }
    | Factor                    { $$ = $1; }
Factor : OPEN_P Expr CLOSE_P    { $$ = $2; }
    | SetLit                    { $$ = __PARSE_SET_LIT($1); }
    | Id                        { $$ = __LOAD_VAL($1); }
SetLit : SET_LIT                { $$ = strdup(yytext); }
    | EMPTY_SET                 { $$ = strdup(yytext); }
Id : IDENT                      { $$ = strdup(yytext); }
%%

int yyerror(char *s) {
    writeMessage(NULL);
    writeIndicator(getCurrentColumnNum() - 1);
    writeMessage("Syntax error; unexpected token near here");
    writeMessage(yytext);

    return 1;
}