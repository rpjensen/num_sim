% Ryan Jensen
% CSCI 373
% Prof. Sanft
% Homework 1

%% Problem 1
v = 10:15

%% Problem 2
v = 20:2:40

%% Problem 3
v = 2:0.1:5

%% Problem 4
x = 1:10; % init the matrix
% a:
x = [x 42]
% b:
x(4) = 87
% c:
x = x(1:end-1)
% d:
x = x([1:6 8:end])

%% Problem 5
% Prediction:
% z will equal [8, 13, 18] by using componenet wise addition and scalar
% multiplication according to the equation for z
x = [2 4 6];
y = 3:5;
z = 2*x + y + 1;
disp(z)

%% Problem 6
M = zeros(4, 4);
M(:,1) = 1;
M(3, 4) = 99

%% Problem 7
M2 = M(:,2:end)

%% Problem 8
A = [1 2 3; 4 5 6; 7 8 9];
b = [32 77 122]';
v = A\b;
A*v

%% Problem 9
v1 = [14 -15 15];
v2 = [-1 -4 -30];
m = fun1(v1, v2)

%% Problem 10
fun2 = @(t, y) y.^2 + t;
fun2(0,1)
fun2(4,2)

%% Problem 11
% Prediction: It should print that z is equal to 6 and that x is equal to
% 4. x is unchanged since the function parameters are different then the 
% variables in the calling scope. z is assigned the result of the
% computation which is 6.
x = 4;
y = 5;
z = 6;

f = @(x, y, z) x + y + z;

z = f(1,2,3);
disp(z)
disp(x)

%% Problem 12
% abs returns the absolute value of the elements of a vector, matrix, or
% scalar
abs(-1)
abs([1 -2 3 -4])
abs([-1 2; 3 -4])
% floor returns the largest integer less than or equal to the input (matrix
% floor works element based)
floor(1.2)
floor(-1.1)
floor(2)

%% Problem 13
v1 = ones(4,1);
v2 = zeros(3,1);
prob13(v1,v2)
v1 = ones(3,1);
v2 = zeros(4,1);
prob13(v1,v2)
v1 = ones(3,1);
v2 = zeros(3,1);
prob13(v1,v2)

%% Problem 14
prob14(5)
prob14(123)
prob14(3)
prob14(6)
prob14(125)
prob14(122)

%% Problem 15
myMax([1 2 3 4])
myMax([1 2 3 4 3 2 1])
myMax([4 3 2 1])
myMax([-4 3 2 1])
myMax([-4 -3 -2 -1])
%% Problem 16
prob16(2*[1:10])

%% Problem 17
prob17(2*[1:10])
prob17([1])

%% Problem 18
computeDiff([5 1 9 7])

%% Problem 19
myTranspose([1 2; 3 4; 5 6])

%% Problem 20
[T, Y] = ode45(@prob20, [0 10], [1 0.5]);
plot(T, Y(:,1));
hold on
plot(T, Y(:,2), 'r--');
hold off
figure
plot(Y(:,1),Y(:,2))
