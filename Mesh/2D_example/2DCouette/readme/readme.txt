%2D Couette flow (laminar)
Xmin=0;Xmax=1.0;
Ymin=0;Ymax=5;
Nx=10;
Ny=100;
H=Ymax-Ymin;
gradpx=-20;
mu=12000;
u0=5;
P=101325+gradpx*x;%Initial pressure can not be null or negative!
Ux=u0*y./H+gradpx*(y.^2-H*y)./(2*mu);
Uy=0;