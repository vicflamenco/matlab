disp('Método de la Posición Falsa');
syms x;
format long;
f = input('Ingrese la función f(x)=0: ','s');
p0 = input('Ingrese el valor inicial P0: ');
p1 = input('Ingrese el valor inicial P1: ');
tolerancia= input('Ingrese la tolerancia: ');
error=100;
fprintf(' n        P0           P1            P2           Error\n');
n=1;
while error>tolerancia
   x=p0; f0=eval(f);
   x=p1; f1=eval(f);
   p2=p1-f1*(p1-p0)/(f1-f0);
   x=p2; f2=eval(f);
   
   if f1*f2 < 0
       p0=p1;
       p1=p2;
   else
       p1=p2; 
   end
   error=abs(p2-p1);
   fprintf('%3.0i\t%9.9f\t%9.9f\t%9.9f\t%1.1e\n',n,p0,p1,p2,error);
   n=n+1;
end
fprintf('Distancia = %9.15f mt.\n\n',p2);