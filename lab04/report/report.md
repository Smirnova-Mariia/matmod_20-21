---
# Front matter
lang: ru-RU
title: "Отчет по лабораторной работе 4"
subtitle: "Модель гармонических колебаний"
subject: "Математическое моделирование"
author: "Смирнова Мария Александровна"
groupe: "НФИбд-01-18"

# Formatting
toc-title: "Содержание"
toc: true # Table of contents
toc_depth: 2
lof: true # List of figures
lot: true # List of tables
fontsize: 12pt
linestretch: 1.5
papersize: a4paper
documentclass: scrreprt
polyglossia-lang: russian
polyglossia-otherlangs: english
mainfont: PT Serif
romanfont: PT Serif
sansfont: PT Sans
monofont: PT Mono
mainfontoptions: Ligatures=TeX
romanfontoptions: Ligatures=TeX
sansfontoptions: Ligatures=TeX,Scale=MatchLowercase
monofontoptions: Scale=MatchLowercase
indent: true
pdf-engine: lualatex
header-includes:
  - \linepenalty=10 # the penalty added to the badness of each line within a paragraph (no associated penalty node) Increasing the value makes tex try to have fewer lines in the paragraph.
  - \interlinepenalty=0 # value of the penalty (node) added after each line of a paragraph.
  - \hyphenpenalty=50 # the penalty for line breaking at an automatically inserted hyphen
  - \exhyphenpenalty=50 # the penalty for line breaking at an explicit hyphen
  - \binoppenalty=700 # the penalty for breaking a line at a binary operator
  - \relpenalty=500 # the penalty for breaking a line at a relation
  - \clubpenalty=150 # extra penalty for breaking after first line of a paragraph
  - \widowpenalty=150 # extra penalty for breaking before last line of a paragraph
  - \displaywidowpenalty=50 # extra penalty for breaking before last line before a display math
  - \brokenpenalty=100 # extra penalty for page breaking after a hyphenated line
  - \predisplaypenalty=10000 # penalty for breaking before a display
  - \postdisplaypenalty=0 # penalty for breaking after a display
  - \floatingpenalty = 20000 # penalty for splitting an insertion (can only be split footnote in standard LaTeX)
  - \raggedbottom # or \flushbottom
  - \usepackage{float} # keep figures where there are in the text
  - \floatplacement{figure}{H} # keep figures where there are in the text
---

# Цель работы

Рассмотреть модель гармонических колебаний. Освоить построение фазового портрета гармонических колебаний.

# Краткая теоретическая справка

Движение грузика на пружинке, маятника, заряда в электрическом контуре, а
также эволюция во времени многих систем в физике, химии, биологии и других
науках при определенных предположениях можно описать одним и тем же
дифференциальным уравнением, которое в теории колебаний выступает в качестве
основной модели. Эта модель называется линейным гармоническим осциллятором.

Уравнение свободных колебаний гармонического осциллятора имеет следующий вид:

$$\frac{\partial^2 x}{\partial t^2} + 2\gamma \frac{\partial x}{\partial t} + w_0^2x = 0$$

где $x$ - переменная, описывающая состояние системы (смещение грузика, заряд
конденсатора и т.д.) , $\gamma$ – параметр, характеризующий потери энергии (трение в
механической системе, сопротивление в контуре), $w_0$ – собственная частота колебаний, $t$ – время. 

Это уравнение есть линейное однородное дифференциальное уравнение второго порядка и оно является примером линейной динамической системы.

Для однозначной разрешимости уравнения второго порядка необходимо задать два начальных условия вида:

$$ \begin{cases} x(t_0) = x_0 \ x'(t_0) = y_0 \ \end{cases} $$

Уравнение второго порядка можно представить в виде системы двух
уравнений первого порядка:

$$ \begin{cases} x'(t) = y \ y'(t) = -2 \gamma y - w^2_0x \ \end{cases} $$

Начальные условия для системы примут вид:

$$ \begin{cases} x(t_0) = x_0 \ y(t_0) = y_0 \ \end{cases} $$

Независимые переменные x, y определяют пространство, в котором
«движется» решение. Это фазовое пространство системы, поскольку оно двумерно
будем называть его фазовой плоскостью. Значение фазовых координат x, y в любой момент времени полностью определяет состояние системы.

# Задание

### Вариант 27 

Постройте фазовый портрет гармонического осциллятора и решение уравнения гармонического осциллятора для следующих случаев:

    1. Колебания гармонического осциллятора без затуханий и без действий внешней силы $x''(t) + 9x = 0$,
    2. Колебания гармонического осциллятора c затуханием и без действий внешней силы $x''(t) + 5.5x'(t) + 4.4x = 0$,
    3. Колебания гармонического осциллятора c затуханием и под действием внешней силы $x''(t) + x'(t) + 6x = 2*cos{0.5t}$,

На интервале $t \in [0; 37]$ (шаг 0.05) с начальными условиями $x_0 = -0.7$, $y_0 = 0.7$.


# Выполнение лабораторной работы

1. Построим фазовый портрет гармонического осциллятора для колебаний без затуханий и без действия внешней силы. Код julia:


using Plots 

using DifferentialEquations

pyplot();

w = 9.00;

t = (0.0,37.0);

step = 0.05;

x0 = [-0.7; 0.7];

p = [w];

function syst(dx,x,p,t)

    w = p[1];

    dx[1]  = x[2];

    dx[2] =  - w * x[1];

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

title!("Фазовый портрет гармонического осциллятора без затуханий, без действия внешней силы")


Получим следующий график (рис.1 -@fig:001)

![Рис.1 Фазовый портрет гармонического осциллятора без затуханий, без
действия внешней силы](image/Figure_1.png){ #fig:001 width=70% }

2. Построим фазовый портрет гармонического осциллятора для колебаний с затуханиями и без действия внешней силы. Код julia:


using Plots 

using DifferentialEquations

pyplot();

w = 4.4;

g = 5.5;

t = (0.0,37.0);

step = 0.05;

x0 = [-0.7; 0.7];

p = [w,g];

function syst(dx,x,p,t)

    w,g = p

    dx[1]  = x[2];

    dx[2] =  - w * x[1] - g * x[2];

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

title!("Фазовый портрет гармонического осциллятора с затуханиями, без действия внешней силы")


Получим следующий график (рис.2 -@fig:002)

![Рис.2 Фазовый портрет гармонического осциллятора с затуханиями, без
действия внешней силы](image/Figure_2.png){ #fig:002 width=70% }

3. Построим фазовый портрет гармонического осциллятора для колебаний без затуханий и под действием внешней силы. Код julia:


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

title!("Фазовый портрет гармонического осциллятора с затуханиями, под действием внешней силы")


Получим следующий график (рис.3 -@fig:003)

![Рис.3 Фазовый портрет гармонического осциллятора с затуханиями, под
действием внешней силы](image/Figure_3.png){ #fig:003 width=70% }

# Выводы

В процессе выполнения лабораторной работы мы построили фазовый портрет гармонического осциллятора и решили уравнения гармонического осциллятора для нескольких случаев.
