clear
%load data
x = load('ex5Logx.dat');
y = load('ex5Logy.dat');

%draw figure
figure
pos = find(y);
neg = find(y==0);

plot(x(pos, 1), x(pos, 2), '+')
hold on
plot(x(neg, 1), x(neg, 2), 'o')

% generate input 
u = x(:,1);
v = x(:,2);
input = map_feature(u,v);

%calculate theta
theta = NewtomMethod(10,input,y)

%draw line
printf('start to draw\n');
drawlog(theta)
printf('end to draw\n');

legend('y=1','y=0','decision border')


