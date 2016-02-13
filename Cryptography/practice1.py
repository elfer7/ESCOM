#!/usr/bin/env python2
# coding=utf-8

'''
	IPN - ESCOM
	Cryptography
	Ortega Ortuño Eder
	multiaportes.com/cryptography
'''

import argparse as argumentos
from devizmx.utilidades import leerImagen
from devizmx.utilidades import leerTexto
from devizmx.utilidades import escribirImagen
from devizmx.utilidades import escribirTexto

class CryptographyESCOM:
	def procesar(self, datos, llaves, alfabeto, descifrado): # Self es un "atributo" que se asocia al objeto: objeto.procesar(datos, bandera)
		def algoritmo_crypt(v, k): return (v+k)%alfabeto
		def algoritmo_decrypt(v, k): return (v-k)%alfabeto
		if type(datos) is list:
			print "Pixel 0 (in): ", datos[0]
			salida = []
			for r, g, b in datos:
				if descifrado:
					salida.append((algoritmo_decrypt(r, llaves[0]), algoritmo_decrypt(g, llaves[1]), algoritmo_decrypt(b, llaves[2])))
				else:
					salida.append((algoritmo_crypt(r, llaves[0 ]), algoritmo_crypt(g, llaves[1]), algoritmo_crypt(b, llaves[2])))
			print "Pixel 0 (out): ", salida[0]
			return salida
		elif type(datos) is str:
			salida = ""
			for caracter in datos:
				if 65 <= ord(caracter) <= 90 or 97 <= ord(caracter) <= 122: # Si el ASCII del caracter está entre las mayúsculas o minúsculas
					if descifrado:
						salida += chr(algoritmo_decrypt(ord(caracter) - 65, llaves) + 97)
					else:
						salida += chr(algoritmo_crypt(ord(caracter) - 97, llaves) + 65)
			return salida

parseador = argumentos.ArgumentParser(description='Practice 1: Shift Cryptography', epilog='Ejemplo: ./practice1.py -i entrada.hex -o salida.hex -lr 13 -c')
parseador.add_argument('-i', '--in', action='store', dest='fichero_entrada', help='File to crypt/decrypt.', required=True)
parseador.add_argument('-o', '--out', action='store', dest='fichero_salida', help='Output file.', required=True)
parseador.add_argument('-lr', '--llave-r', action='store', dest='llave_r', help='Key to crypt/decrypt R channel', required=True, type=int)
parseador.add_argument('-lg', '--llave-g', action='store', dest='llave_g', help='Key to crypt/decrypt G channel', type=int)
parseador.add_argument('-lb', '--llave-b', action='store', dest='llave_b', help='Key to crypt/decrypt B channel', type=int)
parseador.add_argument('-d', '--descifrar', action='store_true', dest='flagDecrypt', help='If enabled, the file will be decrypted, otherwise encrypted.')
parseador.add_argument('-b', '--bitmap', action='store_true', dest='flagBmp', help='Input file will be treated as a bitmap if flag enabled, else as a textplain')
args = parseador.parse_args()

if(args.flagBmp):
	tam = [] # Una tupla es no-mutable, por lo que no se puede modificar mediante paso de argumentos (por referencia)
	escribirImagen(CryptographyESCOM().procesar(leerImagen(args.fichero_entrada, tam), (args.llave_r, args.llave_g, args.llave_b), 256, args.flagDecrypt), list(tam), args.fichero_salida)
else:
	escribirTexto(CryptographyESCOM().procesar(leerTexto(args.fichero_entrada), args.llave_r, 26, args.flagDecrypt), args.fichero_salida)

print "Por Eder Ortega - multiaportes.com/cryptography"
exit()