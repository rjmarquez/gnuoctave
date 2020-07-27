% sejem5.m
% Programa de generacion de los graficos del ejemplo5.m
close all
clear all

% tiempo de simulacion
ti = 0;
tf = 1;

%% condiciones iniciales:
%%x0 = [0.2 0.0 0.2 0.0]';
x0 = [0.2 0.0 0.0 -1.0]';

%% simulacion
[t,x] = ode23('ejemplo5',[ti tf],x0);

%% parametros del sistema
a = 0.2; g = 9.8;
X1e = 0.7854; Ue = g/(a*cos(X1e));

%% Angulo theta (x(1))
subplot(2,1,1), plot(t,x(:,1),t,x(:,3)+X1e,'--',t,X1e)
title('Posici�n angular anillo')
xlabel('tiempo t')
ylabel('\theta [rad]')
legend('\theta','\theta_\delta estimada + \Theta')


%% Velocidad angular (x(2))
subplot(2,2,3), plot(t,x(:,2),t,x(:,4),'-')
title('Velocidad angular anillo')
xlabel('tiempo t')
ylabel('x_2 [rad/s]')
legend('x_2','x_2 estimado')

%% Variable de control u
%% parametros del controlador
wn = 12.83; xi = 0.707;
K1 = 2*(wn^2-g/a*tan(X1e)*sin(X1e))/sin(2*X1e);
K2 = 4*xi*wn/sin(2*X1e);

%% Ley de control
u = -K1*(x(:,3))-K2*x(:,4)+Ue;
w = sqrt(u);

subplot(2,2,4), plot(t,w)
title('Velocidad angular del aro')
xlabel('tiempo t')
ylabel('\omega')

% fin de sejem5.m
