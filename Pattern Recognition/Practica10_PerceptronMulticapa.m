% IPN - ESCOM
% Pattern Recognition
% Ortega Ortuño Eder - blog.nativehex.com/pattern-recognition

% Conjunto de muestras de aprendizaje (CMA)
c1 = [0 1 1 1; 0 0 0 1; 0 1 0 0];
c2 = [0 0 0 1; 0 1 1 1; 1 1 0 1];


tam = 4;
f = 1;
r = 1;

% Pesos
w = [0; 0; 0; 0]

% Perceptrón
while f ~= 0
    f = 0;
    
    i = 1;
    while i <= tam
        vector = [c1(1,i) c1(2,i) c1(3,i) 1];
               
        escalar = vector * w;
        
        if escalar >= 0
            w = w - r*vector'
            f = f+1;
        end
        i = i+1;
    end
    
    i = 1;
    while i <= tam
        vector = [c2(1,i) c2(2,i) c2(3,i) 1];
        escalar = vector*w;
        
        if escalar <= 0
            w = w + r*vector'
            f = f+1;
        end
        i = i+1;
    end
end

figure(1)

plot3(c1(1,:),c1(2,:),c1(3,:), 'r>', 'Markersize', 5);
hold on
plot3(c2(1,:),c2(2,:),c2(3,:), 'b<', 'Markersize', 5);

legend('Clase 1','Clase 2');

hold on
grid on
[X, Y] = meshgrid(0:.1:1); % Inicio, incremento, fin

Z = (-w(1).*X -w(2).*Y -w(4))/w(3);

mesh(X, Y, Z, gradient(Z)); % Coordenadas, color
hold on