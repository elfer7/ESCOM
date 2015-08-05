/*
	IPN - ESCOM
	Desarrollo de Sistemas Distribuidos
	4CM1

	Equipo 5
	=> Hernández Jiménez Enrique
	=> Ortega Ortuño Eder
	=> Fernandez Eduardo

	multiaportes.com/sistemasdistribuidos
*/

#include <iostream>
#include "Cilindro.cpp"
using namespace std;

int main(int argc, char **argv)
{
	Circulo c1, c2(2);
	Cilindro cc1(3, 4);

	cout << "Area C1: " << c1.calcularVal() << endl;
	cout << "Area C2: " << c2.calcularVal() << endl;
	cout << "Volumen CC1: " << cc1.calcularVal() << endl;

	return 0;
}
