function W = bashforth5(fty,a,b,h,W0,W1,W2,W3,W4,solucion,e)
    syms t y;
    n=round((b-a)/h);
    x(1)=a;
    H=h;
    syms Wi ti h ti1 Wi1 ti2 Wi2 ti3 Wi3 ti4 Wi4;
    fprintf('\n\tW0 = %9.15f',double(W0));
    fprintf('\n\tW1 = %9.15f',double(W1));
    fprintf('\n\tW2 = %9.15f',double(W2));
    fprintf('\n\tW3 = %9.15f',double(W3));
    fprintf('\n\tW4 = %9.15f\n\n\t',double(W4));
    fprintf('Wi+1 = Wi + h/720 [ 1901 f(ti,Wi) - 2774 f(ti-1,Wi-1) + 2616 f(ti-2,Wi-2) - 1274 f(ti-3,Wi-3) + 251 f(ti-4,Wi-4) ]\n\n');
    fprintf('Wi+1 = ');
    Funcion = Wi + h/720*[1901*subs(fty,[t y],[ti Wi])-2774*subs(fty,[t y],[ti1 Wi1])+2616*subs(fty,[t y],[ti2 Wi2])-1274*subs(fty,[t y],[ti3 Wi3])+251*subs(fty,[t y],[ti4 Wi4])];
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
       elseif i==5
           W(i) = W4;
       else
            W(i)= W(i-1) + h/720*[1901*subs(fty,[t y],[x(i-1) W(i-1)])-2774*subs(fty,[t y],[x(i-2) W(i-2)])+2616*subs(fty,[t y],[x(i-3) W(i-3)])-1274*subs(fty,[t y],[x(i-4) W(i-4)])+251*subs(fty,[t y],[x(i-5) W(i-5)])];
       end
       error = double(abs(Real(i)-W(i)));
       fprintf('\tt%i = %3.3f\tW%i = %9.15f\ty(t%i) = %9.15f\t%1.2e\n',i-1,double(x(i)),i-1,double(W(i)),i-1,double(Real(i)),error);
    end
end