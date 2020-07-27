function xdot = tcagitado(t,x)
% Control de un reactor de agitado permanentemente.
% Este programa simula la respuesta de un modelo de segundo
% orden, que representa un reactor de agitado permanente
% controlado mediante linealizacion exacta
%
% tcagitado.m
%
%% Ejemplo con simulaciones numericas del libro:
%% Control de Sistemas No Lineales: Linealización aproximada, extendida, exacta, 2005
#
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
Da1 = 1; Da2 = 1; U = 4; x2d = (1/(2*Da2))*(-1 + sqrt(1 + 4*Da1*Da2*U/(1 + Da1)));
xi = 0.707; wn = 3.162277;

%% Ley de control
u = (1/Da1)*(Da1*(1 + Da1)*x(1) + (1 - 2*xi*wn + 2*Da2*x(2))*(Da1*x(1) - x(2) - Da2*x(2)^2) - wn^2*(x(2) - x2d));

%% Ecuaciones de estado
xdot = [ (- (1 + Da1)*x(1) + u); (Da1*x(1) - x(2) - Da2*x(2)^2)];

%% fin de tcagitado.m

