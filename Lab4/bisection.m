function [xvect,xdif,fx,it_cnt] = bisection(fun,a,b,eps)
cb = a;
for i = 1:1000
    c = (a + b)/2;
    fc = fun(c);
    xvect(i) = c;
    xdif(i) = abs(cb - c);
    fx(i) = fc;
    cb = c;
    if abs(fc) < eps || abs(b - a) < eps
      it_cnt = i;
      return;
    elseif fun(a) * fc < 0
      b = c;
    else
      a = c;
    end
end
end