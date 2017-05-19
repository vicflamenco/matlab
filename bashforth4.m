function W = bashforth4(fty,a,b,h,W0,W1,W2,W3,solucion,e)
    syms t y;
    n=round((b-a)/h);
    x(1)=a;
    H=h;
    syms Wi ti h ti1 Wi1 ti2 Wi2 ti3 Wi3;
    fprintf('\n\tW0 = %9.15f',double(W0));
    fprintf('\n\tW1 = %9.15f',double(W1));
    fprintf('\n\tW2 = %9.15f',double(W2));
    fprintf('\n\tW3 = %9.15f\n\n\t',double(W3));
    fprintf('Wi+1 = Wi + h/24 [ 55 f(ti,Wi) - 59 f(ti-1,Wi-1) + 37 f(ti-2,Wi-2) - 9 f(ti-3,Wi-3) ]\n\n');
    fprintf('Wi+1 = ');
    Funcion = Wi + h/24*[55*subs(fty,[t y],[ti  Wi])-59*subs(fty,[t y],[ti1 Wi1])+37*subs(fty,[t y],[ti2 Wi2])-9*subs(fty,[t y],[ti3 Wi3])];
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
       elseif i==4
           W(i) = W3;
       else
            W(i)= W(i-1) + h/24*[55*subs(fty,[t y],[x(i-1) W(i-1)])-59*subs(fty,[t y],[x(i-2) W(i-2)])+37*subs(fty,[t y],[x(i-3) W(i-3)])-9*subs(fty,[t y],[x(i-4) W(i-4)])];
       end
       error = double(abs(Real(i)-W(i)));
       fprintf('\tt%i = %3.3f\tW%i = %9.15f\ty(t%i) = %9.15f\t%1.2e\n',i-1,double(x(i)),i-1,double(W(i)),i-1,double(Real(i)),error);
    end
end