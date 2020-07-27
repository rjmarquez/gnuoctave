% robleob2.m
function dx = robleob2(t,x)
% parametros
B = 1e-2; J = 4e-2; c = .58; N = 1;

% punto de equilibrio
X = 0;

% polinomios deseados
xi = 0.707; wn = 8.56; % control
b1 = 6.0; b2 = 8.0; % observacion

u = -J*wn*wn*(x(3)-X) + c*sin(x(3)/N) + (B-2*J*xi*wn)*x(4);

y = x(1);

dx = [x(2);
    -B/J*x(2)-c/J*sin(x(1)/N)+1/J*u; % modelo
    x(4)+(b1+b2-B/J)*(y-x(3));
    -B/J*x(4)+1/J*u+(b1*b2-B/J*(b1+b2)+B*B/J/J)*(y-x(3))-c/J*sin(y/N)];
% fin de robleob2.m
