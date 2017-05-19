function y = richardson(f,x0,h,N)
    format long;
    syms x;
    M = zeros(N,N);
    h0=h;
    for j=1:N
        den=2;
        fprintf('\n\nPara j = %i',j);
        for i=1:N
            if j==1
               M(i,j) = (1/(2*h0))*( subs(f,x,x0+h0) - subs(f,x,x0-h0) );
               fprintf('\n\n\tN%1i(h/%1i) = 1 / 2(%f) * [ f(%f) - f(%f) ]     =   %9.15f',j,den/2,h0,x0+h0,x0-h0,M(i,j));
               h0=h0/2;
               den=2*den;
            elseif i>=2 && i>=j
               M(i,j) = M(i,j-1) + ( M(i,j-1) - M(i-1,j-1) ) / ( 4^(j-1) - 1 );
               fprintf('\n\n\tN%1i(h/%1i) = N%1i(h/%1i) + [ N%1i(h/%1i) - N%1i(h/%1i) ] / %i     =   %9.15f',j,den/2,j-1,den,j-1,den,j-1,den/2,4^(j-1)-1,M(i,j));
               den=2*den;
            end
            
        end
    end
    fprintf('\n\nMatriz:\n');
    M
    aprox=M(N,N);
    real=double(subs(diff(f,x),x,x0));
    e=abs(real-aprox);
    fprintf('\tValor Aproximado = %9.15f\n\n\tValor Real = %9.15f\n\n\tError = %1.2e\n\n',aprox,real,e);
    
end