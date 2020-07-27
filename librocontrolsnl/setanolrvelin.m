% setanolrvelin.m
% Programa de simulacion y generacion de los graficos del ejemplo2.m
close all
clear all

% tiempo de simulacion
ti = 0;
tf = 6;

%% parámetros
global E lambda
E = 0.7 ;  
lambda = 5 ;

%% condiciones iniciales:
x0 = [0.1-E 0.6-1+E]';

%% simulacion
[t,x] = ode45('etanolrvelin',[ti tf],x0);

%% Concentracion del etanol (x(1))
subplot(2,2,1), plot(t,x(:,1))
title('Concentración del etanol')
xlabel('tiempo t')
ylabel('x_{1\delta}')

%% Concentracion del azucar (x(2))
subplot(2,2,2), plot(t,x(:,2))
title('Concentración de azúcar')
xlabel('tiempo t')
ylabel('x_{2\delta}')

%% Concentracion del azucar (x(2))
subplot(2,2,3), plot(t,x(:,1)+x(:,2))
title('Variable incontrolable (estable)')
xlabel('tiempo t')
ylabel('x_{1\delta}+x_{2\delta}')

%% Variable de control (u)

u = (1/E)*(lambda-1/E)*x(:,1) ;

subplot(2,2,4), plot(t,u)
title('Tasa de alimentación del sustrato')
xlabel('tiempo t')
ylabel('u_{\delta}')

% fin de setanolrvelin.m

