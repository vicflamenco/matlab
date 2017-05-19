function y = trespuntos(f,x0,h)
    syms x;
    format long;
    a = subs(f,x,x0);
    b = subs(f,x,x0+h);
    c = subs(f,x,x0+2*h);
    
    deriv = diff(f,x);
    fprintf('\nDERIVADA = ');
    pretty(deriv);
    
    fprintf('\n\nf(%3.3f) = 1/(2h) * [ -3 f(%3.3f) + 4 f(%3.3f) - f(%3.3f) ]\n\n',x0,x0,x0+h,x0+2*h);
    aprox = double((1/(2*h))*(-3*a+4*b-c))
    
    real = double(subs(deriv,x,x0))
    error = double(abs(aprox-real))
    
end