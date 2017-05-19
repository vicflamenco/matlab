function y = n2_abierta(f,a,b)
    syms x;
    format long;
    n=2;
    h = (b-a)/(n+2);
    x0=a+h;
    x1=x0+h;
    x2=b-h;
    fprintf('\n\tx0 = %9.15f \n\tx1 = %9.15f \n\tx2 = %9.15f',x0,x1,x2);
    f0 = subs(f,x,x0);
    f1 = subs(f,x,x1);
    f2 = subs(f,x,x2);
    aprox = double((4*h/3)*[2*f0 - f1 + 2*f2]);
    fprintf('\n\n\th = (b-a)/(n+2) = %f',h);    
    fprintf('\n\n\tValor Aproximado = 4*h/3 * [2 f(%2.4f) - f(%2.4f) + 2 f(%2.4f)] = %9.15f\n',x0,x1,x2,aprox);
    Integral = int(f,x);
    fprintf('\n\tIntegral =\n');
    pretty(Integral);
    real = double(subs(Integral,x,b)-subs(Integral,x,a));
    e=abs(real-aprox);
    fprintf('\n\tValor Real = %9.15f\n\n\tError = %1.2e\n\n',real,e);
end