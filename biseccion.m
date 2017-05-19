% ---- método de bisección ----------------
syms x;
format long
f=input('Ingrese la función f(x)=0:   f(x) = ','s');
a=input('Ingrese el valor de a = ');
b=input('Ingrese el valor de b = ');
tolerancia=input('Ingrese la tolerancia = ');
p1=(a+b)/2;
if subs(f,x,p1) == 0
    fprintf('El valor de aproximación deseado es %9.15f',p1);
else
    error=abs(subs(f,x,p1));
    n=1;
    fprintf('\n n  \t a  \t \t b \t \t P \t \t Error \n \n');
    fprintf('%3.0f \t %9.15f \t %9.15f \t %9.15f \t %1.2e \n',n,double(a),double(b),double(p1),double(error));
    while error > tolerancia
        n=n+1;
        if subs(f,x,p1)*subs(f,x,a) < 0
            b=p1;
        else
            a=p1;
        end
        p2=(a+b)/2;
        error=abs(p2-p1);
        fprintf('%3i \t %9.15f \t %9.15f \t %9.15f \t %1.2e \n',n,a,b,p2,error);
        p1=(a+b)/2;
    end
        fprintf('\n El valor de aproximación deseado es %9.15f \n \n',double(p2)); 
end
    