function features = extract_from_path_mfccs(C:\Users\alessandro duske\Desktop\GENRES CLASSIFICATION\Songs,extension,windowLength,stepLength)
addpath(genpath(path))
files = dir([path,'*.',extension]);
features=[];
for i=1:length(files)
    ceps = all_features(files(i).name,windowLength,stepLength);
    
end