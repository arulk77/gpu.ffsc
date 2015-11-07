%%This program is to setup the constants for the gf speech coder
global gf gf_m gf_p C_Frm_Sz pg_str
pg_str = 'gf_coder: ';

%% Initialize galois field specific value
gf_m = 16;
gf_p = 2;

%% Initialize the galois field
p = sprintf('%s Creating gf of prime %d and extension %d',pg_str,gf_p,gf_m);disp(p);
gf = gftuple([-1:2^gf_m-2]',gf_m,gf_p);

%% Initialize other constants
C_Frm_Sz = 2^8; C_Fs = 8e3;

%% End of initialization
p = sprintf('%s Done initializing the variables',pg_str);disp(p);
