%% This function is to multiply the two numbers represented as
%% power of alpha
function r = gf_mult_apow(e1,e2)
  global gf;
  global gf_m;

  if e1 == inf || e2 == inf
      r = gf(1,:); return
  end

  r = gf(gf_mat_pos(gf_norm_apow(e1+e2)),:);
end