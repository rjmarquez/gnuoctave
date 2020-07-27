function xdot=ejem3(t,x)
%% ejemplo3.m
%%
%% Tercer ejemplo con simulaciones numericas del
%% libro: Control de Sistemas No Lineales
%%
%% Control de orientacion de un artefacto espacial por medio
%% de linealizacion aproximada y uso de un observador dinamico
%%
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
F = 200; L=3; R=20; J =50;

%% parametros del controlador
a =2.0; b=3.5; c = 12.75; Theta = 2.5;

%% parametros del observador (los tres polos de la dinamica
%% del error se ubican en -5:
lambda1 = 5;
lambda2 = 5;
lambda3 = 5;

Ll = lambda1+lambda2+lambda3;
L2 = lambda1*lambda2+lambda1*lambda3+lambda2*lambda3 ;
L3 = lambda1*lambda2*lambda3*J/(F*L);

%% Ley de control
u = -J*a*(b^2+c^2)/(F*L*R)*x(4)-J*(b^2+c^2+2*a*b)/F/L/R*x(5)-...
(2*b+a)/R*x(6);

%% Ecuaciones de estado
xdot= [ x(2) ;
F*L/J*sin(x(3)) ;
R*u ;
x(5)+Ll*(x(1)-Theta-x(4)) ;
F*L/J*x(6)+L2*(x(1)-Theta-x(4)) ;
R*u + L3*(x(1)-Theta-x(4))] ;

%% Fin de ejemplo3.m
