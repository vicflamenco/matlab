function [y] = horner_function(coef,X0,tolerancia)
    format long;
    error=100;
    n=1;
    m=size(coef,2);
    j=m-1;
    fprintf('\n');
    while error > tolerancia
        
        A=[];
        b=0;
        fprintf('Iteración %3.0i:\n\n\t',n);
        for i=1:size(coef,2)
            fprintf('%9.9f\t',coef(i));
        end
        fprintf('\n');
        for i=1:m
           
            if i==1
               b=coef(1);
               fprintf('\t\t\t\t');
            else
               c=b*X0;
               b=c+coef(i);
               fprintf('%9.9f\t',c);
            end
            
            if i<m
                A = [A b];
            else
                bop=b;
            end
        end
        fprintf('\t\tX0 = %9.9f\n\t________________________________________________________________________________\n\t',X0);
        div1 = [A bop];
        for i=1:size(div1,2)
            fprintf('%9.9f ',div1(i));
        end
        fprintf(' <==== bop\n');
        coef2=A;
        b=0;
        A=[];
        for i=1:j
           
            if i==1
               b=coef2(1);
               fprintf('\t\t\t\t');
            else
               c=b*X0;
               b=c+coef2(i);
               fprintf('%9.9f\t',c);
            end
            
            if i<j
                A = [A b];
            else
                boq=b;
            end
        end
        fprintf('\n\t____________________________________________________________________________\n\t');
        div2 = [A boq];
        for i=1:size(div2,2)
            fprintf('%9.9f\t',div2(i));
        end
        
        fprintf(' <==== boq\n');
        x=X0-bop/boq;
        error=abs(x-X0);
        fprintf('\n\tn = %3.0i\t\tX0 = %9.15f\tX = %9.15f\tError = %1.2e\n\n',n,X0,x,error);
        X0=x;
        n=n+1;
    end
    y=x;
end