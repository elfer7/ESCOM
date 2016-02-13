; 	IPN - ESCOM
;	Introducción a los Microcontroladores	
;	Ortega Ortuño Eder - escom.nativehex.com/microcontroladores

.include "m48def.inc"
.def __nhx__regTmp1 = R16
.def __nhx__regTmp2 = R17
.def __nhx__regDato = R18
.def __nhx__regFinal = R19

; Vectores de interrupción
.org 0x000
	rjmp __nhx__iniciar
.org 0x012 // USART Rx completo (Recepción finalizada)
	rjmp __nhx__recepcionCompleta

__nhx__iniciar:
	; Inicializar Stack Pointer
	ldi __nhx__regTmp1, low(RAMEND)
	out SPL, __nhx__regTmp1
	ldi __nhx__regTmp1, high(RAMEND)
	out SPH, __nhx__regTmp1
	rjmp __nhx__main

	; Configurar USART en la pinche cucaracha rompebolas
	ldi __nhx__regTmp1, 0b00000010 // Establecemos el bit "U20n" (donde '0' corresponde al registro cero) para doblar la velocidad de transferencia asíncrona
	out USCR0A, __nhx__regTmp1 // Registro 0 de control "A"
	ldi __nhx__regTmp1, 0b00001100 // Habilitar transmisor y receptor USART
	out USCR0B, __nhx__regTmp1 // Registro 0 de control "B"
	sei

__nhx__recepcionCompleta:
	in __nhx__regDato, UDR0
	subi __nhx__regDato, 32 // Restar 32 al dato recibido
	rcall __nhx__setBit // Esperar hasta que los bits sean iguales
	mov __nhx__regFinal, __nhx__regDato
	reti // Habilita las interrupciones globales automáticamente

__nhx__setBit:
	mov __nhx__regTmp1, UCSR0A
	mov __nhx__regTmp2, UDRE0 // USART Data Register Empty
	cp __nhx__regTmp1, __nhx__regTmp2 // Comparar dos registros
	brne __nhx__setBit__noIgual
	ret

__nhx__setBit__noIgual:
	nop
	nop
	rjmp __nhx__setBit

__nhx__main:
	rjmp __nhx__main