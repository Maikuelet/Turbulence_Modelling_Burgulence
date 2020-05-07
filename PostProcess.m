%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%  POSTPROCESS   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



function PostProcess(Ek_save, N)

close all
options = 0;
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultaxesticklabelinterpreter','latex');
set(groot,'defaultlegendinterpreter','latex');


%% Data Loading
if options ==0
pathh     = pwd;                                  % Path Where Saved main.m
myfolder  = 'Workspace';                          % Folder where Saved

% ----------------------        Energy            ---------------------- %
FrameFolder = fullfile(pathh , myfolder, 'Ek_save');      % Generate Adress
load(FrameFolder);                                        % Load Adress
% ----------------------        Nodes            ---------------------- %
FrameFolder = fullfile(pathh , myfolder, 'N');            % Generate Adress
load(FrameFolder);                                        % Load Adress
end

%% Previous calculations
for i=1:length(N)
    it = size((Ek_save{i}),2);
    for t=1:it  
        
        %Energy sum
        Tot_Ek(i,t) = sum(Ek_save{i}(:,t));
        
    end
end


% Plot Generation
for i=1:length(N)
    it = size((Ek_save{i}),2);
    
    h1=figure(1);
    p = plot(Tot_Ek(i,1:it)); hold on;
    xlabel('Iterations');
    ylabel('Total energy of the modes');
    legend(sprintf('$N = %d $ DNS', N(1)), sprintf('$N = %d $ DNS', N(2)));
    grid on

    
    h2=figure(2); 
    loglog(1:N(i),Ek_save{i}(:,it),'-*'); hold on;
    xlabel('Wave number ($k$)');
    ylabel('Energy Spectrum $E_k$');
    legend(sprintf('$N = %d $ DNS', N(1)), sprintf('$N = %d $ DNS', N(2)));
    grid on
    
end

%% Plot Storage
pathh     = pwd;
mkdir Images
myfolder = 'Images';

f = fullfile(pathh , myfolder, 'EnergySpectrum.png');
saveas(h2,f);
f = fullfile(pathh , myfolder, 'TotalEnergy.png');
saveas(h1,f);


%% Vble Storage
mkdir Workspace
myfolder = 'Workspace';

f = fullfile(pathh , myfolder, 'Ek_save');
save(f,'Ek_save');
f = fullfile(pathh , myfolder, 'N');
save(f,'N');
end