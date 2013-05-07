%2D Poiseuille (laminar)
Nx=10;%Nx nodes between Xmin and Xmax
Ny=100;%Ny nodes between Ymin and Ymax
Xmin=0;Xmax=2.0;
Ymin=0;Ymax=1.17;
Ly=Ymax-Ymin;                
CenterY=(Ymax-Ymin)./2+Ymin;               
R2=Ly.^2./4;
r2=(y-CenterY).^2;
mu=0.001308;
gradpx=-0.101325;
P=101325+gradpx*x;%Initial pressure can not be null or negative!
Ux=-gradpx*(R2-r2)./(4*mu);
Uy=0;