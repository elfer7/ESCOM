% IPN - ESCOM
% Pattern Recognition
% Ortega Ortuño Eder - blog.nativehex.com/pattern-recognition

function clase = PR_distanciaProbabilistica(clases, centroides, vector_desconocido, cantidad_clases)
    % Variables temporales
    distancias = {};
    probabilidades = {};

    % La distancia de Mahalanobis se define como "D^2 = (vector_representante - vector_centroide)^T * matriz_covarianza^(-1) * (vector_representante - vector_centroide)"
    % donde las 3 son matrices multiplicables, T es la matriz transpuesta y
    % se considera la inversa de la matriz de varianza/covarianza.
    
    % Trabajamos en el formato de la práctica (volteamos la matriz)
    vector_desconocido = vector_desconocido';
    constante = power(2 * pi, cantidad_clases / 2);
    
    for c = 1: cantidad_clases
        clase = clases{c};
        centroide = centroides{c};
        % Trabajamos en el formato de la práctica (volteamos la matriz)
        clase = clase';
        
        % Calculamos la matriz de varianza/covarianza de la clase
        elementos_x = clase(1,:) - centroide(1); % Con el operador semicolon seleccionamos a cada elemento y le restamos el centroide
        elementos_y = clase(2,:) - centroide(2);
        elementos = [elementos_x; elementos_y];
        matriz_inversa_varianza_covarianza = inv(elementos * elementos' / length(clase));
        
        % Obtenemos la distancia Mahalanobis
        vector_minus_puntomedio = vector_desconocido - centroide;
        mahalanobis = vector_minus_puntomedio' * matriz_inversa_varianza_covarianza * vector_minus_puntomedio; % Considerando que el operador apóstrofe indica "matriz transpuesta"
        
        % Aplicamos la fórmula: P(n) = e^(-1/2 * mahalanobis) / [2pi^n/2 * det(Vn)^1/2]
        exponencial = exp(-mahalanobis/2);
        probabilidad = exponencial * inv(constante * power(det(matriz_inversa_varianza_covarianza), 1/2));
        probabilidades{end+1} = probabilidad;
    end
    
    % Normalizando las probabilidades: Pn = P(n) / [P1+P2+...+PN]
    suma_probabilidades = sum(cell2mat(probabilidades));
    for c = 1: cantidad_clases
        distancias{end+1} = probabilidades{c} / suma_probabilidades;
    end
    
    distancias_matriz = cell2mat(distancias);
    distancias_ordenadas = sort(distancias_matriz, 'descend');
    for i = 1:cantidad_clases
        if distancias_ordenadas(1) == distancias_matriz(i);
            clase = i;
        end
    end
end