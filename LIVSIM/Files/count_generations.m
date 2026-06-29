clear all

if exist('groupd_output.mat','file')
    delete('grouped_output.mat')
end

save MOTHERS.mat
save FATHERS.mat
for i=1:10
    save(['DAUGHTERS',int2str(i),'.mat']);
    save(['SONS',int2str(i),'.mat']);
    save(['GDAUGHTERS',int2str(i),'.mat']);
    save(['GSONS',int2str(i),'.mat']);
    save(['GGDAUGHTERS',int2str(i),'.mat']);
    save(['GGSONS',int2str(i),'.mat']);
end

load save_output.mat
load counter.mat numberoftimes

for runs=1:numberoftimes
    
    MOTHERS     ={};
    FATHERS     ={};
    DAUGHTERS   ={};
    SONS        ={};
    GDAUGHTERS  ={};
    GSONS       ={};
    GGDAUGHTERS ={};
    GGSONS      ={};
    
    count_mothers      =0;
    count_fathers      =0;
    count_daughters    =0;
    count_sons         =0;
    count_gdaughters   =0;
    count_gsons        =0;
    count_ggddaughters =0;
    count_ggsons       =0;
    
    OUTPUT_temp      =save_settings{1,runs}.OUTPUT;
    FORAGES_temp     =save_settings{1,runs}.FORAGES;
    CONCENTRATE_temp =save_settings{1,runs}.CONCENTRATE;
    
    store_gen=[];
    oei=0;
    
    [a b c] =size(OUTPUT_temp);
    for bla=1:b
        if max(OUTPUT_temp(3,bla,:))>(1/12)
            oei=oei+1;
        end
    end
    [d e f] =size(FORAGES_temp);
    [g h i] =size(CONCENTRATE_temp);
    
    for cow=1:oei
        aux=cow;
        generation=1;
        while max(OUTPUT_temp(5,aux,:))>-999
            generation=generation+1;
            aux=max(OUTPUT_temp(5,aux,:));
        end
        store_gen=[store_gen; generation];
        
        OUTPUT      =reshape(OUTPUT_temp(:,cow,:),a,c);
        FORAGES     =reshape(FORAGES_temp(:,cow,:),d,f);
        CONCENTRATE =reshape(CONCENTRATE_temp(:,cow,:),g,i);
        save('temp.mat','OUTPUT','FORAGES','CONCENTRATE');
        
        if max(OUTPUT(2,:))==1 && generation==1         % mothers
            cow_group=1;
        elseif max(OUTPUT(2,:))==0 && generation==1     % fathers
            cow_group=2;
        elseif max(OUTPUT(2,:))==1 && generation==2     % daughters
            cow_group=3;
        elseif max(OUTPUT(2,:))==0 && generation==2     % sons
            cow_group=4;
        elseif max(OUTPUT(2,:))==1 && generation==3     % granddaughters
            cow_group=5;
        elseif max(OUTPUT(2,:))==0 && generation==3     % grandsons
            cow_group=6;
        elseif max(OUTPUT(2,:))==1 && generation==4     % greatgranddaughters
            cow_group=7;
        elseif max(OUTPUT(2,:))==0 && generation==4     % greatgrandsons
            cow_group=8;
        else
            error('cow out of scope')
        end
        
        switch cow_group
            case 1
                count_mothers=count_mothers+1;
                MOTHERS{count_mothers}=load('temp.mat');
            case 2
                count_fathers=count_fathers+1;
                FATHERS{count_fathers}=load('temp.mat');
            case 3
                count_daughters=count_daughters+1;
                DAUGHTERS{count_daughters}=load('temp.mat');
            case 4
                count_sons=count_sons+1;
                SONS{count_sons}=load('temp.mat');
            case 5
                count_gdaughters=count_gdaughters+1;
                GDAUGHTERS{count_gdaughters}=load('temp.mat');
            case 6
                count_gsons=count_gsons+1;
                GSONS{count_gsons}=load('temp.mat');
            case 7
                count_ggdaughters=count_ggdaughters+1;
                GGDAUGHTERS{count_ggdaughters}=load('temp.mat');
            case 8
                count_ggsons=count_ggsons+1;
                GGSONS{count_ggsons}=load('temp.mat');
        end
                
    end
    save grouped_output.mat MOTHERS FATHERS DAUGHTERS SONS GDAUGHTERS GSONS GGDAUGHTERS GGSONS runs
    
    clear all
    load grouped_output.mat MOTHERS runs
    for i=1:length(MOTHERS)
        v=genvarname(['RUN',int2str(runs)]);
        eval([v '=MOTHERS{1,i};'])
        save('MOTHERS.mat',['RUN',int2str(runs)],'-append')
    end
    
    clear all
    load grouped_output.mat FATHERS runs
    for i=1:length(FATHERS)
        v=genvarname(['RUN',int2str(runs)]);
        eval([v '=FATHERS{1,i};'])
        save('FATHERS.mat',['RUN',int2str(runs)],'-append')
    end
    
    clear all
    load grouped_output.mat DAUGHTERS runs
    for i=1:length(DAUGHTERS)
        v=genvarname(['RUN',int2str(runs)]);
        eval([v '=DAUGHTERS{1,i};'])
        save(['DAUGHTERS',int2str(i),'.mat'],['RUN',int2str(runs)],'-append');
    end
    
    clear all
    load grouped_output.mat SONS runs
    for i=1:length(SONS)
        v=genvarname(['RUN',int2str(runs)]);
        eval([v '=SONS{1,i};'])
        save(['SONS',int2str(i),'.mat'],['RUN',int2str(runs)],'-append');
    end
    
    clear all
    load grouped_output.mat GDAUGHTERS runs
    for i=1:length(GDAUGHTERS)
        v=genvarname(['RUN',int2str(runs)]);
        eval([v '=GDAUGHTERS{1,i};'])
        save(['GDAUGHTERS',int2str(i),'.mat'],['RUN',int2str(runs)],'-append');
    end
    
    clear all
    load grouped_output.mat GSONS runs
    for i=1:length(GSONS)
        v=genvarname(['RUN',int2str(runs)]);
        eval([v '=GSONS{1,i};'])
        save(['GSONS',int2str(i),'.mat'],['RUN',int2str(runs)],'-append');
    end
    
    clear all
    load grouped_output.mat GGDAUGHTERS runs
    for i=1:length(GGDAUGHTERS)
        v=genvarname(['RUN',int2str(runs)]);
        eval([v '=GGDAUGHTERS{1,i};'])
        save(['GGDAUGHTERS',int2str(i),'.mat'],['RUN',int2str(runs)],'-append');
    end
    
    clear all
    load grouped_output.mat GGSONS runs
    for i=1:length(GGSONS)
        v=genvarname(['RUN',int2str(runs)]);
        eval([v '=GGSONS{1,i};'])
        save(['GGSONS',int2str(i),'.mat'],['RUN',int2str(runs)],'-append');
    end
        
    load save_output.mat
end

% to delete empty mat-files use:
s=dir('MOTHERS.mat');
if s.bytes<=175
    delete('MOTHERS.mat')
end

s=dir('FATHERS.mat');
if s.bytes<=175
    delete('FATHERS.mat')
end

for j=1:10
    s=dir(['DAUGHTERS',int2str(j),'.mat']);
    if s.bytes<=175
        delete(['DAUGHTERS',int2str(j),'.mat'])
    end
end

for j=1:10
    s=dir(['SONS',int2str(j),'.mat']);
    if s.bytes<=175
        delete(['SONS',int2str(j),'.mat'])
    end
end

for j=1:10
    s=dir(['GDAUGHTERS',int2str(j),'.mat']);
    if s.bytes<=175
        delete(['GDAUGHTERS',int2str(j),'.mat'])
    end
end

for j=1:10
    s=dir(['GSONS',int2str(j),'.mat']);
    if s.bytes<=175
        delete(['GSONS',int2str(j),'.mat'])
    end
end

for j=1:10
    s=dir(['GGDAUGHTERS',int2str(j),'.mat']);
    if s.bytes<=175
        delete(['GGDAUGHTERS',int2str(j),'.mat'])
    end
end

for j=1:10
    s=dir(['GGSONS',int2str(j),'.mat']);
    if s.bytes<=175
        delete(['GGSONS',int2str(j),'.mat'])
    end
end
