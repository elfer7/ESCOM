.include "m48def.inc"

	ldi R16, $FF
	out DDRB, R16
	out PORTD, R16
	ldi R17, $0A
	ldi R16, $5B
	add R17, R16
	out PORTB, R17

fin:
	rjmp fin
