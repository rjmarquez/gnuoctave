% robexa.m
function dx = robexa(t,x)
% modelo de un manipulador robotico regulado mediante el metodo de control calculado

% parametros
B = 1e-2; J = 4e-2; c = .58; N = 1;

% punto de equilibrio
Xd = 0;

% polinomios deseados
xi = 0.707; wn = 8.56;
u = -J*wn*wn*(x(1)-Xd) + c*sin(x(1)/N) + (B-2*J*xi*wn)*x(2);

y = x(1);

dx = [x(2);
    -B/J*x(2)-c/J*sin(x(1)/N)+1/J*u];
% fin de robexa.m
