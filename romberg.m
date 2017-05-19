function y = romberg(f,a,b,R)
    n=R;
    syms x;
    format long;
    R=zeros(n,n);
    for i=1:n
       h(i) = (b-a)/(2^(i-1)) ;
       fprintf('\n\th%i = (b-a) / 2^%i  =  %9.5f',i,i-1,h(i));
    end
    for j=1:n
        for i=1:n
           if i>=j
              if j==1
                  if i==1
                      fa = double(subs(f,x,a));
                      fb = double(subs(f,x,b));
                      R(i,j) = (h(1)/2)*(fa+fb);
                      fprintf('\n\nR%i%i = h%i/2 * [ f(a) + f(b) ]  =  %9.15f',i,j,i,R(i,j));
                  else
                      sum=0;
                      fprintf('\n\nR%i%i = 1/2 * { R%i%i  +  h%i * [ ',i,j,i-1,j,i-1);
                      for k=1:(2^(i-2))
                          val = a + (2*k-1)*h(i);
                          if k == (2^(i-2))
                                fprintf('f(a + %i h%i) ',2*k-1,i);
                          else
                                fprintf('f(a + %i h%i) + ',2*k-1,i);
                          end
                          sum = sum + double(subs(f,x,val));
                      end
                      R(i,j) = (1/2) * [ R(i-1,1) + h(i-1) * sum ];
                      fprintf('] }  =  %9.51f',R(i,j));
                  end
              else
                  R(i,j) = R(i,j-1) + ( R(i,j-1) - R(i-1,j-1) ) / ( 4^(j-1) - 1 );
                  fprintf('\n\nR%i%i = R%i%i + ( R%i%i - R%i%i )/%i  =  %9.15f',i,j,i,j-1,i,j-1,i-1,j-1,4^(j-1) - 1,R(i,j));
              end
           end
        end
    end
    fprintf('\n\nIntegral exacta = ');
    integ = int(f,x);
    pretty(integ);
    real = double(subs(integ,x,b)-subs(integ,x,a));
    aprox = R(n,n);
    error = abs(real-aprox);
    fprintf('\n\nValor aproximado = %9.15f\nValor real = %9.15f\nError = %1.2e\n\n',aprox,real,error);
end