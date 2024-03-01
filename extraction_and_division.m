addpath(genpath(pwd))

%extracting features from the songs

cepsAmbient_1 = all_features('Ambient1.wav');
cepsMinimal_1 = all_features('Minimal1.wav');
cepsHouse_1 = all_features('House1.wav');

cepsAmbient_2 = all_features_2('Ambient2.wav');
cepsMinimal_2 = all_features_2('Minimal2.wav');
cepsHouse_2 = all_features_2('House2.wav');

cepsAmbient_3 = all_features_3('Ambient3.wav');
cepsMinimal_3 = all_features_3('Minimal3.wav');
cepsHouse_3 = all_features_3('House3.wav');

cepsAmbient_4 = all_features('Ambient4.wav');
cepsMinimal_4 = all_features('Minimal4.wav');
cepsHouse_4 = all_features('House4.wav');

cepsAmbient_5 = all_features_2('Ambient5.wav');
cepsMinimal_5 = all_features_2('Minimal5.wav');
cepsHouse_5 = all_features_2('House5.wav');

cepsAmbient_6 = all_features_3('Ambient6.wav');
cepsMinimal_6 = all_features_3('Minimal6.wav');
cepsHouse_6 = all_features_3('House6.wav');

%----------------------------------------------------------------

% use half of the data for training files

trainAmbient_1 = cepsAmbient_1; 
trainMinimal_1 = cepsMinimal_1;
trainHouse_1 = cepsHouse_1;

trainAmbient_2 = cepsAmbient_2; 
trainMinimal_2 = cepsMinimal_2;
trainHouse_2 = cepsHouse_2;

trainAmbient_3 = cepsAmbient_3; 
trainMinimal_3 = cepsMinimal_3;
trainHouse_3 = cepsHouse_3;



%----------------------------------------------------------------

% define the test data

testAmbient_1 = cepsAmbient_4; 
testMinimal_1 = cepsMinimal_4;
testHouse_1 = cepsHouse_4;

testAmbient_2 = cepsAmbient_5; 
testMinimal_2 = cepsMinimal_5;
testHouse_2 = cepsHouse_5;

testAmbient_3 = cepsAmbient_6; 
testMinimal_3 = cepsMinimal_6;
testHouse_3 = cepsHouse_6;


%----------------------------------------------------------------