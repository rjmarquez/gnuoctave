% sejem4.m
% Programa de generacion de los graficos del ejemplo4.m

% tiempo de simulacion
ti = 0;
tf = 1;

%% condiciones iniciales:
x0 = [0.2 0]';

%% simulacion
[t,x] = ode23('ejemplo4',[ti tf],x0);

%% parametros del sistema
a = 0.2; g = 9.8;
X1e = pi/4; Ue = g/(a*cos(X1e));

%% Angulo theta (x(1))
subplot(2,2,1), plot(t,x(:,1),t,X1e*ones(size(t)),'r--')
title('Posición angular anillo')
xlabel('tiempo t')
ylabel('\theta [rad]')

%% Velocidad angular (x(2))
subplot(2,2,2), plot(t,x(:,2))
title('Velocidad angular anillo')
xlabel('tiempo t')
ylabel('d\theta/dt [rad/s]')

%% Variable de control (u)

%% parametros del controlador
wn = 12.83; xi = 0.707;
K1 = 2*(wn^2-g/a*tan(X1e)*sin(X1e))/sin(2*X1e);
K2 = 4*xi*wn/sin(2*X1e);

%% Ley de control
u = -K1*(x(:,1)-X1e)-K2*x(:,2)+Ue;
w = sqrt(u);

subplot(2,1,2), plot(t,w)
title('Velocidad angular del aro')
xlabel('tiempo t')
ylabel('\omega = sqrt(u)')

% fin de sejem4.m
