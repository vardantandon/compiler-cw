import java_cup.runtime.*;

%%

%class Lexer
%unicode
/*%standalone*/
%cup
%line
%column

%{
    private Symbol symbol(int type) {
        return new Symbol(type, yyline, yycolumn);
    }
    
    private Symbol symbol(int type, Object value) {
        return new Symbol(type, yyline, yycolumn, value);
    }
%}

lineTerminator = \r|\n|\r\n
inputCharacter = [^\r\n]
whiteSpace     = {lineTerminator} | [ \t\f]
multiLineComment = "/#" ({whiteSpace}|{inputCharacter}|{whiteSpace}|{lineTerminator})* "#/"
endOfLineComment = "#" {inputCharacter}* {lineTerminator}?
COMMENT = {multiLineComment} | {endOfLineComment}
ID = [a-z][0-9a-zA-Z_]*
CHARACTER = "\'"."\'"
BOOLEAN  = [T|F]
INTEGER  = -?(0|[1-9])[0-9]*
FLOAT = -?[0-9]+.[0-9]+
RATIONAL = -?([0-9]+_)?[0-9]+\/[0-9]+
PRIMITIVE = {character}|{boolean}|{integer}|{float}|{rational}

%%
{COMMENT}     { System.out.print("COMMENT"); return symbol(sym.comment);}
{CHARACTER}   { System.out.print("CHAR"); return symbol(sym.character,new String(yytext()));}
{ID}  	      { System.out.print("ID"); return symbol(sym.id,new String(yytext()));}
{BOOLEAN}     { System.out.print("BOOL"); return symbol(sym.bool, new String(yytext()));}
{INTEGER}     { System.out.print("INT"); return symbol(sym.integer, new Integer(yytext()));}
{FLOAT}       { System.out.print("FLOAT"); return symbol(sym.ffloat, new Float(yytext()));}
{RATIONAL}    { System.out.print("RAT"); return symbol(sym.rat, new String(yytext()));}
