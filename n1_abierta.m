function y = n1_abierta(f,a,b)
    syms x;
    format long;
    n=1;
    h = (b-a)/(n+2);
    x0=a+h;
    x1=b-h;
    fprintf('\n\tx0 = %9.15f \n\tx1 = %9.15f',x0,x1);
    f0 = subs(f,x,x0);
    f1 = subs(f,x,x1);
    aprox = double((3*h/2)*[f0 + f1]);
    fprintf('\n\n\th = (b-a)/(n+2) = %f',h);    
    fprintf('\n\n\tValor Aproximado = 3*h/2 * [f(%2.4f) + f(%2.4f)] = %9.15f\n',x0,x1,aprox);
    Integral = int(f,x);
    fprintf('\n\tIntegral =\n');
    pretty(Integral);
    real = double(subs(Integral,x,b)-subs(Integral,x,a));
    e=abs(real-aprox);
    fprintf('\n\tValor Real = %9.15f\n\n\tError = %1.2e\n\n',real,e);
end