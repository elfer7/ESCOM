#!/bin/bash

# Instituto Politécnico Nacional
# Escuela Superior de Cómputo
# Desarrollo de Sistemas Distribuidos
# Ortega Ortuño Eder - 4CM1
# multiaportes.com/sistemasdistribuidos

declare -a ejercicios=("Raíz cuadrada mediante algoritmo babilónico" "Caída libre (altura edificio)" "Conversor de tiempo" "Calcular temperaturas" "Simplificar fracciones" "Números primos")
declare -a sourcecodes=("a" "b" "c" "d" "e" "f")

function seleccionarOpcion
{
	if [ $1 -lt ${#ejercicios[@]} ]; then
		if [ $1 -eq 3 ] || [ $1 -eq 4 ] || [ $1 -eq 5 ]; then # Programa con argumentos vía CLI
			ejecutar $1 true
		else
			ejecutar $1 false
		fi
	elif [ $1 -eq ${#ejercicios[@]} ]; then
		exit 0
	fi
}
function ejecutar # Si el segundo argumento es verdadero, entonces el programa se ejecutará con los argumentos especificados
{
	clear
	archivo="proyecto1_"
	archivo="$archivo${sourcecodes[$1]}.cpp"
	echo "Compilando..."
	g++ -std=c++11 $archivo
	if [ "$2" = true ]; then
		read -p "Argumentos del programa: " args
		./a.out $args
	else
		./a.out
	fi
	read -p "[Enter] para volver al menú"
}

while true
do
	clear
	echo "Proyecto 1: Ortega Ortuño Eder"
	echo
	for ((indice = 0; indice <= ${#ejercicios[@]}; indice++)) 
	do
		if [ $indice -lt ${#ejercicios[@]} ]; then
			echo -e "\t[$indice] ${ejercicios[$indice]}"
		else
			echo -e "\t[$indice] Salir"
		fi
	done
	echo
	echo -e "\tNOTA: algunos programas necesitan argumentos, para ello consultar el archivo Instrucciones.txt"
	echo
	read -p "Opción: " opcion
	seleccionarOpcion $opcion
done
