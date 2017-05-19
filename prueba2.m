function dy = prueba2(t,u)
    dy = [u(2);u(3);exp(t)+1*u(2)+2*u(1)-2*u(3)];
end