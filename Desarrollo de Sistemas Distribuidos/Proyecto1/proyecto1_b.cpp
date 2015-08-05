/*
	IPN - ESCOM
	Desarrollo de Sistemas Distribuidos
	4CM1

	=> Ortega Ortuño Eder

	multiaportes.com/sistemasdistribuidos
*/

#include <iostream>

double calcularAltura(int tt)
{
	const double ACELERACION = 9.81; // Gravedad
	double t, d;
	t = static_cast<double>(tt);

	return (ACELERACION * t * t) / 2; // Ecuación para cuerpo en caída libre: d = 1/2 * gt^2
}
int main()
{
	int tt;

	std::cout.setf(std::ios::fixed);
	std::cout.setf(std::ios::showpoint);
	std::cout.precision(2);

	std::cout << "Tiempo (segundos): ";
	std::cin >> tt;

	std::cout << "Tamaño edificio (metros) = " << calcularAltura(tt) << std::endl;

	return 0;
}
