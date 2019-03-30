clear all
close all
clc

%--------------------------------------- Initializing the Parameters ------------------------------------------%

n = 100;
p = 20;
A = rand(p,n); % rank(A) = p
x1 = rand(n,1);
b = A*x1;

%--------------------------------------- CVX for finding the solution of the Primal Problem ------------------------------------------%

cvx_begin % Applying CVX for finding the solution
    variable x(n)
    minimize( -(sum(log(x))))
    subject to
    A*x == b;
    cvx_end
    x_cvx = x;
clear x;

if cvx_status == 'Solved'
    eps = 1e-9;
    alpha = 0.2; % tolerance parameter for stepsize
    beta = 0.15; % factor with which stepsize is multiplied at each backtracking step
    x_newton = Newton_Method_Implementation(@(x)(-sum(log(x))), @(x)(-1./x), @(x)(diag(1./(x.^2))), x1, A, alpha, beta, eps);
end

%--------------------------------------- CVX for finding the solution of the Dual Problem ------------------------------------------%

cvx_begin
    variable v(p)
    maximize( -b'*v + n + sum(log(A'*v))) % maximize because the dual problem is concave
    subject to
    A'*v >= 0; % positive definite
cvx_end
x_dual_with_cvx = 1/(A'*v);
