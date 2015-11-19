%% This function is to squeeze the gf polynomial 
%% to a degree given
function r = gf_squeeze(p)
  sz = size(p,2);
  deg = gf_degree(p);
  r = p(1,sz-deg:sz);
end