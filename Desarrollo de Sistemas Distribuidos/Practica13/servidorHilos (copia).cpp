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
char ipRed[] = "192.168.0.";

void *servicioSuma(void *);
void *comunicacion(void *);
char *ipLocal();

int main()
{

    pthread_t th1, th2;
    pthread_create(&th1, NULL, &servicioSuma, NULL);
    pthread_create(&th2, NULL, &comunicacion, NULL);
   
    pthread_join(th1, NULL);
    pthread_join(th2, NULL);
   
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
                PaqueteDatagrama paq1((char *)num,NUM_MAX_MAQS * sizeof(int),(char *)ip.c_str(),PUERTO_COMUNICACION);
                socket.envia(paq1);
                activarEnvio = false;
                continue;
            }
            if(!iplocalhost.compare(ip))//comparamos con la ip local en caso de == entra
            {
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
