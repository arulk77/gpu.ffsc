%% This is to experiment the different top level
m = 3;
cp = gf([1 0 0],m);
for i = 0:2^m-1
  for j = 1:2^m
      xp = gf([1 i],m);
      yp = gf([1 j-1],m);
      cp(i*(2^m)+j,:) = conv(xp,yp);
  end
end