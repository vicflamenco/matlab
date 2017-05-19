function Resultado = valores_reales(solucion,a,b,h,explicita)
    syms t y;
    n = round((b-a)/h);
    if explicita==1
        for i=1:n+1
            Resultado(i) = double(subs(solucion,t,a+(i-1)*h));
        end
    elseif explicita==0
        for i=1:n+1
            ev = subs(solucion,t,a+(i-1)*h);
            raiz = solve(ev,y);
            Resultado(i) = double(raiz(1));
        end
    end
end