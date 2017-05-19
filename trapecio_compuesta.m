function y = trapecio_compuesta(f,a,b,n)
    syms x;
    format long;
    h = (b-a)/n;
    fprintf('\n\th = (b-a)/n = %f',h); 
    t(1)=a;
    t(n+1)=b;
    fprintf('\n\n\tx0 = %f',t(1));
    for i=2:n
       t(i) = a + (i-1)*h; 
       fprintf('\n\tx%i = %f',i-1,t(i));
    end
    fprintf('\n\tx%i = %f',n,t(n+1));
    fprintf('\n\n\tValor Aproximado = h/2 * [f(%2.4f) + 2[',t(1));
    sum=0;
    for i=2:n
       fprintf('f(%2.4f) + ',t(i));
       fi = subs(f,x,t(i));
       sum = sum + fi;
    end
    f0=subs(f,x,a);
    fn=subs(f,x,b);
    aprox = double((h/2)*(f0+2*sum+fn));
    fprintf('] + f(%2.4f)] = %9.15f\n',t(n+1),aprox);
    Integral = int(f,x);
    fprintf('\n\tIntegral =\n');
    pretty(Integral);
    real = double(subs(Integral,x,b)-subs(Integral,x,a));
    e=abs(real-aprox);
    fprintf('\n\tValor Real = %9.15f\n\n\tError = %1.2e\n\n',real,e);
end