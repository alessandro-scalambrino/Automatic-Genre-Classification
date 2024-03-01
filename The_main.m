clear all; close all
clc
addpath(genpath(pwd));


disp("Choose between one of these options: ")
fprintf('\n')
disp("1. Using first group (Frame: 20ms) ")
disp("2. Using second group (Frame: 40ms) ")
disp("3. Using third group (Frame: 100ms) ")

fprintf('\n')


selection = input("Insert choice: ");

if selection < 1 || selection > 3
    disp("Operation not valid: choose between 1 and 3...")
    return
end


switch selection
    case 1
        load('trainAmbient_1.mat');
        load('trainMinimal_1.mat');
        load('trainHouse_1.mat');
        
        load('testAmbient_1.mat');
        load('testMinimal_1.mat');
        load('testHouse_1.mat');
        
        labelAmbient = repmat(1,1,length(trainAmbient_1));
        labelMinimal = repmat(2,1,length(trainMinimal_1));
        labelHouse = repmat(3,1,length(trainHouse_1));
        
        testlabelAmbient = repmat(1,1,length(testAmbient_1));
        testlabelMinimal = repmat(2,1,length(testMinimal_1));
        testlabelHouse = repmat(3,1,length(testHouse_1));
        
        all_train = [trainAmbient_1 trainMinimal_1 trainHouse_1];
        all_test = [testAmbient_1 testMinimal_1 testHouse_1];
    case 2
        load('trainAmbient_2.mat');
        load('trainMinimal_2.mat');
        load('trainHouse_2.mat');
        
        load('testAmbient_2.mat');
        load('testMinimal_2.mat');
        load('testHouse_2.mat');
        
        labelAmbient = repmat(1,1,length(trainAmbient_2));
        labelMinimal = repmat(2,1,length(trainMinimal_2));
        labelHouse = repmat(3,1,length(trainHouse_2));
        
        testlabelAmbient = repmat(1,1,length(testAmbient_2));
        testlabelMinimal = repmat(2,1,length(testMinimal_2));
        testlabelHouse = repmat(3,1,length(testHouse_2));
        
        all_train = [trainAmbient_2 trainMinimal_2 trainHouse_2];
        all_test = [testAmbient_2 testMinimal_2 testHouse_2];
    case 3
        load('trainAmbient_3.mat');
        load('trainMinimal_3.mat');
        load('trainHouse_3.mat');
        
        load('testAmbient_3.mat');
        load('testMinimal_3.mat');
        load('testHouse_3.mat');
        
        labelAmbient = repmat(1,1,length(trainAmbient_3));
        labelMinimal = repmat(2,1,length(trainMinimal_3));
        labelHouse = repmat(3,1,length(trainHouse_3));
        
        testlabelAmbient = repmat(1,1,length(testAmbient_3));
        testlabelMinimal = repmat(2,1,length(testMinimal_3));
        testlabelHouse = repmat(3,1,length(testHouse_3));
        
        all_train = [trainAmbient_3 trainMinimal_3 trainHouse_3];
        all_test = [testAmbient_3 testMinimal_3 testHouse_3];
    
end





all_labels = [labelAmbient labelMinimal labelHouse];


test_labels = [testlabelAmbient testlabelMinimal testlabelHouse];


rate_time = [];


rate_frequency = [];


rate_altogether = [];

fprintf('\n')
disp("--------")

k=[1 2 4 8 10 20];

for kk = 1:length(k)
    disp(['set-up the kNN for time domain features... number of neighbors: ',mat2str(k(kk))])
    Mdl = fitcknn(all_train(17:end,:)',all_labels','NumNeighbors',k(kk));
   
    predicted_label = predict(Mdl,all_test(17:end,:)');
   
    correct = 0;
    for i=1:length(predicted_label)
        if predicted_label(i)==test_labels(i)
            correct = correct + 1;
        end
    end
    rate_time(kk) = (correct/length(predicted_label))*100;
    disp(['recognition rate: ',mat2str(rate_time(kk)),'%'])
    fprintf('\n')
    
    disp(['set-up the kNN for frequency domain features... number of neighbors: ',mat2str(k(kk))])
    Mdl = fitcknn(all_train(1:16,:)',all_labels','NumNeighbors',k(kk));
   
    predicted_label = predict(Mdl,all_test(1:16,:)');
   
    correct = 0;
    for i=1:length(predicted_label)
        if predicted_label(i)==test_labels(i)
            correct = correct + 1;
        end
    end
    rate_frequency(kk) = (correct/length(predicted_label))*100;
    disp(['recognition rate: ',mat2str(rate_frequency(kk)),'%'])
    fprintf('\n')
    
    disp(['set-up the kNN for time and frequency domain features... number of neighbors: ',mat2str(k(kk))])
    Mdl = fitcknn(all_train',all_labels','NumNeighbors',k(kk));
   
    predicted_label = predict(Mdl,all_test');
   
    correct = 0;
    for i=1:length(predicted_label)
        if predicted_label(i)==test_labels(i)
            correct = correct + 1;
        end
    end
    rate_altogether(kk) = (correct/length(predicted_label))*100;
    disp(['recognition rate: ',mat2str(rate_altogether(kk)),'%'])
    if kk < length(k)
        fprintf('\n')
    end
end


[max_rate_time,b_rate_time]=max(rate_time);
min_rate_time = min(rate_time);


[max_rate_frequency,b_rate_frequency]=max(rate_frequency);
min_rate_frequency = min(rate_frequency);

[max_rate_altogether,b_rate_altogether]=max(rate_altogether);
min_rate_altogether = min(rate_altogether);
    
%plotting 
figure
subplot(3,1,1)
scatter(k,rate_time,'filled')
ylim([(min_rate_time-0.5) (max_rate_time+0.5)])
xlabel('k Nearest Neighbour')
ylabel('Rate(%)')
set(gca,"XTick",k)
title('Time Domain Features','FontSize',12)
subplot(3,1,2)
scatter(k,rate_frequency,'filled')
ylim([(min_rate_frequency-0.5) (max_rate_frequency+0.5)])
xlabel('k Nearest Neighbour')
ylabel('Rate(%)')
set(gca,"XTick",k)
title('Frequency Domain Features','FontSize',12)
subplot(3,1,3)
scatter(k,rate_altogether,'filled')
ylim([(min_rate_frequency-0.5) (max_rate_altogether+0.5)])
xlabel('k Nearest Neighbour')
ylabel('Rate(%)')
set(gca,"XTick",k)
title('Time and Frequency Domain Features','FontSize',12)
set(gcf,'position',[15,15,850,700])

disp("--------")
fprintf('\n')

%printing results
disp("Final Results")
fprintf('\n')
disp("Time Domain:")
disp(['Maximum rate: ',mat2str(max_rate_time), '% ...achieved with ',mat2str(k(b_rate_time)),' nearest neighbors'])
fprintf('\n')
disp("Frequency Domain:")
disp(['Maximum rate: ',mat2str(max_rate_frequency), '% ...achieved with ',mat2str(k(b_rate_frequency)),' nearest neighbors'])
fprintf('\n')
disp("Frequency and Time Domain:")
disp(['Maximum rate: ',mat2str(max_rate_altogether), '% ...achieved with ',mat2str(k(b_rate_altogether)),' nearest neighbors'])
fprintf('\n')
disp("Performances plottes")
fprintf('\n')
disp("--------")

