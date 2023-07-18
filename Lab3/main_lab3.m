clc
clear all
close all

% odpowiednie fragmenty kodu mozna wykonac poprzez zaznaczenie i wcisniecie F9 w Matlabie
% komentowanie/odkomentowywanie: ctrl+r / ctrl+t

% Zadanie A
%------------------
N = 10;
density = 3; % parametr decydujacy o gestosci polaczen miedzy stronami
[Edges] = generate_network(N, density);
%-----------------

% Zadanie B
%------------------
% generacja macierzy I, A, B i wektora b
d = 0.85;

B = sparse(Edges(2,:), Edges(1,:), 1, N, N);

I = speye(N);

L = sum(B);

A = spdiags(1./L.', 0, N, N);

b = ((1-d)/N)*ones(N, 1);

M = sparse(I - d.*B*A);

% macierze A, B i I musza byc przechowywane w formacie sparse (rzadkim)
issparse(M)
%-----------------

% Zadanie c
%------------------
r = M\b;
%-----------------


%% 
% Zadanie D
%------------------
clc
clear all
close all

N = [500, 1000, 3000, 6000, 12000];
d = 0.85;
density = 10;


for i = 1:5
    [Edges] = generate_network(N(i), density);

    B = sparse(Edges(2,:), Edges(1,:), 1, N(i), N(i));

    I = speye(N(i));

    L = sum(B);

    A = spdiags(1./L.', 0, N(i), N(i));

    b = ((1-d)/N(i))*ones(N(i), 1);

    M = sparse(I - d.*B*A);
    tic
    % obliczenia start
    r = M\b;
    % obliczenia stop
    direct_time(i) = toc;
end
plot(N, direct_time)
title("Zadanie D - czas rozwiązywania równania macierzowego")
ylabel("Czas [s]")
xlabel("Rozmiar macierzy")
saveas(gcf, 'zadanieD.png')
%%------------------
%%
% Zadanie E
% ------------------
clc
clear all
close all

d = 0.85;
density = 10;
norm_threshold = 10^(-14);
N = [500, 1000, 3000, 6000, 12000];


for i = 1:5
    [Edges] = generate_network(N(i), density);

    B = sparse(Edges(2,:), Edges(1,:), 1, N(i), N(i));

    I = speye(N(i));

    L = sum(B);

    A = spdiags(1./L.', 0, N(i), N(i));

    b = ((1-d)/N(i))*ones(N(i), 1);

    M = sparse(I - d.*B*A);
    
    r = ones(N(i), 1);

    D = diag(diag(M));

    U = triu(M, 1);

    L = tril(M, -1);

    iters(i) = 0;

    elem1 = -D \ (L + U);

    elem2 = D \ b;
    tic
    % obliczenia start
    while(true)
        iters(i) = iters(i) + 1;
        r = elem1 * r + elem2;
        res = M * r - b;
        residual(i, iters(i)) = norm(res);
        if(norm(res) <= norm_threshold)
            break
        end
    end
    % obliczenia stop
    jacobi_time(i) = toc;
end
plot(N, jacobi_time)
title("Zadanie E - czas rozwiązywania równania macierzowego")
ylabel("Czas [s]")
xlabel("Rozmiar macierzy")
saveas(gcf, 'zadanieE_czas.png')

plot(N, iters)
title("Zadanie E - liczba iteracji");
ylabel("Liczba iteracji");
xlabel("Rozmiar macierzy");
saveas(gcf, 'zadanieE_iteracje.png');

semilogy(residual(2, 1:iters(2)))
title("Zadanie E - norma z residuum dla kolejnych iteracji dla rozmiaru macierzy N = 1000");
ylabel("Norma z residuum");
xlabel("Numer iteracji");
saveas(gcf, 'zadanieE_norma.png');
%------------------
%% 
% Zadanie F
%------------------
clc
clear all
close all

d = 0.85;
density = 10;
norm_threshold = 10^(-14);
N = [500, 1000, 3000, 6000, 12000];


for i = 1:5
    [Edges] = generate_network(N(i), density);

    B = sparse(Edges(2,:), Edges(1,:), 1, N(i), N(i));

    I = speye(N(i));

    L = sum(B);

    A = spdiags(1./L.', 0, N(i), N(i));

    b = ((1-d)/N(i))*ones(N(i), 1);

    M = sparse(I - d.*B*A);
    
    r = ones(N(i), 1);

    D = diag(diag(M));

    U = triu(M, 1);

    L = tril(M, -1);

    iters(i) = 0;

    elem1 = -(D + L);

    elem2 = (D + L) \ b;
    tic
    % obliczenia start
    while(true)
        iters(i) = iters(i) + 1;
        r = elem1 \ (U * r) + elem2;
        res = M * r - b;
        residual(i, iters(i)) = norm(res);
        if(norm(res) <= norm_threshold)
            break
        end
    end
    % obliczenia stop
    gauss_seidl_time(i) = toc;
end
plot(N, gauss_seidl_time)
title("Zadanie F - czas rozwiązywania równania macierzowego")
ylabel("Czas [s]")
xlabel("Rozmiar macierzy")
saveas(gcf, 'zadanieF_czas.png')

plot(N, iters)
title("Zadanie F - liczba iteracji");
ylabel("Liczba iteracji");
xlabel("Rozmiar macierzy");
saveas(gcf, 'zadanieF_iteracje.png');

semilogy(residual(2, 1:iters(2)))
title("Zadanie F - norma z residuum dla kolejnych iteracji dla rozmiaru macierzy N = 1000");
ylabel("Norma z residuum");
xlabel("Numer iteracji");
saveas(gcf, 'zadanieF_norma.png');
%------------------
%%
% Zadanie G
%------------------
clc
clear all
close all

norm_threshold = 10^(-14);
iters(1) = 0;
iters(2) = 0;
load("Dane_Filtr_Dielektryczny_lab3_MN.mat")

r = M \ b;

res = M * r - b;
norm(res)

cols = size(M);
r = ones(cols(2), 1);

D = diag(diag(M));

U = triu(M, 1);

L = tril(M, -1);

elem1 = -D \ (L + U);

elem2 = D \ b;

while(true)
        iters(1) = iters(1) + 1;
        r = elem1 * r + elem2;
        res = M * r - b;
        residual(1, iters(1)) = norm(res);
        if(norm(res) <= norm_threshold  || isnan(norm(res)))
            break
        end
end
norm(residual(1, iters(1)))

cols = size(M);
r = ones(cols(2), 1);

D = diag(diag(M));

U = triu(M, 1);

L = tril(M, -1);

elem1 = -(D + L);

elem2 = (D + L) \ b;

while(true)
        iters(2) = iters(2) + 1;
        r = elem1 \ (U * r) + elem2;
        res = M * r - b;
        residual(2, iters(2)) = norm(res);
        if(norm(res) <= norm_threshold  || isnan(norm(res)))
            break
        end
end
norm(residual(2, iters(2)))