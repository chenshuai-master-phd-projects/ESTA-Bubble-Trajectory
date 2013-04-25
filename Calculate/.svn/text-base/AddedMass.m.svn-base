function r=AddedMass(n,ratio,PositionP,VelocityP,AccelerationP,Radius,Radius0,Pressure0)
%Added mass force at the n th time step
%PositionP,VelocityP,Radius are distinctly the position,velocity,radius of bubble 
%When we have known bubble's acceleration AccelerationP at the moment t=n*dtf ,added mass force can be calculated using this function  
%ratio=int(dt/dtf)
global RHOC dtf %density of fluid and the time step length between two neighbouring frames
r2=R(n+ratio,Radius0,Pressure0,PositionP); %Radius when time = (n+ratio)*dtf
r1=Radius;%Radius when time = n*dtf
tmpf2=interpolation(n+ratio,PositionP,'Velocity');%Velocity of fluid at the position PositionP when time = (n+ratio)*dtf
Uf=interpolation(n,PositionP,'Velocity');%Velocity of fluid at the position PositionP when time = n*dtf
tmpf1=Uf;
tmp=(tmpf2-tmpf1)./(ratio*dtf)+interpolation(n,PositionP,'Convection');%substantial derivative=Unsteady inertial term +convective inertial terms
%the result
r=(1./2)*RHOC*(4./3)*pi*Radius^3*(tmp-AccelerationP)+(1./2)*RHOC*(4*pi*Radius^2)*(r2-r1)./(ratio*dtf)*(Uf-VelocityP);
end