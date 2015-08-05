/*
	IPN - ESCOM
	Desarrollo de Sistemas Distribuidos
	4CM1

	=> Ortega Ortuño Eder

	multiaportes.com/sistemasdistribuidos
*/

class Vector2D
{
	public:
		Vector2D();
		Vector2D(float, float);
		void setX(float);
		void setY(float);
		float getX();
		float getY();
		float getLongitud();
		void normalizarVector();

		/*
			Sobrecarga de operadores para sumar y multiplicar vectores.
			Se declara como amigo para que pueda acceder a los miembros privados de la clase
		*/
		/*friend Vector2D operator + (Vector2D &v2);
		friend Vector2D operator += (Vector2D &v2);
		friend Vector2D operator * (float escalar);
		friend Vector2D operator *= (float escalar);*/
	private:
		float x, y;
};