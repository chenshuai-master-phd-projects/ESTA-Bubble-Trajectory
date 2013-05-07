function r=interpolation(n,Position,s)
%the position in mesh:Position =[real real real] or [real real]
%s=Pressure, Velocity,  Gradient, Curl, Divergence, Laplace, Convection
if size(Position,2)==3;%dimension=3
    global a b c Xmin Ymin Zmin %distances between neighbouring frames and mimimum of computational domain
    %Find the neighbouring nodes,and choose the one with the smallest indexs( a node locates in a corner of a cube)
    tmp=neighbour(Position,n);
    cI=tmp(1);%"c" means corner
    cJ=tmp(2);
    cK=tmp(3);
    %generate a small cube surrounding the variable'Position'.
    %The values at 8 vertices of the small cube will be known quantities for interpolation 
    [X,Y,Z]=meshgrid(a*[cI:cI+1],b*[cJ:cJ+1],c*[cK,cK+1]);
    %Read values at 8 vertices
    m1=FDM(n,[cI,cJ,cK],s);
    m2=FDM(n,[cI,cJ,cK+1],s);
    m3=FDM(n,[cI,cJ+1,cK],s);
    m4=FDM(n,[cI,cJ+1,cK+1],s);
    m5=FDM(n,[cI+1,cJ,cK],s);
    m6=FDM(n,[cI+1,cJ,cK+1],s);
    m7=FDM(n,[cI+1,cJ+1,cK],s);
    m8=FDM(n,[cI+1,cJ+1,cK+1],s);
    M=cat(1,m1,m2,m3,m4,m5,m6,m7,m8);%M={m1;m2;m3;m4;m5;m6;m7;m8}
    
    %Begin interpolation
    switch s
        case {'Pressure','Divergence'};%Output is Scalar
            S=M;%S Scalar
            %V=V(X,Y,Z)
            V(:,:,1)=[S(1),S(5);S(3),S(7)];
            V(:,:,2)=[S(2),S(6);S(4),S(8)];
            %interp3 is a function for 3D interpolation in MATLAB function
            %library.Here we use linear interpolation
            r=interp3(X,Y,Z,V,Position(1),Position(2),Position(3),'linear');
        case {'Velocity','Gradient','Curl','Laplace','Convection'};%Output is a vector 
            for i=1:3;
               S=M(:,i);%S Scalar
               %V=V(X,Y,Z)
               V(:,:,1)=[S(1),S(5);S(3),S(7)];
               V(:,:,2)=[S(2),S(6);S(4),S(8)];
               %interp3 is a function for 3D interpolation in MATLAB function
               %library.Here we use linear interpolation
               r(:,i)=interp3(X,Y,Z,V,Position(1),Position(2),Position(3),'linear');
            end   
        otherwise
            sprintf('In interpolation.m , the scalar value interpolated can be P,Ux,Uy,Uz')
    end
    
else %dimension=2
    global a b Xmin Ymin %distances between neighbouring frames and mimimum of computational domain
    %Find the neighbouring nodes,and choose the one with the smallest indexs( a node locates in a corner of a square)
    tmp=neighbour(Position,n);
    cI=tmp(1);%'c' means corner
    cJ=tmp(2);
    %generate a small square surrounding the variable'Position'.
    %The values at 4 vertices of the small square will be known quantities for interpolation
    [X,Y]=meshgrid(a*[cI:cI+1],b*[cJ:cJ+1]);
    %Read values at 4 vertices
    m1=FDM(n,[cI,cJ],s);
    m2=FDM(n,[cI,cJ+1],s);
    m3=FDM(n,[cI+1,cJ],s);
    m4=FDM(n,[cI+1,cJ+1],s);
    M=cat(1,m1,m2,m3,m4);%M=[m1;m2;m3;m4]
    
    %Begin interpolation
    switch s
        case {'Pressure','Divergence'};%Output is Scalar
            S=M;
            %V=V(X,Y)
            V=[S(1),S(3);S(2),S(4)];
            %interp2 is a function for 2D interpolation in MATLAB function
            %library.Here we use linear interpolation
            r=interp2(X,Y,V,Position(1),Position(2),'linear');
        case {'Velocity','Gradient','Laplace','Convection'};%Output is a vector
            for i=1:2;
               S=M(:,i);
               %V=V(X,Y)
               V=[S(1),S(3);S(2),S(4)];
               %interp2 is a function for 2D interpolation in MATLAB function
               %library.Here we use linear interpolation
               r(:,i)=interp2(X,Y,V,Position(1),Position(2),'linear');
            end            
        case 'Curl' %Output is a vector,although its first and second components are 0
            for i=1:3;
               S=M(:,i);
               %V=V(X,Y)
               V=[S(1),S(3);S(2),S(4)];
               %interp2 is a function for 2D interpolation in MATLAB function
               %library.Here we use linear interpolation
               r(:,i)=interp2(X,Y,V,Position(1),Position(2),'linear'); 
            end            
        otherwise
            sprintf('In interpolation.m , the scalar value interpolated can be P,Ux,Uy,Uz')
    end  
    
end

end