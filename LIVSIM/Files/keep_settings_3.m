load counter.mat

save_settings=cell(12,numberoftimes);
for i=1:numberoftimes
    load(['save_startmonth',int2str(i)])
    for j=1:12
        save_settings{j,i}=save_startmonth{j};
    end
end

save('save_output.mat','save_settings','-v7.3')

