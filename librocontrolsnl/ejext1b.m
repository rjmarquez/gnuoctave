function xdot = ejext1b(t,x)
% ejext1b.m
%
% Modificacion al programa ejext1.m
%
% Ley de control realimentada usando una saturacion del
% valor maximo y minimo posibles.
%
% El programa requerido para realizar las simulaciones
% y obtener las graficas es:
%
% sejext1b.m
%

% parametros del sistema
J=90;al=0.5;a2=0.5; X=1.5;

% valor de saturacion del control
umax=5;

% ley de control
uu = -J*al*a2*(atan(x(1)) - atan(X) ) - J(al+a2)*x(2) ;

if abs(uu) > umax,
u = umax;
else
u = uu;
end

% modelo no lineal (satelite monoaxial)
xdot = [0.5*(1+x(1)*x(1))*x(2) ;
    1/J*u];

% fin ejext1b.m
