function y = simpson_compuesta(f,a,b,n)
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
    fprintf('\n\n\tValor Aproximado = h/3 * [f(%2.4f) + 2[',t(1));
    sum=0;
    for i=2:(n/2)
       fprintf('f(%2.4f) + ',t(2*i-1));
       fi = subs(f,x,t(2*i-1));
       sum = sum + fi;
    end
    fprintf('] + 4 [');
    sum2=0;
    for i=2:(n/2)+1
       fprintf('f(%2.4f) + ',t(2*i-2));
       fi = subs(f,x,t(2*i-2));
       sum2 = sum2 + fi;
    end
    f0=subs(f,x,a);
    fn=subs(f,x,b);
    aprox = double((h/3)*(f0+2*sum+4*sum2+fn));
    fprintf('] + f(%2.4f)] = %9.15f\n',t(n+1),aprox);
    Integral = int(f,x);
    fprintf('\n\tIntegral =\n');
    pretty(Integral);
    real = double(subs(Integral,x,b)-subs(Integral,x,a));
    e=abs(real-aprox);
    fprintf('\n\tValor Real = %9.15f\n\n\tError = %1.2e\n\n',real,e);
end