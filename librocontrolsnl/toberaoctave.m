global F L J R c a b sel lambda1 lambda2 lambda3 thet L1 L2 L3

% Parametros del sistema
F = 100; % Fuerza de Reaccion 
L = 3; % Distancia
J = 50; % Constante de Inercia
R = 20; %Una constante conocida

% Parametros del Controlador
c = 2.75;
a = 2;
b = 3.5;

% Punto de Equilibrio deseado
thet = 2.5;

% Parametros del Observador
lambda1 = 10;
lambda2 = 10;
lambda3 = 10; 
L1 = lambda1+lambda2+lambda3;
L2 = lambda1*lambda2+lambda1*lambda3+lambda2*lambda3;
L3 = (lambda1*lambda2*lambda3*J)/(F*L);

sel = 1; % controlador con observador
%sel = 0; % controlador con realimentación completa de los estados

function xdot = f (x, t)
global F L J R c a b sel lambda1 lambda2 lambda3 thet L1 L2 L3

% Ley de Control.
% Dependiendo de la variable "sel" se emplea uno u otro controlador:
u = (-J*a*(b^2+c^2)/(F*L*R)*x(4)-J*(b^2+c^2+2*a*b)/F/L/R*x(5)-(2*b+a)/R*x(6))*sel+(-J*a*(b^2+c^2)/(F*L*R)*(x(1)-thet)-J*(b^2+c^2+2*a*b)/F/L/R*x(2)-(2*b+a)/R*x(3))*(1-sel);

% Ecuaciones de Estado
xdot(1) = x(2);
xdot(2) = ((F*L)/J)*sin(x(3));
xdot(3) = R*u;
xdot(4) = L1*((x(1)-thet)-x(4))+x(5);
xdot(5) = L2*((x(1)-thet)-x(4))+(F*L/J)*x(6);
xdot(6) = R*u+L3*((x(1)-thet)-x(4));
endfunction

% Condiciones Iniciales 
X1 = 2;
X2 = 0;
X3 = 0;
X4 = 0;
X5 = 0;
X6 = 0;
x0 = [X1;X2;X3;X4;X5;X6];

ti = 0;
tf = 1.25; 

np = 100;

t = linspace(ti,tf,np);
x = lsode("f",x0,t);

%Posicion Angular (x(1))

plot(t,x(:,1),'3',t,x(:,4)+thet,'2')
title('Posicion Angular')
xlabel('t[seg]')
ylabel('theta')
safeimage

% Velocidad Angular (x(2))

plot(t,x(:,2),'3',t,x(:,5),'2')
title('Velocidad Angular')
xlabel('t[seg]')
ylabel('Omega')
safeimage

% Angulo de Orientacion de la Tobera (x(3)) 

plot(t,x(:,3),'3',t,x(:,6),'2')
title('Orientación de la Tobera')
xlabel('t[seg]')
ylabel('Beta')
safeimage

% Controlador u

v = (-J*a*(b^2+c^2)/F/L/R*x(:,4)-J*(b^2+c^2+2*a*b)/F/L/R*x(:,5)-(2*b+a)/R*x(:,6))*sel+(-J*a*(b^2+c^2)/F/L/R*(x(:,1)-thet)-J*(b^2+c^2+2*a*b)/F/L/R*x(:,2)-(2*b+a)/R*x(:,3))*(1-sel);

plot(t,v,'3')
title('Variable de Control')
xlabel('t[seg]')
ylabel('u')
safeimage

plot3(x(:,1),x(:,2),x(:,3))
hold
plot3(x(:,4)+thet,x(:,5),x(:,6),'r')

safeimage

