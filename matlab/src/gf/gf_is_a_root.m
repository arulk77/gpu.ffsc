%% This function is to find the roots of the given equation in the
%% gf_m domain
function roots = gf_is_a_root(p_eq,e)
    global gf_m;
    global gf;

    %%  Loop for the polynomial position
    for p_pos = 1 : size(p_eq,2);
        if (p_pos == 1) 
            gf_sum = gf(gf_mat_pos(p_eq(1,p_pos)),:);
        else
            alpha_pow_elem  = p_eq(1,p_pos);
            alpha_pow_p_pos = gf_norm_apow(e*(p_pos-1));
            
            mult_res = gf_mult_apow(alpha_pow_elem,alpha_pow_p_pos);
            gf_sum = xor(gf_sum,mult_res);
        end
    end

    roots =  sum(gf_sum);
    return;
end
