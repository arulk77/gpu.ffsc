%% This function checks if the given polynomial is 
%% a monic polynomial
function r = gf_monic (p_in) 
  global gf_m;
  p =   gf_squeeze(p_in);
  deg = gf_deg(p);
  r = 0;
  if(deg > 0)
      if(p(1,1) == gf(1,gf_m))
          r = 1;
      end
  end


end