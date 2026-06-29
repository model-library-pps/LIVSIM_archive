clear all

load save_output.mat
load counter.mat numberoftimes

if exist('extra_output.mat','file')>0
    delete extra_output.mat
end

extra_output=cell(12,numberoftimes);

for i=1:numberoftimes
    
    for j=1:12
        % construct a matrix with ones for the months in which a calf has been
        % born (only for the original mother cow)
        calf_matrix=-999*ones(1,144);
        for h=2:145
            if save_settings{j,i}.OUTPUT(11,1,h)>save_settings{j,i}.OUTPUT(11,1,h-1)
                calf_matrix(h-1)=1;
            else
                calf_matrix(h-1)=0;
            end
        end
        
        % check which cows are calves of the original mother cow, store their
        % id's in a vector and use this vector to determine whether these cows
        % have died and how old they were at the end of the run or at the
        % time of their death
        [a b c]=size(save_settings{j,i}.OUTPUT);
        calves_id=[];
        for k=1:b
            if max(save_settings{j,i}.OUTPUT(5,k,:))==1
                calves_id=[calves_id; max(save_settings{j,i}.OUTPUT(1,k,:))];
            end
        end
        
        % check whether a cow has died
        dead_or_alive=[];
        max_age=[];
        min_age=[];
        birth_month=[];
        for l=1:length(calves_id)
            dead_or_alive=[dead_or_alive; max(save_settings{j,i}.OUTPUT(14,calves_id(l),:))];
            max_age=[max_age; max(save_settings{j,i}.OUTPUT(3,calves_id(l),:))];
            filter=save_settings{j,i}.OUTPUT(3,calves_id(l),:)>0;
            min_age=[min_age; min(save_settings{j,i}.OUTPUT(3,calves_id(l),filter))];
            birth_month=[birth_month;find(save_settings{j,i}.OUTPUT(3,calves_id(l),:)==min(save_settings{j,i}.OUTPUT(3,calves_id(l),filter)))];
        end
        
        save temp.mat calf_matrix calves_id dead_or_alive max_age min_age birth_month
        extra_output{j,i}=load('temp.mat');
        delete temp.mat
    end
end

save extra_output.mat extra_output


for i=1:12
    maand_set=[];
    for j=1:numberoftimes
        maand_set=[maand_set, find(extra_output{i,j}.calf_matrix>0)];
    end
    maand_set=(maand_set/12-floor(maand_set/12))*12;
    maand_set(maand_set==0)=12;
    
    v=genvarname(['save_maand_',int2str(i)]);
    eval([v '=maand_set;'])
end

for i=1:12
    v=genvarname(['save_maand_',int2str(i)]);
    length_month(i)=length(eval(v));
end

store_calf_matrix=NaN*ones(12,max(length_month));
for i=1:12
    v2=genvarname(['save_maand_',int2str(i)]);
    for j=1:12
        v1=genvarname(['k',int2str(j)]);
        eval([v1 '=eval(v2)>j-0.5 & eval(v2)<j+0.5;'])
    end
    
    months=[i:12,1:(i-1)];
    temp=eval(v2);
    for j=1:12
        v1=genvarname(['k',int2str(j)]);
        temp(eval(v1))=months(j);
    end
    figure(i)
    hist(temp,12)
        
    for k=1:length(temp)
        store_calf_matrix(i,k)=temp(k);
    end
end
N=NaN*ones(15000,12);
xlswrite('store_calf_matrix.xls',N,'sheet1','A4')
xlswrite('store_calf_matrix.xls',store_calf_matrix','sheet1','A4')

for i=1:12
    clear M
    M=-999*ones(numberoftimes,1);
    for l=1:numberoftimes
        M(l)=length(extra_output{i,l}.calves_id);
    end
    calves_id=NaN*ones(numberoftimes,max(1,max(M)));
    for j=1:numberoftimes
        clear bla
        bla=extra_output{i,j}.calves_id;
        for k=1:length(bla)
            if ~isempty(bla(k))
                calves_id(j,k)=bla(k);
            end
        end
    end
    v=genvarname(['sheet',int2str(i)]);
    clean=NaN*ones(numberoftimes,100);
    xlswrite('calves_id.xls',clean,v)
    xlswrite('calves_id.xls',calves_id,v)
    
    clear M
    M=-999*ones(numberoftimes,1);
    for l=1:numberoftimes
        M(l)=length(extra_output{i,l}.dead_or_alive);
    end
    dead_or_alive=NaN*ones(numberoftimes,max(1,max(M)));
    for j=1:numberoftimes
        clear bla
        bla=extra_output{i,j}.dead_or_alive;
        for k=1:length(bla)
            if ~isempty(bla(k))
                dead_or_alive(j,k)=bla(k);
            end
        end
    end
    v=genvarname(['sheet',int2str(i)]);
    clean=NaN*ones(numberoftimes,100);
    xlswrite('dead_or_alive.xls',clean,v)
    xlswrite('dead_or_alive.xls',dead_or_alive,v)
    
    clear M
    M=-999*ones(numberoftimes,1);
    for l=1:numberoftimes
        M(l)=length(extra_output{i,l}.max_age);
    end
    max_age=NaN*ones(numberoftimes,max(1,max(M)));
    for j=1:numberoftimes
        clear bla
        bla=extra_output{i,j}.max_age;
        for k=1:length(bla)
            if ~isempty(bla(k))
                max_age(j,k)=bla(k);
            end
        end
    end
    v=genvarname(['sheet',int2str(i)]);
    clean=NaN*ones(numberoftimes,100);
    xlswrite('max_age.xls',clean,v)
    xlswrite('max_age.xls',max_age,v)
    
    % Determine the number of months an animal was alive during the run
    % and, if the animal has died during the run, in which month said
    % animal has perished.
    clear M
    M=-999*ones(numberoftimes,1);
    for l=1:numberoftimes
        M(l)=length(extra_output{i,l}.min_age);
    end
    min_age=NaN*ones(numberoftimes,max(1,max(M)));
    for j=1:numberoftimes
        clear bla
        bla=extra_output{i,j}.min_age;
        for k=1:length(bla)
            if ~isempty(bla(k))
                min_age(j,k)=bla(k);
            end
        end
    end
    months_alive=round((max_age-min_age)*12);
        
    clear M
    M=-999*ones(numberoftimes,1);
    for l=1:numberoftimes
        M(l)=length(extra_output{i,l}.birth_month);
    end
    birth_month=NaN*ones(numberoftimes,max(1,max(M)));
    for j=1:numberoftimes
        clear bla
        bla=extra_output{i,j}.birth_month;
        for k=1:length(bla)
            if ~isempty(bla(k))
                birth_month(j,k)=bla(k);
            end
        end
    end
    
    end_month=birth_month+months_alive;
    end_month=(end_month/12-floor(end_month/12))*12;
    end_month(end_month==0)=12;
    months=[i:12,1:(i-1)];
    
    for j=1:12
        v1=genvarname(['k',int2str(j)]);
        eval([v1 '=end_month>j-0.5 & end_month<j+0.5;'])
    end
    
    for j=1:12
        v1=genvarname(['k',int2str(j)]);
        end_month(eval(v1))=months(j);
    end
    
    filter=dead_or_alive==0;
    end_month(filter)=0;
    
    v=genvarname(['sheet',int2str(i)]);
    clean=NaN*ones(numberoftimes,100);
    xlswrite('end_month.xls',clean,v,'A1:H5000')
    xlswrite('end_month.xls',end_month,v,'A1:H5000')
    %xlswrite('end_month.xls',end_month,v)
end

