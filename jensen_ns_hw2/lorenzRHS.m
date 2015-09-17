function dy = lorenzRHS(t,y)
    dy=zeros(3,1);
    dy(1) = -10*y(1) + 10*y(2);
    dy(2) = -y(2) + 28*y(1) - y(1)*y(3);
    dy(3) = -8/3*y(3) + y(1)*y(2);
end