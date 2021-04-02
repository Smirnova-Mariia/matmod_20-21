using DifferentialEquations

using Plots

pyplot()

x0 = [7.7, 8.8];

t = (0.0, 30.0);

p_cr = 39;

N  = 91;

q = 1;

t_1 = 31;

t_2  = 28;

p_1 = 11.2;

p_2 = 15.5;

a1 = (p_cr) / (t_1 * t_1 * p_1 * p_1 * N * q);

a2 = (p_cr) / (t_2 * t_2 * p_2 * p_2 * N * q);

b = (p_cr) / (t_1 * t_1 * p_1 * p_1 * t_2 * t_2 * p_2 * p_2 * N * q);

c1 = (p_cr - p_1) / (t_1 * p_1);

c2 = (p_cr - p_2) / (t_2 * p_2);

theta = t./c1;

step = 0.01 / c1;

function syst(dx, x, p, t)

       a1,a2,b,c1,c2 = p;

       dx[1] = x[1] - b/c1 * x[1]*x[2] - a1/c1 * x[1]*x[1];

       dx[2] = c2/c1 * x[2] - b/c1 * x[1]*x[2] - a2/c1 * x[2]*x[2];

end

p = [a1, a2, b, c1,c2];

prob = ODEProblem(syst, x0, theta, p);

sol = solve(prob, saveat = step);

plot(sol, xlabel = "Theta", ylabel = "M", labels = ["M1(Theta)" "M2(Theta)"])

title!("Случай 1")
