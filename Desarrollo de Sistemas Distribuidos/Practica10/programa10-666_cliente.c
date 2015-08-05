/*
   IPN - ESCOM
   Desarrollo de Sistemas Distribuidos
   4CM1

   Equipo 5
      - Ortega Ortuño Eder

   multiaportes.com/sistemasdistribuidos
*/

#include "UtilidadSocket.h"

int main(int argc, char **argv)
{
	struct sockaddr_in estructCliente, estructServidor;
	int s, i, arg = 1;

   for(i = 1; i <= CANTIDAD_LAPTOPS; i++)
   {
   		s = socket(AF_INET, SOCK_DGRAM, 0);
   		perror("\tSocket: ");

	   definirEstructura(1, argv[arg], atoi(argv[arg+1]), &estructServidor);
	   definirEstructura(0, NULL, 0, &estructCliente);

	   bind(s, (struct sockaddr *) &estructCliente, sizeof(estructCliente));
	   perror("\tBind: ");

	   printf("2 + 5 = %d\n", conectarToServidor(s, 2, 5, &estructServidor));

	   close(s);

	   arg+=2;
	}

   return 0;
}

