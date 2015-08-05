//
//  Interactivo.cpp
//
//
//  Created by Eduardo Fernandez on 25/05/15.
//
//

#include "SocketDatagrama.h"
#include <sstream>

int main()
{
    int num[2];
    std::string ip;
    std::stringstream sstm;
    int *res = NULL;
    SocketDatagrama socket;
    num[0] = 2;
    num[1] = 5;
    PaqueteDatagrama paq1(sizeof(int));
    socket.setTiempoEspera(0.5);
    
    for (int i = 1; i<=20; i++) {
        //sstm << "192.168.0." << i;
        sstm << "10.16.0." << i;
        ip = sstm.str();
        std::cout << "ip:" << ip << std::endl;
        sstm.str("");
        PaqueteDatagrama paq((char *)num,2 * sizeof(int),(char *)ip.c_str(),7200);
        socket.envia(paq);
        if(socket.recibe(paq1) != -1)
        {
            res = (int *)paq1.obtieneDatos();
            std::cout << "RESPUESTA: " << *res << "DESDE: "<< ip << std::endl;
        }
        else
        {
            std::cout << "PERDIDO DESDE: " << ip << std::endl;
        }
        
    }
    
    return 0;
}