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
#include "Fecha.hpp"
using namespace std;

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
	vecesMuestraFecha++;
	return;
}
int Fecha::getVecesMuestraFecha()
{
	return vecesMuestraFecha;
}
int Fecha::vecesMuestraFecha = 0;

int main()
{
	Fecha a, b, c(21, 9, 2000);

	b.inicializaFecha(17, 6, 2000);

	a.muestraFecha();
	cout << "muestraFecha() se ha llamado " << a.getVecesMuestraFecha() << " veces" << endl;
	b.muestraFecha();
	cout << "muestraFecha() se ha llamado " << b.getVecesMuestraFecha() << " veces" << endl;
	c.muestraFecha();
	cout << "muestraFecha() se ha llamado " << c.getVecesMuestraFecha() << " veces" << endl;

	return 0;
}
