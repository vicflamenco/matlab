function y = cincopuntos(f,x0,h)
    syms x;
    format long;
    a = subs(f,x,x0);
    b = subs(f,x,x0+h);
    c = subs(f,x,x0+2*h);
    d = subs(f,x,x0+3*h);
    e = subs(f,x,x0+4*h);
    
    deriv = diff(f,x);
    fprintf('\nDERIVADA = ');
    pretty(deriv);
    
    fprintf('\n\nf(%3.3f) = 1/(12h) * [ -25 f(%3.3f) + 48 f(%3.3f) - 36 f(%3.3f) + 16 f(%3.3f) - 3 f(%3.3f) ]\n\n',x0,x0,x0+h,x0+2*h,x0+3*h,x0+4*h);
    aprox = double((1/(12*h))*(-25*a+48*b-36*c+16*d-3*e))
    
    real = double(subs(deriv,x,x0))
    error = double(abs(aprox-real))
    
end