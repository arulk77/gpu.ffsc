%% This function is to get the exponent (power) of the given element
%% represented as power of alpha
function r = gf_exp_apow(e1,pow)
  global gf;
  global gf_m;

  if e1 == inf || pow == inf
      r = gf(1,:); return
  end
  r = gf(gf_mat_pos(gf_norm_apow(e1*pow)),:);
end