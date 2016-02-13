#!/usr/bin/env python2
# coding=utf-8

import os

kr = raw_input("Valor llave R: ")
kg = raw_input("Valor llave G: ")
kb = raw_input("Valor llave B: ")

entrada = raw_input("Archivo entrada: ")
salida = raw_input("Archivo salida: ")

opDescifrar = raw_input("Descifrar? s/n: ")
opImagen = raw_input("Imagen? s/n: ")

comandoExec = "python2 ./practice1.py -i %s -o %s -lr %s -lg %s -lb %s " %(entrada, salida, kr, kg, kb)

if opDescifrar == "s":
	comandoExec = comandoExec + "-d "
if opImagen == "s":
	comandoExec = comandoExec + "-b "

print "Comando de salida: %s" % comandoExec

os.system(comandoExec)
