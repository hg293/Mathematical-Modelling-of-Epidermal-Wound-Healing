clc
clear all
close all

%defining parameters for the graph plot
m=0;
x = linspace(0,100,100);
t = linspace(0,100,100);

%solving the pde
sol = pdepe(m,@wavepde,@waveic,@bcfun2,x,t); %solves the pde from the functions
n=sol(:,:,1);

%figure plot
figure(1)
plot(x,n) % plots the solution
title('Cell density')
xlabel('Distance x')
ylabel('Cell density,n(x,t)')

%function to define the pde
function [c,f,s] = wavepde(x,t,n,dndx)
D=0.001;
c = 1;
f = D*dndx;
s = n*(1-n);
end

%function to define the initial condition
function n0 = waveic(x)
n0 = 0;
end

%function to define the boundry condition
function [pL,qL,pR,qR] = bcfun2(xL,nL,xR,nR,t)
pL = nL;
qL = 0;
pR = nR-1;
qR = 0;
end   
