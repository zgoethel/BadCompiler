%{
    #include <stdbool.h>

    #include "IOMngr.h"
    #include "y.tab.h"
    #include "BoolSemantics.h"

    #define YY_INPUT(buf,result,max_size) { \
        int c = getNextSourceChar(); \
        result = (c == EOF) ? YY_NULL : (buf[0] = c, 1); \
    }
%}

letter [A-Za-z]
digit [0-9]

%%
true                        { return _TRUE; }
false                       { return _FALSE; }
{letter}({letter}|{digit})* { return _IDENT; }
\|\|                        { return _OR; }
\&\&                        { return _AND; }
\=                          { return _EQUALS; }
\!                          { return _EXCLAIM; }
\;                          { return _SEMI_C; }
\(                          { return _OPEN_P; }
\)                          { return _CLOSE_P; }
[ ]                         { }
\t                          { }
\r                          { }
\n                          { }
.                           {
                                writeIndicator(getCurrentColumnNum());
                                writeMessage("Illegal Character in input");
                            }
%%

int yywrap () {
    return 1;
}