function virtualisation()
%post-processing of the result in 'trajectory.txt'
[dim]=textread('trajectory.txt','%d',1,'headerlines',1);%dimension of problem
[dt]=textread('trajectory.txt','%f',1,'headerlines',3); %time step length between 2 computational frames
if dim==3;%dimension=3
    %read the interval of length
    [Xmin,Xmax,Ymin,Ymax,Zmin,Zmax]=textread('trajectory.txt','%f%f%f%f%f%f',1,'headerlines',5);
    %Get bubble's data
    [n,X,Y,Z,Vx,Vy,Vz,R,Re,Nx,Ny,Nz,Dx,Dy,Dz,Lx,Ly,Lz,AMx,AMy,AMz,Bx,By,Bz,BGx,BGy,BGz]= ...
    textread('trajectory.txt','%d%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f','delimiter',' ','headerlines',7);
else %dimension=2
    %read the interval of length
    [Xmin,Xmax,Ymin,Ymax]=textread('trajectory.txt','%f%f%f%f',1,'headerlines',5);
    %Get bubble's data
    [n,X,Y,Vx,Vy,R,Re,Nx,Ny,Dx,Dy,Lx,Ly,AMx,AMy,Bx,By,BGx,BGy]= ...
    textread('trajectory.txt','%d%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f','delimiter',' ','headerlines',7);    
end


if dim==3;%dimension=3
    axis([Xmin,Xmax,Ymin,Ymax,Zmin,Zmax]);
    xlabel('X');ylabel('Y');zlabel('Z');
    hold on;
    nframes=size(n,1);
    blue=[0 0 1];
    colormap(blue);
    for i=1:nframes;
        %draw a 3D blue ball as the bubble
        [theta,phi]=meshgrid(0:.1:pi,0:.1:2*pi);
        sphereX=X(i,1)+R(i,1)*cos(phi).*sin(theta);
        sphereY=Y(i,1)+R(i,1)*sin(phi).*sin(theta);
        sphereZ=Z(i,1)+R(i,1)*cos(theta);
        surf(sphereX,sphereY,sphereZ);
        shading interp
        alpha(.5)%alpha is a function of transparency in MATLAB function library 
        %draw the trajectory of bubble 
        if i>1;
            plot3([X(i,1),X(i-1,1)],[Y(i,1),Y(i-1,1)],[Z(i,1),Z(i-1,1)],'color','r');
        end
        M(i)=getframe;
    end
else %dimension=2
    axis([Xmin,Xmax,Ymin,Ymax]);
    xlabel('X');ylabel('Y');
    hold on;
    nframes=size(n,1);    
    for i=1:nframes; 
        %draw a blue round as the bubble
        phi=0:.1:2*pi;
        circleX=X(i,1)+R(i,1)*cos(phi);
        circleY=Y(i,1)+R(i,1)*sin(phi);
        fill(circleX,circleY,'b');
        alpha(.5)%alpha is a function of transparency in MATLAB function library 
        %draw the trajectory of bubble 
        if i>1;
            plot([X(i,1),X(i-1,1)],[Y(i,1),Y(i-1,1)],'color','r');
        end
        %Store the frame
        M(i)=getframe;        
    end
end
%Play the 'movie' twice, play speed= 2.25 frame per second
movie(M,2,2.25)

end