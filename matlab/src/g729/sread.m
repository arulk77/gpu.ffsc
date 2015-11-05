%% Read the constants that are used in the program
constant

%% This file is to read the samples and assign to a variable 
fid = fopen(strcat(fpath,'/SPEECH.IN'),'r');

% Get the raw speech samples
rss = fread(fid,inf,'int16')';
[rss_m,rss_n] = size(rss);

% Sampling rate of the file is 8 KHz. 
% Get the dimension and form the time samples
st = (0:1:rss_n-1); 
st = st.*(1.0/C_Fs);

%% Calculate the global variables for the speech coders
Tframes = floor(rss_n/C_Frm_sz);

% For loop for the total number of frames
for i = 1:Tframes-1
  j = i; % Index for the array
  c(j)         = g729_frm_cls;

  %% The first frame is a special frame where the previous samples 
  %% are assumed to be zeros
  if i == 1 
    % When there is no frame available then pad with zeros  
	  c(j).speech_3frames = [zeros(1,C_Frm_sz),rss((i-1)*C_Frm_sz+1:(i+0)*C_Frm_sz),rss((i+0)*C_Frm_sz+1:(i+1)*C_Frm_sz)];
	  c(j).lp_fil_y2 = 0; c(j).lp_fil_y1 = 0;
	  c(j).lp_fil_x2 = 0; c(j).lp_fil_x1 = 0;
  else 
	  c(j).speech_3frames = [c(j-1).cur_frame,rss((i-1)*C_Frm_sz+1:(i+0)*C_Frm_sz),rss((i+0)*C_Frm_sz+1:(i+1)*C_Frm_sz)];
	  c(j).lp_fil_y2 = c(j-1).lp_fil_y2;; c(j).lp_fil_y1 = c(j-1).lp_fil_y1;;
	  c(j).lp_fil_x2 = c(j-1).lp_fil_x2;; c(j).lp_fil_x1 = c(j-1).lp_fil_x1;;
  end 
  
  %% Encode the speech samples
  c(j).encode;
end
