function [P] = newton_function (f,P0,tolerancia)
    %f(x)=0
    format long;
    syms x;
    error=100;
    fprintf('\n\n  n\t\t\tP0\t\t\t\tP\t\t\t\tError');
    n=1;
    deriv = diff(f,x);
    while error > tolerancia
        x=P0;
        F0 = eval(f);
        Fprima = eval(deriv);
        P=P0-F0/Fprima;
        error=abs(P-P0);
        fprintf('\n%3.0f\t%9.15f\t%9.15f\t%1.2e',n,double(P0),double(P),double(error));
        P0=P;
        n=n+1;
    end
    P=double(P);
    fprintf('\n');
end