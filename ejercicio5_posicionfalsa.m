f = input('Ingrese la funcion f(x)=0: ','s');
tolerancia= input('Ingrese la tolerancia: ');
P0 = input('Ingrese el valor inicial P0: ');
P1 = input('Ingrese el valor inicial P1: ');
syms x;
format long;
fprintf('\tn\t\t\t\tP0\t\t\t\tP1\t\t\t\tP2\t\t\t\tError\n\n');
error=100;
n=1;
while error>tolerancia
   x = P0;
   F0 = eval(f);
   x = P1;
   F1 = eval(f);
   
   P2 = P1 - F1*(P1-P0)/(F1-F0);
   x=P2;
   F2 = eval(f);
   error=abs(P2-P1);
   fprintf('\t%3.0i\t%9.9f\t%9.9f\t%9.9f\t%1.2e\n',n,P0,P1,P2,error);
   if F1*F2 <0
      P0=P1;
      P1=P2;
   else
      P0=P0;
      P1=P2;
   end
    n=n+1;
end
fprintf('El lado de los cuadrados es %9.15f cm.',P2);