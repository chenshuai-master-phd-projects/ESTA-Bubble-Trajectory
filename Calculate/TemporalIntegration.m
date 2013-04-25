function TemporalIntegation(Pressure0,Radius0,Position0,Velocity0,ratio,NT,SafeDistance,epsilon)
global dtf %dtf:time step length between 2 neighbouring fluid field mesh frames
DT=ratio*dtf;%DT:time step length between 2 neighbouring computational frames
R0=R(0,Radius0,Pressure0,Position0);%initial radius of bubble
%Verify the Reynolds number and the distance between wall and bubble
[Re,NearWall]=Reynolds(0,Position0,Velocity0,R0,SafeDistance);

if (Re>epsilon)|(NearWall==1);
%The Reynolds number can't satisfy the creeping flow condition OR the bubble is near wall
    sprintf('Inappropriate initial values!\n Please reset initial values!')
else
    %assignment of initial values    
    [finish,PositionP,VelocityP,cache,CacheArray]=Restart('Read&Assign',Position0,Velocity0);
end
%Begin the temporal integration
head=finish;
for n=head:NT;    
    if Re>=epsilon;%The Reynolds number can't satisfy the creeping flow condition
        sprintf('!!!!!!The Reynolds number has exceeded epsilon!!!!!!')
        break;
    elseif NearWall==1;%The bubble is near wall
        sprintf('!!!!TemporalIntegration.m:The bubble is near the wall!!!!!')
        break;
    else%(Re<epsilon)&(NearWall==0);
        %we record the the serial number of last time step finished
        Restart('Write',n,PositionP,VelocityP,CacheArray,cache);
        r=R(n,Radius0,Pressure0,PositionP);%bubble's radius at the n th time step
        F=0;
        
        %Steady force at the n th time step
        global dim
        BG=BandG(dim,n,r);%Bouyance and gravity at the n th time step
        L=Lift(n,PositionP,VelocityP,r);%Lift at the n th time step
        D=Drag(n,PositionP,VelocityP,r);%Drag at the n th time step
        Di=dilate(n,ratio,PositionP,VelocityP,r,Radius0,Pressure0);
        %Unsteady force at the n th time step
        N=Nameless(n,ratio,PositionP,r);
        %Basset history force at the n th time step
        [B,CacheArray]=Basset(n,ratio,PositionP,Position0,Velocity0,r,CacheArray,cache);
        
        %Total force at the n th time step
        %F=(3/2).*N+BG+L+D+B+Di;
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        F=(2./2).*N+BG+L+D
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        global RHOC RHOP
        Mequal=(RHOP+RHOC/2)*(4./3)*pi*r^3;%Mequal: equivalent mass
        AccelerationP=F./Mequal %bubble's acceleration at the n th time step
        
        
        AccelerationBG=BG./Mequal
        AccelerationL=L./Mequal
        AccelerationD=D./Mequal
        AccelerationN=N./Mequal
        AccelerationB=B./Mequal
        %}
        
        %Added mass force at the n th time step
        A=AddedMass(n,ratio,PositionP,VelocityP,AccelerationP,r,Radius0,Pressure0);
        %Preparation for the calculation of Basset force at the (n+1) th time
        %step
        x=RHOC*(4./3)*pi*r^3;        
        cache=N./x-AccelerationP;  
        %output bubble's information in the file  'trajectory.txt'
        output(n,ratio,PositionP,VelocityP,r,Re,N,D,L,A,B,BG);%output
        %Preparation for the (n+1) th time step.
        %Update PositionP VelocityP Re and NearWall
        VelocityP=VelocityP+AccelerationP.*DT;
        PositionP=PositionP+VelocityP.*DT;
        %predict of the next position of bubble
        if size(PositionP,2)==3;
            sprintf('The next position of bubble=(%f,%f,%f)',PositionP(1),PositionP(2),PositionP(3))
        else %dim=2
            sprintf('The next position of bubble=(%f,%f)',PositionP(1),PositionP(2))
        end
        %Calculation of Reynolds number and 'NearWall'
        [Re,NearWall]=Reynolds(n,PositionP,VelocityP,r,SafeDistance);
        
        sprintf('The n=%d time step has been completed',n)
        sprintf('********************************************')
    end
end
Restart('Default');%set the content in the file  Record.txt to default
sprintf('Every time step of the computation has been completed')
end
