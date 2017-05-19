function y = cuadratura (f,a,b)
    syms x
    format long;
    h = (b-a)/2;
    f1 = subs(f,x,a);
    f2 = subs(f,x,a+h/2);
    f3 = subs(f,x,a+h);
    S1 = double((h/6)*[f1+4*f2+f3]);
    fprintf('\n\nS(a,(a+b)/2)  =  h/6 [ f(a) + 4 f(a+h/2) + f(a+h) ]  =  %9.15f',S1);
    f4 = subs(f,x,a+3*h/2);
    f5 = subs(f,x,b);
    S2 = double((h/6)*[f3 + 4*f4 + f5]);
    fprintf('\n\nS((a+b)/2,b)  =  h/6 [ f(a+h) + 4 f(a + 3/2 h) + f(b) ]  =  %9.15f',S2);
    S=S1+S2;
    fprintf('\n\nIntegral exacta = ');
    integral = int(f,x);
    pretty(integral);
    fprintf('\n\nValor aproximado = %9.15f',S);
    real = double ( subs(integral,x,b) - subs(integral,x,a) ) ;
    fprintf('\n\nValor real = %9.15f',real);
    error = abs(S-real);
    fprintf('\n\nError = %1.2e\n\n',error);
end