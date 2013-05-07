function r=Lift(n,PositionP,VelocityP,R)%Lift at n th time step
global RHOC
CL=0.53;
rot=interpolation(n,PositionP,'Curl');% the curl of velocity of fluid
if size(PositionP,2)==3;%dimension=3
  tmp1=VelocityP-interpolation(n,PositionP,'Velocity');%relative velocity between bubble and fluid
  tmp2=cross(tmp1,rot);%cross produit of the curl of velocity of fluid and relative velocity
  r=-(4./3)*pi*CL*RHOC*R^3.*tmp2;
else%dimension=2
   tmp1=VelocityP-interpolation(n,PositionP,'Velocity');%relative velocity between bubble and fluid
   tmp2(:,1)=tmp1(1);
   tmp2(:,2)=tmp1(2);
   tmp2(:,3)=0;
   tmp3=cross(tmp2,rot);%cross produit of the curl of velocity of fluid and relative velocity
   tmp4(:,1)=tmp3(1);
   tmp4(:,2)=tmp3(2);
   r=-(4./3)*pi*CL*RHOC*R^3.*tmp4;
end

end