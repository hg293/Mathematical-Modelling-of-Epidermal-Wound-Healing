%% clear workspace & bring figure to front:
clear all;
figure(gcf);
colormap(jet)

%% set parameters:
% Considering a lattice of 100X100 to plot 3D structure of the PDE
length = 100;
width = 100;

%define the gridpoints of x and y axis
n = [width, 1:(width-1)]; %north
s = [(2:width), 1]; %south
e = [(2:length), 1]; %east
w = [length, 1:(length-1)]; %west

% defines the distance between gridpoints
dx = 5/length; 
dy= dx;

dt = 0.00025; % timestep
Dn = 0.1; % diffusivity
ts = 5; % advection speed
ni = 50000; % number of iterations
su = 1;

%% define the boundry conditions
N(1:width,1:length) = 0; %initial concentration

% boundry conditions
N(round(width/2)-30:round(width/2)+30,round(length/2)-30:round(length/2)+30) = 1;

%% Plotting the PDE solutions with laplacian and euler's method
for t = 1:ni
    
 % Laplacian of N:
 DNX2 = (N(:,e)-2.*N +N(:,w))./dx^2;
 DNY2 = (N(n,:)-2.*N +N(s,:))./dy^2;

 Ndot = Dn.*(DNX2 + DNY2) + su.*N.*(1-N) ;% define the PDE equation

 %applying euler's method for integration
 N = N + Ndot.*dt;

 % Plot:
 if (t/25) == round(t/25)
 surf(N,'FaceColor','interp');
 zlim([0 1]);
 view([15,64]); axis tight; axis off;
 drawnow
 end
end