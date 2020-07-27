% simartefactorvelin.m
% Programa de generacion de los graficos del artefactorvelin.m realizado en GNU Octave 
%%
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
ti = 0; tf = 3;

%% condiciones iniciales:
%% cerca del punto de equilibrio
x0 = [2 0 0]';

%% lejos del p.e.
%%x0 = [0 0 0]';

%% simulacion
[t,x] = ode45('artefactorvelin',[ti tf],x0);

%% Posicion angular (x(1))
subplot(2,2,1), plot(t,x(:,1))
title('Posición angular')
xlabel('tiempo t')
ylabel('\theta')

%% Velocidad angular (x(2))
subplot(2,2,2), plot(t,x(:,2))
title('Velocidad angular')
xlabel('tiempo t')
ylabel('\omega')

%% Angulo de orientacion de la tobera (x(3))
subplot(2,2,3), plot(t,x(:,3))
title('Orientación de la tobera')
xlabel('tiempo t')
ylabel('\beta')

%% Variable de control (u)
F = 200; L=3; R=20; J =50; a =2; b=3.5; c = 12.75; Theta = 2.5;

u = -J*a*(b^2+c^2)/F/L/R*(x(:,1)-Theta)-J*(b^2+c^2+2*a*b)/F/L/R*x(:,2)-...
(2*b+a)/R*x(:,3);

subplot(2,2,4), plot(t,u)
title('Variable de control')
xlabel('tiempo t')
ylabel('u')

% fin de simartefactorvelin.m
