% ejext3.m
function xdot = ejext3(t,x)
%
% Ejemplo de simulacion numerica usando el metodo
% de linealizacion extendida para el disen~o de un
% observador no lineal
%

% parametros del sistema
J=90;al=0.5;a2=0.5; X=1.5; xi=0.7; wn=0.8;

% ley de control
u = -J*al*a2*(atan(x(3))-atan(X))-J(al+a2)*x(4);

% modelo no lineal (satelite monoaxial)
xdot = [0.5*(1+x(1)*x(1))*x(2) ;
    1/J*u;
    0.5*(1+x(3)*x(3))*x(4)+2*xi*wn*(x(1)-x(3));
    1/J*u+2*wn*wn*(atan(x(1))-atan(x(3)))];

% fin ejext3.m
