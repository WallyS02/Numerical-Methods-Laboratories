function [ret] = metoda_Monte_Carlo(a, b, N, fmin, fmax, P_ref)
  f_diff = fmax - fmin;
  i_diff = b - a;
  N_1 = 0;
  for i = 1:N
    x = rand() * i_diff + a;
    y = rand() * f_diff + fmin;
    fx = gestosc_prawdopodobienstwa(x);
    if y >= fmin && y <= fx
        N_1 = N_1 + 1;
    end
  end
  S = (N_1/N) * abs(a-b) * abs(fmin-fmax);
  ret = abs(S - P_ref);
end