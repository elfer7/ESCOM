% IPN - ESCOM
% Pattern Recognition
% Ortega Ortuño Eder - blog.nativehex.com/pattern-recognition

clc

figure
hold on
grid on

centroides = {};

clase1 = [1, 2; 3, 5; 1, 5; 2, 2; 3, 3];
clase2 = [6, 4; 6, 3; 7, 4; 8, 4; 8, 5];
desconocido = [4, 5];

centroide1 = PR_getCentroGravedad(clase1);
centroide2 = PR_getCentroGravedad(clase2);
centroides{1} = centroide1;
centroides{2} = centroide2;

for w = 1:size(clase1, 1)
    clase1(w, 1) = centroide1(1) + clase1(w, 1);
    clase1(w, 2) = centroide1(2) + clase1(w, 2);
end
for w = 1:size(clase2, 1)
    clase2(w, 1) = centroide2(1) + clase2(w, 1);
    clase2(w, 2) = centroide2(2) + clase2(w, 2);
end

plot(desconocido(1), desconocido(2), 'k*')
plot(clase1, 'ro')
plot(clase2, 'b+')

clase_padre = PR_distanciaEuclideana(centroides, desconocido, 2);
fprintf('El vector pertenece a la clase %d\n', clase_padre)