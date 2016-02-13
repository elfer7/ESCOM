#####################################
## IPN - ESCOM
## Compiladores - 3CV5
## Ortega Ortuño Eder - blog.nativehex.com/compiladores
#####################################

NHX_CC = gcc
NHX_LEX = flex
NHX_YACC = bison
NHX_CC_FLAGS = -lfl -g -lm
NHX_LEX_FLAGS = 
NHX_YACC_FLAGS = -d

# Unificar todos los componentes en nuestra aplicación final (vinculando la librería de Flex)
#lex.yy.c proyecto.tab.c proyecto.tab.h
ProyectoCompiladores: AnalizadorLexico AnalizadorSintactico
	$(NHX_CC) $(NHX_CC_FLAGS) -o proyecto NHX_Generic_TablaSimbolos.h Proyecto.tab.h Proyecto.tab.c lex.yy.c

# Generar el código para el analizador sintáctico
AnalizadorSintactico: Proyecto.y
	$(NHX_YACC) $(NHX_YACC_FLAGS) Proyecto.y

# Generar el código para el analizador léxico
AnalizadorLexico: Proyecto.l
	$(NHX_LEX) $(NHX_LEX_FLAGS) Proyecto.l

# Limpiar basura
Limpiador:
	rm Proyecto.tab.h Proyecto.tab.c lex.yy.c proyecto