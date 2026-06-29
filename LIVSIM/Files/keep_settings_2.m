load counter.mat

save_startmonth=cell(12,1);
for i=1:12
    load(['temp_month',int2str(i)])
    save_startmonth{i,1}=save_temp;
    
end

save(['save_startmonth',int2str(counter)],'save_startmonth') 

