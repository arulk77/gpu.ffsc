%%This program is to setup the constants for the gf speech coder
global gf_m gf_p C_Frm_Sz pg_str
pg_str = 'gf_coder: ';

%% Initialize galois field specific value
gf_m = 3;
gf_p = 2;

%% Initialize the galois field
p = sprintf('%s Creating gf of prime %d and extension %d',pg_str,gf_p,gf_m);disp(p);

%% Initialize other constants
C_Frm_Sz = 2^5-1; C_Fs = 8e3;

%% End of initialization
p = sprintf('%s Done initializing the variables',pg_str);disp(p);

%% Find the prime polynomial for different poistion
pos = 1;
for e = 0:2^gf_m-1
    a = zeros(1,pos+2);
    a(pos+2) = e;
    a(pos+1) = 1;
    a(pos) = 1;
    m = gf(a,gf_m);
    r= roots(m);
    a
    size(r,1)
end
