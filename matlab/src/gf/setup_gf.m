%This program is to setup the constants for the gf speech coder
global gf;
global gf_m=16;
global gf_p=2;

% Initialize the galois field
gf = gftuple([-1:2^gf_m-2]',gf_m,gf_p)

global C_Frm_sz = 2^8;

