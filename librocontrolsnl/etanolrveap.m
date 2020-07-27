function xdot=etanolrveap(t,x)
%% etanolrveap.m
%%
%% Ejemplo con simulaciones numericas del libro:
%% Control de Sistemas No Lineales y Linealización
%%
%% Control de un proceso incontrolable de produccion
%% de etanol por medio del metodo de linealizacion aproximada
%%

%% parametros del sistema
E = 0.7 ;  Ue = (1-E)/E;

%% parametros del controlador
lambda = 1 ;

%% Ley de control
u = Ue -(1/E)*(lambda-1/E)*(x(1)-E) ;

%% Ecuaciones de estado
xdot = [ x(2)-x(1)*u ; -x(2)+ (1-x(2))*u ];

%% Fin de etanolrveap.m

