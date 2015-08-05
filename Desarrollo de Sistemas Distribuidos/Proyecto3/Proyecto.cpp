/*
	IPN - ESCOM
	Desarrollo de Sistemas Distribuidos
	4CM1

	=> Ortega Ortuño Eder

	multiaportes.com/sistemasdistribuidos
*/

#include <iostream>
#include <cstdlib>
#include "MultiAportesUtils.hpp"
#include "ModoGraficoSDL.cpp"
#include "ezOptionParser.hpp"
using namespace std;

void init(int cantidad, bool debug)
{
	Uint32 frameInicio, frameTiempo;

	srand(generarSemilla());

	ModoGraficoSDL *juego;

	juego = new ModoGraficoSDL(cantidad, debug);
	juego->iniciar("Proyecto 3: Sistemas Distribuidos | Ortega Ortuño Eder - 4CM1", SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED, VENTANA_X, VENTANA_Y, SDL_WINDOW_SHOWN);

	while(juego->correr())
	{
		frameInicio = juego->getTiempoJuego();

		juego->manejarEventos();
		juego->actualizar();
		juego->renderizar();

		frameTiempo = juego->getTiempoJuego() - frameInicio;
		if(frameTiempo < JUEGO_TIEMPO_RETARDO)
			juego->setRetardo((int) JUEGO_TIEMPO_RETARDO - frameTiempo);
	}

	juego->limpiar();

	std::cout << "\n\t** Por Ortega Ortuño Eder - multiaportes.com **\n" << std::endl;
}

int main(int argc, const char **argv)
{
	string uso;
	vector<string> errores;
	ez::ezOptionParser argumentos;

	argumentos.overview = "Proyecto 3";
	argumentos.syntax = "./Proyecto3 -a <cantidad>";
	argumentos.example = "./Proyecto3 -a 60\nHay un máximo de 60 asteroides en el simulador.\n\n";
	argumentos.footer = "Por Ortega Ortuño Eder - 4CM1";

	argumentos.add("600", 1, 1, 0, "Cantidad de asteroides", "-a", "--asteroides");
	argumentos.add("", 0, 0, 0, "Modo verboso", "-v", "--verbosidad");

	argumentos.parse(argc, argv);

	if(!argumentos.gotRequired(errores))
	{
		argumentos.getUsage(uso);
		cerr << uso << endl;
	}
	else
	{
		int aa;
		bool db = false;

		argumentos.get("-a")->getInt(aa);

		if(argumentos.isSet("-v"))
			db = true;

		init(aa, db);
	}
}