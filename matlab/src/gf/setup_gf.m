%%This program is to setup the constants for the gf speech coder
global gf_m gf_p Frm_Sz pg_str
pg_str = 'gf_coder: ';

%% Initialize galois field specific value
gf_m = 12;
gf_p = 2;

%% Initialize the galois field
p = sprintf('%s Creating gf of prime %d and extension %d',pg_str,gf_p,gf_m);disp(p);

%% Initialize other constants
global C_Frm_Sz
C_Frm_Sz = 2^5-1; C_Fs = 8e3;

%% Galois field constants in the design 
global C_gf_zero C_gf_one
C_gf_zero = gf(0,gf_m);
C_gf_one  = gf(1,gf_m);

%% End of initialization
p = sprintf('%s Done initializing the variables',pg_str);disp(p);

