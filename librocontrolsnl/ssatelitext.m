% ssatelitext.m
%
% Programa de simulacion de la respuesta controlada
% de un satelite monoaxial (modelo no lineal obtenido
% usando la representacion Cayley-Rodrigues).
% Este programa permite simular la respuesta del sistema no lineal
% presentado en el programa ejext1.m
%
% El sistema es controlado mediante una realimentacion no lineal de estado
% obtenida por linealizacion extendida.

% tiempo de simulacion
t0=0; tf=30;

% condiciones iniciales
x0=[0 0]';

% simulacion numerica
[t,x] = ode23('ejext1',[t0 tf],x0);

% parametros
J=90;a1=0.5;a2=0.5; X=1.5;

% obtencion de la ley de control en forma vectorial
u = -J*a1*a2*(atan(x(:,1))-atan(X))-J*(a1+a2)*x(:,2);

subplot(221), plot(t,x(:,1))
title('posicion angular de orientacion')
ylabel('x1')
xlabel('t [seg]')

subplot(222), plot(t,x(:,2))
title('velocidad angular respecto al eje principal')
ylabel('x2')
xlabel('t [seg]')

subplot(223), plot(t,u)
title('torque externo - ley de control')
ylabel('u')
xlabel('t [seg]')
% ssatelitext.m
