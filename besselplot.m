%Plot Bessel Function of First Kind
%Define the domain

eta = 0:0.1:20;
%%
%Calculate the first five Bessel Functions of the first kind

J = zeros(5,201);
for i = 0:4
    J(i+1, : ) = besselj (i,eta);
end
%%
%Plot the results 

plot(eta,J, 'LineWidth',1.5)
axis([0 20 -.5 1]);
grid on;
legend('J*0', 'J*1', 'J*2', 'J*3', 'J*4', 'Location', 'Best')
title('Bessel Function of First Kind for v = 0,1,2,3,4');
xlabel('eta');
ylabel('Amplitude');