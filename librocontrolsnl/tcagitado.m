% tcagitado.m
function xdot = tcagitado(t,x)
% Control de un reactor de agitado permanentemente.
% Este programa simula la respuesta de un modelo de segundo
% orden, que representa un reactor de agitado permanente
% controlado mediante linealizacion exacta

%% parametros del sistema
Da1 = 1; Da2 = 1; U = 4; x2d = (1/(2*Da2))*(-1 + sqrt(1 + 4*Da1*Da2*U/(1 + Da1)));
xi = 0.707; wn = 3.162277;

%% Ley de control
u = (1/Da1)*(Da1*(1 + Da1)*x(1) + (1 - 2*xi*wn + 2*Da2*x(2))*(Da1*x(1) - x(2) - Da2*x(2)^2) - wn^2*(x(2) - x2d));

%% Ecuaciones de estado
xdot = [ (- (1 + Da1)*x(1) + u); (Da1*x(1) - x(2) - Da2*x(2)^2)];

%% fin de tcagitado.m

