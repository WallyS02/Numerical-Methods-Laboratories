function [ret] = metoda_Simpsona(a, b, N, P_ref)
  dx = (b - a)/N;
  S = 0;
  for i = 1:N
    x_i = a + (i - 1)*dx;
    x_i_1 = a + i * dx;
    S = S + gestosc_prawdopodobienstwa(x_i) + 4 * gestosc_prawdopodobienstwa((x_i_1 + x_i)/2) + gestosc_prawdopodobienstwa(x_i_1);
  end
  S = S * dx/6;
  ret = abs(S - P_ref);
end