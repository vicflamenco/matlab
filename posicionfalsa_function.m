function [P2] = posicionfalsa_function (f,P0,P1,tolerancia)
    %f(x)=0
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
        x=P2;
        F2 = eval(f);
        error=abs(P2-P1);
        fprintf('\n%3.0f\t%9.15f\t%9.15f\t%9.15f\t%1.2e',n,double(P0),double(P1),double(P2),double(error));
        if F1*F2 < 0
           P0=P1;
           P1=P2;
        else
           P1=P2;
        end
        n=n+1;
    end
    P2 = double(P2);
    fprintf('\n');
end