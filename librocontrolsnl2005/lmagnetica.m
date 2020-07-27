function xdot = lmagnetica(t,x)
%% lmagnetica.m
%%
%% Control de un sistema de levitacion magnetica
%%
%% Este programa simula la respuesta de un modelo de tercer
%% orden, que representa un sistema de levitacion magnetica
%%
%% Ejemplo con simulaciones numericas del libro:
%% Control de Sistemas No Lineales y Linealización
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

%% parametros del sistema
c = 1; m = 0.1; L = 0.01; R = 1; g = 9.8;
a = 40; xi = 0.5; wn = 25; Xd = 0.05;

%% Ley de control
u = m*L*x(1)/(2*c*x(3))*((c/m)*(x(3)^2/x(1))*(2*R/L + x(2)/x(1)) +...
(a + 2*xi*wn)*(g - c/m*x(3)^2/x(1)) + (wn^2 + 2*xi*wn*a)*x(2) + a*wn^2*(x(1) - Xd));

%% Ecuaciones de estado
xdot = [ x(2); g - (c/m)*(x(3)^2/x(1)); -(R/L)*x(3) + (1/L)*u];

%% Fin de lmagnetica.m
