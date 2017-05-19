function W = newton(F,J,X,tolerancia)
    % F(X) = 0
    F=F';
    syms x1 x2;
    Error=100;
    k=2;
    while Error>tolerancia
        fprintf('\n\t---------- Para k = %i ----------\n\n',k-1);
        fprintf('******* ESCRIBIR --->\t\tX%i = X%i - inv(J(X%i))*F(X%i) = \n',k-1,k-2,k-2,k-2);
        fprintf('\tX(%i) = ',k-2);
        X(k-1,:)'
        fprintf('\tJ(X(%i)) = \n',k-2);
        J0 = double(subs(J,[x1 x2],[X(k-1,1) X(k-1,2)]))
        fprintf('\tF(X(%i)) = \n',k-2);
        F0 = double(subs(F,[x1 x2],[X(k-1,1) X(k-1,2)]))
        
        fprintf('\t\tX%i = X%i - inv(J(X%i))*F(X%i) = \n',k-1,k-2,k-2,k-2);
        X(k,:) = X(k-1,:)' - inv(J0)*F0;
        X(k,:)'
        Error = norm(X(k-1,:)-X(k,:),inf);
        fprintf('\n\tError = %1.2e\n\n',Error);
        k=k+1;
    end
    fprintf('------------------------------------');
    fprintf('\n\n\tx1 = %9.15f',X(k-1,1));
    fprintf('\n\tx2 = %9.15f\n\n',X(k-1,2));
end