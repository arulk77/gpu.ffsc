% This function is to multiply the two numbers 
function r = gf_mult(e1,e2)
  global gf;
  global gf_m;
  if e1 == inf || e2 == inf
      r = gf(1,:); return
  end

  exp_add = mod(e1+e2,2^gf_m-1);
  r = gf(gf_mat_pos(exp_add),:);
end