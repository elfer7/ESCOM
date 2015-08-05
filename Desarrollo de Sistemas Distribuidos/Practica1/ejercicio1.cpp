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
	const double PI = 3.141592653;
	double rrr, aaa;

	cout << "Radio: ";	
	cin >> 	rrr;

	aaa = rrr * rrr * PI;

	// PI = 6.66; => En este punto el compilador rechaza la asignación de la constante

	cout << "Área = " << aaa << endl;

	return 0;
}
