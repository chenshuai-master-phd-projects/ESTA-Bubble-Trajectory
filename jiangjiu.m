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
figure(1)
plot(dt.*x(:,1),x(:,2))
title('Position X')
xlabel('t /s');
ylabel('x /m');
legend('x-t')

figure(2)
plot(dt.*x(:,1),x(:,3))
title('Position Y')
xlabel('t /s');
ylabel('y /m');
legend('y-t')

figure(3)
plot(dt.*x(:,1),x(:,4))
title('Velocity X')
xlabel('t /s');
ylabel('Vx /ms^{-1}');
legend('Vx-t')

figure(4)
plot(dt.*x(:,1),x(:,5))
title('Velocity Y')
xlabel('t /s');
ylabel('Vy /ms^{-1}');
legend('Vy-t')

figure(5)
plot(dt.*x(:,1),x(:,6))
title('Radius')
xlabel('t /s');
ylabel('Radius /m');
legend('R-t')

figure(6)
plot(dt.*x(:,1),x(:,7))
title('Reynolds')
xlabel('t /s');
ylabel('Re');
legend('Re-t')

figure(7)
plot(dt.*x(:,1),x(:,8),dt.*x(:,1),x(:,10),dt.*x(:,1),x(:,12),dt.*x(:,1),x(:,14),dt.*x(:,1),x(:,16),dt.*x(:,1),x(:,18))
title('Forces in X axis')
xlabel('t /s')
ylabel('Forces /N')
legend('Nameless','Drag','Lift','Added Mass','Basset','Buoyance&Gravity')

figure(8)
plot(dt.*x(:,1),x(:,9),dt.*x(:,1),x(:,11),dt.*x(:,1),x(:,13),dt.*x(:,1),x(:,15),dt.*x(:,1),x(:,17),dt.*x(:,1),x(:,19))
title('Forces in Y axis')
xlabel('t /s')
ylabel('Forces /N')
legend('Nameless','Drag','Lift','Added Mass','Basset','Buoyance&Gravity')


