function r=Drag(n,PositionP,VelocityP,R)%Drag at the n th time step 
global MU 
Uf=interpolation(n,PositionP,'Velocity');%the velocity of fluid at the position PositionP
r=-6*pi*MU*R.*(VelocityP-Uf);
end