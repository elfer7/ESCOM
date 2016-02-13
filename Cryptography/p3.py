#!/usr/bin/env python2
# coding=utf-8

import os

entrada = raw_input("Archivo entrada: ")
llave = raw_input("Llave: ")
modo_op = raw_input("Modo operacion: ")
decrypt = raw_input("Descifrar? 0/1: ")

comandoExec = "bash ./practice3.sh %s %s %s %s" %(entrada, llave, modo_op, decrypt)

print "Comando de salida: %s" % comandoExec

os.system(comandoExec)
