function f = pm(fty,a,b,h,alfa,solucion)
    format long;
    x(1)=a;
    syms t y;
    n=round((b-a)/h);
    for i=2:n+1
       x(i) = a+(i-1)*h;
    end
    for i=1:n+1
        reales(i) = subs(solucion,t,x(i));
    end
    W(1) = alfa;
    for i=1:n
        W(i+1)=W(i)+h*subs(fty,[t,y],[x(i)+h/2,W(i)+h/2*subs(fty,[t,y],[x(i),W(i)])]);
    end
    f = double([x'    W'    reales']);
end