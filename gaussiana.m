function y = gaussiana(f,a,b,n,P)
    syms x t;
    v = solve(P)'
    for i=1:n
       fprintf('\n\tx%i = %9.15f',i,double(v(i))); 
    end
    for i=1:n
        num=1;
        den=1;
        for j=1:n
            if i==j
            else
                num=num*(x-v(j));
                den=den*(v(i)-v(j));
            end
        end
        fprintf('\n\nC%i = ',i);
        G=num/den;
        pretty(G);
        C(i) = double(int(G,x,-1,1));
        fprintf('\nC%i = %9.15f\n',i,C(i));
    end
    
    x0 = ((b-a)*t+a+b)/2;
    dx0 = (b-a)/2;
    fprintf(' x = ');
    pretty(x0);
    dx0
    F = subs(f,x,x0)*dx0;
    pretty(F);
    y = 0;
    for i = 1:n
        y=y+C(i)*subs(F,t,v(i));
    end
    y=double(y);
end