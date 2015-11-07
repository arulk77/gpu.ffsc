%% Read the constants that are used in the program
setup_gf;

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
Tframes = floor(rss_n/C_Frm_Sz);

% For loop for the total number of frames
for i = 1:Tframes-1
  cur_speech(i,:) = rss((i-1)*C_Frm_Sz+1:i*C_Frm_Sz);
end
