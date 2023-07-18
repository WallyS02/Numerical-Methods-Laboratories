clc
clear all
close all

warning('off','all')

load trajektoria2

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
print (gcf, 'zadanie5a.png', '-dpng', '-r450')
hold off
%%
err = [];
M = size(n);
M = M(2);
for N = 1:71
    xa = aproksymacjaWielomianowa(n, x, N);
    ya = aproksymacjaWielomianowa(n, y, N);
    za = aproksymacjaWielomianowa(n, z, N);
    err = [err, (sqrt(sum((x - xa).^2)) / M) + (sqrt(sum((y - ya).^2)) / M) + (sqrt(sum((z - za).^2)) / M)];
end

semilogy(err)
grid on
title("Błąd aproksymacji wielomianowej")
xlabel("N")
ylabel("Błąd")
print (gcf, 'zadanie5b.png', '-dpng', '-r450')