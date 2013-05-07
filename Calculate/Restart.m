function varargout=Restart(varargin)
%This function can complete 3 different tasks:
%<1>Restart('Write',finish,PositionP,VelocityP,ArrayCache,cache)
%finish:the serial number of last time step finished
%In <1> task,we record the the serial number of last time step finished in
%the file Record.txt.Once the computation has been interrupted, the
%computation can  automatically continue after running 'main.m' again
%It will be useful if the computation takes long time

%<2>[finish,PositionP,VelocityP,cache,CacheArray]=Restart('Read&Assign',Position0,Velocity0)
%In <2> task,we assign initial values of some variables before temporal integration

%<3>Restart('Default')
%In <3> task,we set the content in the file  Record.txt to default

str=varargin{1};%Read the task
filename='Record.txt';
if strcmp(str,'Write');%str=='Write'    
    finish=varargin{2};%finish:the serial number of last time step finished
    PositionP=varargin{3};%bubble's position at the last time step finished
    VelocityP=varargin{4};%bubble's velocity at the last time step finished
    ArrayCache=varargin{5};%array of 'cache' at the last time step finished
    cache=varargin{6};%the relative acceleration between fluid and bubble at the last time step finished
    %Output bubble's information at the last time step finished in case of
    %being interrupted.
    fid=fopen(filename,'wt');
    fprintf(fid,'#This time step has been completed\nFor n>0 time step,there was no doubt that Re<epsilon,NearWall=0\n');
    fprintf(fid,'%d\n',finish);    
    if size(PositionP,2)==3;%dimension==3        
        fprintf(fid,'#Position of bubble in this time step\n');
        fprintf(fid,'%f %f %f\n',PositionP(1),PositionP(2),PositionP(3));
        fprintf(fid,'#Velocity of bubble in this time step\n');
        fprintf(fid,'%f %f %f\n',VelocityP(1),VelocityP(2),VelocityP(3));
        fprintf(fid,'#We get the variable ''new cache'' in order to calculate Basset force\n');
        fprintf(fid,'%f %f %f\n',cache(1),cache(2),cache(3));
        fprintf(fid,'#We have already haven an array of ''old cache''\n');        
        for i=1:size(ArrayCache,1);%size(ArrayCache,1) the line of ArrayCache
            fprintf(fid,'%f %f %f\n',ArrayCache(i,1),ArrayCache(i,2),ArrayCache(i,3));        
        end
    else%dimension==2
        fprintf(fid,'#Position of bubble in this time step\n');
        fprintf(fid,'%f %f\n',PositionP(1),PositionP(2));
        fprintf(fid,'#Velocity of bubble in this time step\n');
        fprintf(fid,'%f %f\n',VelocityP(1),VelocityP(2));
        fprintf(fid,'#We get the variable ''new cache'' in order to calculate Basset force\n');
        fprintf(fid,'%f %f\n',cache(1),cache(2));
        fprintf(fid,'#We have already haven an array of ''old cache''\n');        
        for i=1:size(ArrayCache,1);%size(ArrayCache,1) the line of ArrayCache
            fprintf(fid,'%f %f\n',ArrayCache(i,1),ArrayCache(i,2));        
        end
    end
    fclose(fid);
    nargout=0;
    
elseif strcmp(str,'Read&Assign')&(nargin==3);%str='Read&Assign'
    [finish]=textread(filename,'%d',1,'headerlines',2);
    global dim
    if finish~=0;%The computation has been interrupted
        if dim==3;%dimension=3
            [P1,P2,P3]=textread(filename,'%f %f %f',1,'headerlines',4);
            P=[P1,P2,P3];%assignment of initial position of bubble
            [V1,V2,V3]=textread(filename,'%f %f %f',1,'headerlines',6);
            V=[V1,V2,V3];%assignment of initial velocity of bubble
            [newc1,newc2,newc3]=textread(filename,'%f %f %f',1,'headerlines',8);
            newcache=[newc1,newc2,newc3];%assignment of initial relative acceleration
            [AC1,AC2,AC3]=textread(filename,'%f %f %f','delimiter',' ','headerlines',10);
            AC=[AC1,AC2,AC3];%assignment of initial ArrayCaches            
        else %dimension=2
            [P1,P2]=textread(filename,'%f %f',1,'headerlines',4);
            P=[P1,P2];%assignment of initial position of bubble
            [V1,V2]=textread(filename,'%f %f',1,'headerlines',6);
            V=[V1,V2];%assignment of initial velocity of bubble
            [newc1,newc2]=textread(filename,'%f %f',1,'headerlines',8);
            newcache=[newc1,newc2];%assignment of initial relative acceleration
            [AC1,AC2]=textread(filename,'%f %f','delimiter',' ','headerlines',10);
            AC=[AC1,AC2];%assignment of initial ArrayCaches            
        end        
    else %finish=0 The computation hasn't been interrupted yet.
        P=varargin{2};%Position0 %assignment of initial position of bubble;
        V=varargin{3};%Velocity0 %assignment of initial velocity of bubble;            
        if dim==3;
            AC(1,:)=[0,0,0];%assignment of initial ArrayCaches
            newcache=[0,0,0];%assignment of initial relative acceleration
        else %dim=2
            AC(1,:)=[0,0];%assignment of initial ArrayCaches
            newcache=[0,0];%assignment of initial relative acceleration
        end       
    end
    %assignment of initial values
    varargout{1}=finish;
    varargout{2}=P;%PositionP
    varargout{3}=V;%VelocityP
    varargout{4}=newcache;%cache
    varargout{5}=AC;%ArrayCache  
    
elseif strcmp(str,'Default')&(nargin==1);%str='Default'
    fid=fopen(filename,'wt');
    %set the content in the file  Record.txt to default
    fprintf(fid,'#This time step has been completed\nFor n>0 time step,there was no doubt that Re<epsilon,NearWall=0\n');
    fprintf(fid,'0');
    fclose(fid);
    nargout=0;%No output  
end


end

