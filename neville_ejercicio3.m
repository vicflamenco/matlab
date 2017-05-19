function y = neville_ejercicio3(t,ft,x0)
    n=length(t);
    Q=zeros(n,n);
    Q(:,1)=ft';
    for j=2:n
        for i=2:n
           if i>=j
                Q(i,j) = ((x0-t(i-j+1))*Q(i,j-1)-(x0-t(i))*Q(i-1,j-1))/(t(i)-t(i-j+1));
           end
        end
    end
    Q
    y = Q(n,n);
end