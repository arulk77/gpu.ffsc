%% This function is to test whether the given polynomial is 
%% irreducible or not
%% This uses the Rabin's method to test
function irr = gf_irr_test(p)
  global gf_m;
  global gf_p;

  p = gf_squeeze(p);
  n = gf_deg(p);
  f = factor(n);
  
  %% Initialize that is irreducible
  irr = 0; stop = 0;

  %% First test
%% for i = 1 : size(f,2)
%%     k = n/f(1,i);
%%     q_pow_k = gf_p^gf_m^k;
%%     m = zeros(1,q_pow_k+1);
%%     m(1,1) = 1; m(1,q_pow_k) = 1;
%% 
%%     %% x^q^ni mod p
%%     [q r] = deconv(gf(m,gf_m),p);
%%     
%%     %% GCD of the residual and function p
%%     gcd = gf_gcd(r,p);
%% 
%%     if gf_deg(gcd) >= 1
%%         stop = 1; break;
%%     end
%% end
%% 
%% if stop == 1
%%     return;
%% end

  %% Second test (only performed if above iteration fails)
  %% x^q^n - x mod f == 0

  %% x^q^n - x 
  q_pow_n = gf_p^gf_m^n;
  m = zeros(1,q_pow_n+1);
  m(1,1) = 1; m(1,q_pow_n) = 1;

  [q r] = deconv(gf(m,gf_m),p);
  if(gf_deg(r) == -1 && r(1,size(r,2)) == 0 )
      irr = 1;
      return; %% The polynomial is divisible
  end
  
end