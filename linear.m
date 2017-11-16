%load data
load ex5Linx.dat;
load ex5Liny.dat;

m = size(ex5Linx,1);

%generate input data
n = 5;
input = [ones(m,1),ex5Linx,ex5Linx.^2,ex5Linx.^3,ex5Linx.^4,ex5Linx.^5];

%create constMatrix
constMatrix = eye(n+1);
constMatrix(1,1) = 0;

%normal equation to generate theta
theta0 = pinv((input')*input+0*constMatrix)*(input')*ex5Liny

theta1 = pinv((input')*input+1*constMatrix)*(input')*ex5Liny

theta10 = pinv((input')*input+10*constMatrix)*(input')*ex5Liny

%hypothesis
hy0 = input*theta0;

hy1 = input*theta1;

hy10 = input*theta10;

%jvalue
constOneMVector = ones(1,m);
constOneNVector = ones(1,n+1);
constOneNVector(1,1) = 0;

j0 = (constOneMVector*(hy0 - ex5Liny).^2  + 0*constOneNVector*theta0.^2)/(2*m)

j1 = (constOneMVector*(hy1 - ex5Liny).^2 + 1*constOneNVector*theta1.^2)/(2*m)

j10 = (constOneMVector*(hy10 - ex5Liny).^2 + 10*constOneNVector*theta10.^2)/(2*m)

%draw 
hold on
plot(ex5Linx, ex5Liny,'o')
plot(ex5Linx, hy0,'r')
plot(ex5Linx, hy1,'g')
plot(ex5Linx, hy10,'b')
legend('traing data','\lambda=0','\lambda=1','\lambda=10')
hold off