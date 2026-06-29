clear all

if exist('summarised_output_agemax.mat','file')>0
    delete summarised_output_agemax.mat
end
save summarised_output_agemax.mat

if exist('summarised_output_bw.mat','file')>0
    delete summarised_output_bw.mat
end
save summarised_output_bw.mat

if exist('summarised_output_mi.mat','file')>0
    delete summarised_output_mi.mat
end
save summarised_output_mi.mat

if exist('summarised_output_mp.mat','file')>0
    delete summarised_output_mp.mat
end
save summarised_output_mp.mat

if exist('summarised_output_nbcalv.mat','file')>0
    delete summarised_output_nbcalv.mat
end
save summarised_output_nbcalv.mat

if exist('summarised_output_age_fc.mat','file')>0
    delete summarised_output_age_fc.mat
end
save summarised_output_age_fc.mat

if exist('summarised_output_calvint.mat','file')>0
    delete summarised_output_calvint.mat
end
save summarised_output_calvint.mat

if exist('summarised_output_dead.mat','file')>0
    delete summarised_output_dead.mat
end
save summarised_output_dead.mat

if exist('summarised_output_runs.mat','file')>0
    delete summarised_output_runs.mat
end
save summarised_output_runs.mat

%--MOTHERS
clear all
load MOTHERS.mat
load counter.mat numberoftimes
load param.mat
runs=0;
store_runs   =[];
store_agemax  =[];
store_bw      =[];
store_mi      =[];
store_mp      =[];
store_nbcalv  =[];
store_age_fc  =[];
dead_time     =[];
store_calvint =[];
store_dead    =[];

for i=1:numberoftimes
    runs=runs+1;
    
    age     =eval(['RUN',int2str(i),'.OUTPUT(3,:)']);
    bw      =eval(['RUN',int2str(i),'.OUTPUT(4,:)']);
    mp      =eval(['RUN',int2str(i),'.OUTPUT(9,:)']);
    mi      =eval(['RUN',int2str(i),'.OUTPUT(7,:)']);
    nbcalv  =eval(['RUN',int2str(i),'.OUTPUT(11,:)']);
    age_fc  =eval(['RUN',int2str(i),'.OUTPUT(12,:)']);
    age_lc  =eval(['RUN',int2str(i),'.OUTPUT(13,:)']);
    dead    =eval(['RUN',int2str(i),'.OUTPUT(14,:)']);
    
    store_runs(runs,:)    =i;
    store_agemax(runs,:)  =max(age);                                    % age
    store_bw(runs,:)      =bw;                                          % body weight
    store_mi(runs,:)      =mi;                                          % milk intake
    store_mp(runs,:)      =mp;                                          % milk production
    store_nbcalv(runs,:)  =max(nbcalv);                                 % number of calves
    store_age_fc(runs,:)  =max(age_fc);                                 % age at first calving
    dead_time(runs,:)     =dead;
    if max(nbcalv)>1;
        store_calvint(runs,:) =(max(age_lc)-max(age_fc))/(max(nbcalv)-1); % calving interval
    else
        store_calvint(runs,:)=NaN;
    end
    if max(dead)>0
        store_dead(runs,:)=1;
    else
        store_dead(runs,:)=0;
    end
end

v1=genvarname('M_agemax');
v2=genvarname('M_bw');
v3=genvarname('M_mi');
v4=genvarname('M_mp');
v5=genvarname('M_nbcalv');
v6=genvarname('M_age_fc');
v7=genvarname('M_calvint');
v8=genvarname('M_dead');
v9=genvarname('M_dead_time');
v10=genvarname('M_runs');

eval([v1 '=store_agemax;'])
eval([v2 '=store_bw;'])
eval([v3 '=store_mi;'])
eval([v4 '=store_mp;'])
eval([v5 '=store_nbcalv;'])
eval([v6 '=store_age_fc;'])
eval([v7 '=store_calvint;'])
eval([v8 '=store_dead;'])
eval([v9 '=dead_time;'])
eval([v10 '=store_runs;'])

save('summarised_output_agemax.mat',('M_agemax'),'-append')
save('summarised_output_bw.mat',('M_bw'),'-append')
save('summarised_output_mi.mat',('M_mi'),'-append')
save('summarised_output_mp.mat',('M_mp'),'-append')
save('summarised_output_nbcalv.mat',('M_nbcalv'),'-append')
save('summarised_output_age_fc.mat',('M_age_fc'),'-append')
save('summarised_output_calvint.mat',('M_calvint'),'-append')
save('summarised_output_dead',('M_dead'),'-append')
save('summarised_output_dead',('M_dead_time'),'-append')
save('summarised_output_runs.mat',('M_runs'),'-append')

%--DAUGHTERS
clear all
load counter.mat numberoftimes
h=1;
while h<=10
    
    if exist(['DAUGHTERS',int2str(h),'.mat'],'file')>0
        load(['DAUGHTERS',int2str(h),'.mat']);
        runs=0;
        store_runs   =[];
        store_agemax  =[];
        store_bw      =[];
        store_mi      =[];
        store_mp      =[];
        store_nbcalv  =[];
        store_age_fc  =[];
        dead_time     =[];
        store_calvint =[];
        store_dead    =[];
        
        for i=1:numberoftimes
            if exist(['RUN',int2str(i)],'var')>0
                runs=runs+1;
                
                age     =eval(['RUN',int2str(i),'.OUTPUT(3,:)']);
                bw      =eval(['RUN',int2str(i),'.OUTPUT(4,:)']);
                mp      =eval(['RUN',int2str(i),'.OUTPUT(9,:)']);
                mi      =eval(['RUN',int2str(i),'.OUTPUT(7,:)']);
                nbcalv  =eval(['RUN',int2str(i),'.OUTPUT(11,:)']);
                age_fc  =eval(['RUN',int2str(i),'.OUTPUT(12,:)']);
                age_lc  =eval(['RUN',int2str(i),'.OUTPUT(13,:)']);
                dead    =eval(['RUN',int2str(i),'.OUTPUT(14,:)']);
                
                store_runs(runs,:)    =i;
                store_agemax(runs,:)  =max(age);                                  % age
                store_bw(runs,:)      =bw;                                        % body weight
                store_mi(runs,:)      =mi;                                        % milk intake
                store_mp(runs,:)      =mp;                                        % milk production
                store_nbcalv(runs,:)  =max(nbcalv);                               % number of calves
                store_age_fc(runs,:)  =max(age_fc);                               % age at first calving
                dead_time(runs,:)     =dead;
                
                if max(nbcalv)>1;
                    store_calvint(runs,:) =(max(age_lc)-max(age_fc))/(max(nbcalv)-1); % calving interval
                else
                    store_calvint(runs,:)=NaN;
                end
                if max(dead)>0
                    store_dead(runs,:)=1;
                else
                    store_dead(runs,:)=0;
                end
            end
        end
        %         runs
        %         pause
        
        v1=genvarname(['D',int2str(h),'_agemax']);
        v2=genvarname(['D',int2str(h),'_bw']);
        v3=genvarname(['D',int2str(h),'_mi']);
        v4=genvarname(['D',int2str(h),'_mp']);
        v5=genvarname(['D',int2str(h),'_nbcalv']);
        v6=genvarname(['D',int2str(h),'_age_fc']);
        v7=genvarname(['D',int2str(h),'_calvint']);
        v8=genvarname(['D',int2str(h),'_dead']);
        v9=genvarname(['D',int2str(h),'_dead_time']);
        v10=genvarname(['D',int2str(h),'_runs']);
        
        eval([v1 '=store_agemax;'])
        eval([v2 '=store_bw;'])
        eval([v3 '=store_mi;'])
        eval([v4 '=store_mp;'])
        eval([v5 '=store_nbcalv;'])
        eval([v6 '=store_age_fc;'])
        eval([v7 '=store_calvint;'])
        eval([v8 '=store_dead;'])
        eval([v9 '=dead_time;'])
        eval([v10 '=store_runs;'])
        
        save('summarised_output_agemax.mat',(['D',int2str(h),'_agemax']),'-append')
        save('summarised_output_bw.mat',(['D',int2str(h),'_bw']),'-append')
        save('summarised_output_mi.mat',(['D',int2str(h),'_mi']),'-append')
        save('summarised_output_mp.mat',(['D',int2str(h),'_mp']),'-append')
        save('summarised_output_nbcalv.mat',(['D',int2str(h),'_nbcalv']),'-append')
        save('summarised_output_age_fc.mat',(['D',int2str(h),'_age_fc']),'-append')
        save('summarised_output_calvint.mat',(['D',int2str(h),'_calvint']),'-append')
        save('summarised_output_dead',(['D',int2str(h),'_dead']),'-append')
        save('summarised_output_dead',(['D',int2str(h),'_dead_time']),'-append')
        save('summarised_output_runs.mat',(['D',int2str(h),'_runs']),'-append')
    end
    
    h=h+1;
    save counter.mat h -append
    
    clear all
    load counter.mat h numberoftimes
    
end

%--SONS
clear all
load counter.mat numberoftimes
h=1;
while h<=10
    
    if exist(['SONS',int2str(h),'.mat'],'file')>0
        load(['SONS',int2str(h),'.mat']);
        runs=0;
        store_runs   =[];
        store_agemax =[];
        store_bw     =[];
        store_mi     =[];
        dead_time    =[];
        store_dead   =[];
        
        for i=1:numberoftimes
            if exist(['RUN',int2str(i)],'var')>0
                runs=runs+1;
                
                age     =eval(['RUN',int2str(i),'.OUTPUT(3,:)']);
                bw      =eval(['RUN',int2str(i),'.OUTPUT(4,:)']);
                mi      =eval(['RUN',int2str(i),'.OUTPUT(7,:)']);
                dead    =eval(['RUN',int2str(i),'.OUTPUT(14,:)']);
                
                store_runs(runs,:)    =i;
                store_agemax(runs,:)  =max(age);                                  % age
                store_bw(runs,:)      =bw;                                        % body weight
                store_mi(runs,:)      =mi;
                dead_time(runs,:)     =dead;
                if max(dead)>0
                    store_dead(runs,:)=1;
                else
                    store_dead(runs,:)=0;
                end
                
            end
        end
        
        v1=genvarname(['S',int2str(h),'_agemax']);
        v2=genvarname(['S',int2str(h),'_bw']);
        v3=genvarname(['S',int2str(h),'_dead']);
        v4=genvarname(['S',int2str(h),'_mi']);
        v5=genvarname(['S',int2str(h),'_runs']);
        v9=genvarname(['S',int2str(h),'_dead_time']);
        
        eval([v1 '=store_agemax;'])
        eval([v2 '=store_bw;'])
        eval([v3 '=store_dead;'])
        eval([v4 '=store_mi;'])
        eval([v5 '=store_runs;'])
        eval([v9 '=dead_time;'])
        
        save('summarised_output_agemax.mat',(['S',int2str(h),'_agemax']),'-append')
        save('summarised_output_bw.mat',(['S',int2str(h),'_bw']),'-append')
        save('summarised_output_mi.mat',(['S',int2str(h),'_mi']),'-append')
        save('summarised_output_dead',(['S',int2str(h),'_dead']),'-append')
        save('summarised_output_dead',(['S',int2str(h),'_dead_time']),'-append')
        save('summarised_output_runs.mat',(['S',int2str(h),'_runs']),'-append')
    end
    
    h=h+1;
    save counter.mat h -append
    
    clear all
    load counter.mat h numberoftimes
    
end

%--GRANDDAUGHTERS
clear all
load counter.mat numberoftimes
h=1;
while h<=10
    
    if exist(['GDAUGHTERS',int2str(h),'.mat'],'file')>0
        load(['GDAUGHTERS',int2str(h),'.mat']);
        runs=0;
        store_runs   =[];
        store_agemax  =[];
        store_bw      =[];
        store_mi      =[];
        store_mp      =[];
        store_nbcalv  =[];
        store_age_fc  =[];
        dead_time     =[];
        store_calvint =[];
        store_dead    =[];
        
        for i=1:numberoftimes
            if exist(['RUN',int2str(i)],'var')>0
                runs=runs+1;
                
                age     =eval(['RUN',int2str(i),'.OUTPUT(3,:)']);
                bw      =eval(['RUN',int2str(i),'.OUTPUT(4,:)']);
                mp      =eval(['RUN',int2str(i),'.OUTPUT(9,:)']);
                mi      =eval(['RUN',int2str(i),'.OUTPUT(7,:)']);
                nbcalv  =eval(['RUN',int2str(i),'.OUTPUT(11,:)']);
                age_fc  =eval(['RUN',int2str(i),'.OUTPUT(12,:)']);
                age_lc  =eval(['RUN',int2str(i),'.OUTPUT(12,:)']);
                dead    =eval(['RUN',int2str(i),'.OUTPUT(14,:)']);
                
                store_runs(runs,:)    =i;
                store_agemax(runs,:)  =max(age);                                  % age
                store_bw(runs,:)      =bw;                                        % body weight
                store_mi(runs,:)      =mi;                                        % milk intake
                store_mp(runs,:)      =mp;                                        % milk production
                store_nbcalv(runs,:)  =max(nbcalv);                               % number of calves
                store_age_fc(runs,:)  =max(age_fc);                               % age at first calving
                dead_time(runs,:)     =dead;
                
                if max(nbcalv)>1;
                    store_calvint(runs,:) =(max(age_lc)-max(age_fc))/(max(nbcalv)-1); % calving interval
                else
                    store_calvint(runs,:)=NaN;
                end
                if max(dead)>0
                    store_dead(runs,:)=1;
                else
                    store_dead(runs,:)=0;
                end
            end
        end
        
        v1=genvarname(['GD',int2str(h),'_agemax']);
        v2=genvarname(['GD',int2str(h),'_bw']);
        v3=genvarname(['GD',int2str(h),'_mi']);
        v4=genvarname(['GD',int2str(h),'_mp']);
        v5=genvarname(['GD',int2str(h),'_nbcalv']);
        v6=genvarname(['GD',int2str(h),'_age_fc']);
        v7=genvarname(['GD',int2str(h),'_calvint']);
        v8=genvarname(['GD',int2str(h),'_dead']);
        v9=genvarname(['GD',int2str(h),'_dead_time']);
        v10=genvarname(['GD',int2str(h),'_runs']);
        
        eval([v1 '=store_agemax;'])
        eval([v2 '=store_bw;'])
        eval([v3 '=store_mi;'])
        eval([v4 '=store_mp;'])
        eval([v5 '=store_nbcalv;'])
        eval([v6 '=store_age_fc;'])
        eval([v7 '=store_calvint;'])
        eval([v8 '=store_dead;'])
        eval([v9 '=dead_time;'])
        eval([v10 '=store_runs;'])
        
        save('summarised_output_agemax.mat',(['GD',int2str(h),'_agemax']),'-append')
        save('summarised_output_bw.mat',(['GD',int2str(h),'_bw']),'-append')
        save('summarised_output_mi.mat',(['GD',int2str(h),'_mi']),'-append')
        save('summarised_output_mp.mat',(['GD',int2str(h),'_mp']),'-append')
        save('summarised_output_nbcalv.mat',(['GD',int2str(h),'_nbcalv']),'-append')
        save('summarised_output_age_fc.mat',(['GD',int2str(h),'_age_fc']),'-append')
        save('summarised_output_calvint.mat',(['GD',int2str(h),'_calvint']),'-append')
        save('summarised_output_dead',(['GD',int2str(h),'_dead']),'-append')
        save('summarised_output_dead',(['GD',int2str(h),'_dead_time']),'-append')
        save('summarised_output_runs.mat',(['GD',int2str(h),'_runs']),'-append')
    end
    
    h=h+1;
    save counter.mat h -append
    
    clear all
    load counter.mat h numberoftimes
    
end

%--GRANDSONS
clear all
load counter.mat numberoftimes
h=1;
while h<=10
    
    if exist(['GSONS',int2str(h),'.mat'],'file')>0
        load(['GSONS',int2str(h),'.mat']);
        runs=0;
        store_runs   =[];
        store_agemax =[];
        store_bw     =[];
        store_mi     =[];
        dead_time    =[];
        store_dead   =[];
        
        for i=1:numberoftimes
            if exist(['RUN',int2str(i)],'var')>0
                runs=runs+1;
                
                age     =eval(['RUN',int2str(i),'.OUTPUT(3,:)']);
                bw      =eval(['RUN',int2str(i),'.OUTPUT(4,:)']);
                mi      =eval(['RUN',int2str(i),'.OUTPUT(7,:)']);
                dead    =eval(['RUN',int2str(i),'.OUTPUT(14,:)']);
                
                store_runs(runs,:)    =i;
                store_agemax(runs,:)  =max(age);                                  % age
                store_bw(runs,:)      =bw;                                        % body weight
                store_mi(runs,:)      =mi;
                dead_time(runs,:)     =dead;
                if max(dead)>0
                    store_dead(runs,:)=1;
                else
                    store_dead(runs,:)=0;
                end
            end
        end
        
        v1=genvarname(['GS',int2str(h),'_agemax']);
        v2=genvarname(['GS',int2str(h),'_bw']);
        v3=genvarname(['GS',int2str(h),'_dead']);
        v4=genvarname(['GS',int2str(h),'_mi']);
        v5=genvarname(['GS',int2str(h),'_runs']);
        v9=genvarname(['GS',int2str(h),'_dead_time']);
        
        eval([v1 '=store_agemax;'])
        eval([v2 '=store_bw;'])
        eval([v3 '=store_dead;'])
        eval([v4 '=store_mi;'])
        eval([v5 '=store_runs;'])
        eval([v9 '=dead_time;'])
        
        save('summarised_output_agemax.mat',(['GS',int2str(h),'_agemax']),'-append')
        save('summarised_output_bw.mat',(['GS',int2str(h),'_bw']),'-append')
        save('summarised_output_mi.mat',(['GS',int2str(h),'_mi']),'-append')
        save('summarised_output_dead',(['GS',int2str(h),'_dead']),'-append')
        save('summarised_output_dead',(['GS',int2str(h),'_dead_time']),'-append')
        save('summarised_output_runs.mat',(['GS',int2str(h),'_runs']),'-append')
    end
    
    h=h+1;
    save counter.mat h -append
    
    clear all
    load counter.mat h numberoftimes
    
end

%--GREATGRANDDAUGHTERS
clear all
load counter.mat numberoftimes
h=1;
while h<=10
    
    if exist(['GGDAUGHTERS',int2str(h),'.mat'],'file')>0
        load(['GGDAUGHTERS',int2str(h),'.mat']);
        runs=0;
        store_runs   =[];
        store_agemax  =[];
        store_bw      =[];
        store_mi      =[];
        store_mp      =[];
        store_nbcalv  =[];
        store_age_fc  =[];
        dead_time     =[];
        store_calvint =[];
        store_dead    =[];
        
        for i=1:numberoftimes
            if exist(['RUN',int2str(i)],'var')>0
                runs=runs+1;
                
                age     =eval(['RUN',int2str(i),'.OUTPUT(3,:)']);
                bw      =eval(['RUN',int2str(i),'.OUTPUT(4,:)']);
                mp      =eval(['RUN',int2str(i),'.OUTPUT(9,:)']);
                mi      =eval(['RUN',int2str(i),'.OUTPUT(7,:)']);
                nbcalv  =eval(['RUN',int2str(i),'.OUTPUT(11,:)']);
                age_fc  =eval(['RUN',int2str(i),'.OUTPUT(12,:)']);
                age_lc  =eval(['RUN',int2str(i),'.OUTPUT(13,:)']);
                dead    =eval(['RUN',int2str(i),'.OUTPUT(14,:)']);
                
                store_runs(runs,:)    =i;
                store_agemax(runs,:)  =max(age);                                  % age
                store_bw(runs,:)      =bw;                                        % body weight
                store_mi(runs,:)      =mi;                                        % milk intake
                store_mp(runs,:)      =mp;                                        % milk production
                store_nbcalv(runs,:)  =max(nbcalv);                               % number of calves
                store_age_fc(runs,:)  =max(age_fc);                               % age at first calving
                dead_time(runs,:)     =dead;
                if max(nbcalv)>1;
                    store_calvint(runs,:) =(max(age_lc)-max(age_fc))/(max(nbcalv)-1); % calving interval
                else
                    store_calvint(runs,:)=NaN;
                end
                if max(dead)>0
                    store_dead(runs,:)=1;
                else
                    store_dead(runs,:)=0;
                end
            end
        end
        
        v1=genvarname(['GGD',int2str(h),'_agemax']);
        v2=genvarname(['GGD',int2str(h),'_bw']);
        v3=genvarname(['GGD',int2str(h),'_mi']);
        v4=genvarname(['GGD',int2str(h),'_mp']);
        v5=genvarname(['GGD',int2str(h),'_nbcalv']);
        v6=genvarname(['GGD',int2str(h),'_age_fc']);
        v7=genvarname(['GGD',int2str(h),'_calvint']);
        v8=genvarname(['GGD',int2str(h),'_dead']);
        v9=genvarname(['GGD',int2str(h),'_dead_time']);
        v10=genvarname(['GGD',int2str(h),'_runs']);
        
        eval([v1 '=store_agemax;'])
        eval([v2 '=store_bw;'])
        eval([v3 '=store_mi;'])
        eval([v4 '=store_mp;'])
        eval([v5 '=store_nbcalv;'])
        eval([v6 '=store_age_fc;'])
        eval([v7 '=store_calvint;'])
        eval([v8 '=store_dead;'])
        eval([v9 '=dead_time;'])
        eval([v10 '=store_runs;'])
        
        save('summarised_output_agemax.mat',(['GGD',int2str(h),'_agemax']),'-append')
        save('summarised_output_bw.mat',(['GGD',int2str(h),'_bw']),'-append')
        save('summarised_output_mi.mat',(['GGD',int2str(h),'_mi']),'-append')
        save('summarised_output_mp.mat',(['GGD',int2str(h),'_mp']),'-append')
        save('summarised_output_nbcalv.mat',(['GGD',int2str(h),'_nbcalv']),'-append')
        save('summarised_output_age_fc.mat',(['GGD',int2str(h),'_age_fc']),'-append')
        save('summarised_output_calvint.mat',(['GGD',int2str(h),'_calvint']),'-append')
        save('summarised_output_dead',(['GGD',int2str(h),'_dead']),'-append')
        save('summarised_output_dead',(['GGD',int2str(h),'_dead_time']),'-append')
        save('summarised_output_runs.mat',(['GGD',int2str(h),'_runs']),'-append')
    end
    
    h=h+1;
    save counter.mat h -append
    
    clear all
    load counter.mat h numberoftimes
    
end

%--GREATGRANDSONS
clear all
load counter.mat numberoftimes
h=1;
while h<=10
    
    if exist(['GGSONS',int2str(h),'.mat'],'file')>0
        load(['GGSONS',int2str(h),'.mat']);
        runs=0;
        store_runs   =[];
        store_agemax =[];
        store_bw     =[];
        store_mi     =[];
        dead_time    =[];
        store_dead   =[];
        
        for i=1:numberoftimes
            if exist(['RUN',int2str(i)],'var')>0
                runs=runs+1;
                
                age     =eval(['RUN',int2str(i),'.OUTPUT(3,:)']);
                bw      =eval(['RUN',int2str(i),'.OUTPUT(4,:)']);
                mi      =eval(['RUN',int2str(i),'.OUTPUT(7,:)']);
                dead    =eval(['RUN',int2str(i),'.OUTPUT(14,:)']);
                
                store_runs(runs,:)    =i;
                store_agemax(runs,:)  =max(age);                                  % age
                store_bw(runs,:)      =bw;                                        % body weight
                store_mi(runs,:)      =mi;
                dead_time(runs,:)     =dead;
                if max(dead)>0
                    store_dead(runs,:)=1;
                else
                    store_dead(runs,:)=0;
                end
            end
        end
        
        v1=genvarname(['GGS',int2str(h),'_agemax']);
        v2=genvarname(['GGS',int2str(h),'_bw']);
        v3=genvarname(['GGS',int2str(h),'_dead']);
        v4=genvarname(['GGS',int2str(h),'_mi']);
        v5=genvarname(['GGS',int2str(h),'_runs']);
        v9=genvarname(['GGS',int2str(h),'_dead_time']);
        
        eval([v1 '=store_agemax;'])
        eval([v2 '=store_bw;'])
        eval([v3 '=store_dead;'])
        eval([v4 '=store_mi;'])
        eval([v5 '=store_runs;'])
        eval([v9 '=dead_time;'])
        
        save('summarised_output_agemax.mat',(['GGS',int2str(h),'_agemax']),'-append')
        save('summarised_output_bw.mat',(['GGS',int2str(h),'_bw']),'-append')
        save('summarised_output_mi.mat',(['GGS',int2str(h),'_mi']),'-append')
        save('summarised_output_dead',(['GGS',int2str(h),'_dead']),'-append')
        save('summarised_output_dead',(['GGS',int2str(h),'_dead_time']),'-append')
        save('summarised_output_runs.mat',(['GGS',int2str(h),'_runs']),'-append')
    end
    
    h=h+1;
    save counter.mat h -append
    
    clear all
    load counter.mat h numberoftimes
    
end

%-------------------------Age at first calving-----------------------------
clear all
load summarised_output_age_fc.mat
if exist('M_age_fc','var')>0
    k=M_age_fc>0;
    if isempty(M_age_fc(k))<0.5
        M_mean_age_fc=mean(M_age_fc(k));
        M_min_age_fc=min(M_age_fc(k));
        M_max_age_fc=max(M_age_fc(k));
    end
end

for i=1:10
    
    if exist(['D',int2str(i),'_age_fc'],'var')
        v1=genvarname(['D',int2str(i),'_mean_age_fc']);
        v2=genvarname(['D',int2str(i),'_min_age_fc']);
        v3=genvarname(['D',int2str(i),'_max_age_fc']);
        temp1=eval(['D',int2str(i),'_age_fc']);
        k=temp1>0;
        if isempty(temp1(k))<0.5
            eval([v1 '=mean(temp1(k));'])
            eval([v2 '=min(temp1(k));'])
            eval([v3 '=max(temp1(k));'])
        end
    end
    
    if exist(['GD',int2str(i),'_age_fc'],'var')
        v1=genvarname(['GD',int2str(i),'_mean_age_fc']);
        v2=genvarname(['GD',int2str(i),'_min_age_fc']);
        v3=genvarname(['GD',int2str(i),'_max_age_fc']);
        temp1=eval(['GD',int2str(i),'_age_fc']);
        k=temp1>0;
        if isempty(temp1(k))<0.5
            eval([v1 '=mean(temp1(k));'])
            eval([v2 '=min(temp1(k));'])
            eval([v3 '=max(temp1(k));'])
        end
    end
    
    if exist(['GGD',int2str(i),'_age_fc'],'var')
        v1=genvarname(['GGD',int2str(i),'_mean_age_fc']);
        v2=genvarname(['GGD',int2str(i),'_min_age_fc']);
        v3=genvarname(['GGD',int2str(i),'_max_age_fc']);
        temp1=eval(['GGD',int2str(i),'_age_fc']);
        k=temp1>0;
        if isempty(temp1(k))<0.5
            eval([v1 '=mean(temp1(k));'])
            eval([v2 '=min(temp1(k));'])
            eval([v3 '=max(temp1(k));'])
        end
    end
    
end
save summarised_output_age_fc.mat


%---------------------------Number of calves------------------------------
clear all
load summarised_output_nbcalv.mat
if exist('M_nbcalv','var')>0
    M_mean_nbcalv=mean(M_nbcalv);
    M_min_nbcalv=min(M_nbcalv);
    M_max_nbcalv=max(M_nbcalv);
end

for i=1:10
    if exist(['D',int2str(i),'_nbcalv'],'var')
        v1=genvarname(['D',int2str(i),'_mean_nbcalv']);
        v2=genvarname(['D',int2str(i),'_min_nbcalv']);
        v3=genvarname(['D',int2str(i),'_max_nbcalv']);
        temp1=eval(['D',int2str(i),'_nbcalv']);
        eval([v1 '=mean(temp1);'])
        eval([v2 '=min(temp1);'])
        eval([v3 '=max(temp1);'])
    end
    
    if exist(['GD',int2str(i),'_nbcalv'],'var')
        v1=genvarname(['GD',int2str(i),'_mean_nbcalv']);
        v2=genvarname(['GD',int2str(i),'_min_nbcalv']);
        v3=genvarname(['GD',int2str(i),'_max_nbcalv']);
        temp1=eval(['GD',int2str(i),'_nbcalv']);
        eval([v1 '=mean(temp1);'])
        eval([v2 '=min(temp1);'])
        eval([v3 '=max(temp1);'])
    end
    
    if exist(['GGD',int2str(i),'_nbcalv'],'var')
        v1=genvarname(['GGD',int2str(i),'_mean_nbcalv']);
        v2=genvarname(['GGD',int2str(i),'_min_nbcalv']);
        v3=genvarname(['GGD',int2str(i),'_max_nbcalv']);
        temp1=eval(['GGD',int2str(i),'_nbcalv']);
        eval([v1 '=mean(temp1);'])
        eval([v2 '=min(temp1);'])
        eval([v3 '=max(temp1);'])
    end
end
save summarised_output_nbcalv.mat

%----------------------------Calving interval------------------------------
clear all
load summarised_output_calvint.mat
if exist('M_calvint','var')>0
    k=~isnan(M_calvint);
    temp_M_calvint=M_calvint(k);
    k=temp_M_calvint>0;
    if isempty(temp_M_calvint)<0.5
        M_mean_calvint=mean(temp_M_calvint(k));
        M_min_calvint=min(temp_M_calvint(k));
        M_max_calvint=max(temp_M_calvint(k));
    end
end

for i=1:10
    
    if exist(['D',int2str(i),'_calvint'],'var')
        v1=genvarname(['D',int2str(i),'_mean_calvint']);
        v2=genvarname(['D',int2str(i),'_min_calvint']);
        v3=genvarname(['D',int2str(i),'_max_calvint']);
        temp1=eval(['D',int2str(i),'_calvint']);
        k=~isnan(temp1);
        temp1=temp1(k);
        k=temp1>0;
        if isempty(temp1(k))<0.5
            eval([v1 '=mean(temp1(k));'])
            eval([v2 '=min(temp1(k));'])
            eval([v3 '=max(temp1(k));'])
        end
    end
    
    if exist(['GD',int2str(i),'_calvint'],'var')
        v1=genvarname(['GD',int2str(i),'_mean_calvint']);
        v2=genvarname(['GD',int2str(i),'_min_calvint']);
        v3=genvarname(['GD',int2str(i),'_max_calvint']);
        temp1=eval(['GD',int2str(i),'_calvint']);
        k=~isnan(temp1);
        temp1=temp1(k);
        k=temp1>0;
        if isempty(temp1(k))<0.5
            eval([v1 '=mean(temp1(k));'])
            eval([v2 '=min(temp1(k));'])
            eval([v3 '=max(temp1(k));'])
        end
    end
    
    if exist(['GGD',int2str(i),'_calvint'],'var')
        v1=genvarname(['GGD',int2str(i),'_mean_calvint']);
        v2=genvarname(['GGD',int2str(i),'_min_calvint']);
        v3=genvarname(['GGD',int2str(i),'_max_calvint']);
        temp1=eval(['GGD',int2str(i),'_calvint']);
        k=~isnan(temp1);
        temp1=temp1(k);
        k=temp1>0;
        if isempty(temp1(k))<0.5
            eval([v1 '=mean(temp1(k));'])
            eval([v2 '=min(temp1(k));'])
            eval([v3 '=max(temp1(k));'])
        end
    end
    
end
save summarised_output_calvint.mat

%----------------------------Milk production-------------------------------
clear all
load summarised_output_mp.mat
if exist('M_mp','var')>0
    aux=M_mp;
    [n o]=size(aux);
    for j=1:o
        mean_mp(j,1)=mean(aux(:,j));
    end
    M_mean_mp=mean(sum(aux,2));
    M_mean_mp_time=mean_mp;
    M_min_mp=min(sum(aux,2));
    M_max_mp=max(sum(aux,2));
end

for i=1:10
    
    if exist(['D',int2str(i),'_mp'],'var')
        aux=eval(['D',int2str(i),'_mp']);
        [n o]=size(aux);
        for j=1:o
            mean_mp(j,1)=mean(aux(:,j));
        end
        v1=genvarname(['D',int2str(i),'_mean_mp']);
        v2=genvarname(['D',int2str(i),'_mean_mp_time']);
        v3=genvarname(['D',int2str(i),'_min_mp']);
        v4=genvarname(['D',int2str(i),'_max_mp']);
        eval([v1 '=mean(sum(aux,2));'])
        eval([v2 '=mean_mp;'])
        eval([v3 '=min(sum(aux,2));'])
        eval([v4 '=max(sum(aux,2));'])
    end
    
    if exist(['GD',int2str(i),'_mp'],'var')
        aux=eval(['GD',int2str(i),'_mp']);
        [n o]=size(aux);
        for j=1:o
            mean_mp(j,1)=mean(aux(:,j));
        end
        v1=genvarname(['GD',int2str(i),'_mean_mp']);
        v2=genvarname(['GD',int2str(i),'_mean_mp_time']);
        v3=genvarname(['GD',int2str(i),'_min_mp']);
        v4=genvarname(['GD',int2str(i),'_max_mp']);
        eval([v1 '=mean(sum(aux,2));'])
        eval([v2 '=mean_mp;'])
        eval([v3 '=min(sum(aux,2));'])
        eval([v4 '=max(sum(aux,2));'])
    end
    
    if exist(['GGD',int2str(i),'_mp'],'var')
        aux=eval(['GGD',int2str(i),'_mp']);
        [n o]=size(aux);
        for j=1:o
            mean_mp(j,1)=mean(aux(:,j));
        end
        v1=genvarname(['GGD',int2str(i),'_mean_mp']);
        v2=genvarname(['GGD',int2str(i),'_mean_mp_time']);
        v3=genvarname(['GGD',int2str(i),'_min_mp']);
        v4=genvarname(['GGD',int2str(i),'_max_mp']);
        eval([v1 '=mean(sum(aux,2));'])
        eval([v2 '=mean_mp;'])
        eval([v3 '=min(sum(aux,2));'])
        eval([v4 '=max(sum(aux,2));'])
    end
end
save summarised_output_mp.mat

%------------------------------Age max-------------------------------------
clear all
load summarised_output_agemax.mat
if exist('M_agemax','var')>0
    M_mean_agemax=mean(M_agemax);
    M_min_agemax=min(M_agemax);
    M_max_agemax=max(M_agemax);
end

for i=1:10
    
    if exist(['D',int2str(i),'_agemax'],'var')
        v1=genvarname(['D',int2str(i),'_mean_agemax']);
        v2=genvarname(['D',int2str(i),'_min_agemax']);
        v3=genvarname(['D',int2str(i),'_max_agemax']);
        temp1=eval(['D',int2str(i),'_agemax']);
        eval([v1 '=mean(temp1);'])
        eval([v2 '=min(temp1);'])
        eval([v3 '=max(temp1);'])
    end
    
    if exist(['S',int2str(i),'_agemax'],'var')
        v1=genvarname(['S',int2str(i),'_mean_agemax']);
        v2=genvarname(['S',int2str(i),'_min_agemax']);
        v3=genvarname(['S',int2str(i),'_max_agemax']);
        temp1=eval(['S',int2str(i),'_agemax']);
        eval([v1 '=mean(temp1);'])
        eval([v2 '=min(temp1);'])
        eval([v3 '=max(temp1);'])
    end
    
    if exist(['GD',int2str(i),'_agemax'],'var')
        v1=genvarname(['GD',int2str(i),'_mean_agemax']);
        v2=genvarname(['GD',int2str(i),'_min_agemax']);
        v3=genvarname(['GD',int2str(i),'_max_agemax']);
        temp1=eval(['GD',int2str(i),'_agemax']);
        eval([v1 '=mean(temp1);'])
        eval([v2 '=min(temp1);'])
        eval([v3 '=max(temp1);'])
    end
    
    if exist(['GS',int2str(i),'_agemax'],'var')
        v1=genvarname(['GS',int2str(i),'_mean_agemax']);
        v2=genvarname(['GS',int2str(i),'_min_agemax']);
        v3=genvarname(['GS',int2str(i),'_max_agemax']);
        temp1=eval(['GS',int2str(i),'_agemax']);
        eval([v1 '=mean(temp1);'])
        eval([v2 '=min(temp1);'])
        eval([v3 '=max(temp1);'])
    end
    
    if exist(['GGD',int2str(i),'_agemax'],'var')
        v1=genvarname(['GGD',int2str(i),'_mean_agemax']);
        v2=genvarname(['GGD',int2str(i),'_min_agemax']);
        v3=genvarname(['GGD',int2str(i),'_max_agemax']);
        temp1=eval(['GGD',int2str(i),'_agemax']);
        eval([v1 '=mean(temp1);'])
        eval([v2 '=min(temp1);'])
        eval([v3 '=max(temp1);'])
    end
    
    if exist(['GGS',int2str(i),'_agemax'],'var')
        v1=genvarname(['GGS',int2str(i),'_mean_agemax']);
        v2=genvarname(['GGS',int2str(i),'_min_agemax']);
        v3=genvarname(['GGS',int2str(i),'_max_agemax']);
        temp1=eval(['GGS',int2str(i),'_agemax']);
        eval([v1 '=mean(temp1);'])
        eval([v2 '=min(temp1);'])
        eval([v3 '=max(temp1);'])
    end
end
save summarised_output_agemax.mat

%------------------------------Body weight---------------------------------
clear all
load summarised_output_bw.mat
load summarised_output_dead.mat
if exist('M_bw','var')>0
    aux1=M_bw;
    aux2=M_dead_time;
    [n o]=size(aux1);
    for j=1:n
        bw(j,1)=aux1(j,o);
    end
    M_mean_bw=mean(bw);
    M_min_bw=min(bw);
    M_max_bw=max(bw);
    bw=[];
    for j=1:o
        bw(j,1)=mean(aux1(:,j));
    end
    k=isnan(bw);
    bw(k)=0;
    M_bw_time_all=bw;
    bw=[];
    for j=1:o
        k=aux2(:,j)<1;
        bw(j,1)=mean(aux1(k,j));
    end
    k=isnan(bw);
    bw(k)=0;
    M_bw_time_alive=bw;
end

for i=1:10
    
    if exist(['D',int2str(i),'_bw'],'var')
        bw=[];
        aux1=eval(['D',int2str(i),'_bw']);
        aux2=eval(['D',int2str(i),'_dead_time']);
        [n o]=size(aux1);
        for j=1:n
            bw(j,1)=aux1(j,o);
        end
        v1=genvarname(['D',int2str(i),'_mean_bw']);
        eval([v1 '=mean(bw);'])
        bw=[];
        for j=1:o
            bw(j,1)=mean(aux1(:,j));
        end
        k=isnan(bw);
        bw(k)=0;
        v2=genvarname(['D',int2str(i),'_bw_time_all']);
        eval([v2 '=bw;'])
        bw=[];
        for j=1:o
            k=aux2(:,j)<1 & aux1(:,j)>0;
            if isempty(aux1(k,j))<0.5
                bw(j,1)=mean(aux1(k,j));
            end
        end
        k=isnan(bw);
        bw(k)=0;
        v3=genvarname(['D',int2str(i),'_bw_time_alive']);
        eval([v3 '=bw;'])
    end
    
    if exist(['S',int2str(i),'_bw'],'var')
        bw=[];
        aux1=eval(['S',int2str(i),'_bw']);
        aux2=eval(['S',int2str(i),'_dead_time']);
        [n o]=size(aux1);
        for j=1:n
            bw(j,1)=aux1(j,o);
        end
        v1=genvarname(['S',int2str(i),'_mean_bw']);
        eval([v1 '=mean(bw);'])
        bw=[];
        for j=1:o
            bw(j,1)=mean(aux1(:,j));
        end
        k=isnan(bw);
        bw(k)=0;
        v2=genvarname(['S',int2str(i),'_bw_time_all']);
        eval([v2 '=bw;'])
        bw=[];
        for j=1:o
            k=aux2(:,j)<1 & aux1(:,j)>0;
            if isempty(aux1(k,j))<0.5
                bw(j,1)=mean(aux1(k,j));
            end
        end
        k=isnan(bw);
        bw(k)=0;
        v3=genvarname(['S',int2str(i),'_bw_time_alive']);
        eval([v3 '=bw;'])
    end
    
    if exist(['GD',int2str(i),'_bw'],'var')
        bw=[];
        aux1=eval(['GD',int2str(i),'_bw']);
        aux2=eval(['GD',int2str(i),'_dead_time']);
        [n o]=size(aux1);
        for j=1:n
            bw(j,1)=aux1(j,o);
        end
        v1=genvarname(['GD',int2str(i),'_mean_bw']);
        eval([v1 '=mean(bw);'])
        bw=[];
        for j=1:o
            bw(j,1)=mean(aux1(:,j));
        end
        k=isnan(bw);
        bw(k)=0;
        v2=genvarname(['GD',int2str(i),'_bw_time_all']);
        eval([v2 '=bw;'])
        bw=[];
        for j=1:o
            k=aux2(:,j)<1 & aux1(:,j)>0;
            if isempty(aux1(k,j))<0.5
                bw(j,1)=mean(aux1(k,j));
            end
        end
        k=isnan(bw);
        bw(k)=0;
        v3=genvarname(['GD',int2str(i),'_bw_time_alive']);
        eval([v3 '=bw;'])
    end
    
    if exist(['GS',int2str(i),'_bw'],'var')
        bw=[];
        aux1=eval(['GS',int2str(i),'_bw']);
        aux2=eval(['GS',int2str(i),'_dead_time']);
        [n o]=size(aux1);
        for j=1:n
            bw(j,1)=aux1(j,o);
        end
        v1=genvarname(['GS',int2str(i),'_mean_bw']);
        eval([v1 '=mean(bw);'])
        bw=[];
        for j=1:o
            bw(j,1)=mean(aux1(:,j));
        end
        k=isnan(bw);
        bw(k)=0;
        v2=genvarname(['GS',int2str(i),'_bw_time_all']);
        eval([v2 '=bw;'])
        bw=[];
        for j=1:o
            k=aux2(:,j)<1 & aux1(:,j)>0;
            if isempty(aux1(k,j))<0.5
                bw(j,1)=mean(aux1(k,j));
            end
        end
        k=isnan(bw);
        bw(k)=0;
        v3=genvarname(['GS',int2str(i),'_bw_time_alive']);
        eval([v3 '=bw;'])
    end
    
    if exist(['GGD',int2str(i),'_bw'],'var')
        bw=[];
        aux1=eval(['GGD',int2str(i),'_bw']);
        aux2=eval(['GGD',int2str(i),'_dead_time']);
        [n o]=size(aux1);
        for j=1:n
            bw(j,1)=aux1(j,o);
        end
        v1=genvarname(['GGD',int2str(i),'_mean_bw']);
        eval([v1 '=mean(bw);'])
        bw=[];
        for j=1:o
            bw(j,1)=mean(aux1(:,j));
        end
        k=isnan(bw);
        bw(k)=0;
        v2=genvarname(['GGD',int2str(i),'_bw_time_all']);
        eval([v2 '=bw;'])
        bw=[];
        for j=1:o
            k=aux2(:,j)<1 & aux1(:,j)>0;
            if isempty(aux1(k,j))<0.5
                bw(j,1)=mean(aux1(k,j));
            end
        end
        k=isnan(bw);
        bw(k)=0;
        v3=genvarname(['GGD',int2str(i),'_bw_time_alive']);
        eval([v3 '=bw;'])
    end
    
    if exist(['GGS',int2str(i),'_bw'],'var')
        bw=[];
        aux1=eval(['GGS',int2str(i),'_bw']);
        aux2=eval(['GGS',int2str(i),'_dead_time']);
        [n o]=size(aux1);
        for j=1:n
            bw(j,1)=aux1(j,o);
        end
        v1=genvarname(['GGS',int2str(i),'_mean_bw']);
        eval([v1 '=mean(bw);'])
        bw=[];
        for j=1:o
            bw(j,1)=mean(aux1(:,j));
        end
        k=isnan(bw);
        bw(k)=0;
        v2=genvarname(['GGS',int2str(i),'_bw_time_all']);
        eval([v2 '=bw;'])
        bw=[];
        for j=1:o
            k=aux2(:,j)<1 & aux1(:,j)>0;
            if isempty(aux1(k,j))<0.5
                bw(j,1)=mean(aux1(k,j));
            end
        end
        k=isnan(bw);
        bw(k)=0;
        v3=genvarname(['GGS',int2str(i),'_bw_time_alive']);
        eval([v3 '=bw;'])
    end
    
end
clear *dead*
save summarised_output_bw.mat

%------------------------------Milk intake---------------------------------
clear all
load summarised_output_mi.mat
if exist('M_mi','var')>0
    aux=M_mi;
    [n o]=size(aux);
    for j=1:o
        mean_mi(j,1)=mean(aux(:,j));
    end
    
    M_mean_mi=mean(sum(aux,2));
    M_min_mi=min(sum(aux,2));
    M_max_mi=max(sum(aux,2));
    M_mean_mi_time=mean_mi;
end

for i=1:10
    
    if exist(['D',int2str(i),'_mi'],'var')
        aux=eval(['D',int2str(i),'_mi']);
        [n o]=size(aux);
        for j=1:o
            mean_mi(j,1)=mean(aux(:,j));
        end
                
        v1=genvarname(['D',int2str(i),'_mean_mi']);
        v2=genvarname(['D',int2str(i),'_mean_mi_time']);
        v3=genvarname(['D',int2str(i),'_min_mi']);
        v4=genvarname(['D',int2str(i),'_max_mi']);
        eval([v1 '=mean(sum(aux,2));'])
        eval([v2 '=mean_mi;'])
        eval([v3 '=min(sum(aux,2));'])
        eval([v4 '=max(sum(aux,2));'])
    end
    
    if exist(['S',int2str(i),'_mi'],'var')
        aux=eval(['S',int2str(i),'_mi']);
        [n o]=size(aux);
        for j=1:o
            mean_mi(j,1)=mean(aux(:,j));
        end
        temp1=mean_mi;
        
        v1=genvarname(['S',int2str(i),'_mean_mi']);
        v2=genvarname(['S',int2str(i),'_mean_mi_time']);
        v3=genvarname(['S',int2str(i),'_min_mi']);
        v4=genvarname(['S',int2str(i),'_max_mi']);
        eval([v1 '=mean(sum(aux,2));'])
        eval([v2 '=mean_mi;'])
        eval([v3 '=min(sum(aux,2));'])
        eval([v4 '=max(sum(aux,2));'])
    end
    
    if exist(['GD',int2str(i),'_mi'],'var')
        aux=eval(['GD',int2str(i),'_mi']);
        [n o]=size(aux);
        for j=1:o
            mean_mi(j,1)=mean(aux(:,j));
        end
        temp1=mean_mi;
        
        v1=genvarname(['GD',int2str(i),'_mean_mi']);
        v2=genvarname(['GD',int2str(i),'_mean_mi_time']);
        v3=genvarname(['GD',int2str(i),'_min_mi']);
        v4=genvarname(['GD',int2str(i),'_max_mi']);
        eval([v1 '=mean(sum(aux,2));'])
        eval([v2 '=mean_mi;'])
        eval([v3 '=min(sum(aux,2));'])
        eval([v4 '=max(sum(aux,2));'])
    end
    
    if exist(['GS',int2str(i),'_mi'],'var')
        aux=eval(['GS',int2str(i),'_mi']);
        [n o]=size(aux);
        for j=1:o
            mean_mi(j,1)=mean(aux(:,j));
        end
        temp1=mean_mi;
        
        v1=genvarname(['GS',int2str(i),'_mean_mi']);
        v2=genvarname(['GS',int2str(i),'_mean_mi_time']);
        v3=genvarname(['GS',int2str(i),'_min_mi']);
        v4=genvarname(['GS',int2str(i),'_max_mi']);
        eval([v1 '=mean(sum(aux,2));'])
        eval([v2 '=mean_mi;'])
        eval([v3 '=min(sum(aux,2));'])
        eval([v4 '=max(sum(aux,2));'])
    end
    
    if exist(['GGD',int2str(i),'_mi'],'var')
        aux=eval(['GGD',int2str(i),'_mi']);
        [n o]=size(aux);
        for j=1:o
            mean_mi(j,1)=mean(aux(:,j));
        end
        temp1=mean_mi;
        
        v1=genvarname(['GGD',int2str(i),'_mean_mi']);
        v2=genvarname(['GGD',int2str(i),'_mean_mi_time']);
        v3=genvarname(['GGD',int2str(i),'_min_mi']);
        v4=genvarname(['GGD',int2str(i),'_max_mi']);
        eval([v1 '=mean(sum(aux,2));'])
        eval([v2 '=mean_mi;'])
        eval([v3 '=min(sum(aux,2));'])
        eval([v4 '=max(sum(aux,2));'])
    end
    
    if exist(['GGS',int2str(i),'_mi'],'var')
        aux=eval(['GGS',int2str(i),'_mi']);
        [n o]=size(aux);
        for j=1:o
            mean_mi(j,1)=mean(aux(:,j));
        end
        temp1=mean_mi;
        
        v1=genvarname(['GGS',int2str(i),'_mean_mi']);
        v2=genvarname(['GGS',int2str(i),'_mean_mi_time']);
        v3=genvarname(['GGS',int2str(i),'_min_mi']);
        v4=genvarname(['GGS',int2str(i),'_max_mi']);
        eval([v1 '=mean(sum(aux,2));'])
        eval([v2 '=mean_mi;'])
        eval([v3 '=min(sum(aux,2));'])
        eval([v4 '=max(sum(aux,2));'])
    end
    
end
save summarised_output_mi.mat

%------------------------------Milk sold-----------------------------------
clear all
load counter.mat numberoftimes
load summarised_output_mp.mat
load summarised_output_mi.mat
load summarised_output_runs.mat

milk_intake_daughters=zeros(numberoftimes,10);
for i=1:10
    if exist(['D',int2str(i),'_mi'],'var')
        runs   =eval(['D',int2str(i),'_runs']);
        intake =eval(['D',int2str(i),'_mi']);
        for j=1:length(runs)
            milk_intake_daughters(runs(j,1),i)=sum(intake(j,:));
        end
    end
end

milk_intake_sons=zeros(numberoftimes,10);
for i=1:10
    if exist(['S',int2str(i),'_mi'],'var')
        runs   =eval(['S',int2str(i),'_runs']);
        intake =eval(['S',int2str(i),'_mi']);
        for j=1:length(runs)
            milk_intake_sons(runs(j,1),i)=sum(intake(j,:));
        end
    end
end

milk_intake_total=milk_intake_daughters+milk_intake_sons;
[n o]=size(milk_intake_total);
for i=1:n
    total_milk_intake(i,1)=sum(milk_intake_total(i,:));
end

for i=1:numberoftimes
    milk_production(i,1)=sum(M_mp(i,:));
end

milk_sold      =milk_production-total_milk_intake;
milk_sold_mean =mean(milk_sold);
milk_sold_min  =min(milk_sold);
milk_sold_max  =max(milk_sold);

save summarised_output_ms.mat milk_* total_milk_intake
%--------------------------------Dead--------------------------------------
clear all
load summarised_output_dead.mat
if exist('M_dead','var')>0
    k=M_dead==1;
    M_frac_dead=length(M_dead(k))/length(M_dead);
    M_present=length(M_dead);
end

for i=1:10
    
    if exist(['D',int2str(i),'_dead'],'var')
        v1=genvarname(['D',int2str(i),'_frac_dead']);
        v2=genvarname(['D',int2str(i),'_present']);
        temp1=eval(['D',int2str(i),'_dead']);
        k=temp1==1;
        temp2=length(temp1(k))/length(temp1);
        eval([v1 '=temp2;'])
        eval([v2 '=length(temp1);'])
    end
    
    if exist(['S',int2str(i),'_dead'],'var')
        v1=genvarname(['S',int2str(i),'_frac_dead']);
        v2=genvarname(['S',int2str(i),'_present']);
        temp1=eval(['S',int2str(i),'_dead']);
        k=temp1==1;
        temp2=length(temp1(k))/length(temp1);
        eval([v1 '=temp2;'])
        eval([v2 '=length(temp1);'])
    end
    
    if exist(['GD',int2str(i),'_dead'],'var')
        v1=genvarname(['GD',int2str(i),'_frac_dead']);
        v2=genvarname(['GD',int2str(i),'_present']);
        temp1=eval(['GD',int2str(i),'_dead']);
        k=temp1==1;
        temp2=length(temp1(k))/length(temp1);
        eval([v1 '=temp2;'])
        eval([v2 '=length(temp1);'])
    end
    
    if exist(['GS',int2str(i),'_dead'],'var')
        v1=genvarname(['GS',int2str(i),'_frac_dead']);
        v2=genvarname(['GS',int2str(i),'_present']);
        temp1=eval(['GS',int2str(i),'_dead']);
        k=temp1==1;
        temp2=length(temp1(k))/length(temp1);
        eval([v1 '=temp2;'])
        eval([v2 '=length(temp1);'])
    end
    
    if exist(['GGD',int2str(i),'_dead'],'var')
        v1=genvarname(['GGD',int2str(i),'_frac_dead']);
        v2=genvarname(['GGD',int2str(i),'_present']);
        temp1=eval(['GGD',int2str(i),'_dead']);
        k=temp1==1;
        temp2=length(temp1(k))/length(temp1);
        eval([v1 '=temp2;'])
        eval([v2 '=length(temp1);'])
    end
    
    if exist(['GGS',int2str(i),'_dead'],'var')
        v1=genvarname(['GGS',int2str(i),'_frac_dead']);
        v2=genvarname(['GGS',int2str(i),'_present']);
        temp1=eval(['GGS',int2str(i),'_dead']);
        k=temp1==1;
        temp2=length(temp1(k))/length(temp1);
        eval([v1 '=temp2;'])
        eval([v2 '=length(temp1);'])
    end
end
save summarised_output_dead.mat
clear all