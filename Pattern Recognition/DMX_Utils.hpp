/*
	IPN - ESCOM
	Pattern Recognition
	Ortega Ortuño Eder - multiaportes.com/pattern-recognition
*/

#include <iostream>
#include <fstream>
#include <algorithm>
#include <vector>
#include <string>

namespace DevizMx
{
	class Clase
	{
		public:
			int id;
			float probabilidad;
			Clase(int i, float p): id(i), probabilidad(p)
			{

			}
	};
	float getProbabilidad(unsigned int v, int e)
	{
		return (float) v / (float) e;
	}
	void initPractica1(std::string entrada, std::string salida, int espacio)
	{
		unsigned int valor_entrada, ii = 1;
		std::ifstream fichero_in(entrada.c_str(), std::ifstream::in);
		//std::ofstream fichero_out(salida.c_str(), std::ofstream::out);
		std::vector<DevizMx::Clase> clases;

		while(fichero_in >> valor_entrada)
		{
			clases.emplace_back(DevizMx::Clase(ii, DevizMx::getProbabilidad(valor_entrada, espacio))); // Construye y guarda un objeto
			ii++;
		}

		std::sort(clases.begin(), clases.end(), [](DevizMx::Clase const &a, DevizMx::Clase const &b){return b.probabilidad < a.probabilidad;});

		printf("\"X\" pertenece a la clase %d (probabilidad = %f)\nLa clase siempre pertenece a la probabilidad más grande.\n", clases.at(0).id, clases.at(0).probabilidad*0.1);

		fichero_in.close();
		//fichero_out.close();
	}
}