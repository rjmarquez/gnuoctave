% stcagitado.m
% Programa de simulacion del reactor de agitado
% controlado mediante linealizacion exacta

% tiempo de simulacion
ti = 0; tf = 4;
%% condiciones iniciales:
x0 = [0.1 0.5]';
%% simulacion
[t,x] = ode45('tcagitado', [ti tf], x0);

%% Concentracion normalizada Cp/Cp0 de la especie P (x(1))
subplot(1,2,1), plot(t,x(:,1), 'k', 'linewidth', 1)
title('Concentracion normalizada Cp/Cp0 de la especie P', 'fontsize', 12)
xlabel('tiempo t', 'fontsize', 12)
ylabel('x1', 'fontsize', 12)
grid

%% Concentracion normalizada Cp/Cp0 de la especie Q (x(2))
subplot(1,2,2), plot(t,x(:,2), 'k', 'linewidth', 1)
title('Concentracion normalizada Cp/Cp0 de la especie Q', 'fontsize', 12)
xlabel('tiempo t', 'fontsize', 12)
ylabel('x2', 'fontsize', 12)
grid

%% Variable de control (u)
Da1 = 1; Da2 = 1; U = 4; x2d = (1/(2*Da2))*(-1 + sqrt(1 + 4*Da1*Da2*U/(1 + Da1)));
xi = 0.707; wn = 3.162277;

u = (1/Da1)*(Da1*(1 + Da1)*x(:,1) + (1 - 2*xi*wn + 2*Da2*x(:,2)).*(Da1*x(:,1) -...
x(:,2) - Da2*x(:,2).^2) - wn^2*(x(:,2) - x2d));

figure(2), plot(t,u, 'k', 'linewidth', 1)
title('Variable de control', 'fontsize', 12)
xlabel('tiempo t', 'fontsize', 12)
ylabel('u', 'fontsize', 12)
grid
% fin de stcagitado
