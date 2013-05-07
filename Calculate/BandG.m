function r=BandG(dim,n,R)%Bouyance and gravity at the n th time step.dim is thedimension of problem
global RHOC RHOP G %density of fluid,density of bubble ,gravity acceleration
if dim==3;%When dimension=3,bouyance and gravity are in the direction of Z axis
   r(:,3)=4*pi*(RHOC-RHOP)*G*R^3./3; 
else%When dimension=2,bouyance and gravity are in the direction of Y axis
   r(:,2)=4*pi*(RHOC-RHOP)*G*R^3./3; 
end

end
