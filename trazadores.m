function [y] = trazadores(t,ft,x0)
    format short;
    a=ft;
    h=[];
    n = length(t);
    fprintf('\nValores de a:\n');
    for i=1:n
       fprintf('\n\ta%i = %3.5f\t',i-1,a(i)); 
    end
    fprintf('\n\nValores de h:\n');
    for i=1:(n-1)
       h(i) = t(i+1)-t(i);
       fprintf('\n\th%i = %3.5f\t',i-1,h(i));
    end
    A = zeros(n,n);
    for j=1:(n-2)

           fprintf('\n\n\tPara j = %i\n\n',j);
           fprintf('h%i C%i  + 2 (h%i + h%i) C%i + h%i C%i = 3 (a%i - a%i) / h%i  -  3 (a%i - a%i) / h%i',j-1,j-1,j-1,j,j,j,j+1,j+1,j,j,j,j-1,j-1);
    end
    
    % LLENANDO LA MATRIZ DE VARIABLES
    A(1,1) = 1;
    A(n,n) = 1;
    for i=2:(n-1)
       iteracion=1;
       for j=(i-1):(i+1)
            if iteracion==1
                A(i,j) = h(i-1);
            elseif iteracion==2
                A(i,j) = 2*(h(i-1)+h(i));
            elseif iteracion==3
                A(i,j) = h(i);
            end
           iteracion=iteracion+1;
       end
        
    end
    
    % LLENANDO LA MATRIZ DE CONSTANTES
    for i=2:(n-1)
       b(i) = 3*(a(i+1)-a(i))/h(i) - 3*(a(i)-a(i-1))/h(i-1); 
    end
    fprintf('\n\nC0 = 0\nC%i = 0\n\n',i);
    b = [b 0];
    b=b'
    A
    fprintf('\n\nEcuaciones:\n');
    for i=1:n
        fprintf('\n');
        for j=1:n 
            if j==1
                fprintf('%5.5f C%i ',A(i,j),j-1);
            else
                fprintf('+ %5.5f C%i ',A(i,j),j-1);
            end
        end
    end
    %C = inv(A)*b;
    C = A\b;
    fprintf('\n\nValores de C:\n\n');
    for i=1:n
       fprintf('\tC%i = %9.15f\n',i-1,C(i));
    end
    C = C';
    for i=1:(n-1)
        if x0>t(i) && x0<t(i+1)
            indice = i;
       end
    end
    i=indice;
    syms x;
    k=i-1;
    fprintf('\nConstantes del polinomio:');
    valorA = a(i);
    fprintf('\n\na%i = f(x%i) = %9.15f',k,k,valorA);
    valorB = (a(i+1)-a(i))/h(i) - h(i)*(2*C(i) + C(i+1))/3;
    fprintf('\n\nb%i = (a%i- a%i)/h%i - h%i*(2C%i + C%i)/3    =   %9.15f',k,k+1,k,k,k,k,k+1,valorB);
    valorC = C(i);
    fprintf('\n\nc%i = %9.15f',k,valorC);
    valorD = (C(i+1) - C(i))/(3*h(i));
    fprintf('\n\nd%i = (C%i - C%i) / (3 h%i)   =   %9.15f',k,k+1,k,k,valorD);
    fprintf('\n\n\ta%i = %9.15f\n\tb%i = %9.15f\n\tc%i = %9.15f\n\td%i = %9.15f\n\n',i-1,valorA,i-1,valorB,i-1,valorC,i-1,valorD); 
    fprintf('\n\nPolinomio S%i(x)  = ',k);
    S = valorA + valorB*(x-t(i)) + valorC*(x-t(i))^2 + valorD*(x-t(i))^3;
    pretty(vpa(S));
    fprintf('\nS%i(%3.3f) = %9.15f\n\n',k,x0,double(subs(S,x,x0)));
end