function W = euler(fty,a,b,h,alfa,sol,e)
    syms t y;
    n=(b-a)/h;
    x(1)=a;
    for i=2:n+1
       x(i)=x(i-1)+h;
    end
    H=h;
    syms Wi ti h;
    fprintf('\n\tW0 = %9.15f\n\n\t',alfa);
    fprintf('Wi+1 = ');
    Funcion = subs(fty,[t y],[ti Wi]);
    pretty(Funcion);
    h=H;
    fprintf('\n         ti             Wi+1                     y(ti)               error\n\n');
    Real = valores_reales(sol,a,b,h,e);
    for i=1:n+1
       if i==1
            W(i) = alfa;
       else
           valor = subs(fty,t,x(i-1));
           valor = subs(valor,y,W(i-1));
           W(i) = double(W(i-1) + h * valor);
       end
       error = double(abs(Real(i)-W(i)));
       fprintf('\tt%i = %3.3f\tW%i = %9.15f\ty(t%i) = %9.15f\t%1.2e\n',i-1,double(x(i)),i-1,double(W(i)),i-1,double(Real(i)),error);
    end
end