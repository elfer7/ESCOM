/*
   IPN - ESCOM
   Desarrollo de Sistemas Distribuidos
   4CM1

   Equipo 5
      - Ortega Ortuño Eder

   multiaportes.com/sistemasdistribuidos
*/

#include <sys/types.h>
#include <sys/socket.h>
#include <stdio.h>
#include <netinet/in.h>
#include <netdb.h>
#include <string.h>
#define CANTIDAD_LAPTOPS 3

void definirEstructura(unsigned int flag, char *ip, int puerto, struct sockaddr_in *e)
{
	bzero((char *) e, sizeof(*e));
	e->sin_family = AF_INET;
	e->sin_addr.s_addr = (flag == 0 || ip == NULL)? INADDR_ANY : inet_addr(ip); // El maldito socket JAMÁS funcionará si hacemos un inet_addr(INADDR_ANY)
	e->sin_port = htons(puerto);
}
int conectarToServidor(int s, int n1, int n2, struct sockaddr_in *se)
{
	int res, num[2];
	num[0] = n1;
	num[1] = n2;

	sendto(s, (char *) num, 2 * sizeof(int), 0, (struct sockaddr *) se, sizeof(*se));
	perror("\tSendto: ");

	recvfrom(s, (char *) &res, sizeof(int), 0, NULL, NULL);
	perror("\tRecvfrom: ");

	printf("\nTamanios int:\n\t%d bytes (cliente)\n\t%d bytes (servidor)\n", sizeof(int), sizeof(res));
	
	return res;
}