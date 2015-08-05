class Coordenada
{
	private:
		double x, y;
	public:
		Coordenada(double = 0, double = 0);
		Coordenada(double, double, bool); // cos(1) = 0 y sen(0) = 0
		double getX();
		double getY();
};