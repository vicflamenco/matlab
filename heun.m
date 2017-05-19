function W = heun(fty,a,b,h,alfa,solucion,e)
    format long;
    syms t y;
    n=round((b-a)/h);
    x(1)=a;
    H=h;
    syms ti Wi h;
    fprintf('\n\tW0 = %9.15f\n\n\t',alfa);
    fprintf('Wi+1 = ');
    Funcion = Wi + h/4*subs(fty,[t y],[ti Wi]) + 3*h/4*subs(fty,[t y],[ti+2*h/3 Wi+2*h/3*subs(fty,[t y],[ti Wi])]);
    pretty(Funcion);
    h=H;
    Real=valores_reales(solucion,a,b,h,e);
    for i=2:n+1
       x(i)=x(i-1)+h;
    end
    fprintf('\n         ti             Wi+1                     y(ti)               error\n\n');
    for i=1:n+1
       if i==1
            W(i) = alfa;
       else
            e1 = subs(fty,[t y],[x(i-1) W(i-1)]);
            W(i)= W(i-1) +(h/4)*e1 + (3*h/4) * subs(fty,[t y],[x(i-1)+2*h/3 W(i-1)+(2*h/3)*e1]) ;
       end
       error = double(abs(Real(i)-W(i)));
       fprintf('\tt%i = %3.3f\tW%i = %9.15f\ty(t%i) = %9.15f\t%1.2e\n',i-1,double(x(i)),i-1,double(W(i)),i-1,double(Real(i)),error);
    end
end