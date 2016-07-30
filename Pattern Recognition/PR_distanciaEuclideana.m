% IPN - ESCOM
% Pattern Recognition
% Ortega Ortu�o Eder - blog.nativehex.com/pattern-recognition

function clase = PR_distanciaEuclideana(centroides, vector_desconocido, cantidad_clases)
    % Variables temporales
    distancias = {};

    % Obtener las distancias del vector desconocido al centroide de cada clase
    for c = 1: cantidad_clases
        centroide = centroides{c};
        % Obtener la distancia con la formula d = sqrt((centroide_x - vectordesconocido_x)^2+(centroide_y - vectordesconocido_y)^2)
        distancias{end+1} = sqrt(power(centroide(1)-vector_desconocido(1), 2)+power(centroide(2)-vector_desconocido(2), 2));
    end
    
    distancias_matriz = cell2mat(distancias);
    distancias_ordenadas = sort(distancias_matriz);
    for i = 1:cantidad_clases
        if distancias_ordenadas(1) == distancias_matriz(i);
            clase = i;
        end
    end
end