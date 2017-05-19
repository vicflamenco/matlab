function W = taylor_superior(fty,a,b,h,alfa,N,solucion,e,primera,segunda,tercera)
    syms t y;
    n=round((b-a)/h);
    x(1)=a;
    H=h;
    syms Wi ti h;
    fprintf('\n\tW0 = %9.15f\n\n\t',alfa);
    fprintf('Wi+1 = Wi + h f(ti,Wi) + h^2/2! f1(ti,Wi) + h^3/3! f2(ti,Wi) + . . . + h^n/n! fn(ti,Wi)');
    fprintf('\n\n\tWi+1 = \n');
    Funcion = Wi + h*fty + h^2/factorial(2)*primera + h^3/factorial(3)*segunda + h^4/factorial(4)*tercera;
    Funcion = subs(Funcion,[t y],[ti Wi]);
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
           valores(1) = double(subs(fty,[t y],[x(i-1) W(i-1)]));
           valores(2) = double(subs(primera,[t y],[x(i-1) W(i-1)]));
           valores(3) = double(subs(segunda,[t y],[x(i-1) W(i-1)]));
           valores(4) = double(subs(tercera,[t y],[x(i-1) W(i-1)]));
           
           % AGREGAR TODOS LOS VALORES 'v' NECESARIOS 
           W(i)=W(i-1);
           for j=1:N
                W(i)= W(i) + [(h^j)/factorial(j)]*valores(j);
           end
       end
       error = double(abs(Real(i)-W(i)));
       fprintf('\tt%i = %3.3f\tW%i = %9.15f\ty(t%i) = %9.15f\t%1.2e\n',i-1,double(x(i)),i-1,double(W(i)),i-1,double(Real(i)),error);
    end
end