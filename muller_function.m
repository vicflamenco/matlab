function [x3] = muller_function(f,x0,x1,x2,tolerancia)
    
    format long;
    syms x;
    error=100;
    n=1;
    fprintf('\tn\t\tx0\t\t\t\t\tx1\t\t\t\t\tx2\t\t\t\t\tx3\t\t\t\t\ta\t\t\t\t\tb\t\t\t\t\tc\t\t\t\t\tError\n');
    while error>tolerancia
        x=x0;
        F0 = eval(f);
        x=x1;
        F1 = eval(f);
        x=x2;
        F2 = eval(f);
        
        c=F2;
        denominador = (x0-x2)*(x1-x2)*(x0-x1);
        b = ((x0-x2)^2*(F1-F2)-(x1-x2)^2*(F0-F2))/denominador;
        a = ((x1-x2)*(F0-F2)-(x0-x2)*(F1-F2))/denominador;
        x3 = x2 - (2*c)/(b + sign(b)*sqrt(b^2-4*a*c));
        error=abs(x3-x2);
        
        fprintf('  %3.0i\t%9.15f\t%9.15f\t%9.15f\t%9.15f\t%9.15f\t%9.15f\t%9.15f\t%1.2e\n',n,x0,x1,x2,x3,a,b,c,error);
        
        x0=x1;
        x1=x2;
        x2=x3;
        n=n+1;
    end
end