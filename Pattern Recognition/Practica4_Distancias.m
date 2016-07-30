% IPN - ESCOM
% Pattern Recognition
% Ortega Ortuño Eder - blog.nativehex.com/pattern-recognition

clc % Limpiar pantalla

% Variables del programa
nhx_colores = ['y'; 'm'; 'c'; 'r'; 'g'; 'b'; 'k']; % Especificadores para colores de ploteo: http://www.mathworks.com/help/matlab/ref/plot.html
nhx_figuras = ['o'; '+'; '*'; '.'; 'x'; 's'; 'd'; '^'; 'v'; '<'; '>'; 'p'; 'h']; % Especificadores para marcadores de ploteo
centroides = {}; % Estructura tipo celda (cell)
clases = {};

figure
hold on % Mantener las figuras; no sobreescribir anteriores ploteos
grid on

vector_desconocido_x = input('Coordenadas vector desconocido (X): '); % El semicolon impide que se imprima el valor de la asignación.
vector_desconocido_y = input('Coordenadas vector desconocido (Y): ');
vector_desconocido = [vector_desconocido_x, vector_desconocido_y];
plot(vector_desconocido(1), vector_desconocido(2), strcat(nhx_colores(randi([1, size(nhx_colores, 1)])), nhx_figuras(randi([1, size(nhx_figuras, 1)]))))

nhx_clases = input('Número de clases: ');
for c = 1:nhx_clases
    cantidad_vectores = input('Cantidad representantes: '); % Cantidad de vectores a generar aleatoriamente que pertenezcan a esa clase
    dispersion = input('Dispersión: '); % Qué tan separados van a estar los puntos entre sí
    cc = randn(cantidad_vectores, 2); % Distribución normal aleatoria; genera A elementos de B dimensiones cada uno
    centr = input('Centroide [x;y]: '); %PR_getCentroGravedad(cc);
    for w = 1:size(cc, 1) % En la versión original es de la forma 'coordenada_representante = centroide + coordenada_representante * dispersion'
        cc(w, 1) = centr(1) + cc(w, 1) * dispersion;
        cc(w, 2) = centr(2) + cc(w, 2) * dispersion;
    end
    plot(cc, strcat(nhx_colores(randi([1, size(nhx_colores, 1)])), nhx_figuras(randi([1, size(nhx_figuras, 1)]))))
    centroides{end+1} = centr; % Única forma efectiva de anexar elementos a un array o cell
    clases{end+1} = cc;
end
% class(variable) % Con class() es posible ver el tipo de dato de una variable
% celldisp(variable)% Para imprimir los valores de un cell

clc
opcion = input('1. Distancia Euclideana\n2. Distancia de Mahalanobis\n3. Criterio de máxima probabilidad\nOpción: ');
switch opcion
    case 1
        clase_padre = PR_distanciaEuclideana(centroides, vector_desconocido, nhx_clases);
    case 2
        clase_padre = PR_distanciaMahalanobis(clases, centroides, vector_desconocido, nhx_clases);
    case 3
        clase_padre = PR_distanciaProbabilistica(clases, centroides, vector_desconocido, nhx_clases);
    otherwise
        error('Opción desconocida')
end

%legend('Vector desconocido', 'Clase 1', 'Clase 2', 'Clase 3', 'Clase 4', 'Clase 5')
fprintf('El vector pertenece a la clase %d\n', clase_padre)
