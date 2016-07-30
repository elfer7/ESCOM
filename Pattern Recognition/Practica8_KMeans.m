clc

nhx_colores = ['m'; 'r'; 'g'; 'b']; % Especificadores para colores de ploteo: http://www.mathworks.com/help/matlab/ref/plot.html
nhx_figuras = ['o'; '+'; '*'; '.'; 'x'; 's'; 'd'; '^'; 'v'; '<'; '>'; 'p'; 'h']; % Especificadores para marcadores de ploteo

nhx_imagen = imread('home-slide6.jpg');
imshow(nhx_imagen)
%[x, y, rgb] = impixel(nhx_imagen);

%limite = input('Límite de la gráfica: ');
puntos = 300;
datos = randi([0, 500], puntos, 2);
hold on
plot(datos(:, 1), datos(:, 2), 'k>')

% Leer el valor del pixel
for i=1:size(datos, 1)
    valor_rojo = nhx_imagen(datos(i, 1), datos(i, 2), 1)
    valor_verde = nhx_imagen(datos(i, 1), datos(i, 2), 2)
    valor_azul = nhx_imagen(datos(i, 1), datos(i, 2), 3)
end

%k = input('Cantidad de clusters (grupos = K600): ');
k = 3;
[centroide, puntos_por_grupo, asignacion] = PR_KMeans(datos, k); % La asignación indica en órden a qué grupo (centroide) pertenece cada fila

fig = {'r+', 'g<', 'b<', 'y<', 'c<', 'b<'};

hold on
for i=1:size(centroide, 1)
    figura_aleatoria = fig{i};
    plot(centroide(i, 1), centroide(i, 2), figura_aleatoria, 'LineWidth', 2)
    
    for a=1:size(asignacion, 1)
        if asignacion(a) == i
            plot(datos(a, 1), datos(a, 2), figura_aleatoria, 'LineWidth', 1)
        end
    end
end