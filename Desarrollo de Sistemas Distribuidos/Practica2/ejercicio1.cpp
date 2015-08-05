/*
	IPN - ESCOM
	Desarrollo de Sistemas Distribuidos
	4CM1

	Equipo 5
	=> Enrique Hernández Jiménez
	=> Ortega Ortuño Eder

	multiaportes.com/sistemasdistribuidos
*/

#include <iostream>
using namespace std;

class Fecha
{
	private:
		int dia, mes, anio;
	public:
		Fecha(int = 3, int = 4, int = 2014);
		void inicializaFecha(int, int, int);
		void muestraFecha();
};
Fecha::Fecha(int dd, int mm, int aaaa) // Constructor
{
	mes = mm;
	dia = dd;
	anio = aaaa;
}
void Fecha::inicializaFecha(int dd, int mm, int aaaa)
{
	anio = aaaa;
	mes = mm;
	dia = dd;
	return;
}
void Fecha::muestraFecha()
{
	cout << "La fecha es " << dia << "/" << mes << "/" << anio << endl;
	return;
}

int main()
{
	Fecha a, b, c(21, 9, 1973);

	b.inicializaFecha(17, 6, 2000);

	a.muestraFecha();
	b.muestraFecha();
	c.muestraFecha();

	cout << a.dia << endl; // El compilador detecta si se intenta acceder a un método privado

	return 0;
}
