%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%  BURGERS' EQUATION IN THE    %%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%    FOURIER SPACE SOLVER      %%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%  Miquel Altadill Llasat  %%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc
clear all
close all

InputData;

%% Data Storage
Ek_save = {zeros(N(1)), zeros(N(2))};      %Saves energy for the 2 cases
                                           % N = 20 and N =100

%% Code Core
[Ek_save] = CodeCore(N,Re,Ek_save,error,Ct);

%% Data PostProcess
PostProcess(Ek_save, N)
