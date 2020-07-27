% ssatelitext2.m
%
% Programa de simulacion de la respuesta controlada
% de un satelite monoaxial (modelo no lineal obtenido
% usando la representacion Cayley-Rodrigues).
%
% Este programa permite simular la respuesta del sistema no lineal
% presentado en el programa
%
% ejext1b.m
%
% El sistema es controlado mediante una realimentacion no lineal de estado
% obtenida por linealizacion extendida, usando una saturacion del
% valor maximo del control
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

% tiempo de simulacion
clear all

t0=0;
tf=30;

% condiciones iniciales
x0=[0 0]';

% simulacion numerica
[t,x] = ode23('ejext1b',[t0 tf],x0);

% procedimiento para obtener la ley de control en forma vectorial
% parametros
J=90;a1=0.5;a2=0.5; X=1.5; umax=5;

for i = 1:length(x),
   uu(1,i) = -J*a1*a2*(atan(x(i,1)) - atan(X) ) - J(a1+a2)*x(i,2) ;
%  saturacion
   if abs(uu(1,i)) > umax,
      u(1,i) = umax;
   else
      u(1,i) = uu(1,i);
   end
end

save dejext1b t x u

clf

subplot(221), plot(t,x(:,1))
title('posicion angular de orientacion')
ylabel('x1 (u sat -, u sin sat --)')
xlabel('t [seg]')
subplot(222), plot(t,x(:,2))
title('velocidad angular respecto al eje principal')
ylabel('x2 (u sat -, u sin sat --)')
xlabel('t [seg]')
subplot(223), plot(t,u)
title('torque externo - ley de control')
ylabel('u (u sat -, u sin sat --)')
xlabel('t [seg]')

load dejext1

subplot(221), hold on
plot(t,x(:,1),'--')
subplot(222), hold on
plot(t,x(:,2),'--')
subplot(223), hold on
plot(t,u,'--')

% ssatelitext2.m

