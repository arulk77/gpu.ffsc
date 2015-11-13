%% This function normalizes the alpha power to be in the same field
function r = gf_norm_apow(pos)
  global gf_m;
  if pos == inf
      r = inf;
      return
  end 
  r = mod(pos,2^gf_m-1);
end