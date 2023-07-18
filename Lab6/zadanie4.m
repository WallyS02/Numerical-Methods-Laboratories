clc
clear all
close all

warning('off','all')

load trajektoria1

plot3(x, y, z, 'o')
grid on
axis equal

N = 60;
xa = aproksymacjaWielomianowa(n, x, N);  % aproksymacja wspolrzednej x
ya = aproksymacjaWielomianowa(n, y, N);  % aproksymacja wspolrzednej y
za = aproksymacjaWielomianowa(n, z, N);  % aproksymacja wspolrzednej z
hold on
plot3(xa,ya,za,'g','lineWidth',4)
title("Aproksymacja trajektorii lotu drona, a rzeczywista trasa")
xlabel("x[m]")
ylabel("y[m]")
zlabel("z[m]")
print (gcf, 'zadanie4.png', '-dpng', '-r450')