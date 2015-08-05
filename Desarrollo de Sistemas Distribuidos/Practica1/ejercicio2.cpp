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

int main()
{
	double c = 20, f;

	f = (9/5) * c + 32.0;
	cout << "Temperatura = " << f << endl;
	f = (9.0/5.0) * c + 32.0;
	cout << "Temperatura = " << f << endl;

	return 0;
}
