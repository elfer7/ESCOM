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
#include <thread>
using namespace std;

void funcionConcurrente(int a, double b)
{
	cout << a << ", " << b << endl;
}
int main(int argc, char **argv)
{
	thread hilo(funcionConcurrente, 20, 40.0);
	hilo.join();
	return 0;
}
