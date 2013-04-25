function r=R(n,Radius0,Pressure0,PositionP)
%Calculate the radius of bubble at the n th time step
global GAMMA %isentropic index
p=interpolation(n,PositionP,'Pressure');%Get the pressure at PositionP
r=Radius0*(Pressure0./p)^(1./(3*GAMMA));
end