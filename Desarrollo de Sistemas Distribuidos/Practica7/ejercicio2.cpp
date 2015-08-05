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
using namespace std;

int main(int argc, char **argv)
{
	string cadena("ESCOM");
	cout << cadena[6] << endl;
	cout << cadena.at(6) << endl; // Arroja una excepción
	return 0;
}
