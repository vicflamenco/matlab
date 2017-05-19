function [P2] = steffensen_function (f,P0,tolerancia)
    % x = f(x)
    digits(15);
    syms x;
    error=100;
    fprintf('\n\n  n\t\t\tP0\t\t\t\tP1\t\t\t\tP2\t\t\t\tP\t\t\t\tError');
    n=1;
    while error > tolerancia
        x=P0;
        P1 = eval(f);
        x=P1;
        P2 = eval(f);
        P=P0-((P1-P0)^2)/(P2-2*P1+P0);
        error=abs(P-P0);
        fprintf('\n%3.0f\t%9.15f\t%9.15f\t%9.15f\t%9.15f\t%1.2e',n,P0,P1,P2,P,error);
        P0=P;
        n=n+1;
    end
    P2 = double(P2);
    fprintf('\n');
end