function xdot = ejext1(t,x)
% Primer ejemplo de simulacion numerica usando el metodo
% de linealizacion extendida:
% El programa requerido para realizar las simulaciones
% y obtener las graficas es sejext1.m
%
% parametros del sistema
J=90;al=0.5;a2=0.5; X=1.5;

% ley de control
u = -J*al*a2*(atan(x(1)) - atan(X) ) - J(al+a2)*x(2) ;

% modelo no lineal (satelite monoaxial)
xdot = [0.5*(1+x(1)*x(1))*x(2) ;
    1/J*u];
% fin ejext1.m
