% sejem3.m
% Generacion de los graficos ejem3.m
% tiempo de simulacion
ti = 0;
tf = 2;

%% Parametros del sistema
F = 200; L=3; R=20; J =50;
a =2; b=3.5; c = 12.75; Theta = 2.5;

%% condiciones iniciales:
%% cerca del punto de equilibrio
x0 = [2 0 0 0 0 0]';

%% lejos del p.e.
%% x0 = [0 0 0 0 0 0]';

%% simulacion
[t,x] = ode45('ejem3',[ti tf],x0);

%% Posicion angular (x(1))
subplot(2,2,1), plot(t,x(:,1),t,x(:,4),'--',t,x(:,4)+Theta,'r-.')
title('Posición angular')
xlabel('tiempo t')
ylabel('\theta')
legend('\theta','\theta estimada','\theta est + \Theta')


%% Velocidad angular (x(2))
subplot(2,2,2), plot(t,x(:,2),t,x(:,5),'--')
title('Velocidad angular')
xlabel('tiempo t')
ylabel('\omega')
legend('\omega','\omega estimada')

%% Angulo de orientacion de la tobera (x(3))
subplot(2,2,3), plot(t,x(:,3),t,x(:,6),'--')
title('Orientación de la tobera')
xlabel('tiempo t')
ylabel('\beta')
legend('\beta','\beta estimada')

%% Variable de control (u)
u = -J*a*(b^2+c^2)/F/L/R*x(:,4)-J*(b^2+c^2+2*a*b)/F/L/R*x(:,5)-...
(2*b+a)/R*x(:,6);

subplot(2,2,4), plot(t,u)
title('Variable de control')
xlabel('tiempo t')
ylabel('u')

% fin de sejem3.m