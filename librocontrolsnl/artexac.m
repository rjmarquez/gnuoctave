function xdot=artexac(t,x)
% artexac.m
%
% Control de orientacion de un artefacto espacial por medio
% de linealizacion exacta
%
% simulacion mediante sartexac.m

% parametros del sistema
F = 200; L=3; R=20; J =50;

%% parametros del controlador
a1 = 3; a2 = 5; a3 = 4; X = 2.5;

%% Ley de control
b1 = a1*a2*a3; b2 = a1*a2+a1*a3+a2*a3; b3 = a1+a2+a3;

u = J/(F*L*R*cos(x(3)))*( -b1*(x(1)-X)-b2*x(2)-b3*F*L/J*sin(x(3))
);

%% Ecuaciones de estado
xdot = [x(2) ; F*L/J*sin(x(3)) ; R*u];

%% Fin de artexac.m
