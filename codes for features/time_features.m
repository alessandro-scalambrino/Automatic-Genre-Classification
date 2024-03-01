function [Z,E]=time_features(filename)
[y,fs]=audioread(filename);
windowLength = fs*0.8;
% cuts the signal into frames
[M,nf]=windowize(y,windowLength,windowLength/2);
Z=zeros(1,nf);
E=zeros(1,nf);
for j=1:nf % for each frame compute ZCR and Energy
    Z(j) = feature_zcr(M(:,j));
    E(j) = feature_energy(M(:,j));
end