function [v] = lagrange_function(t,ft,valor)
    y=0;
    syms x;
    format long;
    n = size(t,2);
    m = size(ft,2);
    div=0;
    if m~=n
       fprintf('\nEl tamaño del arreglo de los valores x no coincide con el tamaño del arreglo de sus imagenes.\n');
    else
        for i=1:m
            num=1;
            den=1;
           for j=1:m
               if i~=j
                   num=num*(x-t(j));
                   den=den*(t(i)-t(j));
                   div = num/den;
               end
           end
           y = y + div*ft(i);
           fprintf('\n\tL%1i(x)=',(i-1));
           div = vpa(div);
           pretty(div);
        end
        fprintf('\n\nP(x)=');
        y=vpa(y);
        pretty(y);
        fprintf('\n\nP(x)=');
        simplificado = simplify(y);
        pretty(simplificado);
        
        v = double(subs(y,x,valor));
    end
end