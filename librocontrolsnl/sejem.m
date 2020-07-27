% setanolrveap.m
% Programa de simulacion y generacion de los graficos del ejemplo2.m

% tiempo de simulacion
ti = 0;
tf = 4;

%% condiciones iniciales:
x0 = [0.1 0.9]';

%% simulacion
[t,x] = ode45('etanolrveap',[ti tf],x0);

%% Concentracion del etanol (x(1))
subplot(2,2,1), plot(t,x(:,1))
title('Concentración del etanol')
xlabel('tiempo t')
ylabel('x1')

%% Concentracion del azucar (x(2))
subplot(2,2,2), plot(t,x(:,2))
title('Concentración de azúcar')
xlabel('tiempo t')
ylabel('x2')

%% Variable de control (u)

E = 0.7 ;  Ue = (1-E)/E;
lambda = 1 ;

u = Ue -(1/E)*(lambda-1/E)*(x(:,1)-E) ;

subplot(2,2,3), plot(t,u)
title('Rata de alimentación del sustrato')
xlabel('tiempo t')
ylabel('u')

% fin de setanolrveap.m

