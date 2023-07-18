clc
clear all
close all

[xvect, xdif, ~, it_cnt] = bisection(@compute_parameters,1,60000,1e-3);

plot(1:it_cnt, xvect)
title("Wartość kolejnego przybliżenia N w kolejnych iteracjach przy użyciu metody bisekcji");
ylabel("Liczba parametrów wejściowych N");
xlabel("Numer iteracji");
saveas(gcf, 'parametry_bisekcja_wartości.png');

semilogy(1:it_cnt, xdif)
title("Różnice pomiędzy wartościami N w kolejnych iteracjach przy użyciu metody bisekcji");
ylabel("Różnica pomiędzy obecną i poprzednią wartością N");
xlabel("Numer iteracji");
saveas(gcf, 'parametry_bisekcja_zmiany.png');

%%
[xvect, xdif, ~, it_cnt] = secant(@compute_parameters,1,60000,1e-3);

plot(1:it_cnt, xvect)
title("Wartość kolejnego przybliżenia N w kolejnych iteracjach przy użyciu metody siecznych");
ylabel("Liczba parametrów wejściowych N");
xlabel("Numer iteracji");
saveas(gcf, 'parametry_sieczne_wartości.png');

semilogy(1:it_cnt, xdif)
title("Różnice pomiędzy wartościami N w kolejnych iteracjach przy użyciu metody siecznych");
ylabel("Różnica pomiędzy obecną i poprzednią wartością N");
xlabel("Numer iteracji");
saveas(gcf, 'parametry_sieczne_zmiany.png');

%%
[xvect, xdif, ~, it_cnt] = bisection(@compute_impedance,0,50,1e-12);

plot(1:it_cnt, xvect)
title("Wartość kolejnego przybliżenia przybliżenia prędkości kątowej w kolejnych iteracjach przy użyciu metody bisekcji");
ylabel("Wartość prędkości kątowej");
xlabel("Numer iteracji");
saveas(gcf, 'impendancja_bisekcja_wartości.png');

semilogy(1:it_cnt, xdif)
title("Różnice pomiędzy wartościami przybliżenia prędkości kątowej w kolejnych iteracjach przy użyciu metody bisekcji");
ylabel("Różnica pomiędzy obecną i poprzednią wartością prędkości kątowej");
xlabel("Numer iteracji");
saveas(gcf, 'impendancja_bisekcja_zmiany.png');

%%
[xvect, xdif, ~, it_cnt] = secant(@compute_impedance,0,50,1e-12);

plot(1:it_cnt, xvect)
title("Wartość kolejnego przybliżenia przybliżenia prędkości kątowej w kolejnych iteracjach przy użyciu metody siecznych");
ylabel("Wartość prędkości kątowej");
xlabel("Numer iteracji");
saveas(gcf, 'impendancja_sieczne_wartości.png');

semilogy(1:it_cnt, xdif)
title("Różnice pomiędzy wartościami przybliżenia prędkości kątowej w kolejnych iteracjach przy użyciu metody siecznych");
ylabel("Różnica pomiędzy obecną i poprzednią wartością prędkości kątowej");
xlabel("Numer iteracji");
saveas(gcf, 'impendancja_sieczne_zmiany.png');

%%
[xvect, xdif, ~, it_cnt] = bisection(@compute_time,0,50,1e-12);

plot(1:it_cnt, xvect)
title("Wartość kolejnego przybliżenia przybliżenia czasu w kolejnych iteracjach przy użyciu metody bisekcji");
ylabel("Wartość czasu");
xlabel("Numer iteracji");
saveas(gcf, 'czas_bisekcja_wartości.png');

semilogy(1:it_cnt, xdif)
title("Różnice pomiędzy wartościami przybliżenia czasu w kolejnych iteracjach przy użyciu metody bisekcji");
ylabel("Różnica pomiędzy obecną i poprzednią wartością czasu");
xlabel("Numer iteracji");
saveas(gcf, 'czas_bisekcja_zmiany.png');

%%
[xvect, xdif, ~, it_cnt] = secant(@compute_time,0,50,1e-12);

plot(1:it_cnt, xvect)
title("Wartość kolejnego przybliżenia przybliżenia czasu w kolejnych iteracjach przy użyciu metody siecznych");
ylabel("Wartość czasu");
xlabel("Numer iteracji");
saveas(gcf, 'czas_sieczne_wartości.png');

semilogy(1:it_cnt, xdif)
title("Różnice pomiędzy wartościami przybliżenia czasu w kolejnych iteracjach przy użyciu metody siecznych");
ylabel("Różnica pomiędzy obecną i poprzednią wartością czasu");
xlabel("Numer iteracji");
saveas(gcf, 'czas_sieczne_zmiany.png');

%%
options = optimset('Display','iter');
fzero(@tan,6,options)
fzero(@tan,4.5,options)