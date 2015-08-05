class Fraccion
{
	private:
		int numerador, denominador;
	public:
		Fraccion(int = 20, int = 80);
		void setValores(int, int);
		double getDivision();
		void simplificar();
};