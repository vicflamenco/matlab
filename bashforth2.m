function W = bashforth2(fty,a,b,h,W0,W1,solucion,e)
    syms t y;
    n=round((b-a)/h);
    x(1)=a;
    H=h;
    syms Wi ti h ti1 Wi1;
    fprintf('\n\tW0 = %9.15f',double(W0));
    fprintf('\n\tW1 = %9.15f\n\n\t',double(W1));
    fprintf('Wi+1 = Wi + h/2 [ 3 f(ti,Wi) - f(ti-1,Wi-1)]\n\n');
    fprintf('Wi+1 = ');
    Funcion = Wi + h/2*[3*subs(fty,[t y],[ti  Wi])-subs(fty,[t y],[ti1 Wi1])];
    pretty(Funcion);
    h=H;
    Real = valores_reales(solucion,a,b,h,e);
    for i=2:n+1
       x(i)=x(i-1)+h;
    end
    fprintf('\n         ti             Wi+1                     y(ti)               error\n\n');
    for i=1:n+1
       if i==1
            W(i) = W0;
       elseif i==2
           W(i) = W1;
       else
            e1 = subs(fty,[t y],[x(i-1) W(i-1)]);
            W(i)= W(i-1) + h/2*[3*subs(fty,[t y],[x(i-1) W(i-1)])-subs(fty,[t y],[x(i-2) W(i-2)])];
       end
       error = double(abs(Real(i)-W(i)));
       fprintf('\tt%i = %3.3f\tW%i = %9.15f\ty(t%i) = %9.15f\t%1.2e\n',i-1,double(x(i)),i-1,double(W(i)),i-1,double(Real(i)),error);
    end
end