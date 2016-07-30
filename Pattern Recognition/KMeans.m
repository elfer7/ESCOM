clc

cantidad_grupos = 4;
representantes = 500;

nhx_imagen = imread('tres3.jpg');
imshow(nhx_imagen(:, :, 1))

imagen = rgb2gray(nhx_imagen);


x = randi([10 size(imagen, 1)-10], representantes, 1);
y = randi([10 size(imagen, 2)-10], representantes, 1);
     
 HBaseDatos = [];
 for s =1:representantes

     varAuxiliar = imagen(x(s):x(s)+4,y(s):y(s)+4);
     glcm = graycomatrix(varAuxiliar); % Devuelve una matriz auxiliar de grises de la imagen
     stats = graycoprops(glcm, {'Contrast', 'Correlation', 'Energy', 'Homogeneity'}); % Devuelve una matriz normalizada de niveles de ocurrencia de grises en la imagen utilizando las propiedades. Se basa en el histograma de la imagen
     
     % El contraste mide las variaciones en la matriz de ocurrencia de
     % grises
     % % La correlacion mide la probabilidad de union de dos pixeles en la
     % matriz de ocurrencia
     % La energia es la suma del cuadrado de los elementos; tambien llamada
     % uniformidad
     % La homogeneidad mide la aproximacion de los elementos de la matriz
     % a la diagonal de la misma
     
     
     J = entropy(varAuxiliar);
    level = graythresh(varAuxiliar); % Dada una intensidad, devuelve el valor del nivel para binarizar una imagen
    BW = im2bw(varAuxiliar, level); % La imagen se binariza (incrementa el valor de su intensidad)
    props = regionprops(BW, varAuxiliar,{'MaxIntensity', 'MeanIntensity', 'MinIntensity', 'PixelValues', 'WeightedCentroid'}); % Permite procesar la imagen binarizada
  
      HBaseDatos = [HBaseDatos;stats.Correlation stats.Homogeneity stats.Contrast stats.Energy mean(mean(varAuxiliar)) J ];
 
 end

HBaseDatos(isnan(HBaseDatos)) = 0;

[idx, C] = kmeans(HBaseDatos, cantidad_grupos);

hold on


dataMountains = idx;
 

 for p = 1:representantes
   hold on;
   plot(y,x,'black<','MarkerSize',5);
   if dataMountains(p) == 1
     rectangle('Position',[y(p)-5,x(p)-5,15,15],...
             'Curvature',1.0,...
             'LineWidth',2,...
             'EdgeColor', 'red')
   elseif dataMountains(p) == 2
           rectangle('Position',[y(p)-5,x(p)-5,15,15],...
             'Curvature',1.0,...
             'LineWidth',2,...
             'EdgeColor', 'green')
           
   elseif dataMountains(p) == 3
           rectangle('Position',[y(p)-5,x(p)-5,15,15],...
             'Curvature',1.0,...
             'LineWidth',2,...
             'EdgeColor', 'blue')
         
  elseif dataMountains(p) == 4
           rectangle('Position',[y(p)-5,x(p)-5,15,15],...
             'Curvature',1.0,...
             'LineWidth',2,...
             'EdgeColor', 'magenta')
  
  elseif dataMountains(p) == 5
           rectangle('Position',[y(p)-5,x(p)-5,15,15],...
             'Curvature',1.0,...
             'LineWidth',2,...
             'EdgeColor', 'yellow')
           
   end
 end