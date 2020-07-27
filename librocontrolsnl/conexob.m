function dx = conexob(t,x)
%
% parametros
k = 10; L0 = 0.05; I = 0.3; L = 0.5; a = 0.3;

% punto de equilibrio
b = 0.12;

% polinomios deseados
a1 = 5.0; a2 = 6.0; % control
xi = 0.707; wn = 12; % observacion

u = (a-x(3))/(2*I*L)*(-a1*a2*(x(3)-b)+k*(x(3)-L0)-(a1+a2)*x(4));

y = x(1);

dx = [x(2);
    -k*(x(1)-L0)+2*I*L*u/(a-x(1)); % modelo
    x(4)+2*xi*wn*(y-x(3));
    -k*(x(3)-L0)+2*I*L*u/(a-x(3))+(wn*wn-2*k)*(y-x(3))-k*(a-L0)*log((a-y)/(a-x(3)))];
% fin de conexob.m
