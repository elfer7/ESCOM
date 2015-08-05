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
#include <stdio.h>      
#include <sys/types.h>
#include <ifaddrs.h>
#include <netinet/in.h> 
#include <string.h> 
#include <arpa/inet.h>

using namespace std;

const int PUERTO_SERVICIO = 7575;
const int PUERTO_COMUNICACION = 7474;
const int NUM_MAX_MAQS = 10;
char ipRed[] = "192.168.1.";
char ipBroadcast[] = "192.168.1.255";
const int puertoBroadcast = 7575;
sem_t mutex1;
sem_t mutex2;
std::vector<std::string> vectorIps;

void *servicioSuma(void *);
void *comunicacion(void *);
char *ipLocal();
void *broadcast(void *);
void *ordenamientoImpresion(void *);
void *recepcion(void *);
void enviaToken();

int
main (int argc, char *argv[])
{
  bool control = false;
  if(argc!=2)
  {
    control = true;
  }
    pthread_t th1, th2, th3, th4, th5;
    
    pthread_create(&th1, NULL, &servicioSuma, NULL);
    pthread_create(&th2, NULL, &comunicacion, NULL);
    pthread_join(th1, NULL);
    pthread_join(th2, NULL);
    sleep(2);
    if(control)
    {
      SocketDatagrama socket;
      socket.activaBroadcast();
      sem_init(&mutex1, 0, 1);
      sem_init(&mutex2, 0, 0);
      pthread_create(&th3, NULL, &broadcast, &socket);
      pthread_create(&th4, NULL, &ordenamientoImpresion, NULL);
      pthread_create(&th5, NULL, &recepcion, &socket);
      pthread_join(th3, NULL);
      pthread_join(th4, NULL);
      pthread_join(th5, NULL);
    }
    exit(0);
}


void *servicioSuma(void *)
{
    SocketDatagrama socket(PUERTO_SERVICIO);
    int *num;
    while (1) {
        PaqueteDatagrama paq(sizeof(num)*2);
        socket.recibe(paq);
        num = (int *)paq.obtieneDatos();
        int res = num[0] + num[1];
        cout << num[0] <<"+" << num[1] << "=" << res << endl;
        PaqueteDatagrama paq1((char *) &res,sizeof(int),paq.obtieneDireccion(),paq.obtienePuerto());
        socket.envia(paq1);
    }
    pthread_exit(0);
}

void *comunicacion(void *)
{
    std::stringstream sstm;
    std::string ip;
    std:string iplocalhost(ipLocal());
    std::cout << "localhost:" << iplocalhost << std::endl;
    //(char *)ip.c_str()

    SocketDatagrama socket(PUERTO_COMUNICACION);
    int *num;
    while (1) {
        PaqueteDatagrama paq(sizeof(num)*NUM_MAX_MAQS);
        socket.recibe(paq);
        bool activarEnvio = false;
        std::cout << "ACTUALIZANDO DIRECTORIO DE IPs" << std::endl;
        num = (int *)paq.obtieneDatos();
        for(int i=1;i<=num[0];i++)
        {
            //cout << num[i] << endl;
            sstm << ipRed << num[i];
            ip = sstm.str();
            std::cout << ip << std::endl;
            sstm.str("");
            
            if(activarEnvio)
            {
                std::cout << "ENVIANDO DIRECTORIO DE IPs a: "<< ip << std::endl;
                sleep(2);
                PaqueteDatagrama paq1((char *)num,NUM_MAX_MAQS * sizeof(int),(char *)ip.c_str(),PUERTO_COMUNICACION);
                socket.envia(paq1);
                activarEnvio = false;
                continue;
            }
            if(!iplocalhost.compare(ip))//comparamos con la ip local en caso de == entra
            {
                if(i == num[0])
                {
                    sstm << ipRed << num[1];
                    ip = sstm.str();
                    std::cout << ip << std::endl;
                    sstm.str("");
                    std::cout << "ENVIANDO DIRECTORIO DE IPs a: "<< ip << std::endl;
                    sleep(2);
                    PaqueteDatagrama paq1((char *)num,NUM_MAX_MAQS * sizeof(int),(char *)ip.c_str(),PUERTO_COMUNICACION);
                    socket.envia(paq1);
                }
                activarEnvio = true; 
            }
        }
    }
    pthread_exit(0);
}


char * ipLocal()
{
    char * addressBuffer = NULL;
    struct ifaddrs * ifAddrStruct=NULL;
    struct ifaddrs * ifa=NULL;
    void * tmpAddrPtr=NULL;
    unsigned long int local = inet_addr("127.0.0.1");

    getifaddrs(&ifAddrStruct);

    for (ifa = ifAddrStruct; ifa != NULL; ifa = ifa->ifa_next) {
        if (!ifa->ifa_addr) {
            continue;
        }
        if (ifa->ifa_addr->sa_family == AF_INET && local != ((struct sockaddr_in *)ifa->ifa_addr)->sin_addr.s_addr) {
            addressBuffer = inet_ntoa(((struct sockaddr_in *)ifa->ifa_addr)->sin_addr);
            break;
        } 
    }
    if (ifAddrStruct!=NULL) freeifaddrs(ifAddrStruct);
    return addressBuffer;
    
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
      //sem_post(&mutex1);
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
