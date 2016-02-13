.include "m48def.inc"

.def cta=R17
.def aux=R16

	ser aux
	out DDRB,aux
	out PORTC,aux

	lee:
		sbis PINC,0
		rjmp cero
		sbis PINC,1
		rjmp noventa
		sbis PINC,2
		rjmp cien80
		rjmp lee

	cero:
		ldi aux,1
		out PORTB,aux
		rcall UNMS
		clr aux
		out PORTB,aux
		rcall D9MS
		rjmp lee

	noventa:
		ldi aux,1
		out PORTB,aux
		rcall UNMMS
		clr aux
		out PORTB,aux
		rcall D8MMS
		rjmp lee

	cien80:
		ldi aux,1
		out PORTB,aux
		rcall DOSMS
		clr aux
		out PORTB,aux
		rcall D8MS
		rjmp lee

	UNMS:
		rcall MEDMS
		rcall MEDMS
		ret

	DOSMS:
		rcall UNMS
		rcall UNMS
		ret

	UNMMS:
		rcall UNMS
		rcall MEDMS
		ret

	D8MS:
		ldi cta,9
		loop:
			rcall DOSMS
			dec cta
			brne loop
			ret
	
	D9MS:
		rcall D8MS
		rcall UNMS
		ret

	D8MMS:
		rcall D8MS
		rcall MEDMS
		ret
	
	MEDMS:
		ldi R21,$A6
		loop2:
			dec R21
			brne loop2
		ret
