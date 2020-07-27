% sarole.m
%
% Programa de simulacion del sistema
% que describe el movimiento de un anillo sobre
% un aro giratorio, controlador por una ley
% de realimentacion no lineal la cual linealiza
% de forma exacta al sistema en lazo cerrado.
%

% Parametros de simulacion
ti = 0;
tf = 1;

% Condiciones iniciales
x0 = [0.2 0]';

% Simulacion
[t,x] = ode23('arole',[ti tf],x0);

% graficas
figure(2)
subplot(221),plot(t,x(:,1))
title('Posición angular del anillo sobre el aro')
xlabel('t [seg]')
ylabel('x_1 [rad]')

subplot(222),plot(t,x(:,2))
title('Velocidad angular del anillo')
xlabel('t [seg]')
ylabel('x_2 [rad]')

% parametros del sistema
a = 0.2;
g = 9.8;

% punto de equilibrio
X1e = 0.7854;

% parametros del controlador
wn = 12.83;
xi = 0.707;

% ley de control
uc = (-2*xi*wn*x(:,2)-wn^2*(x(:,1)-X1e)+g/a*sin(x(:,1)))./(sin(x(:,1)).*cos(x(:,1)));
uu = zeros(size(t));
for j = 1:length(t)
if uc(j)<0
   uu(j)=0;
else
   uu(j) = uc(j);
end
end

subplot(223),plot(t,uu)
title('Cuadrado de la velocidad angular del aro')
xlabel('t [seg]')
ylabel('u [rad^2/seg^2]')

subplot(224),plot(t,sqrt(uu))
title('Velocidad angular del aro')
xlabel('t (seg)')
ylabel('\omega [rad/seg]')
% fin de sarole.m
