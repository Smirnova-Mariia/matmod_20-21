using Plots 

using DifferentialEquations

pyplot()

N = 756;

x0 = 17;

step = 0.0001;

t = (0.0, 20.0);

a1(t) = 0.73;

a2(t) = 0.000013;

f(x, p, t) = (a1.(t) + a2.(t) * x)*(N - x);

prob = ODEProblem(f, x0, t);

sol = solve(prob, saveat = step);

plot(sol, xlabel = "t", ylabel = "n", labels = "n(t)")

title!("1й случай")
