function Aprox = extrapolacion(fty,a,b,h,W0,tolerancia,solucion,e)
    format long;
    syms t y;
    q=[2 4 6 8 12 16 24 32];
    hi=h./q;
    n=round((b-a)/h);
    x(1)=a;
    H=h;
    syms ti Wi h;
    fprintf('\n\n\tW0 = %9.15f',W0);
    h=H;
    Real = valores_reales(solucion,a,b,h,e);
    Y = zeros(8,8);
    for i=2:n+1
       x(i)=x(i-1)+h;
    end
    W = zeros(15);
    W(1)=W0;
    
    for i=1:n+1 %RECORRER CADA NODO
       error=1000;
       if i>1
           fprintf('\n\n\t----------- Para t%i = %9.9f -----------',i-1,x(i));
           N=1;
           while error>tolerancia
               calculos=2*N-1; 
               H=(x(i)-a)/q(N);
               fprintf('\n\n\t\th%i = h/%i = %9.9f\n\n',N-1,q(N),H);
               W(2) = W0 + H*subs(fty,[t y],[a W0]);
               fprintf('\t\t\tW1 = %9.15f\n',W(2));
               M=1;
               for j=3:calculos+2
                    W(j) = W(M) + 2*H*subs(fty,[t y],[a+(j-2)*H W(j-1)]);
                    fprintf('\t\t\tW%i = %9.15f\n',j-1,W(j));
                    M=M+1;
               end
               for j=1:N
                  if j==1
                      Y(N,j) = 1/2*[W(calculos+1)+W(calculos+2)+H*subs(fty,[t y],[a+(calculos+1)*H W(calculos+2)])]; 
                  else
                      Y(N,j) = Y(N,j-1) + (hi(N)^2/(hi(N-j+1)^2-hi(N)^2))*(Y(N,j-1)-Y(N-1,j-1));
                  end
                  fprintf('\n\t\t\tY%i%i = %9.15f',N,j,Y(N,j));
               end
               error = double(abs(Real(i)-Y(N,N)));
               fprintf('\n\n\t\t\ty(t%i) = %9.15f\n',i-1,Real(i));
               fprintf('\n\t\t\tError = %1.1e',error);
               N=N+1;
           end
           Aprox(i-1) = Y(N-1,N-1);
       end
    end
    W=0;
end