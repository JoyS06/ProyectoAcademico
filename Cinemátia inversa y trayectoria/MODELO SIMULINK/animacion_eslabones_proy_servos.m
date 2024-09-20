% Define los parámetros iniciales
theta = linspace(0, 2*pi, 100); % Un vector de ángulos de 0 a 2*pi
x0 = 15;
y0 = 15;
l1 = 22; % La longitud del primer eslabón
l2 = 18; % La longitud del segundo eslabón

% Inicializa la figura
figure;
axis equal;
xlim([-30, 70]);
ylim([-30, 70]);
hold on;
r_size = [];
lis_es2 = [];
r_angs =[];
% Bucle para animar los eslabones
for i = 1:length(theta)
    r = 8 + sin(5 * theta(i));
    x2 = (r * cos(theta(i)) + x0);
    y2 = (r * sin(theta(i)) + y0);
    producto_punto = dot([x2,y2], [100,0]);
    % Calcular las normas de v y w
    norma_v = norm([x2,y2]);
    norma_w = norm([100,0]);
    r_size = [r_size,norma_v];
    lis_es2 = [lis_es2, norm([x2-x1,y2-y1])];
    angulo_rad = acos(producto_punto / (norma_v * norma_w));
    r_angs = [r_angs, angulo_rad];
end 

for i = 1:length(r_angs)
    x = r_size(i).*cos(r_angs(i));
    y = r_size(i).*sin(r_angs(i));
    %ang seg eslabon
    q2 = acos((x^2 + y^2 -l1^2 - l2^2)/(2*l1*l2));
    q2d = rad2deg(q2);
    fprintf("Angulo q2 en grados")
    disp(q2d)
    %angulo del primer eslabon
    %disp((l1+l2*cos(q2))/(l2*sin((q2))))
    q1= atan2(y,x) - atan2(l2*sin(q2),(l1+l2*q2));
    q1d= rad2deg(q1);
    fprintf("Angulo q1 en grados")
    disp(q1d)

    % Calcula las coordenadas del eslabón 2 siguiendo x2 e y2
    x1 = l1 * cos(q1);
    y1 = l1 * sin(q1);
    x2 = r_size(i) .* cos(r_angs(i)) + x0 ;
    y2 = r_size(i) .* sin(r_angs(i)) + y0;
   
    % Calcular el ángulo entre v y w en radianes 
    alfa = acos(r^2/(2*l1*r));
    beta = r_angs(i)+alfa;
    % Calcula las coordenadas del final del eslabón 1

    % Imprime las longitudes de los eslabones
    fprintf('La longitud del primer eslabón es: %f\n', l1)
    fprintf('La longitud del segundo eslabón es: %f\n', l2)
    
    % Actualiza el gráfico para el eslabón 1
    eslabon1 = line([0, x1], [0, y1], 'Color', 'b', 'LineWidth', 2);

    % Actualiza el gráfico para el eslabón 2
    eslabon2 = line([x1, x2], [y1, y2], 'Color', 'r', 'LineWidth', 2);
    elabon_i = line([0, x2], [0, y2], 'Color', 'y', 'LineWidth', 2);
    % Dibuja la trayectoria del final del eslabón 2
    plot(x2, y2, 'g*','LineWidth', 0.1);

    % Pausa para la animación
    pause(0.1);

    % Elimina las líneas de los eslabones para la próxima iteración
    if i < length(theta)
        delete(eslabon1);
        delete(eslabon2);
        delete(elabon_i)
    end
end
max(r_size)
var = max(lis_es2)-min(lis_es2);
mean(lis_es2)
% Mantén el gráfico
hold off;
