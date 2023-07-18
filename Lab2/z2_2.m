Edges = [1, 1, 2, 2, 2, 3, 3, 3, 4, 4, 5, 5, 6, 6, 7;
         4, 6, 3, 4, 5, 5, 6, 7, 5, 6, 4, 6, 4, 7, 6];

d = 0.85;
N = 7;

B = sparse(Edges(2,:), Edges(1,:), 1, N, N);

I = speye(N);

L = sum(B);

A = spdiags(1./L.', 0, N, N);

b = ((1-d)/N)*ones(N, 1);

M = sparse(I - d.*B*A);

diary("sparse_test.txt")
whos A B I M b
diary off

spy(B)
title("Punkty zawierające wartości niezerowe macierzy B.")
print -dpng spy_b

r = M\b;

bar(r)
title("Wartości PageRank poszczególnych stron.")
ylabel("wartości PageRank")
xlabel("numer strony")