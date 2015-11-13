%% This function gives back the position of the elemnt as 
%% power of alpha
function pos = gf_elem_apow(element)
  global gf;
  global gf_m;

  for i = 1:size(gf,1)
      if sum(xor(gf(i,:),element)) == 0
          if i == 1 
              pos = inf;
          else
              pos = i - 2;
          end
          return;
      end
  end
end