
import java.io.*;

%%

%public
%class NanoMorphoLexer
%unicode
%byaccj

%{

public NanoMorphoParser yyparser;

public NanoMorphoLexer (java.io.Reader r, NanoMorphoParser yyparser)
{
	this(r);
	this.yyparser = yyparser;
}

%}

  /* Reglulegar skilgreiningar */

  /* Regular definitions */

_DIGIT=[0-9]
_FLOAT={_DIGIT}+\.{_DIGIT}+([eE][+-]?{_DIGIT}+)?
_INT={_DIGIT}+
_STRING=\"([^\"\\]|\\b|\\t|\\n|\\f|\\r|\\\"|\\\'|\\\\|(\\[0-3][0-7][0-7])|\\[0-7][0-7]|\\[0-7])*\"
_CHAR=\'([^\'\\]|\\b|\\t|\\n|\\f|\\r|\\\"|\\\'|\\\\|(\\[0-3][0-7][0-7])|(\\[0-7][0-7])|(\\[0-7]))\'
_DELIM=[(){},;=]
_NAME=([:letter:]|{_DIGIT})+
_OPNAME=[\+\-*/!%&=><\:\^\~&|?]+

%%

  /* Lesgreiningarreglur */

{_DELIM} {
	yyparser.yylval = new NanoMorphoParserVal(yytext());
	return yycharat(0);
}

{_STRING} | {_FLOAT} | {_CHAR} | {_INT} | null | true | false {
	yyparser.yylval = new NanoMorphoParserVal(yytext());
	return NanoMorphoParser.LITERAL;
}

"if" {
	return NanoMorphoParser.IF;
}

"else" {
	return NanoMorphoParser.ELSE;
}

"elsif" {
	return NanoMorphoParser.ELSIF;
}

"while" {
	return NanoMorphoParser.WHILE;
}

"var" {
	return NanoMorphoParser.VAR;
}

"return" {
	return NanoMorphoParser.RETURN;
}

{_NAME} {
	yyparser.yylval = new NanoMorphoParserVal(yytext());
	return NanoMorphoParser.NAME;
}

{_OPNAME} {
	yyparser.yylval = new NanoMorphoParserVal(yytext());
	return NanoMorphoParser.OPNAME;
}

";;;".*$ {
}

[ \t\r\n\f] {
}

. {
	return NanoMorphoParser.YYERRCODE;
}
