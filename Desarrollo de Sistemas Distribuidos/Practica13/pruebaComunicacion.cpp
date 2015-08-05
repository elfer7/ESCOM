//
//  cliente.cpp
//  
//
//  Created by Eduardo Fernandez on 24/05/15.
//
//

#include "SocketDatagrama.h"
#include <vector>
#include <string>
#include <sstream>

int main()
{
    char ip[] = "192.168.0.113";
    
    std::vector<std::string> vectorIps;
    vectorIps.push_back (std::string("102.168.0.113"));
    //vectorIps.push_back (std::string("102.168.1.100"));
    //vectorIps.push_back (std::string("102.168.1.105"));
    vectorIps.push_back (std::string("102.168.0.200"));
    //vectorIps.push_back (std::string("102.168.1.240"));
    int tam = vectorIps.size();
    int *num = new int[tam+1];
    int i = 0;
    num[i++] = tam;
    for (std::vector<std::string>::iterator it = vectorIps.begin(); it != vectorIps.end(); ++it) {
        int part = 0;
        std::string::size_type punto = it->find_last_of('.');
        std::stringstream stream(it->substr(punto+1));
        stream >> part;
        num[i++] = part;
    }
    
    SocketDatagrama socket(7474);
    /*num[0] = 5;
    num[1] = 20;
    num[2] = 100;
    num[3] = 105;
    num[4] = 200;
    num[5] = 240;*/
    PaqueteDatagrama paq((char *)num,i * sizeof(int),ip,7474);
    socket.envia(paq);
    std::cout << "ENVIADO " << std::endl;
    return 0;
}
