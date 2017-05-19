function y = taylor(f,x0,h)
    syms x;
    format long;
    a = subs(f,x,x0-h);
    b = subs(f,x,x0);
    c = subs(f,x,x0+h);
    
    deriv = diff(diff(f,x),x);
    fprintf('\nSEGUNDA DERIVADA = ');
    pretty(deriv);
    
    fprintf('\n\nf(%3.3f) = 1/(h^2) * [ f(%3.3f) - 2 f(%3.3f) + f(%3.3f) ]\n\n',x0,x0-h,x0,x0+h);
    aprox = double((1/(h^2))*(a-2*b+c))
    
    real = double(subs(deriv,x,x0))
    error = double(abs(aprox-real))
    
end