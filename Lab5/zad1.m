K = [5, 15, 25, 35];
[XX,YY]=meshgrid(linspace(0,1,101),linspace(0,1,101));
for i = K
  [x,y,f,xp,yp] = lazik(i);

  subplot(2,2,1)
  plot(xp,yp,'-o','linewidth',2)
  title("Tor ruchu łazika")
  ylabel("y")
  xlabel("x")
  
  subplot(2,2,2)
  surf(reshape(x,i,i),reshape(y,i,i),reshape(f,i,i))
  title("Wartości próbek")
  ylabel("y")
  xlabel("x")
  zlabel("f(x,y)")
  shading flat
  
  [p] = polyfit2d(x,y,f);
  [FP] = polyval2d(XX,YY,p);
  subplot(2,2,3)
  surf(YY,XX,FP)
  shading flat

  title("Interpolacja wielomianowa")
  ylabel("y")
  xlabel("x")
  zlabel("f(x,y)")
  
  [t] = trygfit2d(x,y,f);
  [FT] = trygval2d(XX,YY,t);
  subplot(2,2,4)
  surf(YY,XX,FT)
  shading flat

  title("Interpolacja trygonometryczna")
  ylabel("y")
  xlabel("x")
  zlabel("f(x,y)")
  sgtitle(strcat("K=", num2str(i)))
  print(gcf, strcat("K_", num2str(i), ".png"), '-dpng', '-r450')
end