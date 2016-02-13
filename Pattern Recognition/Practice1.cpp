/*
	IPN - ESCOM
	Pattern Recognition
	Ortega Ortuño Eder - multiaportes.com/pattern-recognition
*/

#include "DMX_Utils.hpp"
#include "ezOptionParser.hpp"

int main(int argc, const char **argv)
{
	int espacio;
	std::string uso, entrada, salida;
	std::vector<std::string> errores;
	ez::ezOptionParser argumentos;

	argumentos.overview = "Práctica 1: Clasificador basado en teoría de la probabilidad";
	argumentos.syntax = "./p1 -i entrada.dump -o salida.dump -s 10000";
	argumentos.example = "./p1 -i entrada -o salida\nLee los datos del fichero de entrada y almacena los resultados en la salida con un espacio muestral de 10000.\n\n";
	argumentos.footer = "Por Ortega Ortuño Eder - multiaportes.com/pattern-recognition";

	argumentos.add("", 1, 1, 0, "Fichero entrada", "-i", "--input");
	argumentos.add("", 1, 1, 0, "Fichero salida", "-o", "--output");
	argumentos.add("", 1, 1, 0, "Espacio muestral", "-s", "--espacio-muestral");

	argumentos.parse(argc, argv);

	if(!argumentos.gotRequired(errores))
	{
		argumentos.getUsage(uso);
		std::cerr << uso << std::endl;
	}
	else
	{
		argumentos.get("-i")->getString(entrada);
		argumentos.get("-o")->getString(salida);
		argumentos.get("-s")->getInt(espacio);

		DevizMx::initPractica1(entrada, salida, espacio);
	}

	return 0;
}