/*
	IPN - ESCOM
	Desarrollo de Sistemas Distribuidos
	4CM1

	=> Ortega Ortuño Eder

	multiaportes.com/sistemasdistribuidos
*/

#include <iostream>

double calcularRaiz(int nn) // Algoritmo babilónico
{
	double n, r, b = 0;
	n = static_cast<double>(nn); // Por seguridad hacemos todo con double
	r = n;

	while(b != r)
	{
		b = r;
		r = ((n / r) + r) / 2;
	}

	return r;
}
int main()
{
	int nn;

	std::cout.setf(std::ios::fixed);
	std::cout.setf(std::ios::showpoint);
	std::cout.precision(4);

	std::cout << "Número: ";
	std::cin >> nn;

	std::cout << "Raíz cuadrada = " << calcularRaiz(nn) << std::endl;

	return 0;
}
