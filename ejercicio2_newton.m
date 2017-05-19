syms x;
fprintf('\n\nMÉTODO DE NEWTON RAPHSON VOLUMEN ESPECÍFICO\n');

Pc = input('Ingrese el valor de Pc en Pascales: ');
Tc = input('Ingrese el valor de Tc en Kelvin: ');
R = input('Ingrese el valor de R en J/Kg*K: ');
tolerancia = input('Ingrese la tolerancia: ');

T = input('Ingrese la temperatura T: ');
P = input('Ingrese la presión P: ');

V0 = R*T/P;
a = (0.4278*(R^2)*(Tc^2.5))/Pc;
b = (0.0867*R*Tc)/Pc;

f = (P + a/(x*(x+b)*(T^0.5)))*(x-b) - (R*T);
deriv = diff(f,x);

error =100;

fprintf('  n      P0         P1           Error    \n\n');
n=1;
while error>tolerancia
    x=V0;
    F0 = eval(f);
    F1 = eval(deriv);
    
    V1 = V0 - F0/F1;
    error = abs(V1-V0);
    
    fprintf('%3.0i\t%9.9f\t%9.9f\t%1.2e\n',n,V0,V1,error);
    V0 = V1;
    n=n+1;
end


fprintf('\n\nEl valor de volumen específico es V = %9.9f metros cúbicos.\n\n',V1);
