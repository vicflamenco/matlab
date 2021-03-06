function W = fehlberg4(fty,a,b,h,alfa,solucion,e)
    format long;
    syms t y;
    n=round((b-a)/h);
    x(1)=a;
    H=h;
    syms ti Wi h K1 K2 K3 K4 K5 K6;
    fprintf('\n\nf(ti,Wi) = ');
    pretty(subs(fty,[t y],[ti Wi]));
    fprintf('\n\nWi+1 = ');
    Funcion = Wi + 25/216*K1 + 1408/2565*K3+2197/4104*K4-K5/5;
    pretty(Funcion);
    fprintf('\n\n\tW0 = %9.15f',alfa);
    h=H;
    Real = valores_reales(solucion,a,b,h,e);
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
            K2=double(h*subs(fty,[t y],[x(i-1)+h/4 W(i-1)+K1/4]));
            K3=double(h*subs(fty,[t y],[x(i-1)+3*h/8 W(i-1)+3/32*K1+9*K2/32]));
            K4=double(h*subs(fty,[t y],[x(i-1)+12/13*h W(i-1)+1932/2197*K1-7200/2197*K2+7296/2197*K3]));
            K5=double(h*subs(fty,[t y],[x(i-1)+h W(i-1)+439/216*K1-8*K2+3680/513*K3-845/4104*K4]));
            W(i)= double(W(i-1)+25/216*K1+1408/2565*K3+2197/4104*K4-K5/5);
            
            fprintf('\tK1 = %9.15f\n',K1);
            fprintf('\tK2 = %9.15f\n',K2);
            fprintf('\tK3 = %9.15f\n',K3);
            fprintf('\tK4 = %9.15f\n',K4);
            fprintf('\tK5 = %9.15f\n',K5);
            fprintf('\n\tW%i = %9.15f',i-1,W(i));
       end
       error = double(abs(Real(i)-W(i)));

       fprintf('\n\tY(t%i) = %9.15f\n',i-1,Real(i));
       fprintf('\tError = %1.2e',error);
    end
end