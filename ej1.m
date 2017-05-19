P7 = x^7 - 21*x^5/13 + 105*x^3/143 - 35*x/429;
f = -2*pi/3*x*(x+2);
v=solve(P7)';
for i=1:7
   v(i)=double(v(i));
   fprintf('\nx%i = %9.15f',i,double(v(i))); 
end
syms x;
for i=1:7
   num=1;
   den=1;
    for j=1:7
       if j==i
       else
           num = num*(x-v(j));
           den = den*(v(i)-v(j));
       end
    end
    F = num/den
    C(i) = int(F,x,-1,1);
    fprintf('C%i = %9.15f',i,C(i));
end
a=-1;
b=0;
syms t;
x0 = 1/2*[(b-a)*t+a+b];
pretty(x0);
dx0 = diff(x0,t);
pretty(dx0);
F = subs(f,x,x0)*dx0;
pretty(F);
y=0;
for i=1:7
   y = y + subs(F,t,v(i))*C(i);
end
APROX = double(y)
REAL = int(f,x,a,b)
ERROR = double(abs(APROX-REAL))