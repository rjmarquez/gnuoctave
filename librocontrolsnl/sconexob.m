% sconexob.m
%
% programa de simulacion del sistema de dos conductores acoplados
% magneticamente, se ilustra la regulacion al punto de equilibrio
% usando un esquema de controlador y observador no lineales,
% obtenidos mediante linealizacion extendida.
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

% parametros de simulacion
t0 = 0;
tf = 1.5;
x0 = [0.1 0.1 0.2 0.0];

% simulacion
[t,x] = ode23('conexob',[t0 tf],x0);

subplot(223),plot(t,x(:,1),'k',t,x(:,3),'k--')
title('Distancia del conductor')
xlabel('t [seg]')
ylabel('y = x_1 [m]')
legend('y = x_1 (medida)','x_1 (estimada)')

subplot(211),plot(t,x(:,2),'k',t,x(:,4),'k--')
title('Velocidad del conductor')
xlabel('t [seg]')
ylabel('x_2 [m/seg]')
legend('x_2 (real)','x_2 (estimada)')

% parametros
k = 10; L0 = 0.05; I = 0.3; L = 0.5; a = 0.3;

% punto de equilibrio
b = 0.12;

% polinomios deseados
a1 = 5.0; a2 = 6.0; % control

uu = (a-x(:,3))/(2*I*L).*(-a1*a2*(x(:,3)-b)+k*(x(:,3)-L0)-(a1+a2)*x(:,4));

subplot(224),plot(t,uu,'k')
title('Corriente I (control)')
xlabel('t [seg]')
ylabel('u [Amp]')

% fin de sconexob.m
