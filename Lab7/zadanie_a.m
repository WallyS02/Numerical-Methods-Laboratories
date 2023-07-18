clc
clear all

gest = [];
nr = [];
for i = 1:20
    nr(i) = i;
    gest(i) = gestosc_prawdopodobienstwa(i);
end
plot(nr, gest)
title("Gęstość prawdopodobieństwa rozkładu normalnego")
xlabel("czas używania urządzenia w latach")
ylabel("gęstość prawdopodobieństwa")
print(gcf, 'gestosc.png', '-dpng', '-r450')

%%

load P_ref.mat
a = 0;
b = 5;
fmin = 0;
fmax = gestosc_prawdopodobienstwa(10);

error_p = [];
error_t = [];
error_s = [];
error_m = [];
for N = 5:50:10^4
    error_p = [error_p, metoda_prostokatow(a, b, N, P_ref)];
    error_t = [error_t, metoda_trapezow(a, b, N, P_ref)];
    error_s = [error_s, metoda_Simpsona(a, b, N, P_ref)];
    error_m = [error_m, metoda_Monte_Carlo(a, b, N, fmin, fmax, P_ref)];
end

x = 5:50:10^4;

loglog(x, error_p)
title('Błąd - metoda prostokątów')
xlabel('Liczba przedziałów')
ylabel('Wartość błędu')
print (gcf, 'metoda_prostokatow.png', '-dpng', '-r450')

loglog(x, error_t)
title('Błąd - metoda trapezów')
xlabel('Liczba przedziałów')
ylabel('Wartość błędu')
print (gcf, 'metoda_trapezow.png', '-dpng', '-r450')

loglog(x, error_s)
title('Błąd - metoda Simpsona')
xlabel('Liczba przedziałów')
ylabel('Wartość błędu')
print (gcf, 'metoda_Simpsona.png', '-dpng', '-r450')

loglog(x, error_m)
title('Błąd - metoda Monte Carlo')
xlabel('Liczba wylosowanych punktów')
ylabel('Wartość błędu')
print(gcf, 'metoda_Monte_Carlo.png', '-dpng', '-r450')

%%

N = 10^7;

tic
metoda_prostokatow(a, b, N, P_ref);
time_p = toc;

tic
metoda_trapezow(a, b, N, P_ref);
time_t = toc;

tic
metoda_Simpsona(a, b, N, P_ref);
time_s = toc;

tic
metoda_Monte_Carlo(a, b, N, fmin, fmax, P_ref);
time_m = toc;
x = [1, 2, 3, 4];
y = [time_p; time_t; time_s; time_m];
bar(x, y, 0.5, 'FaceColor', [0, 0.5, 1])
labels = ["prostokątów"; "trapezów"; "Simpsona"; "Monte Carlo"];
set(gca, 'XTickLabel', labels)
title('Czas wykonania poszczególnych metod dla N = 10^7')
xlabel('Metoda')
ylabel('Czas [s]')
print(gcf, 'czasy.png', '-dpng', '-r450')