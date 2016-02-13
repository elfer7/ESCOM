/*
	IPN - ESCOM
	Compiladores - 3CV5
	Ortega Ortuño Eder - blog.nativehex.com/compiladores
*/

/* Sección de declaraciones en C */
%{
#include "Proyecto.tab.h"
#define __NHX__DEBUG_REGLAS 1
#define __NHX__DEBUG_REGLAS_DEFAULT 0
%}

/* Sección de definiciones de Flex */
NHX_CADENAS \"[a-zA-Z]*\"
NHX_VARIABLES ([a-zA-Z]|\_)+([a-zA-Z]|\_)*
NHX_ENTEROS [0-9]+
NHX_DECIMALES [0-9]*\.{1}[0-9]+
%%

"entero" {if(__NHX__DEBUG_REGLAS) fprintf(stdout, "\t[Keyword: entero]\n"); return NHX_TOKEN_KEYWORD_ENTERO;}
"decimal" {if(__NHX__DEBUG_REGLAS) fprintf(stdout, "\t[Keyword: decimal]\n"); return NHX_TOKEN_KEYWORD_DECIMAL;}
"cadena" {if(__NHX__DEBUG_REGLAS) fprintf(stdout, "\t[Keyword: cadena]\n"); return NHX_TOKEN_KEYWORD_CADENA;}
"funcion" {if(__NHX__DEBUG_REGLAS) fprintf(stdout, "\t[Keyword: funcion]\n"); return NHX_TOKEN_KEYWORD_FUNCION;}
"chau" {if(__NHX__DEBUG_REGLAS) fprintf(stdout, "\t[Keyword: salir]\n"); return NHX_TOKEN_KEYWORD_SALIR;}
"+" {if(__NHX__DEBUG_REGLAS) fprintf(stdout, "\t[Suma]\n"); return NHX_TOKEN_SUMA;}
"-" {if(__NHX__DEBUG_REGLAS) fprintf(stdout, "\t[Resta]\n"); return NHX_TOKEN_RESTA;}
"*" {if(__NHX__DEBUG_REGLAS) fprintf(stdout, "\t[Multiplicacion]\n"); return NHX_TOKEN_MULTIPLICACION;}
"/" {if(__NHX__DEBUG_REGLAS) fprintf(stdout, "\t[Division]\n"); return NHX_TOKEN_DIVISION;}
"^" {if(__NHX__DEBUG_REGLAS) fprintf(stdout, "\t[Potencia]\n"); return NHX_TOKEN_POTENCIA;}
"%" {if(__NHX__DEBUG_REGLAS) fprintf(stdout, "\t[Modulo]\n"); return NHX_TOKEN_MODULO;}
"=>" {if(__NHX__DEBUG_REGLAS) fprintf(stdout, "\t[Asignacion]\n"); return NHX_TOKEN_ASIGNACION;}
"(" {if(__NHX__DEBUG_REGLAS) fprintf(stdout, "\t[Parentesis: apertura]\n"); return NHX_TOKEN_PARENTESIS_APERTURA;}
")" {if(__NHX__DEBUG_REGLAS) fprintf(stdout, "\t[Parentesis: cierre]\n"); return NHX_TOKEN_PARENTESIS_CIERRE;}
";" {if(__NHX__DEBUG_REGLAS) fprintf(stdout, "\t[Semicolon]\n"); return NHX_TOKEN_SEMICOLON;}
"\." {return NHX_TOKEN_DECIMAL;}
"#" {return NHX_TOKEN_CAD;}
"\n" {return NHX_TOKEN_LINEA;}
{NHX_VARIABLES} {if(__NHX__DEBUG_REGLAS) fprintf(stdout, "\t[Variable]\n"); yylval.nhx_valorString = yytext; return NHX_TOKEN_VARIABLE;}
{NHX_CADENAS} {if(__NHX__DEBUG_REGLAS) fprintf(stdout, "\t[Cadena]\n"); yylval.nhx_valorString = yytext; return NHX_TOKEN_STRING;}
{NHX_ENTEROS} {if(__NHX__DEBUG_REGLAS) fprintf(stdout, "\t[Entero]\n"); yylval.nhx_valorEntero = atoi(yytext); return NHX_TOKEN_ENTERO;}
{NHX_DECIMALES} {if(__NHX__DEBUG_REGLAS) fprintf(stdout, "\t[Decimal]\n"); yylval.nhx_valorFlotante = atof(yytext); return NHX_TOKEN_FLOTANTE;}
. {if(__NHX__DEBUG_REGLAS && __NHX__DEBUG_REGLAS_DEFAULT) fprintf(stderr, "\t[Regla por defecto]\n");}
%%

/* Sección de código adicional */