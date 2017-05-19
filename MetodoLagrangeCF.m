clear all;
clc;
disp('M�todo de interpolaci�n usando polinomios de Lagrange - Con funcion');
n=input('Ingrese el n�mero de nodos: ');
xk=zeros(1,n);
for j=1:n
    fprintf('Introduce el X%g: ', j-1)
    xk(j)=input('');
end
syms x
f=input('Ingrese la funci�n: ');
v=input('Ingrese el valor a evaluar: ');
fxk=zeros(1,n);
Lnk=1;
Px=0;
syms x
for l=1:n
    fxk(l)=subs(f,xk(l));
    for m=1:n
        if m~=l
            Lnk=Lnk*(x-xk(m))/(xk(l)-xk(m));
        end
    end
    fprintf('f(x%d)=%.10f\n\nL%d(x)=\n',l-1,fxk(l),l-1);
    pretty(Lnk);
    fprintf('\n--------------------------------------------------------------------------------\n\n');
    Px=Px+fxk(l)*Lnk;
    Lnk=1;
end
fprintf('Polinomio de Lagrange:\n');
pretty(Px);
Pv=subs(Px,v);
fv=subs(f,v);
error=abs(Pv-fv);
fprintf('\n\nValor del polinomio evaluado en %f: %.10f\n',v,Pv);
fprintf('Valor de la funci�n evaluada en %f: %.10f\n',v,fv);
fprintf('Error: %.10E\n\n',error);