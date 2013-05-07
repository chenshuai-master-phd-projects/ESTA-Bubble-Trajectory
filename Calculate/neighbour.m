function r=neighbour(Coordinates,n)
%Find the neighbouring nodes,and choose the one with the smallest indexs( a node locates in a corner of a cube)
%Coordinates [real,real,real] or [real, real] 
%n is the serial number of time step
if size(Coordinates,2)==3;%dimension=3
    %neighbour  
    global a b c Xmin Ymin Zmin
    tmp1=(Coordinates(1)-Xmin)./a;
    tmp2=(Coordinates(2)-Ymin)./b;
    tmp3=(Coordinates(3)-Zmin)./c;
    %choose the one with the smallest indexs( a node locates in a corner of a cube)
    cornerI=floor(tmp1);%floor is a function in Matlab function library
    cornerJ=floor(tmp2);
    cornerK=floor(tmp3);
    %Get the 3D index of the 'Corner Neighbouring Node '
    r=[cornerI,cornerJ,cornerK];
else%dimension=2
    global a b Xmin Ymin
    cornerI=floor((Coordinates(1)-Xmin)./a);
    cornerJ=floor((Coordinates(2)-Ymin)./b);
    %Get the 2D index of the 'Corner Neighbouring Node '
    r=[cornerI,cornerJ];
end

end