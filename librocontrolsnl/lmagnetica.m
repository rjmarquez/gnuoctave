function xdot = lmagnetica(t,x)
%% lmagnetica.m
%%
%% Control de un sistema de levitacion magnetica
%%
%% Este programa simula la respuesta de un modelo de tercer
%% orden, que representa un sistema de levitacion magnetica

%% parametros del sistema
c = 1; m = 0.1; L = 0.01; R = 1; g = 9.8;
a = 40; xi = 0.5; wn = 25; Xd = 0.05;

%% Ley de control
u = m*L*x(1)/(2*c*x(3))*((c/m)*(x(3)^2/x(1))*(2*R/L + x(2)/x(1)) +...
(a + 2*xi*wn)*(g - c/m*x(3)^2/x(1)) + (wn^2 + 2*xi*wn*a)*x(2) + a*wn^2*(x(1) - Xd));

%% Ecuaciones de estado
xdot = [ x(2); g - (c/m)*(x(3)^2/x(1)); -(R/L)*x(3) + (1/L)*u];

%% Fin de lmagnetica.m
