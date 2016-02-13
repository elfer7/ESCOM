/*
	IPN - ESCOM
	Introducción a los Microcontroladores
	Ortega Ortuño Eder - multiaportes.com/microcontroladores
*/

#define F_CPU 8000000 // El ATMega48 funciona a 8MHz
#define PRESCALA0 0b00000001
#define PRESCALA1 0b00000010
#include <avr/io.h>
#include <avr/interrupt.h>
#include <inttypes.h>

/*
	Puerto B => Salidas de los segmentos
	Puerto C => Salidas de sincronización de displays (transistores)

	Display ánodo: se alimenta con '1' y los segmentos se activan con '0'
	Display cátodo: se alimenta con '0' y los segmentos se activan con '1'
*/

// Variables globales
volatile static uint8_t dmx_select_transistor, dmx_valor_display, i; // El keyword 'volatile' indica que la variable puede cambiar de valor en cualquier momento, por lo que al acceder a ella debe leerse su valor actual. Se utiliza en hilos, sockets, etc.
volatile static unsigned char mensaje[] = "HALo";

void setValor(unsigned char simbolo)
{
	// Las letras se definen como si fuera display cátodo: http://www.uize.com/examples/seven-segment-display.html
	// XGFE DCBA => LSB es el segmento 'A' y MSB es el segmento 'G'
	switch(simbolo)
	{
		case 'A':
			dmx_valor_display = 0x77;
			break;
		case 'b':
			dmx_valor_display = 0x7c;
			break;
		case 'C':
			dmx_valor_display = 0x39;
			break;
		case 'd':
			dmx_valor_display = 0x5e;
			break;
		case 'E':
			dmx_valor_display = 0x79;
			break;
		case 'F':
			dmx_valor_display = 0x71;
			break;
		case 'H':
			dmx_valor_display = 0x76;
			break;
		case 'I':
			dmx_valor_display = 0x06;
			break;
		case 'J':
			dmx_valor_display = 0x1e;
			break;
		case 'L':
			dmx_valor_display = 0x38;
			break;
		case 'o':
			dmx_valor_display = 0x5c;
			break;
		case 'P':
			dmx_valor_display = 0x73;
			break;
		case 'q':
			dmx_valor_display = 0x67;
			break;
		case 'r':
			dmx_valor_display = 0x50;
			break;
		case 's':
			dmx_valor_display = 0x6d;
			break;
		case 't':
			dmx_valor_display = 0x78;
			break;
		case 'U':
			dmx_valor_display = 0x3e;
			break;
		case 'Y':
			dmx_valor_display = 0x6e;
			break;
		case '-':
			dmx_valor_display = 0x48;
			break;
		default:
			dmx_valor_display = 0x00;
			break;
	}
}
void desplazarTransistor()
{
	dmx_select_transistor = (dmx_select_transistor == 0b00001000)? 0b00000001 : dmx_select_transistor << 1; // Utilizamos 4 displays
}
void init()
{
	DDRB = DDRC = 0xFF; // Ambos puertos serán salidas (se establecen todos los bits del Data Direction Register en '1', caso contrario se establecen '0' para entradas y se utiliza el registro PINX para leer datos de entrada)

	sei();

	// Configurando interrupciones externas (en ese orden se colocan los registros, de lo contrario ocurre un salto desconocido en el flujo del programa)
	EICRA = 0b00001111; // INT1: interrupcion se activa en rising-edge (11) - INT0: idem
	EIMSK = 0b00000011; // Habilitar INT0 e INT1

	// Configurando timer 0 (8 bits)
	TCNT0 = 0x00;  // Establecemos el valor del registro contador a '0'; trabaja en módulo 256, por lo que después de incrementar el valor '255' se desborda, genera la interrupción y empieza de nuevo
	TIMSK0 = 0b00000001; // El bit TOIE0 permite que se genere una interrupción al desbordarse el TimeCounter si y solamente si el bit de interrupción está habilitado en el registro global
	TCCR0B = PRESCALA0; // Permite configurar un prescaler, habilitar o deshabilitar el Timer0

	// Configurando timer 1 (16 bits)
	TCNT1 = 0x00;
	TIMSK1 = 0b00000001;
	TCCR1B = PRESCALA1;

	// Inicializando variables auxiliares
	i = 0;
	dmx_valor_display = 0b00000000;
	dmx_select_transistor = 0b00000001;
	setValor('-');
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
ISR(TIMER0_OVF_vect) // Cuando el timer se desborda (Habilitar transistor: un nuevo display debe ser habilitado y actualizado su valor)
{
	// Detenemos el contador porque seguira ejecutandose aun cuando exista una interrupcion
	TCCR0B = 0x00;
	TCNT0 = 0;

	setValor(mensaje[i]);
	PORTC = ~dmx_select_transistor;
	PORTB = dmx_valor_display;

	desplazarTransistor();

	i = (i == 3)? 0 : i + 1;

	// Reanudamos el contador al final de la interrupcion
	TCCR0B = PRESCALA0;
}
