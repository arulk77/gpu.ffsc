%% This function is to find the roots of the given equation in the
%% gf_m domain
function roots = gf_is_a_root(p_eq,e)
    global gf_m;
    global gf;

    %%  Loop for the polynomial position
    for p_pos = 1 : size(p_eq,2);
        if (p_pos == 1) 
            gf_sum = gf(p_eq(p_pos)+1,:);
        else
            alpha_pow_elem  = p_eq(1,p_pos);
            alpha_pow_p_pos = gf_norm_apow(e*(p_pos-1));

            if(p_eq(1,p_pos) > 0) 
                mult_res = gf_mult_apow(alpha_pow_elem,0);
            else 
                mult_res = gf(1,:);;
            end

            gf_sum = xor(gf_sum,mult_res);
        end
    end

    %% Add x^gf_m 
    x_pow_gf_m = gf_exp_apow(e,size(p_eq,2));
    gf_sum = xor(gf_sum,x_pow_gf_m);

    roots =  sum(gf_sum);
    return;
end
