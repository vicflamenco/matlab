function [P2] = secante_function (f,P0,P1,tolerancia)
    %f(x)=0
    format long;
    digits(15);
    syms x;
    error=100;
    fprintf('\n\n  n\t\t\tP0\t\t\t\tP1\t\t\t\tP2\t\t\t\tError');
    n=1;
    while error > tolerancia
        x=P1;
        F1 = eval(f);
        x=P0;
        F0 = eval(f);
        P2=P1-(F1*(P1-P0))/(F1-F0);
        error=abs(P2-P1);
        fprintf('\n%3.0f\t%9.15f\t%9.15f\t%9.15f\t%1.2e',n,double(P0),double(P1),double(P2),double(error));
        P0=P1;
        P1=P2;
        n=n+1;
    end
    P2 = double(P2);
    fprintf('\n');
end