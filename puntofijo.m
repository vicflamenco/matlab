function W = puntofijo(G,X,tolerancia)
    % X = F(X)
    nvar = 2;
    syms x1 x2;
    
    Error=100;
    fprintf('\n\n\tK\t\tX1^k\t\t\t\tX2^k\t\t\tError\n\n')
    
    k=1;
    fprintf('\t%i\t%9.15f\t%9.15f\t   -\n',k-1,X(k,1),X(k,2));
    k=2;
    while Error>tolerancia
        X(k,1) = double(subs(G(1),[x1 x2],[X(k-1,1) X(k-1,2)]));
        X(k,2) = double(subs(G(2),[x1 x2],[X(k-1,1) X(k-1,2)]));
        
        Error = norm(X(k-1)-X(k),inf);
        fprintf('\t%i\t%9.15f\t%9.15f\t%1.1e\n',k-1,X(k,1),X(k,2),Error);
        k=k+1;
    end
    fprintf('\n\n\tx1 = %9.15f',X(k-1,1));
    fprintf('\n\tx2 = %9.15f\n\n',X(k-1,2));
end