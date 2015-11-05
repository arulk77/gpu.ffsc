% This function is to adjust the position for the matlab
% The zeroth element will be -inf, and the first element will be 0
function pos = gf_mat_pos(element)
  if element == inf
    pos = 1; return;
  end
  pos = element + 2;
end