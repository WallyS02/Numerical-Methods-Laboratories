clear all
close all
a = 200;
r_max = a/2;
n_max = 200;
x = [];
y = [];
r = [];
field = [];
random_draws = [];
random_counter = 0;
n = 1;
while (n <= n_max)
    inside = false;
    while(inside == false)
        xc = rand(1)*a;
        yc = rand(1)*a;
        rc = rand(1)*r_max;
        if(xc + rc < a && xc - rc > 0 && yc + rc < a && yc - rc > 0)
            inside = true;
        end
        random_counter = random_counter + 1;
    end
    if(n > 1)
        for i = 1:n-1
            x1 = power((xc - x(i)), 2);
            y1 = power((yc - y(i)), 2);
            distance = sqrt((x1 + y1));
            if(distance <= rc + r(i))
                inside = false;
                random_counter = random_counter + 1;
                break;
            end
        end
    end
    if(inside)
        plot_circle(xc, yc, rc)
        axis equal
        axis ([0 a 0 a])
        hold on
        x(n) = xc;
        y(n) = yc;
        r(n) = rc;
        field(n) = pi * rc * rc;
        random_draws(n) = random_counter;
        random_counter = 0;
        pause(0.01)
        n = n + 1;
    end
end
n = n-1;

figure(Name="Powierzchnia całkowita kół")
plot(1:n, cumsum(field))
title("Powierzchnia całkowita kół")
ylabel("Powierzchnia")
xlabel("Liczba narysowanych okręgów")

figure(Name="Średnia liczba losowań")
plot(1:n, cumsum(random_draws)./(1:length(random_draws)))
title("Średnia liczba losowań")
ylabel("Liczba losowań")
xlabel("Liczba narysowanych okręgów")