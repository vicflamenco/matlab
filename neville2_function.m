function [y] = neville2_function(t,f,valor)
    format long;
    syms x;
    a = size(t,2);
    Q = zeros(a,a);
    m = a;
    
        for i=1:m
           Q(i,1) = subs(f,x,t(i));
        end
        
        for j=2:m
            for i=1:m
               if i>=j
                    Q(i,j) = ((valor-t(i-j+1))*Q(i,j-1) - (valor-t(i))*Q(i-1,j-1))    /    (t(i)-t(i-j+1)) ;
                    fprintf('\n\nQ%1i%1i(x) = \n\t\t\t',i-1,j-1);
                    fprintf('( X - X%1i ) * Q%1i%1i - ( X - X%1i ) * Q%1i%1i\n\t\t\t',i-j,i-1,j-2,i-1,i-2,j-2);
                    fprintf('------------------------------------   =    %9.9f\n\t\t\t',Q(i,j));
                    fprintf('              X%1i - X%1i',i-1,i-j);
               end
            end
            
        end
        matriz = Q
        Valor_Exacto = double(subs(f,x,valor))
        Valor_Aproximado = Q(a,a)
        Error = double(abs(Valor_Exacto - Valor_Aproximado))
end