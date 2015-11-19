%% This function returns the degree of the polynomial
function r = gf_deg (p) 
  global gf_m;
  sz = size(p,2);
  for i = 1:sz
      r = sz-i;
      if (p(1,i) ~= gf(0,gf_m))
        break;
      end
  end
  if r == 0 && p(1,1) == gf(0,gf_m)
      r = -1; %% This is zero polynomial
  end
end