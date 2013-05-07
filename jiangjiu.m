x=load('tmp.txt');
dt=0.0025
%{
for i=2:19
    if i~=7
    figure;
    plot(x(:,1),x(:,i))
    hold on;
    end
end
figure(2)
for i=2:19
subplot(4,5,i)
plot(x(:,1),x(:,i));
hold on
end
%}
p1=figure(1);
plot(dt.*x(:,1),x(:,2))
title('Position X')
xlabel('t /s');
ylabel('x /m');
legend('x-t')
saveas(p1,'x-t','epsc')
saveas(p1,'x-t','jpg')

p2=figure(2);
plot(dt.*x(:,1),x(:,3))
title('Position Y')
xlabel('t /s');
ylabel('y /m');
legend('y-t')
saveas(p2,'y-t','epsc')
saveas(p2,'y-t','jpg')

p3=figure(3);
plot(dt.*x(:,1),x(:,4))
title('Velocity X')
xlabel('t /s');
ylabel('Vx /ms^{-1}');
legend('Vx-t')
saveas(p3,'Vx-t','epsc')
saveas(p3,'Vx-t','jpg')

p4=figure(4);
plot(dt.*x(:,1),x(:,5))
title('Velocity Y')
xlabel('t /s');
ylabel('Vy /ms^{-1}');
legend('Vy-t')
saveas(p4,'Vy-t','epsc')
saveas(p4,'Vy-t','jpg')

p5=figure(5);
plot(dt.*x(:,1),x(:,6))
title('Radius')
xlabel('t /s');
ylabel('Radius /m');
legend('R-t')
saveas(p5,'R-t','epsc')
saveas(p5,'R-t','jpg')

p6=figure(6);
plot(dt.*x(:,1),x(:,7))
title('Reynolds')
xlabel('t /s');
ylabel('Re');
legend('Re-t')
saveas(p6,'Re-t','epsc')
saveas(p6,'Re-t','jpg')


p7=figure(7);
plot(dt.*x(:,1),x(:,8),dt.*x(:,1),x(:,10),dt.*x(:,1),x(:,12),dt.*x(:,1),x(:,14),dt.*x(:,1),x(:,16),dt.*x(:,1),x(:,18))
title('Forces in X axis')
xlabel('t /s')
ylabel('Forces /N')
legend('Nameless','Drag','Lift','Added Mass','Basset','Buoyance&Gravity')
saveas(p7,'Fx-t','epsc')
saveas(p7,'Fx-t','jpg')

p8=figure(8);
plot(dt.*x(:,1),x(:,9),dt.*x(:,1),x(:,11),dt.*x(:,1),x(:,13),dt.*x(:,1),x(:,15),dt.*x(:,1),x(:,17),dt.*x(:,1),x(:,19))
title('Forces in Y axis')
xlabel('t /s')
ylabel('Forces /N')
legend('Nameless','Drag','Lift','Added Mass','Basset','Buoyance&Gravity')
saveas(p8,'Fy-t','epsc')
saveas(p8,'Fy-t','jpg')

y=load('tmpa.dat')
a1=figure(9);
plot(y(:,1),y(:,2),y(:,1),y(:,4),y(:,1),y(:,6),y(:,1),y(:,8),y(:,1),y(:,10),y(:,1),y(:,12))
title('\bfAcceleration in X axis')
xlabel('t /s')
ylabel('Acceleration /ms^{-2}')
legend('Total','Buoyance&Gravity','Drag','Basset','Lift','Nameless')
saveas(a1,'Ax-t','epsc')
saveas(a1,'Ax-t','jpg')

a2=figure(10);
plot(y(:,1),y(:,3),y(:,1),y(:,5),y(:,1),y(:,7),y(:,1),y(:,9),y(:,1),y(:,11),y(:,1),y(:,13))
title('\bfAcceleration in Y axis')
xlabel('t /s')
ylabel('Acceleration /ms^{-2}')
legend('Total','Buoyance&Gravity','Drag','Basset','Lift','Nameless')
saveas(a2,'Ay-t','epsc')
saveas(a2,'Ay-t','jpg')



