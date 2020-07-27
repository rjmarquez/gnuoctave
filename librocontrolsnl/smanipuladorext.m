% smanipuladorext.m
% Programa de simulacion de la respuesta controlada
% de un brazo manopulador robotico monoaxial.
%
% El sistema es controlado por realimentacion no lineal de estado
% obtenida mediante linealizacion extendida.

% tiempo de simulacion
t0=0;
tf=1;

% condiciones iniciales
x0=[-0.5 0]';

% simulacion numerica
[t,x] = ode23('ejext2',t0,tf,x0);

% parametros
X = 0; N = 1;
B=1e-2; J=4e-2; c=.58;
xi=0.707; wn=8.56;

% expresion vectorial de la ley de control no lineal u
u = -J*wn*wn*(x(:,1)-X)+c*sin(x(:,1)/N)+(B-2*J*xi*wn)*(x(:,2)-0);
% expresion vectorial de la ley de control lineal u
%u = c*sin(X/N)-(J*wn*wn-c/N*cos(X/N))*(x(:,1)-X)+....
%(B-2*J*xi*wn)*(x(:,2)-0);

clg
subplot(221), plot(t,x(:,1))
title('posicion angular del brazo')
ylabel('x1')
xlabel('t [seg]')
subplot(222), plot(t,x(:,2))
title('velocidad angular del brazo')
ylabel('x2')
xlabel('t [seg]')
subplot(223), plot(t,u)
title('torque externo aplicado')
ylabel('u')
xlabel('t [seg]')
% sejext2.m

% ejext2.m
function xdot = ejext2(t,x)
% parametros del sistema
X = 0; N = 1; B=1e-2; J=4e-2; c=.58; xi=0.707; wn=8.56;

% ley de control no lineal
u = -J*wn*wn*(x(1) - X) +c*sin(x(1)/N)+....
(B-2*J*xi*wn)*(x(2)-0);

% ley de control lineal
%u = c*sin(X/N)-(J*wn*wn-c/N*cos(X/N))*(x(1)-X)+....
%(B-2*J*xi*wn)*(x(2)-0);

% modelo no lineal (satelite monoaxial)
xdot = [x(2) ;
    -B/J*x(2)-(c/J)*sin(x(1)/N)+(1/J)*u];

% fin smanipuladorext.m
