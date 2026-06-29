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

median_for1=median(forage1);
median_for2=median(forage2);
median_for3=median(forage3);
median_pat1=median(pasture1);
median_pat2=median(pasture2);
median_pat3=median(pasture3);
median_con1=median(concentrate1);
median_con2=median(concentrate2);
median_con3=median(concentrate3);
tot_intake=median_for1+median_for2+median_for3+median_pat1+median_pat2+median_pat3+median_con1+median_con2+median_con3;
median_faeces=median(faeces);

median_for1_M=median(forage1_M);
median_for2_M=median(forage2_M);
median_for3_M=median(forage3_M);
median_pat1_M=median(pasture1_M);
median_pat2_M=median(pasture2_M);
median_pat3_M=median(pasture3_M);
median_con1_M=median(concentrate1_M);
median_con2_M=median(concentrate2_M);
median_con3_M=median(concentrate3_M);
tot_intake_M=median_for1_M+median_for2_M+median_for3_M+median_pat1_M+median_pat2_M+median_pat3_M+median_con1_M+median_con2_M+median_con3_M;
median_faeces_M=median(faeces_M);


xlswrite('output_sorted_median',median_for1,'output','C101')
xlswrite('output_sorted_median',median_for2,'output','C102')
xlswrite('output_sorted_median',median_for3,'output','C103')
xlswrite('output_sorted_median',median_pat1,'output','C104')
xlswrite('output_sorted_median',median_pat2,'output','C105')
xlswrite('output_sorted_median',median_pat3,'output','C106')
xlswrite('output_sorted_median',median_con1,'output','C107')
xlswrite('output_sorted_median',median_con2,'output','C108')
xlswrite('output_sorted_median',median_con3,'output','C109')
xlswrite('output_sorted_median',tot_intake,'output','C110')
xlswrite('output_sorted_median',median_faeces,'output','C111')

xlswrite('output_sorted_median',median_for1_M,'output','G101')
xlswrite('output_sorted_median',median_for2_M,'output','G102')
xlswrite('output_sorted_median',median_for3_M,'output','G103')
xlswrite('output_sorted_median',median_pat1_M,'output','G104')
xlswrite('output_sorted_median',median_pat2_M,'output','G105')
xlswrite('output_sorted_median',median_pat3_M,'output','G106')
xlswrite('output_sorted_median',median_con1_M,'output','G107')
xlswrite('output_sorted_median',median_con2_M,'output','G108')
xlswrite('output_sorted_median',median_con3_M,'output','G109')
xlswrite('output_sorted_median',tot_intake_M,'output','G110')
xlswrite('output_sorted_median',median_faeces_M,'output','G111')