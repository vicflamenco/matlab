function [y] = hermite2_function(t, f, valor)
    
    format long;
    digits(15);
    syms x;
    m = size(t,2);
    ft=[];
    f1t=[];
    deriv = diff(f,x);
    for i=1:m
        ft(i) = subs(f,x,t(i));
        f1t(i) = subs(deriv,x,t(i));
    end
    fprintf('\n\n           Xi                f[Xi]           f[Xi,Xi+1]          f[Xi...Xi+2]        f[Xi...Xi+3]\n\n');
    Q = zeros(2*m,2*m+1);
    i = 1;
    pos = 1;
    temp1=[];
    temp2=[];
    temp3=[];
    while i <= m
        Q(pos,1) = t(i);
        temp1(pos) = t(i);
        Q(pos+1,1) = t(i);
        temp1(pos+1) = t(i);
        Q(pos,2) = ft(i);
        temp2(pos) = ft(i);
        Q(pos+1,2) = ft(i);
        temp2(pos+1) = ft(i);
        temp3(pos) = f1t(i);
        temp3(pos+1) = f1t(i);
        i=i+1;
        pos = pos+2;
    end
    t = temp1;
    ft = temp2;
    f1t = temp3;
    m=2*m;
    k=1;
    for j=3:m+1
       for i=1:m
          if i>=(j-1)
                a = Q(i,j-1)-Q(i-1,j-1);
                b = (t(i)-t(i-k));
                if a==0 && b==0
                    Q(i,j) = f1t(i-1);
                else
                    Q(i,j) = a/b;
                end
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
    POLINOMIO = simplify(POLINOMIO)
    Valor_Aproximado = double(subs(Px,x,valor))
    Valor_Exacto = double(subs(f,x,valor))
    Error = double(abs(Valor_Aproximado-Valor_Exacto)) 
end