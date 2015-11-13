%% This function is to find the roots of the given equation in the
%% gf_m domain
function roots = gf_roots(p_eq)
    global gf_m;
    global gf;

    pos = 0;

    %% Loop to find out if the element is a root
    for i = 0 : 2^gf_m - 2
      y = gf_is_a_root(p_eq,i);
      if y == 0 
        pos = pos +1;
        roots(pos) = i;
      end
    end

    %% If there are no roots then return inf
    if pos == 0 
        roots(1) = inf;
    end

end
