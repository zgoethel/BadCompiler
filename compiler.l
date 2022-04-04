%{
    #include <stdbool.h>
    #include <string.h>

    #include "IOMngr.h"
    #include "y.tab.h"

    #define YY_INPUT(buf, result, max_size) { \
        char c = getNextSourceChar(); \
        result = (c == EOF) ? YY_NULL : (buf[0] = c, 1); \
    }
%}

letter [A-Za-z]
digit [0-9]

%%
var                         { return VAR; }
if                          { return IF; }
print                       { return PRINT; }
{letter}({letter}|{digit})* { return IDENT; }
{digit}{digit}*             { return INT_LIT; }
\<                          { return LT; }
\<\=                        { return LTE; }
\>                          { return GT; }
\>\=                        { return GTE; }
\!\=                        { return N_EQUALS; }
\&\&                        { return AND; }
\|\|                        { return OR; }
\=\=                        { return EQUALS; }
\=                          { return '='; }
\+                          { return '+'; }
\*                          { return '*'; }
\;                          { return ';'; }
\(                          { return '('; }
\)                          { return ')'; }
\{                          { return '{'; }
\}                          { return '}'; }
\[                          { return '['; }
\]                          { return ']'; }
\-                          { return '-'; }
\:                          { return ':'; }
\/                          { return '/'; }
\%                          { return '%'; }
\^                          { return '^'; }
\!                          { return '!'; }
[ ]                         {  }
\t                          {  }
\r                          {  }
\n                          {  }
.                           {
                                writeMessage(NULL);
                                writeIndicator(getCurrentColumnNum() - 1);
                                writeMessage("Unexpected character in input");
                                writeMessage(yytext);
                            }
%%

int yywrap () {
    return 1;
}