function y = simpson_cerrada(f,a,b)
    syms x;
    format long;
    n=2;
    h = (b-a)/n;
    x0=a;
    x1=x0+h;
    x2=b;
    fprintf('\n\tx0 = %9.15f \n\tx1 = %9.15f \n\tx2 = %9.15f',x0,x1,x2);
    f0 = subs(f,x,x0);
    f1 = subs(f,x,x1);
    f2 = subs(f,x,x2);
    aprox = double((h/3)*[f0 + 4*f1 + f2]);
    fprintf('\n\n\th = (b-a)/n = %f',h);    
    fprintf('\n\n\tValor Aproximado = h/3 * [f(%2.4f)+ 4 f(%2.4f) + f(%2.4f)] = %9.15f\n',x0,x1,x2,aprox);
    Integral = int(f,x);
    fprintf('\n\tIntegral =\n');
    pretty(Integral);
    real = double(subs(Integral,x,b)-subs(Integral,x,a));
    e=abs(real-aprox);
    fprintf('\n\tValor Real = %9.15f\n\n\tError = %1.2e\n\n',real,e);
end