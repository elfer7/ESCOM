/*
	IPN - ESCOM
	Introducción a los Microcontroladores
	Ortega Ortuño Eder - multiaportes.com/microcontroladores
*/

#define F_CPU 8000000
#define PRESCALA 0b00000101
#include <avr/io.h>
#include <avr/interrupt.h>
#include <inttypes.h>

// Los catodos se alimentan con '0' y sus segmentos se encienden con '1'

// Variables globales
volatile static uint8_t i, toggleContador;
volatile static uint8_t dmx_numerosDisplay[] = {0x3f, 0x30, 0x5b, 0x4f, 0x66, 0x6d, 0x7d, 0x07, 0x7f, 0x6f};

void init()
{
	DDRB = DDRC = 0xFF;
	DDRD = 0x00;

	sei();

	// Configurando interrupciones externas (en ese orden se colocan los registros, de lo contrario ocurre un salto desconocido en el flujo del programa)
	EICRA = 0b00001111; // INT1: interrupcion se activa en rising-edge (11) - INT0: idem
	EIMSK = 0b00000011; // Habilitar INT0 e INT1

	// Configurando timer 0 (8 bits)
	TCNT0 = 0x00; // Contador
	TIMSK0 = 0b00000001; // Indica que la interrupcion se hara al desbordarse el contador

	i = 0;
	toggleContador = 0;
	PORTB = dmx_numerosDisplay[i];
}
int main()
{
	init();

	while(1)
	{
		// Hacemos algunas instrucciones a lo pendejo para mantener ocupado el bucle infinito y evitar que la interrupcion del Timer0 ocurra antes del overflow 
		__asm__ __volatile__("nop");
		__asm__ __volatile__("nop");
	}

	return 0;
}

// Rutinas de Servicio de Interrupción
ISR(TIMER0_OVF_vect)
{
	// Detenemos el contador porque seguira ejecutandose aun cuando exista una interrupcion
	TCCR0B = 0x00;
	TCNT0 = 0;

	i = (i < 9)? i + 1 : 0;
	PORTB = dmx_numerosDisplay[i];

	// Reanudamos el contador al final de la interrupcion
	TCCR0B = PRESCALA;
}
ISR(INT0_vect) // Interrupción al oprimir el push button 1: desplazar el punto al siguiente display
{
	if(toggleContador == 0)
	{
		TCCR0B = PRESCALA;
		toggleContador = 1;
	}
	else
	{
		TCCR0B = 0x00;
		toggleContador = 0;
	}
}
ISR(INT1_vect) // Interrupción al oprimir el push button 2: leer dato del dip-switch
{
	// Detenemos el contador
	TCCR0B = 0x00;
}
