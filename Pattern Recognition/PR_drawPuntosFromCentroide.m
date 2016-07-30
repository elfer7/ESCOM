% IPN - ESCOM
% Pattern Recognition
% Ortega Ortu�o Eder - blog.nativehex.com/pattern-recognition

function representantes = PR_drawPuntosFromCentroide(centroide_x, centroide_y, cantidad, dispersion)
    nhx_colores = ['y'; 'm'; 'c'; 'r'; 'g'; 'b'; 'k']; % Especificadores para colores de ploteo: http://www.mathworks.com/help/matlab/ref/plot.html
    nhx_figuras = ['o'; '+'; '*'; '.'; 'x'; 's'; 'd'; '^'; 'v'; '<'; '>'; 'p'; 'h']; % Especificadores para marcadores de ploteo
    representantes = [];
    
    hold on % Mantener la imagen en el fondo para poder graficar sobre ella
    figura_aleatoria = strcat(nhx_colores(randi([1, size(nhx_colores, 1)])), nhx_figuras(randi([1, size(nhx_figuras, 1)])));
    plot(centroide_x, centroide_y, figura_aleatoria);

    cc = randn(cantidad, 2);
    for w = 1:size(cc, 1)
        numero_signado_x = randi([-1, 1], 1, 1); % Rango, cantidad de enteros a generar, dimensión
        numero_signado_y = randi([-1, 1], 1, 1);
        representantes = [representantes; [centroide_x + numero_signado_x * cc(w, 1) * dispersion, centroide_y + numero_signado_y * cc(w, 2) * dispersion]];
        
        plot(centroide_x + numero_signado_x * cc(w, 1) * dispersion * 100, centroide_y + numero_signado_y * cc(w, 2) * dispersion * 100, figura_aleatoria);
    end
end