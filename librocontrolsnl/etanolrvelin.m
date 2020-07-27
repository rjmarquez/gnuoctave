function xdot=etanolrvelin(t,x)
%% etanolrvelin.m
%%
%% Ejemplo con simulaciones numericas del libro:
%% Control de Sistemas No Lineales y Linealización
%%
%% Control de un proceso incontrolable de produccion
%% de etanol por medio del metodo de linealizacion aproximada
%%

%% parametros del sistema
global E lambda
Ue = (1-E)/E;

%% Ley de control
u = (1/E)*(lambda-1/E)*x(1) ;

%% Ecuaciones de estado
xdot = [ -(1-E)/E*x(1)+x(2)-E*u ; -x(2)/E+E*u ];

%% Fin de etanolrvelin.m

