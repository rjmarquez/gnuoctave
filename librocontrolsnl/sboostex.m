% sboostex.m
%
% Programa que simula la respuesta en lazo cerrado de un convertidor
% de corriente continua del tipo Boost, controlado a un punto
% de equilibrio deseado mediante un regulador PI no lineal
% obtenido mediante linealizacion extendida.
%

clear uu
% parametros de simulacion
t0 = 0;
tf = 0.02;
x0 = [0.1 0.1 0.0];

% simulacion
[t,x] = ode23('boostext',[t0 tf],x0);

subplot(221),plot(t,x(:,1),'k')
title('Corriente normalizada promedio')
xlabel('t [seg]')
ylabel('x1')

subplot(222),plot(t,x(:,2),'k')
title('Tensión normalizada promedio')
xlabel('t [seg]')
ylabel('x2')

% parametros
w0 = 1.881e3;
w1 = 1.6667e3;
b = 106.06;

% punto de equilibrio
Ue = 0.8;
X2e = b/w0/(1-Ue);

yy = x(:,2);

uusl = x(:,3)+ 0.45*w0*(1-x(:,3)).*(1-x(:,3))/b.*(X2e-yy);

for i = 1:length(t),
if uusl(i) >= 1
    uu(i) = 1;
elseif uusl(i) <= 0
    uu(i) = 0;
else
    uu(i) = uusl(i);
end
end


subplot(223),plot(t,uu,'k')
title('Relación de trabajo')
xlabel('t [seg]')
ylabel('u')
axis([0 tf -0.1 1.1])

subplot(224),plot(t,yy,'k')
title('Tensión de salida')
xlabel('t [seg]')
ylabel('y')

% fin de sboostex.m

