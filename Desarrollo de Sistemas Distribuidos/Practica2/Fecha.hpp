#ifndef FECHA_H
#define FECHA_H

class Fecha
{
	private:
		int dia, mes, anio;
	public:
		Fecha(int = 3, int = 4, int = 2014);
		void inicializaFecha(int, int, int);
		void muestraFecha();
		int convierte(); // Agregado en el ejercicio 3
		bool leapyr(); // Agregado en el ejercicio 4
};

#endif
