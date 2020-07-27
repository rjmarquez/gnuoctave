% sejext3.m
%
% Programa de simulacion de la respuesta controlada
% de un satelite monoaxial (modelo no lineal obtenido
% usando la representacion Cayley-Rodrigues).
% El sistema es controlado mediante una realimentacion no lineal de estado
% sintetizada mediante un observador no lineal
% dise~nado mediante linealizacion extendida.
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


% tiempo de simulacion
t0=0;
tf=30;

% condiciones iniciales
x0=[0 0 0.5 0.2]';

% simulacion numerica
[t,x] = ode23('ejext3',[t0 tf],x0);

% parametros
J=90;a1=0.4;a2=0.5; X=1.5;
xi=0.7; wn=0.8;

% ley de control
u = -J*a1*a2*(atan(x(:,3))-atan(X))-J*(a1+a2)*x(:,4);

subplot(223), plot(t,x(:,1),t,x(:,3),'--')
title('Posición angular (salida)')
ylabel('y = x_1')
xlabel('t [seg]')
subplot(211), plot(t,x(:,2),t,x(:,4),'--')
title('Velocidad angular respecto al eje principal')
ylabel('x_2')
xlabel('t [seg]')
subplot(224), plot(t,u)
title('Torque externo - control')
ylabel('u')
xlabel('t [seg]')

% sejext3.m
