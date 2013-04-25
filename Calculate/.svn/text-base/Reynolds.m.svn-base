function [Re,NearWall]=Reynolds(n,PositionP,VelocityP,R,SafeDistance)
%Calculate Reynolds number and surveille the position of bubble in order to
%assure that the bubble isn't near the wall.(Otherwise we'll have to add Faxen correction
%to our essential equation ,and we'll have to treat the FDM on the boundary

%PositionP,VelocityP,R:the position,velocity,radius of bubble
%Dimension of PostionP should correspond to the dimension of SafeDistance
if size(PositionP,2)==3;%dimension=3
    global Xmin Xmax Ymin Ymax Zmin Zmax
    if((PositionP(1)-R)<(Xmin+SafeDistance(1)))|((PositionP(1)+R)>(Xmax-SafeDistance(1)));
        NearWall=1;%The bubble is near the wall Xmin or Xmax
    elseif((PositionP(2)-R)<(Ymin+SafeDistance(2)))|((PositionP(2)+R)>(Ymax-SafeDistance(2)));
        NearWall=1;%The bubble is near the wall Ymin or Ymax
    elseif((PositionP(3)-R)<(Zmin+SafeDistance(3)))|((PositionP(3)+R)>(Zmax-SafeDistance(3)));
        NearWall=1;%The bubble is near the wall Zmin or Zmax
    else %The bubble isn't near the wall
        NearWall=0;
    end   
else %dimension=2
    global Xmin Xmax Ymin Ymax
    if((PositionP(1)-R)<(Xmin+SafeDistance(1)))|((PositionP(1)+R)>(Xmax-SafeDistance(1)));
        NearWall=1; %The bubble is near the wall Xmin or Xmax
    elseif((PositionP(2)-R)<(Ymin+SafeDistance(2)))|((PositionP(2)+R)>(Ymax-SafeDistance(2)));
        NearWall=1;%The bubble is near the wall Ymin or Ymax
    else %The bubble isn't near the wall
        NearWall=0;
    end  
end

if NearWall==1;%Display the alarm
   sprintf('Reynolds.m:The Bubble is near Wall.Even it has prehaps flown out of wall!!!!') 
end

if NearWall==0;
    global MU RHOC
    Uf=interpolation(n,PositionP,'Velocity');%velocity of fluid
    tmp1=Uf-VelocityP;%relative velocity
    tmp=norm(tmp1);%norm of relative velocity    
    Re=2*RHOC*R*sqrt(tmp)./MU;%Calculate the Reynolds number
else %NearWall==1
    Re=0;
end

end

