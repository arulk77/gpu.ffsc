%% This is to experiment is to print out all the prime polynomials
%% into a file
pdeg = 128;
fname = 'prime_poly.txt';

%% Variables for current and previous polynomial
ppoly = zeros(1,pdeg);
cpoly = ppoly;
ppoly(1,pdeg) = -1;

%% Variable for the row caclulator
r    = 1;

%% Variable for prime polynomial position
irpos = 1;

while (r <= 2^gf_m^pdeg)
    %% Carry is 1 for the first element
    carry     = 1; 

    %% Loop that evaluates each polynomial
    for c = pdeg:-1:1
        add        = ppoly(1,c)+carry;
        cpoly(1,c) = mod(add,2^gf_m);
        carry      = floor(add/2^gf_m);
    end
    ppoly = cpoly;

    %% This variable does the matrix
    % M(r,:) = cpoly;

    %% Check if the polynomial is monic irreducible
    if (gf_monic(cpoly))
        %% Degree one is always a irreducible polynomial
        if(gf_deg(cpoly) == 1) 
            irpoly(irpos,:) = cpoly; irpos = irpos + 1;
            dlmwrite(fname,cpoly,'-append');
        end
        %% for degree greater than one
        if(gf_deg(cpoly) > 1)
            irreducible = 1;
            %% Loop through all irreducilbe polynomial
            for l = 1:size(irpoly,1)
                irr_poly = gf(irpoly(l,:),gf_m);
                gf_cpoly = gf(cpoly,gf_m);

                %% Find the gcd between the polynomial matrix and
                %% current poly
                gcd = gf_gcd(irr_poly,gf_cpoly);
                gcd = gf_squeeze(gcd);

                %% If the gcd has a polynomial then it is divisible
                if (size(gcd,2) ~= 1) 
                    irreducible = 0; break;
                end
                
            end
            if (irreducible)
                irpoly(irpos,:) = cpoly; irpos = irpos + 1;
                dlmwrite(fname,cpoly,'-append');
            end
        end
    end
    
    r = r+1;
end
