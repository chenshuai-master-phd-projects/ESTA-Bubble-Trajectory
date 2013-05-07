dim=2;
dtf=0.01;
nframe=20;
Nx=100;
Ny=100;

Xmin=0;Xmax=123.4;
Ymin=0;Ymax=134.5;

a=double((Xmax-Xmin)/Nx);
b=double((Ymax-Ymin)/Ny);


%Taylor-Green Vortex
X1=double(x./(Xmax-Xmin));
Y1=double(y./(Ymax-Ymin));
X=2*pi*X1;
Y=2*pi*Y1;
nu=2;
rho=400;
F=exp(-2*nu*t);
P=(rho/4)*F^2*(cos(2*X)+cos(2*Y))+1234;%initial pressure can not be null!
Ux=sin(X)*cos(Y)*F;
Uy=-cos(X)*sin(Y)*F;