/*
	IPN - ESCOM
	Desarrollo de Sistemas Distribuidos
	4CM1

	=> Ortega Ortuño Eder

	multiaportes.com/sistemasdistribuidos
*/

#include <cmath>
#include "Vector2D.hpp"

/*Vector2D operator + (Vector2D &v2);
{
	return Vector2D(this->x + v2.x, this->y + v2.y);
}
Vector2D operator += (Vector2D &v2);
{
	this->x += v2.x;
	this->y += v2.y;
	return *this;
}
Vector2D operator * (float escalar)
{
	return Vector2D(this->x * escalar, this->y * escalar);
}
Vector2D operator *= (float escalar)
{
	this->x *= escalar;
	this->y *= escalar;
	return *this;
}*/
Vector2D::Vector2D()
{
	this->x = 0;
	this->y = 0;
}
Vector2D::Vector2D(float xx, float yy): x(xx), y(yy)
{

}
float Vector2D::getX()
{
	return this->x;
}
float Vector2D::getY()
{
	return this->y;
}
void Vector2D::setX(float xx)
{
	this->x = xx;
}
void Vector2D::setY(float yy)
{
	this->y = yy;
}
float Vector2D::getLongitud()
{
	return sqrt(pow(this->x, 2) + pow(this->y, 2));
}
void Vector2D::normalizarVector()
{
	this->x /= this->getLongitud();
	this->y /= this->getLongitud();
}