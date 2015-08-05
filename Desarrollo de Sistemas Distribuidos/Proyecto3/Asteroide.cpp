/*
	IPN - ESCOM
	Desarrollo de Sistemas Distribuidos
	4CM1

	=> Ortega Ortuño Eder

	multiaportes.com/sistemasdistribuidos
*/

#include <iostream>
#include <cmath>
#include <algorithm>
#include "MultiAportesConstantes.hpp"
#include "Asteroide.hpp"

Asteroide::Asteroide(std::vector<int> m, int xx, int yy, int rr, int gg, int bb, bool gC)
{
	this->magnitudes = m;
	this->x = xx;
	this->y = yy;
	this->r = rr;
	this->g = gg;
	this->b = bb;
	this->giroContrarreloj = gC;
	this->angulo = 0;

	/*puntosSDL = new SDL_Point[20];
	if(puntosSDL == nullptr)
		std::exit(-1);*/

	int maximo = *max_element(this->magnitudes.begin(), this->magnitudes.end());

	this->establecerCoordenadas();
	this->establecerDesplazamiento((maximo < ASTEROIDE_RADIO_MINIMO + 10)? 5 : (maximo < ASTEROIDE_RADIO_MINIMO + 15)? 3 : 1); // TODO: El desplazamiento varía de acuerdo a la magnitud más grande
	this->establecerRotacion((maximo < ASTEROIDE_RADIO_MINIMO + 10)? 45 : (maximo < ASTEROIDE_RADIO_MINIMO + 15)? 30 : 15);
}
Asteroide::~Asteroide()
{
	/*delete[] puntosSDL;
	puntosSDL = nullptr;*/
}
void Asteroide::establecerCoordenadas()
{
	int lados = this->magnitudes.size(), i;
	double xx, yy;

	for(i = 0; i < lados; i++)
	{
		xx = this->x + static_cast<double>(this->magnitudes.at(i)) * cos(2 * M_PI * i / lados);
		yy = this->y + static_cast<double>(this->magnitudes.at(i)) * sin(2 * M_PI * i / lados);
		this->vertices.push_back(Vector2D(static_cast<float>(xx), static_cast<float>(yy)));
	}
}
void Asteroide::establecerDesplazamiento(int velocidad)
{
	/*
		Dirección = 1: sup-izq a inf-der
		Dirección = 2: sup-der a inf-izq
		Dirección = 3: inf-izq a sup-der
		Dirección = 4: inf-der a sup-izq
	*/

	// Si las coordenadas aleatorias son generadas dentro de la ventana, entonces se restablecen los puntos a un área fuera de la misma
	if(this->x >= 0 && this->x <= VENTANA_X)
		this->x = -100;
	if(this->y >= 0 && this->y <= VENTANA_Y)
		this->y = -100;

	if(this->x < 0 && this->y < 0)
		this->desplazamientoX = this->desplazamientoY = velocidad;
	else if(this->x > 0 && this->y < 0)
	{
		this->desplazamientoX = -velocidad;
		this->desplazamientoY = velocidad;
	}
	else if(this->x > 0 && this->y > 0)
	{
		this->desplazamientoX = velocidad;
		this->desplazamientoY = -velocidad;
	}
	else
		this->desplazamientoX = this->desplazamientoY = -velocidad;
}
void Asteroide::establecerRotacion(int velocidad)
{
	this->rotacion = (this->giroContrarreloj)? -1 * velocidad : velocidad;
}
SDL_Point* Asteroide::getPuntosSDL()
{
	int i = 0;
	std::vector<Vector2D>::iterator it_v2d;

	for(it_v2d = this->vertices.begin(); it_v2d != this->vertices.end(); ++it_v2d)
	{
		this->puntosSDL[i].x = static_cast<int>(it_v2d->getX());
		this->puntosSDL[i].y = static_cast<int>(it_v2d->getY());
		i++;
	}
	this->puntosSDL[i].x = static_cast<int>(this->vertices[0].getX());
	this->puntosSDL[i].y = static_cast<int>(this->vertices[0].getY());

	return this->puntosSDL;
}
void Asteroide::actualizar()
{
	std::vector<Vector2D>::iterator iterador;

	this->x += this->desplazamientoX;
	this->y += this->desplazamientoY;

	/*this->angulo += this->rotacion;
	if(abs(this->angulo) == 360)
		this->angulo = 0;

	this->x = this->x * cos(this->angulo * M_PI / 180) - this->y * sin(this->angulo * M_PI / 180);
	this->y = this->y * cos(this->angulo * M_PI / 180) + this->x * sin(this->angulo * M_PI / 180);*/

	for(iterador = this->vertices.begin(); iterador != this->vertices.end(); ++iterador)
	{
		iterador->setX(iterador->getX() + this->desplazamientoX);
		iterador->setY(iterador->getY() + this->desplazamientoY);
	}
}
int Asteroide::getCantidadLineas()
{
	return this->magnitudes.size() + 1;
}
int Asteroide::getX()
{
	return this->x;
}
int Asteroide::getY()
{
	return this->y;
}
int Asteroide::getR()
{
	return this->r;
}
int Asteroide::getG()
{
	return this->g;
}
int Asteroide::getB()
{
	return this->b;
}