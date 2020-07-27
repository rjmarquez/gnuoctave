%% spend.m
%% Programa de simulacion del modelo
%% del pendulo invertido sobre una plataforma movil.

%% Parametros
global M F r0 u0 m L J C g

%% Movil
M = 0.48; % masa
F = 3.83; % constante de friccion

%% Pendulo
m = 0.16; % masa
L = 0.25; % longitud del pendulo (distancia entre 
		 %el eje y el centro de gravedad)
J = 0.0043; % momento de inercia alrededor 
			%del centro de gravedad
C = 0.00218; % constante de friccion
g = 9.8; % aceleracion de gravedad

%% condiciones iniciales
x0 = [0.4 0 pi/40 0]';

%% tiempo de simulacion
ti = 0; tf = 1;

[t,x] = ode45('mpend',[ti tf],x0);

% la simulacion del sistema lineal es el siguiente script
lpend

% Comparacion de las simulaciones de ambos modelos
subplot(221),plot(t,x(:,1),'y--',T,X(:,1),'r')
title('Posicion del movil'),grid
subplot(222),plot(t,x(:,3)*180/pi,'y--',T,X(:,3)*180/pi,'r')
title('Angulo de rotacion del pendulo'),grid
subplot(223),plot(t,x(:,1)+L*sin(x(:,3)),'y--',T,Y,'r')
title('Posicion del cg'),grid

% fin de spend.m
