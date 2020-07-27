% srobexa.m
% Programa de simulacion del control de un brazo manipulador robotico
% mediante el metodo de torque calculado

% Parametros de simulacion
ti = 0;
tf = 1;
% Condiciones iniciales
x0 = [-0.3 0]';

% Simulacion
[t,x] = ode23('robexa',[ti tf],x0);
% graficas
subplot(221),plot(t,x(:,1))
title('Posición angular del brazo robotico')
xlabel('t [seg]')
ylabel('x_1 [rad]')

subplot(222),plot(t,x(:,2))
title('Velocidad angular')
xlabel('t [seg]')
ylabel('x_2 [rad]')

% parametros
B = 1e-2;
J = 4e-2;
c = .58;
N = 1;

% punto de equilibrio
Xd = 0;

% polinomios deseados
xi = 0.707; wn = 8.56;

% control
uu = -J*wn*wn*(x(:,1)-Xd) + c*sin(x(:,1)/N) + (B-2*J*xi*wn)*x(:,2);

subplot(223),plot(t,uu)
title('Torque aplicado')
xlabel('t [seg]')
ylabel('u [N-m]')
% fin de srobexa.m
