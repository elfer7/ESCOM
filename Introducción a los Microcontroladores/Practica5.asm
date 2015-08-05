.include "m48def.inc"
.def tmp = R16
.def enable_display = R17
.def comparacion_display = R18

; Ejemplo por Eder Ortega

// Nota: LDI escribe valores en registros; OUT escribe valores en puertos I/O
// Nota 2: Los displays se sincronizan de derecha a izquierda

/*
	PORTB, PORTC, PORTD

		MSB |_|_|_|_|_|_|_|_| LSB

	Los valores indicados en hex o bin encienden o apagan los bloques
*/

/*
	Interrupciones: la instruccion ORG indica una dirección que almacena
	ciertas instrucciones a ejecutar cuando una interrupción específica se realiza.
	Debido a la limitada cantidad de palabras (1 word) solamente llamamos
	un salto a una subrutina que ejecuta el código restante necesario.

	Los vectores de interrupción comienzan en 0x0000 (reset vector) por lo que allí
	se almacena la primera instrucción a ejecutar

	Las interrupciones solo ocurren si el bit de Interrupt Enable está activado.

	Los ISR (Interruption Service Routine) son manejadores de interrupción = callbacks.
*/
; Vectores de interrupción tomados de la tabla 12-1 (pag.56 Datasheet ATMega48)
.org 0x000
	rjmp init
.org 0x010 // Vector de interrupción para el TIMER0 si ocurre un overflow
	rjmp sync_displays
init:
	; Inicializar StackPointer: RAMEND = última dirección memoria SRAM. El microcontrolador es de 8 bits, RAMEND es de 16 bits. Por tanto se recorta la palabra RAMEND a la mitad (baja y alta) y se almacena.
	ldi tmp, low(RAMEND) // LDI: Carga una constante en un registro
	out SPL, tmp // OUT: almacena el valor de un registro en un puerto I/O
	ldi tmp, high(RAMEND)
	out SPH, tmp
	rjmp main

main:
	; Configurar los Data Direction Register: '0' => entrada => PINX / '1' => salida => PORTX
	ser tmp // SER: establecer 0xFF al registro (todos los bits activados)
	out DDRB, tmp
	out DDRC, tmp
	clr tmp

	sei // Habilitamos las interrupciones globales en el microcontrolador

	rcall init_comparadores
	ldi tmp, 0b00111111
	out PORTB, tmp
	rcall reiniciar_displays

	/*
		Configuración del TIMER0 (8 bits): para encender/apagar displays

		En primer lugar, se configura el TCNT0 (Timer/Counter 0), el cual es un registro
		de 8 bits que incrementa automáticamente su valor una vez que son activados los bits
		necesarios del registro TCCR0B, considerando que ese mismo timer tiene
		registros TCCR0A y TCCR0B.

		En segundo lugar, se configuran los 3 LSB del registro TCCR0B (Timer/Counter Control Register 0-B)
		donde solamente necesitamos los 3 bits menos significativos. Esos bits son CSCxx (Clock Select Bits)
		y nos permiten establecer un prescaler (divisor de frecuencia para reducir su velocidad)
		utilizando los valores de la tabla 15-9 (pag. 105 Datasheet ATMega48). Entre más grande
		sea el prescaler, más lento irá el conteo del registro.

		NuevaFrecuencia = FrecuenciaMicrocontrolador / Prescaler
		Ejemplo: 4 000 000 / 1024 = 3906.25 Hz
		
		MaxDelay = Prescaler / FrecuenciaMicrocontrolador
		Ejemplo: 1024 / 4 000 000 = 0.000256 uS; es decir que cada 256 microsegundos se produce un overflow si el prescaler es de 1024.

		Cada vez que el registro contador se llena -overflow- (cuyo valor se incrementa automáticamente
		en cada ciclo de reloj), es posible ejecutar una interrupción.
	
		Además, para habilitar las interrupciones del TIMER0 necesitamos
		establecer el bit TIOE0 del registro TIMSK0 (Timer/Counter Interrupt Mask Register) en '1'. La instrucción STS
		nos permite almacenar el valor de un registro en un puerto I/O (data-space, que a su vez existe en la SRAM)
	*/
	ldi tmp, 0b00000000
	out TCNT0, tmp
	ldi tmp, 0b00000101
	out TCCR0B, tmp
	ldi tmp, 0b00000001
	sts TIMSK0, tmp

; En este punto esperamos a que ocurra el overflow del timer0
fin:
	rjmp fin

; Instrucciones adicionales para las interrupciones
sync_displays:
	lsl enable_display
	cp enable_display, comparacion_display // Compara ambos registros
	breq reiniciar_displays // Si lo anterior se cumple
	brne update_displays // Si lo anterior no se cumple
	ret

; Instrucciones auxiliares
init_comparadores:
	ldi comparacion_display, 0b0001000
	ret ; Si se realiza un JMP, el return hace que el programa comience desde el vector 0x000

reiniciar_displays:
	ldi enable_display, 0b11111110
	out PORTC, enable_display
	ldi enable_display, 0b00000001
	sei
	ret

update_displays:
	mov tmp, enable_display
	com tmp
	out PORTC, tmp
	sei
	ret
