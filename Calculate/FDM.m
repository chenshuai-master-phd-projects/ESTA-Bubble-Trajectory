function r=FDM(n,Node,VA)
%spatial FDM (Finite Difference Method)value on nodes of mesh ,Node=[I,J,K]or [I,J] 
%We adopt centered difference
%VA is a parameter of vectorial analysis:
%Position,Pressure,Velocity,Gradient,Curl,Divergence,Laplace,Convection
if size(Node,2)==3; %dim==3
    if (Node(1)==0)|(Node(2)==0)|(Node(3)==0); %Node is on the boundary of computational domain
        NearWall=1;    
    else %Node isn't on the boundary of computational domain
        NearWall=0;    
    end
else %dim=2
    if (Node(1)==0)|(Node(2)==0); %Node is on the boundary of computational domain
        NearWall=1;    
    else %Node isn't on the boundary of computational domain
        NearWall=0;    
    end
end


global system %WINDOWS or LINUX
if (size(Node,2)==3)&(NearWall==0); %dim=3 and node isn't on the boundary of computational domain
   if strcmp(system,'WINDOWS');
       filename=['..\Mesh\' num2str(n) '_mesh.txt'];
   elseif strcmp(system,'LINUX');
       filename=['../Mesh/' num2str(n) '_mesh.txt'];
   end
    
   %Read values: "I,J,K,P,Ux,Uy,U" of the node and its neighbours
   [A,B,C,D,E,F,G]=textread(filename,'%d %d %d %f %f %f %f',1,'headerlines',nindexto1([Node(1),Node(2),Node(3)])+10);
   m0=[A,B,C,D,E,F,G];
   [A,B,C,D,E,F,G]=textread(filename,'%d %d %d %f %f %f %f',1,'headerlines',nindexto1([Node(1)-1,Node(2),Node(3)])+10);
   m1=[A,B,C,D,E,F,G];
   [A,B,C,D,E,F,G]=textread(filename,'%d %d %d %f %f %f %f',1,'headerlines',nindexto1([Node(1)+1,Node(2),Node(3)])+10);
   m2=[A,B,C,D,E,F,G];
   [A,B,C,D,E,F,G]=textread(filename,'%d %d %d %f %f %f %f',1,'headerlines',nindexto1([Node(1),Node(2)-1,Node(3)])+10);
   m3=[A,B,C,D,E,F,G];
   [A,B,C,D,E,F,G]=textread(filename,'%d %d %d %f %f %f %f',1,'headerlines',nindexto1([Node(1),Node(2)+1,Node(3)])+10);
   m4=[A,B,C,D,E,F,G];
   [A,B,C,D,E,F,G]=textread(filename,'%d %d %d %f %f %f %f',1,'headerlines',nindexto1([Node(1),Node(2),Node(3)-1])+10);
   m5=[A,B,C,D,E,F,G];
   [A,B,C,D,E,F,G]=textread(filename,'%d %d %d %f %f %f %f',1,'headerlines',nindexto1([Node(1),Node(2),Node(3)+1])+10);
   m6=[A,B,C,D,E,F,G];
   global a b c Xmin Ymin Zmin
   switch VA %Vectorial Analysis
        case 'Position'
            r=[a*m0(1)+Xmin,b*m0(2)+Ymin,c*m0(3)+Zmin];
        case 'Pressure'
            r=m0(4);
        case 'Velocity'
            r=[m0(5),m0(6),m0(7)];
        case 'Gradient'%the gradient of pressure
            r(:,1)=(m2(4)-m1(4))./(2*a);
            r(:,2)=(m4(4)-m3(4))./(2*b);
            r(:,3)=(m6(4)-m5(4))./(2*c);            
        case 'Curl'
            r(:,1)=(m4(7)-m3(7))./(2*b)-(m6(6)-m5(6))./(2*c);
            r(:,2)=(m6(5)-m5(5))./(2*c)-(m2(7)-m1(7))./(2*a);
            r(:,3)=(m2(6)-m1(6))./(2*a)-(m4(5)-m3(5))./(2*b);
        case 'Divergence'
            r=(m2(5)-m1(5))./(2*a)+(m4(6)-m3(6))./(2*b)+(m6(7)-m5(7))./(2*c);
        case 'Laplace'
            r(:,1)=(m2(5)+m1(5)-2*m0(5))./a^2+(m4(5)+m3(5)-2*m0(5))./b^2+(m6(5)+m5(5)-2*m0(5))./c^2;
            r(:,2)=(m2(6)+m1(6)-2*m0(6))./a^2+(m4(6)+m3(6)-2*m0(6))./b^2+(m6(6)+m5(6)-2*m0(6))./c^2;
            r(:,3)=(m2(7)+m1(7)-2*m0(7))./a^2+(m4(7)+m3(7)-2*m0(7))./b^2+(m6(7)+m5(7)-2*m0(7))./c^2;
        case 'Convection'%the convection term
            r(:,1)=m0(5)*(m2(5)-m1(5))./(2*a)+m0(6)*(m4(5)-m3(5))./(2*b)+m0(7)*(m6(5)-m5(5))./(2*c);
            r(:,2)=m0(5)*(m2(6)-m1(6))./(2*a)+m0(6)*(m4(6)-m3(6))./(2*b)+m0(7)*(m6(6)-m5(6))./(2*c);
            r(:,3)=m0(5)*(m2(7)-m1(7))./(2*a)+m0(6)*(m4(7)-m3(7))./(2*b)+m0(7)*(m6(7)-m5(7))./(2*c);
        otherwise
            sprintf('The parameter is not included in FDM')
            
    end 
elseif (size(Node,2)==2)&(NearWall==0);%dim=2 and node isn't on the boundary of computational domain
    if strcmp(system,'WINDOWS');
        filename=['..\Mesh\' num2str(n) '_mesh.txt'];
    elseif strcmp(system,'LINUX');
        filename=['../Mesh/' num2str(n) '_mesh.txt'];
    end
    
    %Read values:"I,J,P,Ux,Uy" of the node and its neighbours
    [A,B,C,D,E]=textread(filename,'%d %d %f %f %f',1,'headerlines',nindexto1([Node(1),Node(2)])+10);
    m0=[A,B,C,D,E];
    [A,B,C,D,E]=textread(filename,'%d %d %f %f %f',1,'headerlines',nindexto1([Node(1)-1,Node(2)])+10);
    m1=[A,B,C,D,E];
    [A,B,C,D,E]=textread(filename,'%d %d %f %f %f',1,'headerlines',nindexto1([Node(1)+1,Node(2)])+10);
    m2=[A,B,C,D,E];
    [A,B,C,D,E]=textread(filename,'%d %d %f %f %f',1,'headerlines',nindexto1([Node(1),Node(2)-1])+10);
    m3=[A,B,C,D,E];
    [A,B,C,D,E]=textread(filename,'%d %d %f %f %f',1,'headerlines',nindexto1([Node(1),Node(2)+1])+10);
    m4=[A,B,C,D,E];
    global a b Xmin Ymin
    switch VA %Vectorial Analysis
        case 'Position'
            r=[a*m0(1)+Xmin,b*m0(2)+Ymin];
        case 'Pressure'
            r=m0(3);
        case 'Velocity'
            r=[m0(4),m0(5)];
        case 'Gradient'%the gradient of pressure
            r(:,1)=(m2(3)-m1(3))./(2*a);
            r(:,2)=(m4(3)-m3(3))./(2*b);
        case 'Curl'   
            r(:,1)=0;
            r(:,2)=0;
            r(:,3)=(m2(5)-m1(5))./(2*a)-(m4(4)-m3(4))./(2*b);
        case 'Divergence'
            r=(m2(4)-m1(4))./(2*a)+(m4(5)-m3(5))./(2*b);
        case 'Laplace'
            r(:,1)=(m2(4)+m1(4)-2*m0(4))./a^2+(m4(4)+m3(4)-2*m0(4))./b^2;
            r(:,2)=(m2(5)+m1(5)-2*m0(5))./a^2+(m4(5)+m3(5)-2*m0(5))./b^2;
        case 'Convection' %the convection term
            r(:,1)=m0(4)*(m2(4)-m1(4))./(2*a)+m0(5)*(m4(4)-m3(4))./(2*b);
            r(:,2)=m0(4)*(m2(5)-m1(5))./(2*a)+m0(5)*(m4(5)-m3(5))./(2*b);
        otherwise
            sprintf('The parameter is not included in FDM')
    end
    
else %Node is on the boundary of computational domain
    sprintf('The node is on the boundary of computational domain!!!!')
end

end

    