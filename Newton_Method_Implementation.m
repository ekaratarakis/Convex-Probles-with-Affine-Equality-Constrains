function [x, Iteration] = Newton_Method_Implementation(f, g, h, x0, A, alpha, beta, epsilon)
    x = x0; % x is the optimal solution
    gradient_value = g(x);
    hessian_value = h(x);
    Iteration = 0; % Iteration: # of iteration
    while(Iteration <= 10000)
        Iteration = Iteration + 1;
        t = 1;
        w = -inv(A*inv(hessian_value)*A')*A*inv(hessian_value)*gradient_value;
        d = -inv(hessian_value)*(gradient_value+A'*w); % Newtons Step
        l = sqrt(d'*hessian_value*d); % Newtons Decrement
        while(f(x+t*d) > (f(x) + alpha*t*gradient_value'*d))
            t = beta*t;
        end
        x = x+t*d;
        gradient_value = g(x);
        hessian_value = h(x);
        fprintf('Iteration = %2d f(x)=%10.10f\n', Iteration, f(x))
        if (l^2/2 <= epsilon)
            break
        end
    end
    if (Iteration == 10000)
        fprintf('Error in method! Not convergence.\n')
    end
end

