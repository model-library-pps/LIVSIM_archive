%------------------Processing_Output of LIVSIM-stochastic------------------
% This file runs livsim a number of times (variable:numberoftimes)
%
% version March 2010 --Mink Zijlstra
%--------------------------------------------------------------------------

clear
milk_allowance=0.825; %Fraction of the produced milk that is given to the calf.
numberoftimes=50;
storematrix=[]; %zeros(numberoftimes,55,10,144);
counter=1;
save counter.mat counter numberoftimes
save param.mat milk_allowance
FeedInput=xlsread('Feed_Input.xls', 'data', 'd13:r102');
save feed_input.mat FeedInput

while counter<=numberoftimes
    
    counter
    run_livsim_scenario
    fclose('all');
    
    [OUTPUT]=save_outputCOWS(outputCOWS);
    save settings_run.mat OUTPUT FORAGES CONCENTRATE
     
    load counter.mat
    keep_settings_1
    
    counter=counter+1;
    save counter.mat counter -append
end
keep_settings_3

for i=1:numberoftimes
    delete(['save_startmonth',int2str(i),'.mat']);
end

for i=1:12
    delete(['temp_month',int2str(i),'.mat']);
end

tic
count_generations
toc
tic
summarise_output_mean
toc
tic
write_output_mean
toc
tic
sum_intake_mean
toc

nico