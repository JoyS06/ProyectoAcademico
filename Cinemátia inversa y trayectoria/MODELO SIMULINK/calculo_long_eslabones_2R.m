syms l1 l2
% Definir los valores conocidos
px = 20; % valor conocido
py = 30; % valor conocido
theta1 = 45; % valor conocido en grados
theta2 = 30 ; % valor conocido en grados

% Definir el sistema de ecuaciones

eq1 = l1*cosd(theta1) + l2*cosd(theta1 + theta2) == px;
eq2 = l1*sind(theta1) + l2*sind(theta1 + theta2) == py;

% Resolver el sistema para l1 y l2
[A B] = equationsToMatrix([eq1 eq2], [l1,l2]);
R = linsolve(A,B);
% Convertir los resultados a números en punto flotante
R_numerico = double(R);
disp('Longitudes eslabones:');
disp(['l1 = ', num2str(R_numerico(1))]);
disp(['l2 = ', num2str(R_numerico(2))]);