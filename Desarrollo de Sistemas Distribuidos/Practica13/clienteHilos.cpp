#include <pthread.h>
#include <stdio.h>
#include <semaphore.h>
#include <stdlib.h>
#include <unistd.h>
#include "SocketDatagrama.h"
#include <iostream>
#include <algorithm>
#include <vector>
#include <string>
#include <sstream>

//variables compartidas
//char ipBroadcast[] = "10.16.0.255";
char ipBroadcast[] = "192.168.0.255";
const int puertoBroadcast = 7575;
sem_t mutex1;
sem_t mutex2;
std::vector<std::string> vectorIps;

//funcionalidad hilos
void *broadcast(void *);
void *ordenamientoImpresion(void *);
void *recepcion(void *);
void enviaToken();

int main(void){
   pthread_t th1, th2, th3;
   SocketDatagrama socket;
   socket.activaBroadcast();	
   
   // Inicializa los semaforos
   sem_init(&mutex1, 0, 1);
   sem_init(&mutex2, 0, 0);
   
   // Crea hilos
   pthread_create(&th1, NULL, &broadcast, &socket);
   pthread_create(&th2, NULL, &ordenamientoImpresion, NULL);
   pthread_create(&th3, NULL, &recepcion, &socket);
   
   // Esperar a que los hilos terminen
   pthread_join(th1, NULL);
   pthread_join(th2, NULL);
   pthread_join(th3, NULL);
   
   exit(0);
}

void *broadcast(void * aux)
{
   SocketDatagrama * sok = (SocketDatagrama *)aux;
   int num[2] = {2,5};
   PaqueteDatagrama paq((char *)num,2 * sizeof(int),ipBroadcast,puertoBroadcast);
   while(1) {
      sem_wait(&mutex1);
      std::cout << "enviando..." << std::endl;
      sok->envia(paq);
      sleep(10);
      sem_post(&mutex2);
   }
   pthread_exit(0);
}

void *ordenamientoImpresion(void *)
{
   while(1) {
      sem_wait(&mutex2);
      system("clear");
      if(vectorIps.size() > 0)
      {
          std::cout << "TABLA" << std::endl;
          std::sort(vectorIps.begin(), vectorIps.end());
          std::vector<std::string>::iterator last = std::unique(vectorIps.begin(), vectorIps.end());
          vectorIps.erase(last, vectorIps.end());
          for (std::vector<std::string>::iterator it = vectorIps.begin(); it != last; ++it) {
            std::cout << *it << std::endl;
          }
          enviaToken();
          vectorIps.clear();
      }else
      {
           std::cout << "sin seridores por el momento" << std::endl;
      }
      sem_post(&mutex1);
   }
   pthread_exit(0);
}

void *recepcion(void * aux)
{
    SocketDatagrama * sok = (SocketDatagrama *)aux;
    PaqueteDatagrama paq1(sizeof(int));
    while(1) {
        sok->recibe(paq1);
        vectorIps.push_back (std::string(paq1.obtieneDireccion()));
    }
    pthread_exit(0);
}


void enviaToken()
{
    int tam = vectorIps.size();
    int *num = new int[tam+1];
    int i = 0;
    num[i++] = tam;
    std::vector<std::string>::iterator it ;
    for (it = vectorIps.begin(); it != vectorIps.end(); ++it) {
        int part = 0;
        std::string::size_type punto = it->find_last_of('.');
        std::stringstream stream(it->substr(punto+1));
        stream >> part;
        num[i++] = part;
    }
    it = vectorIps.begin();
    
    SocketDatagrama socket2;
    PaqueteDatagrama paq((char *)num,i * sizeof(int),(char *)it->c_str(),7474);
    socket2.envia(paq);
    std::cout << "ENVIADO TOKEN" << std::endl;
}
