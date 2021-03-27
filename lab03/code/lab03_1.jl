using Plots

using DifferentialEquations

pyplot()

x0 = 88000;

y0 = 99000;

a = 0.45;

b = 0.55;

c = 0.58;

h = 0.45;

tmax = 1;

t = (0,tmax);

P(t) = sin(t + 15);

Q(t) = cos(t + 3);


function syst(du, u, p, t)

    a, b, c, h = p;

    du[1] = -a * u[1] - b * u[2] + P(t);

    du[2] = -c * u[1] - h * u[2] + Q(t);

end

u0 = [x0, y0];

p = (a,b,c,h);

prob = ODEProblem(syst, u0, t, p);

sol = solve(prob);

plot(sol, ylims=(0, 99000), xlabel = "Время", ylabel = "Численность армии", label = ["Армия X" "Армия Y"])

title!("Случай №1")
