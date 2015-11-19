%% This function is to find GCD of two galois field element
function gcd = gf_gcd(p1,p2)
   p1_deg = size(p1,2);
   p2_deg = size(p2,2);
   
   %% Swap the polynomial if the degree of the p1 polynomial
   %% is lesser than the second polynomial
   if p2_deg > p1_deg
     t = p2;
     p2 = p1;
     p1 = t;
   end

   %% Create a while loop until the last remider
   %% n -- Numerator, d -- Denominator
   n = gf_squeeze(p1); d = gf_squeeze(p2);
   [q,r] = deconv(n,d);

   while gf_deg(r) ~= -1 
       n = d;
       d = gf_squeeze(r);
       [q,r] = deconv(n,d);
   end
   gcd = d;

end