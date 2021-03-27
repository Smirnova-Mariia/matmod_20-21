using Plots 

using DifferentialEquations

pyplot();

N = 756;

x0 = 17;

step = 0.0001;

t = (0.0, 15.0);

a1(t) = 0.55*sin(t);

a2(t) = 0.33*sin(5*t);

f(x, p, t) = (a1.(t) + a2.(t) * x)*(N - x);

prob = ODEProblem(f, x0, t);

sol = solve(prob, saveat = step);

plot(sol, xlabel = "t", ylabel = "n", labels = "n(t)", xaxis = (0.0:0.01:0.1))

title!("3й случай")
