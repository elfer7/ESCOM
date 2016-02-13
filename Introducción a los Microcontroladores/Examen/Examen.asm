/*
	IPN - ESCOM
	Introducci髇 a los Microcontroladores
	Ortega Ortu駉 Eder - multiaportes.com/microcontroladores
*/

; Directivas
.include "dmx_microcontroladores.inc"
.def dmx_registro_transistor = R17
.def dmx_registro_punto = R18
.def dmx_registro_valordisplay = R19
.def dmx_registro_dipswitch = R20

; Vectores de interrupci贸n
.org 0x000 // Interrupci贸n reset
	rjmp iniciar
.org 0x001 // Interrupci贸n INT1
	rjmp cambiarPosicionPunto
.org 0x002 // Interrupci贸n INT2
	rjmp leerDatoDipSwitch
.org 0x010 // Overflow en el contador del Timer1
	rjmp habilitarTransistor

; Rutinas de servicio de interrupci贸n (ISR)
iniciar:
	__isp
	__sp DDRB
	__sp DDRC
	__ep DDRD
	rcall configTimer
	rcall configIntExternas
	rjmp ejecutar
ejecutar:
	ldi dmx_registro_transistor, 0b00000001
	ldi dmx_registro_punto, 0b00000001
	ldi dmx_registro_valordisplay, 0b10111111 ; Asignar valor que corresponde a '-' (donde los ceros activan los segmentos correspondientes del display c谩todo)
	sei
	rjmp fin
fin:
	rjmp fin
habilitarTransistor:
	cp dmx_registro_transistor, dmx_registro_punto
	brne setGuion
	breq appendPunto
	out PORTC, dmx_registro_transistor
	__rt10
	out PORTB, dmx_registro_valordisplay
	lsl dmx_registro_transistor
	cpi dmx_registro_transistor, 0b00001000
	breq reiniciarRegistroTransistor
	sei ; Suponiendo que la llamada a la interrupci贸n deshabilita la flag I en el Registro Global de Interrupciones, la volvemos a habilitar
	rjmp fin
cambiarPosicionPunto:
	lsl dmx_registro_punto
	cpi dmx_registro_punto, 0b00001000
	breq reiniciarRegistroPunto
	sei
	rjmp fin
leerDatoDipSwitch:
	in dmx_registro_dipswitch, PIND
	cpi dmx_registro_dipswitch, 0b00000000
	breq setCero
	cpi dmx_registro_dipswitch, 0b00010000
	breq setUno
	cpi dmx_registro_dipswitch, 0b00100000
	breq setDos
	cpi dmx_registro_dipswitch, 0b00110000
	breq setTres
	cpi dmx_registro_dipswitch, 0b01000000
	breq setCuatro
	cpi dmx_registro_dipswitch, 0b01010000
	breq setCinco
	cpi dmx_registro_dipswitch, 0b01100000
	breq setSeis
	cpi dmx_registro_dipswitch, 0b01110000
	breq setSiete
	cpi dmx_registro_dipswitch, 0b10000000
	breq setOcho
	cpi dmx_registro_dipswitch, 0b10010000
	breq setNueve
	brne setGuion
	sei
	rjmp fin
; Llamadas y saltos auxiliares
setGuion:
	ldi dmx_registro_valordisplay, 0b10111111
	ret
configTimer:
	ldi tmp, 0b00000000
	out TCNT0, tmp // Contador
	ldi tmp, 0b00000001
	out TCCR0B, tmp // Prescaler (pag. 105 datasheet)
	ldi tmp, 0b00000001
	sts TIMSK0, tmp // Habilitar interrupci髇 por overflow
	ret
configIntExternas:
	; Para evitar 'Operand 1 out of range', usamos STS
	ldi tmp, 0b00000011
	sts EIMSK, tmp // Habilitar INT1 e INT0 (pag. 68 datasheet)
	ldi tmp, 0b00001111
	sts EICRA, tmp // Habilitar interrupci髇 externa en INT1 e INT0 cuando rising-edge (el voltaje cambia de cero a uno)
	ret
appendPunto:
	ori dmx_registro_valordisplay, 0b10000000
	reti
reiniciarRegistroTransistor:
	ldi dmx_registro_transistor, 0b00000001
	ret
reiniciarRegistroPunto:
	ldi dmx_registro_punto, 0b00000001
	ret
setCero:
	ldi dmx_registro_valordisplay, 0b11000000
	ret
setUno:
	ldi dmx_registro_valordisplay, 0b11111001
	ret
setDos:
	ldi dmx_registro_valordisplay, 0b10100100
	ret
setTres:
	ldi dmx_registro_valordisplay, 0b10110000
	ret
setCuatro:
	ldi dmx_registro_valordisplay, 0b10011001
	ret
setCinco:
	ldi dmx_registro_valordisplay, 0b10010010
	ret
setSeis:
	ldi dmx_registro_valordisplay, 0b10000010
	ret
setSiete:
	ldi dmx_registro_valordisplay, 0b11111000
	ret
setOcho:
	ldi dmx_registro_valordisplay, 0b10000000
	ret
setNueve:
	ldi dmx_registro_valordisplay, 0b10010000
	ret
