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
	/*
		Este código no funciona porque el buffer aún almacena el carácter de fin de línea, por lo que la función
		getline() se detiene al leer dicho carácter.
	*/
	int n;
	string linea;
	cin >> n;
	getline(cin, linea);
	return 0;
}
