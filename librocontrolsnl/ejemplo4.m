function xdot=ejemplo4(t,x)
%% ejemplo4.m
%%
%% Sistemas No Lineales
%%
%% Sistema Controlado por linealizacion aproximada para
%% regular la posicion de un anillo que desliza sobre
%% un aro que gira alrededor
%% de su eje vertical. El cuadrado de su velocidad angular
%% sirve de se~nal de control al sistema.
%%

%% parametros del sistema
a = 0.2; g = 9.8;

%% parametros del controlador
X1e = pi/4; Ue = g/(a*cos(X1e));
wn = 12.83; xi = 0.707;
K1 = 2*(wn^2-g/a*tan(X1e)*sin(X1e))/sin(2*X1e);
K2 = 4*xi*wn/sin(2*X1e);

%% Ley de control
u = -K1*(x(1)-X1e)-K2*x(2)+Ue;

%% Ecuaciones de estado
xdot = [x(2) ;
    -g/a*sin(x(1))+u*sin(x(1))*cos(x(1))];

%% Fin de ejemplo4.m
