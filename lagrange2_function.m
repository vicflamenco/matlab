function [v] = lagrange2_function(t,f,valor)
    y=0;
    syms x;
    format long;
    div=0;
    m=size(t,2);
    
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
       fi = subs(f,x,t(i));
       y = y + div*fi;
       fprintf('\n\tL%1i(x)=',(i-1));
       pretty(div);
    end
    fprintf('\n\nP(x)=');
    pretty(y);

    Valor_Aproximado = double(subs(y,x,valor))
    Valor_Exacto = double(subs(f,x,valor))
    Error = double(abs(Valor_Aproximado-Valor_Exacto))
end