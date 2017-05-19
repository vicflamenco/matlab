function [y] = diferencias_function(t,ft,valor)

    syms x;
    format long;
    m= size(t,2);
    n = size (ft,2);
    
    if m==n
        fprintf('\n\n           Xi                f[Xi]           f[Xi,Xi+1]          f[Xi...Xi+2]        f[Xi...Xi+3]\n\n');
        
        Q = zeros(m,m+1);
        for i=1:m
            Q(i,1)=t(i);
            Q(i,2)=ft(i);
        end
        k=1;
        
        for j=3:m+1
           for i=1:m
              if i>=(j-1)
                    Q(i,j) = (Q(i,j-1)-Q(i-1,j-1))/(t(i)-t(i-k));
              end
              
           end
           k=k+1;
        end
        MATRIZ = Q
        
        Px = Q(1,2);
        for i=2:m
               factor=1;
           for j=1:(i-1)
               factor = factor * (x - t(j));
           end
           Px = Px + factor*Q(i,i+1);
        end
        POLINOMIO = vpa(Px,9)
        y = double(subs(Px,x,valor));
        fprintf('\n\n');
    else
        fprintf('Los tamaños de los vectores no coinciden.');
    end
    
end