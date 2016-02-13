/*
	Instituto Politécnico Nacional - Escuela Superior de Cómputo
	Ortega Ortuño Eder - 3CM10
	Introducción a los Microcontroladores - multiaportes.com/microcontroladores
*/

.include "m48def.inc"
.def tmp = R16
; Macros
// Retardo de 10 ciclos (considerando que un NOP gasta 1 clk)
.macro __rt10
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
.endmacro
// Inicializar StackPointer
.macro __isp
	ldi tmp, low(RAMEND)
	out SPL, tmp
	ldi tmp, high(RAMEND)
	out SPH, tmp
	clr tmp
.endmacro
// Definir si el puerto es de entrada
.macro __ep
	ldi tmp, $00
	out @0, tmp
	clr tmp
.endmacro
// Definir si el puerto es de salida
.macro __sp
	ldi tmp, $FF
	out @0, tmp
	clr tmp
.endmacro