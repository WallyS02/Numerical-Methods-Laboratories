div_polyval = [];
div_trygval = [];

for i = 5:45
  [YY,XX] = meshgrid(linspace(0,1,101),linspace(0,1,101));
  [x,y,f,xp] = lazik(i);

  [p] = polyfit2d(x,y,f);
  [FF_p] = polyval2d(XX,YY,p);

  [t] = trygfit2d(x,y,f);
  [FF_t] = trygval2d(XX,YY,t);
  
  if i == 5
    FF_p_prev = FF_p;
    FF_t_prev = FF_t;
  else
    div_polyval = [div_polyval, max(max(abs(FF_p-FF_p_prev)))];
    div_trygval = [div_trygval, max(max(abs(FF_t-FF_t_prev)))];
    FF_p_prev = FF_p;
    FF_t_prev = FF_t;
  end
end

plot(6:45, div_polyval)
title("Zbieżność interpolacji wielomianowej")
ylabel("Maksymalna wartość różnicy różnicy interpolowanych funkcji")
xlabel("Ilość punktów pomiarowych - K")
print (gcf, "zbieznosc_wielomianowa.png", '-dpng', '-r450')

plot(6:45, div_trygval)
title("Zbieżność interpolacji trygonometrycznej")
ylabel("Maksymalna wartość różnicy różnicy interpolowanych funkcji")
xlabel("Ilość punktów pomiarowych - K")
print (gcf, "zbieznosc_trygonometryczna.png", '-dpng', '-r450')
