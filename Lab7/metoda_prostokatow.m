function [ret] = metoda_prostokatow(a, b, N, P_ref)
  dx = (b - a)/N;
  S = 0;
  for i = 1:N
    x_i = a + (i - 1)*dx;
    x_i_1 = a + i * dx;
    S = S + gestosc_prawdopodobienstwa((x_i + x_i_1)/2)*dx;
  end
  ret = abs(S - P_ref);
end