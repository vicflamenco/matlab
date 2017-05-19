fprintf('\n\nMÉTODO DE STEFFENSEN\n\n');
syms x;
tolerancia = 1e-12;
f=(1535/49)*(1-exp(-x/15));
g=2400*(1-exp(-x/15));
p0 = input('Valor inicial = ');
error=100;
n=1;
while error>tolerancia
    x=p0;
    p1 = eval(f);
    x=p1;
    p2 = eval(f);
    p = p0 - ((p1-p0)^2)/(p2-2*p1+p0);
    error=abs(p-p0);
    fprintf('%3.0i\t%9.9f\t%9.9f\t%9.9f\t%1.2e\n',n,p0,p1,p2,error);
    p0=p;
    n=n+1;
end


fprintf('\n\n t = %9.9f s',p2);

x = p2;
r = eval(g);
fprintf('\n alcance = %9.9f m',r);
