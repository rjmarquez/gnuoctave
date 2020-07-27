% sejem5.m
% Programa de generacion de los graficos del ejemplo5.m
%
%% Ejemplo con simulaciones numericas del libro:
%% Control de Sistemas No Lineales: Linealización aproximada, extendida, exacta, 2005
#    Copyright 2005-2020 Richard Marquez
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU Affero General Public License as
#    published by the Free Software Foundation, either version 3 of the
#    License, or (at your option) any later version.#
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU Affero General Public License for more details.
#
#    You should have received a copy of the GNU Affero General Public License
#    along with this program.  If not, see <https://www.gnu.org/licenses/>.

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
title('Posición angular anillo')
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
