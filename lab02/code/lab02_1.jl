using Plots 

using DifferentialEquations 

Plots.pyplot() 

s=11.7; 

r0 = s/(2.7); 

tetha0 = 0;

f1(r, p, tetha) = r/sqrt(3); 

f2(t) = atan(-3); 

f3(t) = sqrt(10)*t;

tetha = (tetha0,2*pi); 

prob = ODEProblem(f1, r0, tetha); 

sol = solve(prob);

t=range(0,100, step=1); 

fi = f2.(t); 

ro = f3.(t);

plot(sol, proj=:polar) 

plot!(fi, ro)
