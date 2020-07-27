function xdot=ejemplo1(t,x)
%% ejemplo1.m
%%
%% Control de orientacion de un artefacto espacial por medio
%% de linealizacion aproximada
%%
%% Este programa simula la respuesta de un modelo de tercer orden, que representa un artefacto espacial del
%% cual se requiere una reorientacion angular mediante control de las variables
%% de estado: posicion, velocidad y orientacion de la tobera. El controlador disen~ado esta basado en
%% linealizacion aproximada alrededor del punto de equilibrio deseado.

%% parametros del sistema
F = 200; L=3; R=20; J =50;

%% parametros del controlador
a =2.0; b=3.5; c = 12.75; Theta = 2.5;

%% ley de control
u = -J*a*(b^2+c^2)/(F*L*R)*(x(1)-Theta)-J*(b^2+c^2+2*a*b)/F/L/R*x(2)-...
(2*b+a)/R*x(3);

%% ecuaciones de estado
xdot = [x(2) ; F*L/J*sin(x(3)) ; R*u];

%% fin de ejemplo1.m

