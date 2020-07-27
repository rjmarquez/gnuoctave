function xdot=arole(t,x)
% Sistema aro-anillo
% Programa de simulacion: sarole.m
%

% parametros del sistema
a = 0.2;
g = 9.8;

% punto de equilibrio
X1e = 0.7854;

% parametros del controlador
wn = 12.83;
xi = 0.707;

uc = (-2*xi*wn*x(2)-wn^2*(x(1)-X1e)+g/a*sin(x(1)))/...
    (sin(x(1))*cos(x(1)));

% solo se toman valores positivos de uc
if uc<0
    u = 0;
else
    u = uc;
end

% sistema dinamico
xdot = [x(2);
    -g/a*sin(x(1))+0.5*u*sin(2*x(1))];
% fin de arole.m
