package analizador.lexico;
import java.io.*;

%%
%public
%column
%line
%class AnalizadorLexico

digito = [0-9]
letra = [a-zA-Z]
punto = [.]
signo = [+|-]
igual = [=]
opSum = [+]
opRes = [-]
opMul = [*]
opDiv = [/]

whitespace = [\t\r]
newline = [\n]

%type Token
%eofval{
    return new Token(TokenConstant.EOF, null);
%eofval}

%%

{digito}      { return new Token(TokenConstant.NUM_REAL, yytext()); }
{letra}     { return new Token(TokenConstant.VARIABLE, yytext()); }
{opSum}        { return new Token(TokenConstant.OP_SUM, yytext()); }
{opRes}        { return new Token(TokenConstant.OP_RES, yytext()); }
{opMul}        { return new Token(TokenConstant.OP_MUL, yytext()); }
{opDiv}        { return new Token(TokenConstant.OP_DIV, yytext()); }
{igual}        { return new Token(TokenConstant.IGUAL, yytext()); }

.              { System.err.println("Error: Caracter no reconocido en la fila " + yyline + ", columna " + yycolumn + " -> " + yytext()); }

