syms x;
f = x*cos(x)-x^2*atan(exp(2*x));
n=7;
x0=0.65;
h=1/100;
R=zeros(n,n);
fprintf('\n\n J = 1\n');
for i=1:n
   fprintf('\n\n\th = %9.15f',h);
   fprintf('\n\tx0+h = %9.15f',x0+h);
   fprintf('\n\tx0-h = %9.15f',x0-h);
    R(i,1)=1/(2*h)*[subs(f,x,x0+h)-subs(f,x,x0-h)];
   h=h/2;
   
end
for j=2:n
   for i=2:n
      if i>=j
         R(i,j)= R(i,j-1) + (R(i,j-1) - R(i-1,j-1))/(4^(j-1)-1);
      end
   end
end
R

fprintf('VALOR REAL=');
deriv = diff(f,x)
real = double(subs(deriv,x,x0))
aproximado = R(n,n)
error = double(abs(real-aproximado))