% IPN - ESCOM
% Pattern Recognition
% Ortega Ortuño Eder - blog.nativehex.com/pattern-recognition

clc % Limpiar pantalla

% El tema de ascendencia jerárquica está bien explicado acá: http://home.deib.polimi.it/matteucc/Clustering/tutorial_html/hierarchical.html

% Variables del programa
centroides1 = {};
centroides2 = {};
nhx_imagen = imread('imagen_pattern-recognition.jpg'); % Obtenida de https://pixabay.com/en/pier-tropical-beach-summer-ocean-440339/
imshow(nhx_imagen)

[x, y, rgb] = impixel(nhx_imagen);
for c=1:size(x, 1)
    
    centroides1{end+1} = [x(c), y(c)];
    centroides2{end+1} = [x(c), y(c)];
    PR_drawPuntosFromCentroide(x(c), y(c), 500, 120);
end

hold on
plot(vector_desconocido(1), vector_desconocido(2), 'r>');

% La tabla debe llenarse respecto a las distancias entre cada centroide y el resto de los centroides
tabla = zeros(size(x, 1));

for i=1:size(x, 1)
    centroide_row = centroides1{i};
    
    for j=1:size(x, 1)
        centroide_col = centroides2{j};
        
        tabla(i, j) = sqrt(power(centroide_row(1)-centroide_col(1), 2)+power(centroide_row(2)-centroide_col(2), 2));
    end
end

set(dendrogram(linkage(tabla, 'single', 'euclidean')), 'LineWidth', 3)
