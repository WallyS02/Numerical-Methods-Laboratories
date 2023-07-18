function [xvect,xdif,fx,it_cnt] = secant(fun,a,b,eps)
x_b = a;
x = b;
for i = 1:1000
    f_x = fun(x);
    x_a = x - (f_x*(x - x_b)/(f_x - fun(x_b)));
    xvect(i) = x_a;
    xdif(i) = abs(x_a - x);
    fx(i) = fun(x_a);
    if abs(fx(i)) < eps
      it_cnt = i;
      return;
    end
    x_b = x;
    x = x_a;
end
end