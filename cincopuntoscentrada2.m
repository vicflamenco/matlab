function y = cincopuntoscentrada2(f,x0,h)
    syms x;
    format long;
    a = subs(f(1),x,x0-2*h);
    b = subs(f(2),x,x0-h);
    c = subs(f(3),x,x0+h);
    d = subs(f(4),x,x0+2*h);
    
    deriv = diff(f,x);
    fprintf('\nDERIVADA = ');
    pretty(deriv);
    
    fprintf('\n\nf(%3.3f) = 1/(12h) * [ f(%3.3f) - 8 f(%3.3f) + 8 f(%3.3f) - f(%3.3f) ]\n\n',x0,x0-2*h,x0-h,x0+h,x0+2*h);
    aprox = double((1/(12*h))*(a-8*b+8*c-d))
    
    real = double(subs(deriv,x,x0))
    error = double(abs(aprox-real))
end