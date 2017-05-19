function y = tresoctavos_cerrada(f,a,b)
    syms x;
    format long;
    n=3;
    h = (b-a)/n;
    x0=a;
    x1=x0+h;
    x2=x1+h;
    x3=b;
    fprintf('\n\tx0 = %9.15f \n\tx1 = %9.15f \n\tx2 = %9.15f \n\tx3 = %9.15f',x0,x1,x2,x3);
    f0 = subs(f,x,x0);
    f1 = subs(f,x,x1);
    f2 = subs(f,x,x2);
    f3 = subs(f,x,x3);
    aprox = double((3*h/8)*[f0 + 3*f1 + 3*f2 + f3]);
    fprintf('\n\n\th = (b-a)/n = %f',h);    
    fprintf('\n\n\tValor Aproximado = 3*h/8 * [f(%2.4f)+ 3 f(%2.4f) + 3 f(%2.4f) + f(%2.4f)] = %9.15f\n',x0,x1,x2,x3,aprox);
    Integral = int(f,x);
    fprintf('\n\tIntegral =\n');
    pretty(Integral);
    real = double(subs(Integral,x,b)-subs(Integral,x,a));
    e=abs(real-aprox);
    fprintf('\n\tValor Real = %9.15f\n\n\tError = %1.2e\n\n',real,e);
end