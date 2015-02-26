import java_cup.runtime.*;

%%

%public
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

CHAR_V = "\'"."\'"
BOOL_V  = [T|F]
INT_V  = (0|[1-9])[0-9]*
FLOAT_V = [0-9]+\.[0-9]+
RAT_V = ([0-9]+_)?[0-9]+\/[0-9]+
SEMI = ";"
COMMA = ","
MAIN = "main"
ASSOP = ":="
CONCAT = "::"
COLON = ":"
DOT = "."
IF = "if"
THEN = "then"
ELSE = "else"
RPAREN = ")"
LPAREN = "("
RBRACE = "}"
LBRACE = "{"
READ = "read"
PRINT = "print"
WHILE = "while"
FORALL = "forall"
RETURN = "return"
IN = "in"
TDEF = "tdef"
FDEF = "fdef"
FI = "fi"
DO = "do"
OD = "od"
PLUS = "+"
MINUS = "-"
MULT = "*"
DIV = "/"
EXP = "^"
AND = "&&"
OR = "||"
IMPL = "=>"
EQ = "="
LTEQ = "<="
LT = "<"
GTEQ = ">="
GT = ">"
NOTEQ = "!="
NOT = "!"
LSQB = "["
RSQB = "]"
LEN = "len"
RAT	= "rat"
INT = "int"
FLOAT = "float"
CHAR = "char"
TOP = "top"
SEQ = "seq"
DICT = "dict"
BOOL = "bool"
ALIAS = "alias"
ID = [a-zA-Z][0-9a-zA-Z_]*
STRING= \"[^\"]*\"
QUOTE = \"
%%

{COMMENT}     	{/* ignore */}
{whiteSpace}	{/* ignore */}
{CHAR_V}   		{  return symbol(sym.CHAR_V,new String(yytext()));}

{BOOL_V}     		{  return symbol(sym.BOOL_V, new String(yytext()));}
{INT_V}     		{  return symbol(sym.INT_V, new Integer(yytext()));}
{FLOAT_V}       	{  return symbol(sym.FLOAT_V, new Float(yytext()));}
{RAT_V}    		{  return symbol(sym.RAT_V, new String(yytext()));}



/*Keywords*/
{MAIN}		  	{  return symbol(sym.MAIN); }
{THEN}		  	{  return symbol(sym.THEN);}
{ELSE}		  	{  return symbol(sym.ELSE);}
{READ}		  	{  return symbol(sym.READ);}
{PRINT}		  	{  return symbol(sym.PRINT);}
{WHILE}		  	{  return symbol(sym.WHILE);}
{FORALL}	  	{  return symbol(sym.FORALL);}
{RETURN}	 	{  return symbol(sym.RETURN);}
{IN}		  	{  return symbol(sym.IN);}
{TDEF}		  	{  return symbol(sym.TDEF);}
{FDEF}		  	{  return symbol(sym.FDEF);}
{FI}		  	{  return symbol(sym.FI);}
{DO}		  	{  return symbol(sym.DO);}
{OD}		  	{  return symbol(sym.OD);}
{LEN}		  	{  return symbol(sym.LEN);}
{IF}		  	{  return symbol(sym.IF);}

/* Operator */
{ASSOP}		  	{  return symbol(sym.ASSOP);}
{CONCAT}		{  return symbol(sym.CONCAT);}
{PLUS}		  	{  return symbol(sym.PLUS);}
{MINUS}		  	{  return symbol(sym.MINUS);}
{MULT}		  	{  return symbol(sym.MULT);}
{DIV}		  	{  return symbol(sym.DIV);}
{EXP}		  	{  return symbol(sym.EXP);}
{AND}		  	{  return symbol(sym.AND);}
{OR}		  	{  return symbol(sym.OR);}
{IMPL}		  	{  return symbol(sym.IMPL);}
{EQ}		  	{  return symbol(sym.EQ);}
{LTEQ}		  	{  return symbol(sym.LTEQ);}
{LT}		  	{  return symbol(sym.LT);}
{GTEQ}		  	{  return symbol(sym.GTEQ);}
{GT}		  	{  return symbol(sym.GT);}
{NOTEQ}		  	{  return symbol(sym.NOTEQ);}
{NOT}		  	{  return symbol(sym.NOT);}
{COLON}		  	{  return symbol(sym.COLON);}
{DOT}		  	{  return symbol(sym.DOT);}


/* Types */
{RAT}			{  return symbol(sym.RAT);}
{INT}			{  return symbol(sym.INT);}
{FLOAT}			{  return symbol(sym.FLOAT);}
{CHAR}			{  return symbol(sym.CHAR);}
{TOP}			{  return symbol(sym.TOP);}
{SEQ}			{  return symbol(sym.SEQ);}
{DICT}			{  return symbol(sym.DICT);}
{BOOL}			{  return symbol(sym.BOOL);}

/* Separator */
{RBRACE}		{  return symbol(sym.RBRACE);}
{LBRACE}	  	{  return symbol(sym.LBRACE);}
{RPAREN}	  	{  return symbol(sym.RPAREN);}
{LPAREN}	  	{  return symbol(sym.LPAREN);}
{LSQB}		  	{  return symbol(sym.LSQB);}
{RSQB}		  	{  return symbol(sym.RSQB);}
{SEMI}		  	{  return symbol(sym.SEMI);}
{COLON}		  	{  return symbol(sym.COLON);}
{COMMA}		  	{  return symbol(sym.COMMA);}
{ALIAS}		  	{  return symbol(sym.ALIAS);}
{STRING}  	    {  return symbol(sym.STRING,new String(yytext()));}
{ID}  	      	{  return symbol(sym.ID,new String(yytext()));}
