function dx = boostext(t,x)
%
% modelo promedio de un convertidor regulado mediante un PI no lineal,
% obtenido a partir del metodo de la linealizacion extendida.
%

% parametros
w0 = 1.881e3;
w1 = 1.6667e3;
b = 106.06;

% valor del control en el equilibrio
Ue = 0.8;

% valor de la salida en el equilibrio
X2e = b/w0/(1-Ue);

% salida
y = x(2);

% calculo del control (sin limitar entre 0 y 1)
usl = x(3)+ 0.45*w0*(1-x(3))*(1-x(3))/b*(X2e-y);

% limitador
if usl >= 1
    u = 1;
elseif usl <= 0
    u = 0;
else
    u = usl;
end

dx = [-w0*x(2)+u*w0*x(2)+b;
    w0*x(1)-w1*x(2)-u*w0*x(1); % modelo
    0.54*w0*w0*(1-x(3))*(1-x(3))*(1-x(3))/(1.4142*pi*b)*(X2e-y)];
% fin de boostext.m

