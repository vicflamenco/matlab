function W = punto_medio(fty,a,b,h,alfa,solucion,e)
    syms t y;
    n=round((b-a)/h);
    x(1)=a;
    H=h;
    syms Wi ti h;
    fprintf('\n\tW0 = %9.15f\n\n\t',alfa);
    fprintf('Wi+1 = ');
    Funcion = Wi + h*subs(fty,[t y],[ti+h/2 Wi+h/2*subs(fty,[t y],[ti Wi])]);
    pretty(Funcion);
    h=H;
    Real = valores_reales(solucion,a,b,h,e);
    for i=2:n+1
       x(i)=x(i-1)+h;
    end
    fprintf('\n         ti             Wi+1                     y(ti)               error\n\n');
    for i=1:n+1
       if i==1
            W(i) = alfa;
       else
            e1 = subs(fty,[t y],[x(i-1) W(i-1)]);
            W(i)= W(i-1) + h* subs(fty,[t y],[x(i-1)+h/2 W(i-1)+h/2*e1]) ;
       end
       error = double(abs(Real(i)-W(i)));
       fprintf('\tt%i = %3.3f\tW%i = %9.15f\ty(t%i) = %9.15f\t%1.2e\n',i-1,double(x(i)),i-1,double(W(i)),i-1,double(Real(i)),error);
    end 
end