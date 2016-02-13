.include "m48def.inc"

; Ejemplo por Eder Ortega

// Nota: LDI escribe valores en registros; OUT escribe valores en puertos I/O

/*
	PORTB, PORTC, PORTD

		MSB |_|_|_|_|_|_|_|_| LSB

	Los valores indicados en hex o bin encienden o apagan los bloques
*/

/*
	Los vectores de interrupci?n comienzan en 0x0000 (reset vector) por lo que all?
	se almacena la primera instrucci?n a ejecutar
*/

/*
	ASCII
		0 => 48 
		1 => 49
		2 => 50
		3 => 
		4 => 
		5 => 
		6 => 
		7 => 
		8 => 
		9 => 57
		A => 65
		B => 66
		C => 
		D => 
		E => 
		F => 70
*/

.org 0x000
	rjmp init
init:
	; Inicializar StackPointer: RAMEND = ?ltima direcci?n memoria SRAM. El microcontrolador es de 8 bits, RAMEND es de 16 bits. Por tanto se recorta la palabra RAMEND a la mitad (baja y alta) y se almacena.
	ldi R16, low(RAMEND) // LDI: Carga una constante en un registro
	out SPL, R16 // OUT: almacena el valor de un registro en un puerto I/O (Stack Pointer Low)
	ldi R16, high(RAMEND)
	out SPH, R16 // Stack Pointer High
	rjmp main

main:
	; Configurar los Data Direction Register (establecen si el puerto PORTX es E/S): '0' => entrada | '1' => salida. PINX siempre es entrada, PORTX se usa como entrada y salida
	
	// Definimos al puerto B como entrada
	ldi R16, 0b00000000
	out DDRB, R16
	clr R16 ; Limpiamos la casa

	// Definimos al puerto C (mismo valor entrada) y D (valor ASCII entrada) como salidas
	ldi R16, 0b11111111
	out DDRC, R16
	out DDRD, R16
	clr R16

	// Leemos el dato de entrada y comparamos con una constante == 10 | http://www.avrbeginners.net/assembler/branches/branch.html
	in R17, PINB
	out PORTC, R17 ; De paso escribimos el valor de entrada
	cpi R17, 10
	brsh ascii_letras ; El valor de entrada es mayor o igual a 10
	brlo ascii_numeros ; El valor es menor

ascii_numeros:
	ldi R16, 48
	add R17, R16 ; Sumamos 48 posiciones (48 = ASCII::0)
	out PORTD, R17 ; Escribimos en el puerto de salida ASCII
	rjmp fin

ascii_letras:
	cpi R17, 16 ; La última letra hexadecimal tiene valor de 15
	brsh fin ; El valor no tiene una letra existente en el alfabeto hexadecimal
	ldi R16, 55
	add R17, R16 ; Sumamos 55 posiciones (65 - 10 = 55) porque '10 = HEX::A'
	out PORTD, R17 ; Escribimos en el puerto de salida ASCII
	rjmp fin

fin:
	nop ; Gastamos unos cuantos ciclos de reloj a lo idiota porque #YOLO :D
	rjmp fin
