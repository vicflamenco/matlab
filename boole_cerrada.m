function y = boole_cerrada(f,a,b)
    syms x;
    format long;
    n=4;
    h = (b-a)/n;
    x0=a;
    x1=x0+h;
    x2=x1+h;
    x3=x2+h;
    x4=b;
    fprintf('\n\tx0 = %9.15f \n\tx1 = %9.15f \n\tx2 = %9.15f \n\tx3 = %9.15f \n\tx4 = %9.15f',x0,x1,x2,x3,x4);
    f0 = subs(f,x,x0);
    f1 = subs(f,x,x1);
    f2 = subs(f,x,x2);
    f3 = subs(f,x,x3);
    f4 = subs(f,x,x4);
    aprox = double((2*h/45)*[7*f0 + 32*f1 + 12*f2 + 32*f3 + 7*f4]);
    fprintf('\n\n\th = (b-a)/n = %f',h);    
    fprintf('\n\n\tValor Aproximado = 2*h/45 * [7 f(%2.4f)+ 32 f(%2.4f) + 12 f(%2.4f) + 32 f(%2.4f) + 7 f(%2.4f)] = %9.15f\n',x0,x1,x2,x3,x4,aprox);
    Integral = int(f,x);
    fprintf('\n\tIntegral =\n');
    pretty(Integral);
    real = double(subs(Integral,x,b)-subs(Integral,x,a));
    e=abs(real-aprox);
    fprintf('\n\tValor Real = %9.15f\n\n\tError = %1.2e\n\n',real,e);
end