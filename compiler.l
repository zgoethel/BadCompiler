%{
    #include <stdbool.h>
    #include <string.h>

    #include "IOMngr.h"
    #include "y.tab.h"

    #define YY_INPUT(buf, result, max_size) { \
        char c = next_char(); \
        result = (c == EOF) ? YY_NULL : (buf[0] = c, 1); \
    }
%}

letter [A-Za-z]
digit [0-9]

%%
var                         { return VAR; }
if                          { return IF; }
print                       { return PRINT; }
read                        { return READ; }
printLines                  { return PR_LINES; }
printSpaces                 { return PR_SPACES; }
else                        { return ELSE; }
while                       { return WHILE; }
for                         { return FOR; }
return                      { return RETURN; }
fun                         { return FUN; }
Ref                         { return REF; }
_*{letter}({letter}|{digit}|_)* { return IDENT; }
{digit}{digit}*             { return INT_LIT; }
\"(\\.|[^"\\])*\"           { return STR_LIT; }
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
\,                          { return ','; }
\&                          { return '&'; }
[ ]                         {  }
\t                          {  }
\r                          {  }
\n                          {  }
.                           {
                                put_warning(NULL);
                                put_marker(col_num() - 1);
                                put_warning("Unexpected character in input");
                                put_warning(yytext);
                            }
%%

int yywrap () {
    return 1;
}