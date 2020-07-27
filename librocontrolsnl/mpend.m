%% mpend.m
%% modelo del pendulo invertido sobre una plataforma movil
%% para utilizarlo hay que ejecutar el programa spend.m

function xdot = mpend(t,x)
%% Parametros
global M F r0 u0 m L J C g

u = 0;

D1 = -C*x(4)+m*L*g*sin(x(3)); 
D2 = -F*x(2)+m*L*sin(x(3))*x(4)^2+u;
D = J*(M+m)+m*L^2*(M+m*sin(x(3))^2);

xdot = [x(2);
    (-m*L*cos(x(3))*D1+(J+m*L^2)*D2)/D;
    x(4);
    ((M+m)*D1-m*L*cos(x(3))*D2)/D];

%% fin de mpend.m
