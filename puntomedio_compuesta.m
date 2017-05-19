function y = puntomedio_compuesta(f,a,b,n)
    syms x;
    format long;
    h = (b-a)/(n+2);
    fprintf('\n\th = (b-a)/(n+2) = %f',h); 
    t(1)=a;
    fprintf('\n\n\tx-1 = %f',t(1));
    for i=2:n+2
       t(i) = a + (i-1)*h; 
       fprintf('\n\tx%i = %f',i-2,t(i));
    end
    fprintf('\n\n\tValor Aproximado = 2h * [');
    sum=0;
    for i=0:(n/2)
       fprintf('f(%2.4f) + ',t(2*i+2));
       fi = subs(f,x,t(2*i+2));
       sum = sum + fi;
    end
    f0=subs(f,x,a);
    fn=subs(f,x,b);
    aprox = double(2*h*sum);
    fprintf('] = %9.15f',aprox);
    Integral = int(f,x);
    fprintf('\n\tIntegral =\n');
    pretty(Integral);
    real = double(subs(Integral,x,b)-subs(Integral,x,a));
    e=abs(real-aprox);
    fprintf('\n\tValor Real = %9.15f\n\n\tError = %1.2e\n\n',real,e);
end