using Plots 
using DifferentialEquations
pyplot();

w = 6.00;
g = 1.00;
t = (0.0,37.0);
step = 0.05;
x0 = [-0.7; 0.7];
p = [w,g];

f(t) = 2 * cos(0.5*t);
function syst(dx,x,p,t)
    w,g = p
    dx[1]  = x[2];
    dx[2] =  - w * x[1] - g * x[2] + f(t);
end

prob = ODEProblem(syst, x0, t, p);
sol = solve(prob, saveat = step);
n = length(sol.u);
y1 = zeros(n);
y2 = zeros(n);
for i in 1:n
    y1[i] = sol.u[i][1];
    y2[i] = sol.u[i][2];
end

plot(y1, y2, xlabel = "X", ylabel = "X'", label = "График зависимости x(x')")
title!("Фазовый портрет гармонического осциллятора с затуханиями, под
действием внешней силы")
