%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%  INPUT DATA   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Solving Parameters
N = [20,100];           % Levels for the summatory
Re = 40;                % Reynolds Number

%% Auxiliar Parameters
rho = 1;                % Fluid Density
mu = 2e-5;              % Fluid Viscosity
l = 1;
v0 = mu*Re/(rho*l);

%% Solver Parameters
error = 1e-7;           %Convergence criteria
Ct    = 0.01;           % Time step compute constant


