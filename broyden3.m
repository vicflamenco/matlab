function W = broyden3(F,J,X,tolerancia)
    Error=100;
    syms x1 x2 x3;
    F
    J
    X
    i=1;
    
    while Error>tolerancia
        fprintf('\nPara i = %i\n',i-1);
        if i == 1
            fprintf('\nA(%i) = J(X(%i))\n',i-1,i-1);
            Ai = double(subs(J,[x1,x2,x3],[X(i,1),X(i,2),X(i,3)]))
            fprintf('\nA(%i)^-1 = \n',i-1);
            Ai_inv = double(inv(Ai))
            fprintf('\nF(X(%i)) =\n',i-1);
            Fi = double(subs(F,[x1,x2,x3],[X(i,1),X(i,2),X(i,3)]))
            X(i+1,:) = double(X(i,:)' - Ai_inv*Fi);
            fprintf('\nX(%i) = X(%i) - A(%i)^-1 * F(X%i)\n',i,i-1,i-1,i-1);
            X(i+1,:)'
            Error = norm(X(i,:)-X(i+1,:),inf)
        elseif i>1
            fprintf('\nS%i = X(%i) - X(%i)\n',i-1,i-1,i-2);
            Si = X(i,:)' - X(i-1,:)'
            fprintf('\nF(X(%i)) =\n',i-1);
            Fi = double(subs(F,[x1 x2 x3],[X(i,1),X(i,2),X(i,3)]))
            Fi1 = double(subs(F,[x1 x2 x3],[X(i-1,1),X(i-1,2),X(i-1,3)]));
            fprintf('\nY%i = F(X(%i)) - F(X(%i))\n',i-1,i-1,i-2);
            Yi = double(Fi - Fi1)
            fprintf('\nA(%i)^-1 = A(%i)^-1 + (S%i - A(%i)^-1 * Y%i) * S%iT * A(%i)^-1\n',i-1,i-2,i-1,i-2,i-1,i-1,i-2);
            fprintf('                    -----------------------------------');
            fprintf('\n                          DET ( S%iT * A(%i)^-1 * Y%i )\n',i-1,i-2,i-1);
            Ai_inv = Ai_inv + ((Si-Ai_inv*Yi)*Si'*Ai_inv)/det(Si'*Ai_inv*Yi)
            X(i+1,:) = double(X(i,:)' - Ai_inv*Fi);
            fprintf('\nX(%i) = X(%i) - A(%i)^-1 * F(X%i)\n',i,i-1,i-1,i-1);
            X(i+1,:)'
            Error = norm(X(i,:)-X(i+1,:),inf)
        end
        i=i+1;
    end


end