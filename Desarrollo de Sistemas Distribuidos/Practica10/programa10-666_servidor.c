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
   int num[2], s, res, clilen, peticiones = 0;
   unsigned char arreglo2[4];
   struct sockaddr_in estructCliente, estructServidor;
   
   s = socket(AF_INET, SOCK_DGRAM, 0);
   perror("\tSocket: ");
   definirEstructura(0, NULL, atoi(argv[1]), &estructServidor);

   bind(s, (struct sockaddr *) &estructServidor, sizeof(estructServidor));
   perror("\tBind: ");
   clilen = sizeof(estructCliente);

   while(1) // El servidor recibe peticiones infinitamente hasta matar al proceso
   {
      recvfrom(s, (char *) num, sizeof(num) * sizeof(int), 0, (struct sockaddr *) &estructCliente, &clilen);
      perror("\tRecvfrom: ");

      res = num[0] + num[1];
      
      sendto(s, (char *)&res, sizeof(int), 0, (struct sockaddr *)&estructCliente, clilen);
      perror("\tSendto: ");

      peticiones++;
      printf("\nPeticiones realizadas: %d\n", peticiones);
      printf("\nTamanios int:\n\t%d bytes (servidor)\n\t%d bytes (cliente)\n", sizeof(int), sizeof(num) / 2);
   }
}

