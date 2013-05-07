function [ output_args ] = dilate(n,ratio,PositionP,VelocityP,Radius,Radius0,Pressure0)
%DILATE Summary of this function goes here
%   Detailed explanation goes here
global RHOC dtf %density of fluid and the time step length between two neighbouring frames
r2=R(n+ratio,Radius0,Pressure0,PositionP); %Radius when time = (n+ratio)*dtf
r1=Radius;%Radius when time = n*dtf
Uf=interpolation(n,PositionP,'Velocity');%Velocity of fluid at the position PositionP when time = n*dtf
%the result
output_args=(1./2)*RHOC*(4*pi*Radius^2)*(r2-r1)./(ratio*dtf)*(Uf-VelocityP);
end

