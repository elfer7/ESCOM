% IPN - ESCOM
% Pattern Recognition
% Ortega Ortuño Eder - blog.nativehex.com/pattern-recognition

clc % Limpiar pantalla

% Variables del programa
distancias = [];
nhx_imagen = imread('imagen_pattern-recognition.jpg'); % Obtenida de https://pixabay.com/en/pier-tropical-beach-summer-ocean-440339/
imshow(nhx_imagen)
truesize()

[x, y, rgb] = impixel(nhx_imagen);
vector_desconocido = [x(size(x, 1)), y(size(y, 1))];
for c=1:size(x, 1)-1
    representantes = input('Cantidad de representantes: ');
    dispersion = input('Dispersión: ');
    tmp = PR_drawPuntosFromCentroide(x(c), y(c), representantes, dispersion);
    
    for ii=1:size(tmp, 1)
        %disp(tmp(ii, 2))
        euclid = sqrt(power(tmp(ii, 1)-vector_desconocido(1), 2)+power(tmp(ii, 2)-vector_desconocido(2), 2));
        distancias = [distancias; euclid, c];
    end
end

distancias = sortrows(distancias, 1) % Ordenar por valor existente en la primera dimensión

k = input('Valor de K: ');
if mod(k, 2) == 0
    k = k + 1;
    fprintf('\t[NOTA]: Valor de K asignado al impar más cercano.\n');
end

k_nn = distancias(1:k, 2); % Seleccionar los K primeros elementos
clase_perteneciente = mode(k_nn); % Seleccionar el más común

fprintf('El vector pertenece a la clase %d\n', clase_perteneciente);