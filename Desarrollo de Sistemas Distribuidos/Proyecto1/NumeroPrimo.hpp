#include <iostream>

class NumeroPrimo
{
	public:
		NumeroPrimo(int, bool = true);
		int getNumero();
		bool getEstado();
		void setEstado(bool);

	private:
		int numero;
		bool esPrimo;
};

NumeroPrimo::NumeroPrimo(int n, bool est): numero(n), esPrimo(est)
{
	if(this->numero < 2)
	{
		std::cerr << "No es un número válido" << std::endl;
		exit(-1);
	}
}
int NumeroPrimo::getNumero()
{
	return this->numero;
}
bool NumeroPrimo::getEstado()
{
	return this->esPrimo;
}
void NumeroPrimo::setEstado(bool e)
{
	this->esPrimo = e;
}