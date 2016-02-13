.include "m48def.inc"

.macro disp
	rcall scroll
	ldi R21,@0
	rjmp fincoloca
.endm

rjmp main
.org $15
rjmp leeradc

.org $1A

main:
	ser R16
	out DDRB, R16
	out DDRD, R16
	;ldi R16,$FE
	out PORTC, R16

	ldi R21,$BF
	ldi R22,$BF
	ldi R23,$BF
	ldi R24,$BF

	clr ZH

	adcset:
		ldi R16,$8D
		sts ADCSRA,R16
		ldi R16,$60
		sts ADMUX,R16
		sei

		otr: 
			ldi ZL,25
		 	ldi R20,$08
		 	out PORTD,R20

			bar: 
				ld R16,-Z
		 		out PORTB,R16

			 	rcall delay7
			 	lsr R20
			 	out PORTD,R20
		
			 adctrig: 
				ldi R16,$CD
				sts ADCSRA,R16
			
				brcc bar
			 	rjmp otr	

;-------------------------
leeradc:
	lds R17,ADCH

	cpi R17,$AE
	breq append0
	cpi R17,$8A
	breq append1
	cpi R17,$70
	breq append2
	cpi R17,$4F
	breq append3
	cpi R17,$B8
	breq append4
	cpi R17,$90
	breq append5
	cpi R17,$74
	breq append6
	cpi R17,$50
	breq append7
	cpi R17,$C8
	breq append8
	cpi R17,$9A
	breq append9
	cpi R17,$7A
	breq appendA
	cpi R17,$53
	breq appendB
	cpi R17,$D8
	breq appendC
	cpi R17,$A2
	breq appendD
	cpi R17,$7F
	breq appendE
	cpi R17,$56
	breq appendF

	fincoloca:
		reti

;---------appendnumbers------
append0: disp $C0
append1: disp $F9
append2: disp $A4
append3: disp $B0
append4: disp $99
append5: disp $92
append6: disp $82
append7: disp $D8
append8: disp $80
append9: disp $90
appendA: disp $88
appendB: disp $83
appendC: disp $C6
appendD: disp $A1
appendE: disp $86
appendF: disp $8E

;---------------------------
delay7:	ldi R18,0

	loop:	
		dec R18
		brne loop
		ret

delay8: ldi R18,200 ;<150
		clr R19
	loop2:
		dec R19
		brne loop2
		dec R18
		brne loop2
		ret

scroll:
		mov R25,R24
		mov R24,R23
		mov R23,R22
		mov R22,R21
		rcall delay8
		rcall delay8
		ret


