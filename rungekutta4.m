function W = rungekutta4(fty,a,b,h,alfa,solucion,e)
    format long;
    syms t y;
    n=round((b-a)/h);
    x(1)=a;
    H=h;
    syms ti Wi h;
    fprintf('\n\nf(ti,Wi) = ');
    Funcion = subs(fty,[t y],[ti Wi]);
    pretty(Funcion);
    fprintf('\n\n\tW0 = %9.15f',alfa);
    h=H;
    Real=valores_reales(solucion,a,b,h,e);
    for i=2:n+1
       x(i)=x(i-1)+h;
    end
    for i=1:n+1
       if i>1
           fprintf('\n\n\t\ti = %i\n\n',i-2);
       end
       if i==1
            W(i) = alfa;
       else
            K1=double(h*subs(fty,[t y],[x(i-1) W(i-1)]));
            K2=double(h*subs(fty,[t y],[x(i-1)+h/2 W(i-1)+K1/2]));
            K3=double(h*subs(fty,[t y],[x(i-1)+h/2 W(i-1)+K2/2]));
            K4=double(h*subs(fty,[t y],[x(i) W(i-1)+K3]));
            e1 = subs(fty,[t y],[x(i-1) W(i-1)]);
            W(i)= double(W(i-1) + 1/6*(K1+2*K2+2*K3+K4));
            
            fprintf('\tK1 = h*f(t%i,W%i) = %9.15f\n',i-2,i-2,K1);
            fprintf('\tK2 = h*f(t%i+h/2,W%i+K1/2) = %9.15f\n',i-2,i-2,K2);
            fprintf('\tK3 = h*f(t%i+h/2,W%i+K2/2) = %9.15f\n',i-2,i-2,K3);
            fprintf('\tK4 = h*f(t%i,W%i+K3) = %9.15f\n',i-1,i-2,K4);
            fprintf('\tW%i = W%i + 1/6 * (K1+ 2K2 + 2K3 + K4) = %9.15f\n',i-1,i-2,W(i));
       end
       error = double(abs(Real(i)-W(i)));
       fprintf('\n\n\tY(t%i) = %9.15f\n',i-1,Real(i));
       fprintf('\tError = %1.2e',error);
    end
end