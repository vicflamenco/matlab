function y = trespuntoscentrada(f,x0,h)
    syms x;
    format long;
    a = subs(f,x,x0+h);
    b = subs(f,x,x0-h);
    
    deriv = diff(f,x);
    fprintf('\nDERIVADA = ');
    pretty(deriv);
    
    fprintf('\n\nf(%3.3f) = 1/(2h) * [ f(%3.3f) - f(%3.3f) ]\n\n',x0,x0+h,x0-h);
    aprox = double((1/(2*h))*(a-b))
    
    real = double(subs(deriv,x,x0))
    error = double(abs(aprox-real))
    
end