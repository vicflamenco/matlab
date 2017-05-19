function y = diferencias_ejercicio7(t,ft,x0)
    n=length(t);
    M=zeros(n,n+1);
    M(:,1)=t';
    M(:,2)=ft';
    k=1;
    for j=3:n+1
       for i=2:n
          if i>=j-1
             M(i,j)=[M(i,j-1)-M(i-1,j-1)]/[t(i)-t(i-k)]; 
          end
       end
       k=k+1;
    end
    M
    syms x;
    %CONSTRUYENDO POLINOMIO
    POL = M(1,2);
    for j=3:n+1
        factor=1;
        for i=1:j-2
            factor=factor*(x-t(i));
        end
        POL = POL + M(j-1,j)*factor;
    end
    pretty(vpa(POL));
    y = double(subs(POL,x,x0));
end