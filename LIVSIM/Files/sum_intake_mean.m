clear all
load counter.mat numberoftimes
load save_output.mat

for i=1:numberoftimes
    % total of the entire herd    
    forage1(i,1)      =sum(sum(save_settings{1,i}.FORAGES(1,:,:)));
    forage2(i,1)      =sum(sum(save_settings{1,i}.FORAGES(2,:,:)));
    forage3(i,1)      =sum(sum(save_settings{1,i}.FORAGES(3,:,:)));
    pasture1(i,1)     =sum(sum(save_settings{1,i}.FORAGES(4,:,:)));
    pasture2(i,1)     =sum(sum(save_settings{1,i}.FORAGES(5,:,:)));
    pasture3(i,1)     =sum(sum(save_settings{1,i}.FORAGES(6,:,:)));
    concentrate1(i,1) =sum(sum(save_settings{1,i}.CONCENTRATE(1,:,:)));
    concentrate2(i,1) =sum(sum(save_settings{1,i}.CONCENTRATE(2,:,:)));
    concentrate3(i,1) =sum(sum(save_settings{1,i}.CONCENTRATE(3,:,:)));
    faeces(i,1)       =sum(sum(save_settings{1,i}.OUTPUT(10,:,:)));
    
    % total of the cow initially present
    forage1_M(i,1)      =sum(save_settings{1,i}.FORAGES(1,1,:));
    forage2_M(i,1)      =sum(save_settings{1,i}.FORAGES(2,1,:));
    forage3_M(i,1)      =sum(save_settings{1,i}.FORAGES(3,1,:));
    pasture1_M(i,1)     =sum(save_settings{1,i}.FORAGES(4,1,:));
    pasture2_M(i,1)     =sum(save_settings{1,i}.FORAGES(5,1,:));
    pasture3_M(i,1)     =sum(save_settings{1,i}.FORAGES(6,1,:));
    concentrate1_M(i,1) =sum(save_settings{1,i}.CONCENTRATE(1,1,:));
    concentrate2_M(i,1) =sum(save_settings{1,i}.CONCENTRATE(2,1,:));
    concentrate3_M(i,1) =sum(save_settings{1,i}.CONCENTRATE(3,1,:));
    faeces_M(i,1)       =sum(save_settings{1,i}.OUTPUT(10,1,:));
end

mean_for1=mean(forage1);
mean_for2=mean(forage2);
mean_for3=mean(forage3);
mean_pat1=mean(pasture1);
mean_pat2=mean(pasture2);
mean_pat3=mean(pasture3);
mean_con1=mean(concentrate1);
mean_con2=mean(concentrate2);
mean_con3=mean(concentrate3);
tot_intake=mean_for1+mean_for2+mean_for3+mean_pat1+mean_pat2+mean_pat3+mean_con1+mean_con2+mean_con3;
mean_faeces=mean(faeces);

mean_for1_M=mean(forage1_M);
mean_for2_M=mean(forage2_M);
mean_for3_M=mean(forage3_M);
mean_pat1_M=mean(pasture1_M);
mean_pat2_M=mean(pasture2_M);
mean_pat3_M=mean(pasture3_M);
mean_con1_M=mean(concentrate1_M);
mean_con2_M=mean(concentrate2_M);
mean_con3_M=mean(concentrate3_M);
tot_intake_M=mean_for1_M+mean_for2_M+mean_for3_M+mean_pat1_M+mean_pat2_M+mean_pat3_M+mean_con1_M+mean_con2_M+mean_con3_M;
mean_faeces_M=mean(faeces_M);


xlswrite('output_sorted_mean',mean_for1,'output','C101')
xlswrite('output_sorted_mean',mean_for2,'output','C102')
xlswrite('output_sorted_mean',mean_for3,'output','C103')
xlswrite('output_sorted_mean',mean_pat1,'output','C104')
xlswrite('output_sorted_mean',mean_pat2,'output','C105')
xlswrite('output_sorted_mean',mean_pat3,'output','C106')
xlswrite('output_sorted_mean',mean_con1,'output','C107')
xlswrite('output_sorted_mean',mean_con2,'output','C108')
xlswrite('output_sorted_mean',mean_con3,'output','C109')
xlswrite('output_sorted_mean',tot_intake,'output','C110')
xlswrite('output_sorted_mean',mean_faeces,'output','C111')

xlswrite('output_sorted_mean',mean_for1_M,'output','G101')
xlswrite('output_sorted_mean',mean_for2_M,'output','G102')
xlswrite('output_sorted_mean',mean_for3_M,'output','G103')
xlswrite('output_sorted_mean',mean_pat1_M,'output','G104')
xlswrite('output_sorted_mean',mean_pat2_M,'output','G105')
xlswrite('output_sorted_mean',mean_pat3_M,'output','G106')
xlswrite('output_sorted_mean',mean_con1_M,'output','G107')
xlswrite('output_sorted_mean',mean_con2_M,'output','G108')
xlswrite('output_sorted_mean',mean_con3_M,'output','G109')
xlswrite('output_sorted_mean',tot_intake_M,'output','G110')
xlswrite('output_sorted_mean',mean_faeces_M,'output','G111')