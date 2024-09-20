%% 
function [q1, q2] = inverse_kinematics_two_link(xd, yd)
    % Calcula la cinemática inversa para un mecanismo de dos eslabones
    % Entradas:
    %   xd, yd: Coordenadas del extremo del brazo robótico deseadas
    % Salidas:
    %   q1, q2: Ángulos de las articulaciones en radianes
    l1 = 23.1079;
    l2 = 14.1421;
    x = r*cos(t*round)+10;
    y = 
    % Cálculo de q2
    q2 = acos((xd^2 + yd^2 - l1^2 - l2^2) / (2 * l1 * l2));%Theta 2
    cos2 = (xd^2 + yd^2 - l1^2 - l2^2) / (2 * l1 * l2);
    theta2= atan2(sqrt(1-cos2*cos2),cos2);
    % Cálculo de q1
    q1 = atan2(yd, xd) - atan2(l2 * sin(q2), l1 + l2 * cos(q2));%Theta 1
end
