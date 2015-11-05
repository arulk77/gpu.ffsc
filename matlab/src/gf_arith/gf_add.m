%This function is to add two elements and it expects a global
%variable field 
function r = gf_add(e1,e2)
  global gf;
  r = xor(gf_mat_pos(e1),gf_mat_pos(e2));
end