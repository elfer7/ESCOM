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
#include <cmath>
using namespace std;

int main(int argc, char **argv)
{
	double pi = acos(-1);
	float pi1 = static_cast<float>(pi);
	long double pi2 = static_cast<long double>(pi);

	cout.setf(ios::fixed);
	cout.setf(ios::showpoint);

	cout.precision(2000);
	cout << pi << endl;
	cout << pi1 << endl;
	cout << pi2 << endl;

	cout << endl;

	cout << sizeof(pi) << endl;
	cout << sizeof(pi1) << endl;
	cout << sizeof(pi2) << endl;

	return 0;
}
