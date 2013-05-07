function Index1Dim=nindexto1(IndexIN)
%Change 3D or 2D index into 1D index,in order to read the mesh.txt file
%This function only cencentrates on datas after 11 lines in mesh.txt !!!
if size(IndexIN,2)==3;%dimension=3,IndexIN=[i,j,k];
    %Nx nodes between Xmin and Xmax,Ny nodes between Ymin and Ymax,Nz nodes between Zmin and Zmax
    global Nx Ny Nz
    Index1Dim=IndexIN(1)*(Ny+1)*(Nz+1)+IndexIN(2)*(Nz+1)+IndexIN(3)+1;
else %dimension=2,IndexIN=[i,j]
    %Nx nodes between Xmin and Xmax,Ny nodes between Ymin and Ymax
    global Nx Ny
    Index1Dim=IndexIN(1)*(Ny+1)+IndexIN(2)+1;
end

end