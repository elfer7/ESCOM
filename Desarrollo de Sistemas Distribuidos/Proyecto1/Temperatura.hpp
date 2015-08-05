class Temperatura
{
	private:
		float gradosK;
		void calcularCelsius(float);
	public:
		Temperatura(float = 0.0);
		void setTempKelvin(float);
		void setTempFahrenheit(float);
		void setTempCelsius(float);
		void imprimirKelvin();
		void imprimirFahrenheit();
		void imprimirCelsius();
};