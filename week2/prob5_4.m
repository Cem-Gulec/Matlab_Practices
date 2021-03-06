function result = prob5_4()
    
    counter = 0;
    xl = -1;
    xu = 0;
    f = @(x) -12 - 21*x + 18*power(x,2) - 2.75*power(x,3);
    % since it can be figured out in the graph where the roots outlied
    % we can easily detect them by giving a close value to approach
    f1 = fzero(f,-1);
    f2 = fzero(f, 1);
    f3 = fzero(f, 4);
    fprintf('root1: %.5f root2: %.5f root3: %.5f\n', f1,f2,f3);
    
    % plotting the function
    figure(1)
    fplot(f, [-3,5], 'g')
    x_line = xlim;
    y_line = ylim;
    line([0 0], y_line);  % y-axis
    line(x_line, [0 0]);  % x-axis
    hold on
    plot([f1,f2,f3], [0,0,0], '*r') % plotting root points
    
    % bisection method implementation
    fprintf('\n***bisection method***\n');
    while(1)
        f_xl = f(xl);
        f_xu = f(xu);
        xr = (xl+xu)/2;
        f_xr = f(xr);
        ea = abs( (xu-xl)/(xu+xl) )*100;
        fprintf('xl:%.5f xu:%.5f xr:%.5f f(xl):%.5f f(xu):%.5f f(xr):%.5f ea: %%%.5f \n', xl, xu, xr, f_xl, f_xu, f_xr, ea);
        
        % updating depending on the conditions
        if f_xl*f_xr < 0
            xu = xr;
        end
        
        if f_xl*f_xr > 0
            xl = xr;
        end
        
        if f_xu*f_xr < 0
            xl = xr;
        end
        
        % iteration number
        counter = counter + 1;
        % stopping criterian
        if ea < 1 
            break 
        end
        
    end
    fprintf('number of iterations: %d\n', counter);
    fprintf('approximate error: %%%.8f\n', ea);
    fprintf('approximate root: %.5f\n\n', xr);
    
    % false position method implementation
    fprintf('***false position method***\n');
    counter = 0;
    state_counter = 0;
    xl_old = -1;
    xl = -1;
    xu = 0;
    f_xl = f(xl);
    
    while(1)
        if xl == xl_old
            state_counter = state_counter + 1;
        end
        
        if state_counter == 3
            f_xl = f_xl / 2;
        end
        
        f_xu = f(xu);
        xr = xu - (f_xu* (xu-xl)/(f_xu-f_xl));
        ea = abs( (xu-xl)/(xu+xl) )*100;
        fprintf('xl:%.5f xu:%.5f xr:%.5f f(xl):%.5f f(xu):%.5f f(xr):%.5f ea: %%%.5f \n', xl, xu, xr, f_xl, f_xu, f(xr), ea);
        
        
        % updating conditions
        if f_xl*f(xr) <0
             xu = xr;
        
        else
             xl = xr;
        end
        
        
        % stopping criteria
        if  abs(f(xr)) < 0.01 || f(xr) == 0
             break 
        end
        
        counter = counter + 1;
        
    end
    fprintf('number of iterations: %d\n', counter);
    fprintf('approximate error: %%%.8f\n', ea);
    fprintf('approximate root: %.5f\n\n', xr);
    
    
    
end