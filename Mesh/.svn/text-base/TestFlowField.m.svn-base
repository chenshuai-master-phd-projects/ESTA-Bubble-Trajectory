function TestFlowField(Total)
%TESTFLOWFIELD:Virtualize and verify the mesh generated
% Total:the total numbers of flow field frames
filename0=['0_mesh.txt'];
[dim]=textread(filename0,'%d',1,'headerlines',1);%dimension of mesh
if dim==3;%dimension==3
    %number of nodes in different directions
    [Nx,Ny,Nz]=textread(filename0,'%d%d%d',1,'headerlines',3);
    %read the interval of length
    [Xmin,Xmax,Ymin,Ymax,Zmin,Zmax]=textread(filename0,'%f%f%f%f%f%f',1,'headerlines',5);
    %spatial step length between neighbouring nodes
    a=double((Xmax-Xmin)/Nx);
    b=double((Ymax-Ymin)/Ny);
    c=double((Zmax-Zmin)/Nz);    
else%dimension=2
    %number of nodes in different directions
    [Nx,Ny]=textread(filename0,'%d%d',1,'headerlines',3);
    %read the interval of length
    [Xmin,Xmax,Ymin,Ymax]=textread(filename0,'%f%f%f%f',1,'headerlines',5);
    %spatial step length between neighbouring nodes
    a=double((Xmax-Xmin)/Nx);
    b=double((Ymax-Ymin)/Ny);   
end


if dim==3;%dimension=3
    axis([Xmin,Xmax,Ymin,Ymax,Zmin,Zmax]);
    xlabel('X');ylabel('Y');zlabel('Z');
    hold on;    
    for i=1:Total;% Total:the total numbers of flow field frames
        filename=[num2str(i-1) '_mesh.txt'];
        %read the datas of each nodes
        [I,J,K,P,Ux,Uy,Uz]=textread(filename,'%d%d%d%f%f%f%f','delimiter',' ','headerlines',11);
        S=[I,J,K,P,Ux,Uy,Uz];
        S(:,1)=a*I+Xmin;
        S(:,2)=b*J+Ymin;
        S(:,3)=c*K+Zmin;
        %plot 3D velocity vectors as arrows using the function quiver3 in
        %MATLAB function library
        quiver3(S(:,1),S(:,2),S(:,3),S(:,5),S(:,6),S(:,7),'k');
        hold on
        
        x=S(:,1);
        y=S(:,2);
        z=S(:,3);
        p=S(:,4);
        xmax=max(x);
        xmin=min(x);
        ymax=max(y);
        ymin=min(y);
        zmax=max(z);
        zmin=min(z);
        xn=50;
        yn=50;
        zn=50;
        Xtmp=linspace(xmin,xmax,xn);
        Ytmp=linspace(ymin,ymax,yn);
        Ztmp=linspace(zmin,zmax,zn);
        %generate some 3D points 
        [Xinterp,Yinterp,Zinterp]=meshgrid(Xtmp,Ytmp,Ztmp);
        %Interpolation of pressure at these points using the known pressure at nodes
        %in mesh.
        %griddata is a function in MATLAB library.To some extent,it is similar to the
        %function 'interp3' 
        Pinterp=griddata(x,y,z,p,Xinterp,Yinterp,Zinterp);
        %draw the isosurface of pressure
        isosurface(Xinterp,Yinterp,Zinterp,Pinterp);
        colorbar;
        %}
        %store this frame
        M(i)=getframe;
    end
else %dimension=2
    axis([Xmin,Xmax,Ymin,Ymax]);
    xlabel('X');ylabel('Y');
    hold on;     
    for i=1:Total;
        filename=[num2str(i-1) '_mesh.txt'];
        %read the datas of each nodes
        [I,J,P,Ux,Uy]=textread(filename,'%d%d%f%f%f','delimiter',' ','headerlines',11);
        S=[I,J,P,Ux,Uy];
        S(:,1)=a*I+Xmin;
        S(:,2)=b*J+Ymin;
        %plot 2D velocity vectors as arrows using the function quiver in
        %MATLAB function library
        quiver(S(:,1),S(:,2),S(:,4),S(:,5),'k');
        hold on
        x=S(:,1);
        y=S(:,2);
        p=S(:,3);
        xmax=max(x);
        xmin=min(x);
        ymax=max(y);
        ymin=min(y);
        xn=150;
        yn=150;
        Xtmp=linspace(xmin,xmax,xn);
        Ytmp=linspace(ymin,ymax,yn);
        %generate some 2D points
        [Xinterp,Yinterp]=meshgrid(Xtmp,Ytmp);
        %Interpolation of pressure at these points using the known pressure at nodes
        %in mesh.
        %griddata is a function in MATLAB library.To some extent,it is similar to the
        %function 'interp2'
        Pinterp=griddata(x,y,p,Xinterp,Yinterp);
        %plot the contour of pressure
        contour(Xinterp,Yinterp,Pinterp);
        colorbar;
        %store this frame
        M(i)=getframe;
    end
end
%Play the 'movie' once, play speed= 0.25 frame per second
movie(M,1,0.25)


end

