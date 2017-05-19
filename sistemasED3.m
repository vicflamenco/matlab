function W = sistemasED3(F,Y,a,b,h)
    
    % CAMBIAR VARIABLES A UTILIZAR
    syms t y x;
    syms U1 U2 U3;
    
    n=round((b-a)/h);
    nfunc = length(F);
    p(1)=a;
    W = Y';
    for i=2:n+1
       p(i) = a+(i-1)*h; 
    end
    for i=1:nfunc;
        fprintf('\n\tf%i = ',i);
        pretty(F(i));
    end
    K=zeros(4,nfunc);
    variables = [t U1 U2 U3]; %-------------------- CAMBIAR VARIABLES A EVALUAR
    
    for j=1:n
        fprintf('\n\n\t\t----- Para t%i ------ \n',j);
        for k=1:4
            for i=1:nfunc
               if k==1
                    % K(1,i) = h fi(tj , W1j, W2j, W3j, ... , Wmj)
                    K(1,i) = h*subs(F(i),variables,[p(j) W(1,j) W(2,j) W(3,j)]);   % BORRAR O AÑADIR VALORES
               elseif k==2
                   % K(2,i) = h fi(tj+h/2 , W1j+K11/2, W2j+K12/2, W3j+K13/2, ... , Wmj+K1m/2)
                    K(2,i) = h*subs(F(i),variables,[p(j)+h/2 W(1,j)+1/2*K(1,1) W(2,j)+1/2*K(1,2) W(3,j)+1/2*K(1,3)]);
               elseif k==3
                   % K(3,i) = h fi(tj+h/2 , W1j+K21/2, W2j+K22/2, W3j+K23/2, ... , Wmj+K2m/2)
                    K(3,i) = h*subs(F(i),variables,[p(j)+h/2 W(1,j)+1/2*K(2,1) W(2,j)+1/2*K(2,2) W(3,j)+1/2*K(2,3)]);
               elseif k==4
                    % K(4,i) = h fi(tj+h , W1j+K31, W2j+K32, W3j+K33, ... , Wmj+K3m)
                    K(4,i) = h*subs(F(i),variables,[p(j)+h W(1,j)+K(3,1) W(2,j)+K(3,2) W(3,j)+K(3,3)]);
               end
               W(i,j+1) = W(i,j)+1/6*(K(1,i)+2*K(2,i)+2*K(3,i)+K(4,i));
            end
        end
        for i=1:nfunc
            for k=1:4
                fprintf('\n\tK%i%i = %9.15f',k,i,K(k,i));
            end
            fprintf('\n\tW%i%i = %9.15f\n',i,j,W(i,j+1));
        end
        
    end
end