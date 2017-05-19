function y = n0_abierta(f,a,b)
    syms x;
    format long;
    n=0;
    h = (b-a)/(n+2);
    x0=a+h;
    f0 = subs(f,x,x0);
    fprintf('\n\tx0 = %9.15f',x0);
    aprox = double((2*h)*f0);
    fprintf('\n\n\th = (b-a)/(n+2) = %f',h);    
    fprintf('\n\n\tValor Aproximado = 2*h * [ f(%2.4f) ] = %9.15f\n',x0,aprox);
    Integral = int(f,x);
    fprintf('\n\tIntegral =\n');
    pretty(Integral);
    real = double(subs(Integral,x,b)-subs(Integral,x,a));
    e=abs(real-aprox);
    fprintf('\n\tValor Real = %9.15f\n\n\tError = %1.2e\n\n',real,e);
end