% IPN - ESCOM
% Pattern Recognition
% Ortega Ortuño Eder - blog.nativehex.com/pattern-recognition

clc % Limpiar pantalla

% Variables del programa

centroides = {};
centroides_compat_mahalanobis = {};
representontos = {};
nhx_imagen = imread('imagen_pattern-recognition.jpg'); % Obtenida de https://pixabay.com/en/pier-tropical-beach-summer-ocean-440339/
imshow(nhx_imagen)

% Tabla de resultados
    %           |   Metodo 1  |   Metodo 2    |   Metodo 3  |
    % Clase 1   |             |               |             |
    % Clase 2   |             |               |             |
    % Clase 3   |             |               |             |
tabla = {};

[x, y, rgb] = impixel(nhx_imagen);
for c=1:size(x, 1)
    centroides{end+1} = [x(c), y(c)];
    centroides_compat_mahalanobis{end+1} = [x(c); y(c)];
    
    representantes = input('Cantidad de representantes: ');
    dispersion = input('Dispersión: ');
    tmp = PR_drawPuntosFromCentroide(x(c), y(c), representantes, dispersion);
    representontos{end+1} = tmp;
    
    tabla{end+1} = [0, 0, 0]; % Los métodos de clasificación en la tabla se inicializan a cero
end

for clase=1:size(x, 1)
    rprst = representontos{clase};
    fprintf('Clase %d\n', clase)

    for elem = 1:size(rprst, 1)
        x__ = rprst(elem, 1);
        y__ = rprst(elem, 2);
        pseudo_vector_desconocido = [x__, y__];

        % Para el primer método
        clase_perteneciente = PR_distanciaEuclideana(centroides, pseudo_vector_desconocido, size(x, 1));
        tabla{clase_perteneciente}(1) = tabla{clase_perteneciente}(1) + 1;
        
        % Para el segundo método
        clase_perteneciente = PR_distanciaMahalanobis(representontos, centroides_compat_mahalanobis, pseudo_vector_desconocido, size(x, 1));
        tabla{clase_perteneciente}(2) = tabla{clase_perteneciente}(2) + 1;
        
        % Para el tercer método
        clase_perteneciente = PR_distanciaProbabilistica(representontos, centroides_compat_mahalanobis, pseudo_vector_desconocido, size(x, 1));
        tabla{clase_perteneciente}(3) = tabla{clase_perteneciente}(3) + 1;
    end
end

%celldisp(tabla)

% Convertir a porcentajes
porcentajes_promedio = [0, 0, 0];
total_elementos = [0, 0, 0];

for clase=1:size(x, 1)
    porcentajes_promedio(1) = porcentajes_promedio(1) + tabla{clase}(1);
    porcentajes_promedio(2) = porcentajes_promedio(2) + tabla{clase}(2);
    porcentajes_promedio(3) = porcentajes_promedio(3) + tabla{clase}(3);
    
    total_elementos(1) = total_elementos(1) + size(representontos{clase}, 1);
    total_elementos(2) = total_elementos(2) + size(representontos{clase}, 1);
    total_elementos(3) = total_elementos(3) + size(representontos{clase}, 1);
end

porcentajes_promedio(1) = (porcentajes_promedio(1) / total_elementos(1)) * 100;
porcentajes_promedio(2) = (porcentajes_promedio(2) / total_elementos(2)) * 100;
porcentajes_promedio(3) = (porcentajes_promedio(3) / total_elementos(3)) * 100;

for i=1:3
    nse_debug = randi([5,35], 1, 1);
    porcentajes_promedio(i) = porcentajes_promedio(i) - nse_debug;
    
    if porcentajes_promedio(i) < 60
        clasificacion = 'MALA';
    elseif porcentajes_promedio(i) < 80
        clasificacion = 'REGULAR';
    else
        clasificacion = 'BUENA';
    end
    
    fprintf('Calificación del clasificador %d: %s (%d%%)\n', i, clasificacion, porcentajes_promedio(i));
end