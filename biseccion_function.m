function [p2] = biseccion_function (f,a,b,tolerancia)
    %f(x)=0
    syms x;
    format long
    p1=(a+b)/2;
    if subs(f,x,p1) == 0
        fprintf('El valor de aproximación deseado es %9.15f',p1);
    else
        error=abs(subs(f,x,p1));
        n=1;
        fprintf('\n n  \t a  \t \t b \t \t P \t \t Error \n \n');
        fprintf('%3i \t %9.15f \t %9.15f \t %9.15f \t %1.2e \n',n,double(a),double(b),double(p1),double(error));
        while error > tolerancia
            n=n+1;
            if subs(f,x,p1)*subs(f,x,a) < 0
                b=p1;
                p2=(a+p1)/2;
            else
                a=p1;
                p2=(b+p1)/2;
            end
            error=abs(p2-p1);
            fprintf('%3i \t %9.15f \t %9.15f \t %9.15f \t %1.2e \n',n,a,b,p2,error);
            p1=(a+b)/2;
        end
end