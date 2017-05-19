function P = ejercicio7_steffensen(P,T,Pc,Tc,R,tolerancia)

    
    syms x;
    format long;
    P0 = R*T/P

    a = (27*(R*Tc)^2)/(64*Pc);
    b = R*Tc/(8*Pc);
    
    f = R*T/(P+a/x^2)+b;
    error=100;
    n=1;
    fprintf('  n      P0          P1         P2        Error\n');
    
    while error>tolerancia
        
        x = P0;
        P1 = eval(f);
        x = P1;
        P2 = eval(f);
        
        P = P0 - ((P1-P0)^2) /(P2-2*P1+P0);
        error = abs(P-P0);
        fprintf('%3.0i\t%9.9f\t%9.9f\t%9.9f\t%1.2e\n',n,P0,P1,P2,error);
        P0=P2;
        n=n+1;    
    end
    
end