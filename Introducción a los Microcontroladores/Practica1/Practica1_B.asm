.include "m48def.inc"

	ser R16
	out DDRB, R16
	out PORTD, R16
esp:
	sbic PIND, 7
	rjmp esp
	clr R17
cta:
	dec R17
	brne cta
	in R16, PINB
	inc R16
	out PORTB, R16
	rjmp esp
