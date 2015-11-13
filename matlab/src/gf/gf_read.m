%% Read the constants that are used in the program
setup_gf;

%% This file is to read the samples and assign to a variable 
fid = fopen(strcat(fpath,'/SPEECH.IN'),'r');

% Get the raw speech samples
rss = fread(fid,inf,'int16')';
[rss_m,rss_n] = size(rss);

% normalize the rss to 2^13
norm_rss = rss.*(2^(gf_m-1)/2^15);

% Sampling rate of the file is 8 KHz. 
% Get the dimension and form the time samples
st = (0:1:rss_n-1); 
st = st.*(1.0/C_Fs);

%% Calculate the global variables for the speech coders
Tframes = floor(rss_n/C_Frm_Sz);

% For loop for the total number of frames
for i = 1:Tframes-1
  speech(i,:) = norm_rss((i-1)*C_Frm_Sz+1:i*C_Frm_Sz);
  speech_norm(i,:) = uint16(int32(speech(i,:)) + 2^(gf_m-1)-1);

  %% Convert the speech to galois field coefficient
  for j = 1:size(speech_norm,2)
    gf_speech_coeff(i,j,:) = gf(gf_mat_pos(speech_norm(i,j)),:);
  end
end

