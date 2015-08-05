/*
	IPN - ESCOM
	Desarrollo de Sistemas Distribuidos
	4CM1

	Equipo 5
	=> Hernández Jiménez Enrique
	=> Ortega Ortuño Eder
	=> Fernandez Eduardo

	multiaportes.com/sistemasdistribuidos
*/

#include <iostream>
#include <cstdlib>
#include <cstring>
#include <ctime>
using namespace std;

char generarMayuscula()
{
	int m = rand() % (91 - 65) + 65;
	return (char) m;
}

int main(int argc, char **argv)
{
	int i, j, m = 3, n = atoi(argv[1]);
	bool cstring = (argv[2][0] == 't')? true : false;

	srand(time(NULL));

	if(cstring)
	{
		char *megacadena = NULL;
		char *subcadena = NULL;

		subcadena = (char *) malloc(sizeof(char) * (m + 2));
		//megacadena = (char *) malloc(sizeof(char) * m + 1);

		//if(subcadena == NULL || megacadena == NULL)
			//exit(-1);

		for(i = 1; i <= n; i++)
		{
			for(j = 0; j < m; j++)
				subcadena[j] = generarMayuscula();

			subcadena[m] = '_';
			subcadena[m + 1] = '\0';

			megacadena = (char *) realloc(megacadena, sizeof(char) * (m + 2));
			if(megacadena == NULL)
				exit(-1);

			strncat(megacadena, subcadena, sizeof(subcadena)); // NO USAR FUNCIONES PARA CONCATENAR

			cout << megacadena << endl;
		}

		free(subcadena);
		free(megacadena);
	}
	else
	{
		string megacadena;
		for(i = 1; i <= n; i++)
		{
			for(j = 1; j <= m; j++)
				megacadena.push_back(generarMayuscula());
			megacadena.push_back(' ');
		}
		cout << megacadena << endl;
	}

	return 0;
}
