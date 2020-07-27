% sejext3.m
%
% Programa de simulacion de la respuesta controlada
% de un satelite monoaxial (modelo no lineal obtenido
% usando la representacion Cayley-Rodrigues).
% El sistema es controlado mediante una realimentacion no lineal de estado
% sintetizada mediante un observador no lineal
% dise~nado mediante linealizacion extendida.

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
