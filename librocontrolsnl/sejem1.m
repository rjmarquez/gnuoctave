% sejem1.m
% Programa de generacion de los graficos del ejemplo1.m

% tiempo de simulacion
ti = 0; tf = 3;

%% condiciones iniciales:
%% cerca del punto de equilibrio
x0 = [2 0 0]';

%% lejos del p.e.
%%x0 = [0 0 0]';

%% simulacion
[t,x] = ode45('ejemplo1',[ti tf],x0);

%% Posicion angular (x(1))
subplot(2,2,1), plot(t,x(:,1))
title('Posición angular')
xlabel('tiempo t')
ylabel('theta')

%% Velocidad angular (x(2))
subplot(2,2,2), plot(t,x(:,2))
title('Velocidad angular')
xlabel('tiempo t')
ylabel('omega')

%% Angulo de orientación de la tobera (x(3))
subplot(2,2,3), plot(t,x(:,3))
title('Orientación de la tobera')
xlabel('tiempo t')
ylabel('beta')

%% Variable de control (u)
F = 200; L=3; R=20; J =50; a =2; b=3.5; c = 12.75; Theta = 2.5;

u = -J*a*(b^2+c^2)/F/L/R*(x(:,1)-Theta)-J*(b^2+c^2+2*a*b)/F/L/R*x(:,2)-...
(2*b+a)/R*x(:,3);

subplot(2,2,4), plot(t,u)
title('Variable de control')
xlabel('tiempo t')
ylabel('u')

% fin de sejem1.m

