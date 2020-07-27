% sartexac.m
% Programa de simulacion del comportamiento en lazo
% cerrado de un artefacto espacial controlado mediante realimentacion
% no lineal basada en el metodo de linealizacion exacta.
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
ti = 0; tf = 5;

%% condiciones iniciales:
x0 = [0 0 0]';

%% simulacion
[t,x] = ode23('artexac',[ti tf],x0);

%% Posicion angular (x(1))
subplot(2,2,1), plot(t,x(:,1))
title('Posición angular')
xlabel('tiempo t [seg]')
ylabel('\theta [rad]')

%% Velocidad angular (x(2))
subplot(2,2,2), plot(t,x(:,2))
title('Velocidad angular')
xlabel('tiempo t [seg]')
ylabel('\omega [rad/seg]')

%% Angulo de orientación de la tobera (x(3))
subplot(2,2,3), plot(t,x(:,3))
title('Orientación de la tobera')
xlabel('tiempo t [seg]')
ylabel('\beta [rad]')

% parametros del sistema
F = 200; L=3; R=20; J =50;

%% parametros del controlador
a1 = 3;
a2 = 5;
a3 = 4;
X = 2.5;

%% Ley de control
b1 = a1*a2*a3;
b2 = a1*a2+a1*a3+a2*a3;
b3 = a1+a2+a3;

uu = J./(F*L*R*cos(x(:,3))).*( -b1*(x(:,1)-X)-b2*x(:,2)-b3*F*L/J*sin(x(:,3)) );

subplot(2,2,4), plot(t,uu)
title('Variable de control')
xlabel('tiempo t [seg]')
ylabel('u [rad/seg]')

% fin de sartexac.m
