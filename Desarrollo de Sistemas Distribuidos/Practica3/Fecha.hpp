#ifndef FECHA_H
#define FECHA_H

class Fecha
{
	private:
		int dia, mes, anio; // Para notar un aumento de tiempo en el benchmark, aumentar ese tamaño (4*3 = 12 bytes)
		long double xdd, ydd, zdd;
		int var[100000];
	public:
		Fecha(int = 3, int = 4, int = 2014);
		void inicializaFecha(int, int, int);
		void muestraFecha();
		int getDia();
		int getMes();
		int getAnio();
		int masVieja(Fecha, Fecha);
		int masVieja(Fecha *, Fecha *);
		int convierte(); // Agregado en el ejercicio 3
};

#endif
