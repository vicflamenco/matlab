function W = bashforth3(fty,a,b,h,W0,W1,W2,solucion,e)
    syms t y;
    n=round((b-a)/h);
    x(1)=a;
    H=h;
    syms Wi ti h ti1 Wi1 ti2 Wi2;
    fprintf('\n\tW0 = %9.15f',double(W0));
    fprintf('\n\tW1 = %9.15f',double(W1));
    fprintf('\n\tW2 = %9.15f\n\n\t',double(W2));
    fprintf('Wi+1 = Wi + h/12 [ 23 f(ti,Wi) - 16 f(ti-1,Wi-1) + 5 f(ti-2,Wi-2) ]\n\n');
    fprintf('Wi+1 = ');
    Funcion = Wi + h/12*[23*subs(fty,[t y],[ti  Wi])-16*subs(fty,[t y],[ti1 Wi1]) + 5*subs(fty,[t y],[ti2 Wi2])];
    pretty(Funcion);
    h=H;
    Real=valores_reales(solucion,a,b,h,e);
    for i=2:n+1
       x(i)=x(i-1)+h;
    end
    fprintf('\n         ti             Wi+1                     y(ti)               error\n\n');
    for i=1:n+1
       if i==1
           W(i) = W0;
       elseif i==2
           W(i) = W1;
       elseif i==3
           W(i) = W2;
       else
            W(i)= W(i-1) + h/12*[23*subs(fty,[t y],[x(i-1) W(i-1)])-16*subs(fty,[t y],[x(i-2) W(i-2)])+5*subs(fty,[t y],[x(i-3) W(i-3)])];
       end
       error = double(abs(Real(i)-W(i)));
       fprintf('\tt%i = %3.3f\tW%i = %9.15f\ty(t%i) = %9.15f\t%1.2e\n',i-1,double(x(i)),i-1,double(W(i)),i-1,double(Real(i)),error);
    end
end