class Fecha
{
	private:
		int dia, mes, anio;
		static int vecesMuestraFecha;
	public:
		Fecha(int = 3, int = 4, int = 2014);
		void inicializaFecha(int, int, int);
		void muestraFecha();
		static int getVecesMuestraFecha();
};
