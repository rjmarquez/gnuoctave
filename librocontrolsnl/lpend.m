%% lpend.m
%% Modelo incremental
%% pendulo invertido sobre una plataforma movil.
%%
%% Se debe ejecutar despues de spend.m
%% Los parametros son los mismos de spend.m

Dt = J*(M+m)+M*m*L^2;

A =    [0 1 0 0;
    0 -F*(J+m*L^2)/Dt -m^2*L^2*g/Dt m*L*C/Dt;
    0 0 0 1;
    0 m*L*F/Dt (M+m)*m*L*g/Dt -C*(M+m)/Dt];

B =    [0;
    (J+m*L^2)/Dt;
    0;
    -m*L/Dt];


C = [1 0 L 0]; %% Consideramos como salida la posicion
           %% del centro de gravedad y = x_1+L*sin(x_3)

D = 0;

T = (0:0.05:tf)';
U = zeros(size(T));

%% condiciones iniciales x0, ver spend.m
[Y,X] = lsim(A,B,C,D,U,T,x0);

%% fin de lpend.m
