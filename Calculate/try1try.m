function try1try()
global system
system='LINUX';
%{
if strcmp(system,'LINUX');
        [Nx,Ny]=textread('../Mesh/0_mesh.txt','%d %d',1,'headerlines',3);
end
sprintf('Nx=%d,Ny=%d',Nx,Ny)
%}
initialisation;
end
