function [value] = compute_time( t )

  g = 9.81;
  m = 150000;
  q = 2700;
  u = 2000;
  v = u * log(m / (m - q * t)) - g * t;
  value = v - 750;

end