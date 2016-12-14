#!/bin/bash

###	IPN - ESCOM
###	Cryptography
###	Ortega Ortuño Eder - multiaportes.com/cryptography

# Netpbm formato: http://netpbm.sourceforge.net/doc/pbm.html
#	=> PBM (Portable BitMap) -> Blanco y negro (0, 1)
#	=> PGM (Portable GrayMap) -> Escala de grises (0, 255)
#	=> PPM (Portable PixMap) -> Colores (0, 255)

# Constantes
#declare -a OPENSSL_DES_MODOS=("ecb" "cbc" "cfb" "ofb") # Electronic CodeBook, Cipher Block Chaining, Cipher FeedBack, Output FeedBack
ARCHIVO=$1
LLAVE=$2
MODO_OPERACION=$3
FLAG_DECRYPT=$4
TEMPORAL_DATOS="dmx_datos.tmp"
TEMPORAL_SALIDA_ENC="dmx_out_enc.tmp"
TEMPORAL_SALIDA_DEC="dmx_out_dec.tmp"

# Leer los datos
dd if="$ARCHIVO.ppm" of="$TEMPORAL_DATOS" ibs=1 skip=13 # Los datos se leen a partir del bloque 14 (el bloque de entrada tiene un tamaño 'ibs' bytes y se omiten los primeros 13 bloques, cuyo tamaño está especificado por 'ibs')

# Cifrar utilizando la implementación de OpenSSL
#for MODO_OPERACION in ${OPENSSL_DES_MODOS[@]}
#do
	FINAL_ENC="$ARCHIVO.des_enc_${MODO_OPERACION}.ppm"
	FINAL_DEC="$ARCHIVO.des_dec_${MODO_OPERACION}.ppm"

	if [ $FLAG_DECRYPT -eq 0 ]; then
		# Cifrando
		# La cabecera tiene 13 bytes de información
		dd if="$ARCHIVO.ppm" of="$FINAL_ENC" bs=13 count=1
		openssl enc -des-"${MODO_OPERACION}" -e -k "$LLAVE" -in "$TEMPORAL_DATOS" -out "$TEMPORAL_SALIDA_ENC" -p
		cat "$TEMPORAL_SALIDA_ENC" >> "$FINAL_ENC"
		xv "$FINAL_ENC"

	else
		# Descifrando
		dd if="$ARCHIVO.ppm" of="$FINAL_DEC" bs=13 count=1
		openssl enc -des-"${MODO_OPERACION}" -d -k "$LLAVE" -in "$TEMPORAL_SALIDA_ENC" -out "$TEMPORAL_SALIDA_DEC" -p
		cat "$TEMPORAL_SALIDA_DEC" >> "$FINAL_DEC"
		xv "$FINAL_DEC"
	fi
#done

rm -f "$TEMPORAL_DATOS" "$TEMPORAL_SALIDA_ENC" "$TEMPORAL_SALIDA_DEC"

#od -t x1 $TEMPORAL_DATOS

exit