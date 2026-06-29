clear all

M=['-'; '-'; '-'; '-'; '-'; '-'; '-'; '-'; '-'; '-'; '-'; '-'; '-'; '-'; '-'; '-'; '-'; '-'];
N=['-'; '-'; '-'; '-'; '-'; '-'; '-'; '-'; '-'; '-'; '-'];
xlswrite('output_sorted_median.xls',M,'output','C3')
xlswrite('output_sorted_median.xls',M,'output','C25')
xlswrite('output_sorted_median.xls',M,'output','E25')
xlswrite('output_sorted_median.xls',M,'output','G25')
xlswrite('output_sorted_median.xls',M,'output','I25')
xlswrite('output_sorted_median.xls',M,'output','K25')
xlswrite('output_sorted_median.xls',M,'output','M25')
xlswrite('output_sorted_median.xls',M,'output','O25')
xlswrite('output_sorted_median.xls',M,'output','Q25')
xlswrite('output_sorted_median.xls',M,'output','S25')
xlswrite('output_sorted_median.xls',M,'output','U25')
xlswrite('output_sorted_median.xls',M,'output','C44')
xlswrite('output_sorted_median.xls',M,'output','E44')
xlswrite('output_sorted_median.xls',M,'output','G44')
xlswrite('output_sorted_median.xls',M,'output','I44')
xlswrite('output_sorted_median.xls',M,'output','K44')
xlswrite('output_sorted_median.xls',M,'output','M44')
xlswrite('output_sorted_median.xls',M,'output','O44')
xlswrite('output_sorted_median.xls',M,'output','Q44')
xlswrite('output_sorted_median.xls',M,'output','S44')
xlswrite('output_sorted_median.xls',M,'output','U44')
xlswrite('output_sorted_median.xls',M,'output','C63')
xlswrite('output_sorted_median.xls',M,'output','E63')
xlswrite('output_sorted_median.xls',M,'output','G63')
xlswrite('output_sorted_median.xls',M,'output','I63')
xlswrite('output_sorted_median.xls',M,'output','K63')
xlswrite('output_sorted_median.xls',M,'output','M63')
xlswrite('output_sorted_median.xls',M,'output','O63')
xlswrite('output_sorted_median.xls',M,'output','Q63')
xlswrite('output_sorted_median.xls',M,'output','S63')
xlswrite('output_sorted_median.xls',M,'output','U63')
xlswrite('output_sorted_median.xls',M,'output','C82')
xlswrite('output_sorted_median.xls',M,'output','E82')
xlswrite('output_sorted_median.xls',M,'output','G82')
xlswrite('output_sorted_median.xls',M,'output','I82')
xlswrite('output_sorted_median.xls',M,'output','K82')
xlswrite('output_sorted_median.xls',M,'output','M82')
xlswrite('output_sorted_median.xls',M,'output','O82')
xlswrite('output_sorted_median.xls',M,'output','Q82')
xlswrite('output_sorted_median.xls',M,'output','S82')
xlswrite('output_sorted_median.xls',M,'output','U82')
xlswrite('output_sorted_median.xls',N,'output','C101')
xlswrite('output_sorted_median.xls',N,'output','G101')

load summarised_output_agemax.mat
if exist('M_median_agemax','var');
    xlswrite('output_sorted_median.xls',M_median_agemax,'output','C4')
end

if exist('M_min_agemax','var');
    xlswrite('output_sorted_median.xls',M_min_agemax,'output','C5')
end

if exist('M_max_agemax','var');
    xlswrite('output_sorted_median.xls',M_max_agemax,'output','C6')
end

for i=1:10
    if exist(['D',int2str(i),'_median_agemax'],'var');
        temp=eval(['D',int2str(i),'_median_agemax']);
        if i==1
            xlswrite('output_sorted_median.xls',temp,'output','C28')
        elseif i==2
            xlswrite('output_sorted_median.xls',temp,'output','E28')
        elseif i==3
            xlswrite('output_sorted_median.xls',temp,'output','G28')
        elseif i==4
            xlswrite('output_sorted_median.xls',temp,'output','I28')
        elseif i==5
            xlswrite('output_sorted_median.xls',temp,'output','K28')
        elseif i==6
            xlswrite('output_sorted_median.xls',temp,'output','M28')
        elseif i==7
            xlswrite('output_sorted_median.xls',temp,'output','O28')
        elseif i==8
            xlswrite('output_sorted_median.xls',temp,'output','Q28')
        elseif i==9
            xlswrite('output_sorted_median.xls',temp,'output','S28')
        elseif i==10
            xlswrite('output_sorted_median.xls',temp,'output','U28')
        end
    end
    
    if exist(['D',int2str(i),'_min_agemax'],'var');
        temp=eval(['D',int2str(i),'_min_agemax']);
        if i==1
            xlswrite('output_sorted_median.xls',temp,'output','C29')
        elseif i==2
            xlswrite('output_sorted_median.xls',temp,'output','E29')
        elseif i==3
            xlswrite('output_sorted_median.xls',temp,'output','G29')
        elseif i==4
            xlswrite('output_sorted_median.xls',temp,'output','I29')
        elseif i==5
            xlswrite('output_sorted_median.xls',temp,'output','K29')
        elseif i==6
            xlswrite('output_sorted_median.xls',temp,'output','M29')
        elseif i==7
            xlswrite('output_sorted_median.xls',temp,'output','O29')
        elseif i==8
            xlswrite('output_sorted_median.xls',temp,'output','Q29')
        elseif i==9
            xlswrite('output_sorted_median.xls',temp,'output','S29')
        elseif i==10
            xlswrite('output_sorted_median.xls',temp,'output','U29')
        end
    end
    
    if exist(['D',int2str(i),'_max_agemax'],'var');
        temp=eval(['D',int2str(i),'_max_agemax']);
        if i==1
            xlswrite('output_sorted_median.xls',temp,'output','C30')
        elseif i==2
            xlswrite('output_sorted_median.xls',temp,'output','E30')
        elseif i==3
            xlswrite('output_sorted_median.xls',temp,'output','G30')
        elseif i==4
            xlswrite('output_sorted_median.xls',temp,'output','I30')
        elseif i==5
            xlswrite('output_sorted_median.xls',temp,'output','K30')
        elseif i==6
            xlswrite('output_sorted_median.xls',temp,'output','M30')
        elseif i==7
            xlswrite('output_sorted_median.xls',temp,'output','O30')
        elseif i==8
            xlswrite('output_sorted_median.xls',temp,'output','Q30')
        elseif i==9
            xlswrite('output_sorted_median.xls',temp,'output','S30')
        elseif i==10
            xlswrite('output_sorted_median.xls',temp,'output','U30')
        end
    end
    
    if exist(['S',int2str(i),'_median_agemax'],'var');
        temp=eval(['S',int2str(i),'_median_agemax']);
        if i==1
            xlswrite('output_sorted_median.xls',temp,'output','C66')
        elseif i==2
            xlswrite('output_sorted_median.xls',temp,'output','E66')
        elseif i==3
            xlswrite('output_sorted_median.xls',temp,'output','G66')
        elseif i==4
            xlswrite('output_sorted_median.xls',temp,'output','I66')
        elseif i==5
            xlswrite('output_sorted_median.xls',temp,'output','K66')
        elseif i==6
            xlswrite('output_sorted_median.xls',temp,'output','M66')
        elseif i==7
            xlswrite('output_sorted_median.xls',temp,'output','O66')
        elseif i==8
            xlswrite('output_sorted_median.xls',temp,'output','Q66')
        elseif i==9
            xlswrite('output_sorted_median.xls',temp,'output','S66')
        elseif i==10
            xlswrite('output_sorted_median.xls',temp,'output','U66')
        end
    end
    
    if exist(['S',int2str(i),'_min_agemax'],'var');
        temp=eval(['S',int2str(i),'_min_agemax']);
        if i==1
            xlswrite('output_sorted_median.xls',temp,'output','C67')
        elseif i==2
            xlswrite('output_sorted_median.xls',temp,'output','E67')
        elseif i==3
            xlswrite('output_sorted_median.xls',temp,'output','G67')
        elseif i==4
            xlswrite('output_sorted_median.xls',temp,'output','I67')
        elseif i==5
            xlswrite('output_sorted_median.xls',temp,'output','K67')
        elseif i==6
            xlswrite('output_sorted_median.xls',temp,'output','M67')
        elseif i==7
            xlswrite('output_sorted_median.xls',temp,'output','O67')
        elseif i==8
            xlswrite('output_sorted_median.xls',temp,'output','Q67')
        elseif i==9
            xlswrite('output_sorted_median.xls',temp,'output','S67')
        elseif i==10
            xlswrite('output_sorted_median.xls',temp,'output','U67')
        end
    end
    
    if exist(['S',int2str(i),'_max_agemax'],'var');
        temp=eval(['S',int2str(i),'_max_agemax']);
        if i==1
            xlswrite('output_sorted_median.xls',temp,'output','C68')
        elseif i==2
            xlswrite('output_sorted_median.xls',temp,'output','E68')
        elseif i==3
            xlswrite('output_sorted_median.xls',temp,'output','G68')
        elseif i==4
            xlswrite('output_sorted_median.xls',temp,'output','I68')
        elseif i==5
            xlswrite('output_sorted_median.xls',temp,'output','K68')
        elseif i==6
            xlswrite('output_sorted_median.xls',temp,'output','M68')
        elseif i==7
            xlswrite('output_sorted_median.xls',temp,'output','O68')
        elseif i==8
            xlswrite('output_sorted_median.xls',temp,'output','Q68')
        elseif i==9
            xlswrite('output_sorted_median.xls',temp,'output','S68')
        elseif i==10
            xlswrite('output_sorted_median.xls',temp,'output','U68')
        end
    end
    
    if exist(['GD',int2str(i),'_median_agemax'],'var');
        temp=eval(['GD',int2str(i),'_median_agemax']);
        if i==1
            xlswrite('output_sorted_median.xls',temp,'output','C47')
        elseif i==2
            xlswrite('output_sorted_median.xls',temp,'output','E47')
        elseif i==3
            xlswrite('output_sorted_median.xls',temp,'output','G47')
        elseif i==4
            xlswrite('output_sorted_median.xls',temp,'output','I47')
        elseif i==5
            xlswrite('output_sorted_median.xls',temp,'output','K47')
        elseif i==6
            xlswrite('output_sorted_median.xls',temp,'output','M47')
        elseif i==7
            xlswrite('output_sorted_median.xls',temp,'output','O47')
        elseif i==8
            xlswrite('output_sorted_median.xls',temp,'output','Q47')
        elseif i==9
            xlswrite('output_sorted_median.xls',temp,'output','S47')
        elseif i==10
            xlswrite('output_sorted_median.xls',temp,'output','U47')
        end
    end
    
    if exist(['GD',int2str(i),'_min_agemax'],'var');
        temp=eval(['GD',int2str(i),'_min_agemax']);
        if i==1
            xlswrite('output_sorted_median.xls',temp,'output','C48')
        elseif i==2
            xlswrite('output_sorted_median.xls',temp,'output','E48')
        elseif i==3
            xlswrite('output_sorted_median.xls',temp,'output','G48')
        elseif i==4
            xlswrite('output_sorted_median.xls',temp,'output','I48')
        elseif i==5
            xlswrite('output_sorted_median.xls',temp,'output','K48')
        elseif i==6
            xlswrite('output_sorted_median.xls',temp,'output','M48')
        elseif i==7
            xlswrite('output_sorted_median.xls',temp,'output','O48')
        elseif i==8
            xlswrite('output_sorted_median.xls',temp,'output','Q48')
        elseif i==9
            xlswrite('output_sorted_median.xls',temp,'output','S48')
        elseif i==10
            xlswrite('output_sorted_median.xls',temp,'output','U48')
        end
    end
    
    if exist(['GD',int2str(i),'_max_agemax'],'var');
        temp=eval(['GD',int2str(i),'_max_agemax']);
        if i==1
            xlswrite('output_sorted_median.xls',temp,'output','C49')
        elseif i==2
            xlswrite('output_sorted_median.xls',temp,'output','E49')
        elseif i==3
            xlswrite('output_sorted_median.xls',temp,'output','G49')
        elseif i==4
            xlswrite('output_sorted_median.xls',temp,'output','I49')
        elseif i==5
            xlswrite('output_sorted_median.xls',temp,'output','K49')
        elseif i==6
            xlswrite('output_sorted_median.xls',temp,'output','M49')
        elseif i==7
            xlswrite('output_sorted_median.xls',temp,'output','O49')
        elseif i==8
            xlswrite('output_sorted_median.xls',temp,'output','Q49')
        elseif i==9
            xlswrite('output_sorted_median.xls',temp,'output','S49')
        elseif i==10
            xlswrite('output_sorted_median.xls',temp,'output','U49')
        end
    end
    
    if exist(['GS',int2str(i),'_median_agemax'],'var');
        temp=eval(['GS',int2str(i),'_median_agemax']);
        if i==1
            xlswrite('output_sorted_median.xls',temp,'output','C85')
        elseif i==2
            xlswrite('output_sorted_median.xls',temp,'output','E85')
        elseif i==3
            xlswrite('output_sorted_median.xls',temp,'output','G85')
        elseif i==4
            xlswrite('output_sorted_median.xls',temp,'output','I85')
        elseif i==5
            xlswrite('output_sorted_median.xls',temp,'output','K85')
        elseif i==6
            xlswrite('output_sorted_median.xls',temp,'output','M85')
        elseif i==7
            xlswrite('output_sorted_median.xls',temp,'output','O85')
        elseif i==8
            xlswrite('output_sorted_median.xls',temp,'output','Q85')
        elseif i==9
            xlswrite('output_sorted_median.xls',temp,'output','S85')
        elseif i==10
            xlswrite('output_sorted_median.xls',temp,'output','U85')
        end
    end
    
    if exist(['GS',int2str(i),'_min_agemax'],'var');
        temp=eval(['GS',int2str(i),'_min_agemax']);
        if i==1
            xlswrite('output_sorted_median.xls',temp,'output','C86')
        elseif i==2
            xlswrite('output_sorted_median.xls',temp,'output','E86')
        elseif i==3
            xlswrite('output_sorted_median.xls',temp,'output','G86')
        elseif i==4
            xlswrite('output_sorted_median.xls',temp,'output','I86')
        elseif i==5
            xlswrite('output_sorted_median.xls',temp,'output','K86')
        elseif i==6
            xlswrite('output_sorted_median.xls',temp,'output','M86')
        elseif i==7
            xlswrite('output_sorted_median.xls',temp,'output','O86')
        elseif i==8
            xlswrite('output_sorted_median.xls',temp,'output','Q86')
        elseif i==9
            xlswrite('output_sorted_median.xls',temp,'output','S86')
        elseif i==10
            xlswrite('output_sorted_median.xls',temp,'output','U86')
        end
    end
    
    if exist(['GS',int2str(i),'_max_agemax'],'var');
        temp=eval(['GS',int2str(i),'_max_agemax']);
        if i==1
            xlswrite('output_sorted_median.xls',temp,'output','C87')
        elseif i==2
            xlswrite('output_sorted_median.xls',temp,'output','E87')
        elseif i==3
            xlswrite('output_sorted_median.xls',temp,'output','G87')
        elseif i==4
            xlswrite('output_sorted_median.xls',temp,'output','I87')
        elseif i==5
            xlswrite('output_sorted_median.xls',temp,'output','K87')
        elseif i==6
            xlswrite('output_sorted_median.xls',temp,'output','M87')
        elseif i==7
            xlswrite('output_sorted_median.xls',temp,'output','O87')
        elseif i==8
            xlswrite('output_sorted_median.xls',temp,'output','Q87')
        elseif i==9
            xlswrite('output_sorted_median.xls',temp,'output','S87')
        elseif i==10
            xlswrite('output_sorted_median.xls',temp,'output','U87')
        end
    end
end

clear all
load summarised_output_bw.mat
if exist('M_median_bw','var');
    temp=eval('M_median_bw');
    xlswrite('output_sorted_median.xls',temp,'output','C19')
end

if exist('M_min_bw','var');
    temp=eval('M_min_bw');
    xlswrite('output_sorted_median.xls',temp,'output','C20')
end

if exist('M_max_bw','var');
    temp=eval('M_max_bw');
    xlswrite('output_sorted_median.xls',temp,'output','C21')
end

for i=1:10
    if exist(['D',int2str(i),'_median_bw'],'var');
        temp=eval(['D',int2str(i),'_median_bw']);
        if i==1
            xlswrite('output_sorted_median.xls',temp,'output','C40')
        elseif i==2
            xlswrite('output_sorted_median.xls',temp,'output','E40')
        elseif i==3
            xlswrite('output_sorted_median.xls',temp,'output','G40')
        elseif i==4
            xlswrite('output_sorted_median.xls',temp,'output','I40')
        elseif i==5
            xlswrite('output_sorted_median.xls',temp,'output','K40')
        elseif i==6
            xlswrite('output_sorted_median.xls',temp,'output','M40')
        elseif i==7
            xlswrite('output_sorted_median.xls',temp,'output','O40')
        elseif i==8
            xlswrite('output_sorted_median.xls',temp,'output','Q40')
        elseif i==9
            xlswrite('output_sorted_median.xls',temp,'output','S40')
        elseif i==10
            xlswrite('output_sorted_median.xls',temp,'output','U40')
        end
    end
    
    if exist(['S',int2str(i),'_median_bw'],'var');
        temp=eval(['S',int2str(i),'_median_bw']);
        if i==1
            xlswrite('output_sorted_median.xls',temp,'output','C78')
        elseif i==2
            xlswrite('output_sorted_median.xls',temp,'output','E78')
        elseif i==3
            xlswrite('output_sorted_median.xls',temp,'output','G78')
        elseif i==4
            xlswrite('output_sorted_median.xls',temp,'output','I78')
        elseif i==5
            xlswrite('output_sorted_median.xls',temp,'output','K78')
        elseif i==6
            xlswrite('output_sorted_median.xls',temp,'output','M78')
        elseif i==7
            xlswrite('output_sorted_median.xls',temp,'output','O78')
        elseif i==8
            xlswrite('output_sorted_median.xls',temp,'output','Q78')
        elseif i==9
            xlswrite('output_sorted_median.xls',temp,'output','S78')
        elseif i==10
            xlswrite('output_sorted_median.xls',temp,'output','U78')
        end
    end
    
    if exist(['GD',int2str(i),'_median_bw'],'var');
        temp=eval(['GD',int2str(i),'_median_bw']);
        if i==1
            xlswrite('output_sorted_median.xls',temp,'output','C59')
        elseif i==2
            xlswrite('output_sorted_median.xls',temp,'output','E59')
        elseif i==3
            xlswrite('output_sorted_median.xls',temp,'output','G59')
        elseif i==4
            xlswrite('output_sorted_median.xls',temp,'output','I59')
        elseif i==5
            xlswrite('output_sorted_median.xls',temp,'output','K59')
        elseif i==6
            xlswrite('output_sorted_median.xls',temp,'output','M59')
        elseif i==7
            xlswrite('output_sorted_median.xls',temp,'output','O59')
        elseif i==8
            xlswrite('output_sorted_median.xls',temp,'output','Q59')
        elseif i==9
            xlswrite('output_sorted_median.xls',temp,'output','S59')
        elseif i==10
            xlswrite('output_sorted_median.xls',temp,'output','U59')
        end
    end
    
    if exist(['GS',int2str(i),'_median_bw'],'var');
        temp=eval(['GS',int2str(i),'_median_bw']);
        if i==1
            xlswrite('output_sorted_median.xls',temp,'output','C78')
        elseif i==2
            xlswrite('output_sorted_median.xls',temp,'output','E78')
        elseif i==3
            xlswrite('output_sorted_median.xls',temp,'output','G78')
        elseif i==4
            xlswrite('output_sorted_median.xls',temp,'output','I78')
        elseif i==5
            xlswrite('output_sorted_median.xls',temp,'output','K78')
        elseif i==6
            xlswrite('output_sorted_median.xls',temp,'output','M78')
        elseif i==7
            xlswrite('output_sorted_median.xls',temp,'output','O78')
        elseif i==8
            xlswrite('output_sorted_median.xls',temp,'output','Q78')
        elseif i==9
            xlswrite('output_sorted_median.xls',temp,'output','S78')
        elseif i==10
            xlswrite('output_sorted_median.xls',temp,'output','U78')
        end
    end
end

clear all
load summarised_output_dead.mat
if exist('M_frac_dead','var');
    xlswrite('output_sorted_median.xls',M_frac_dead,'output','C23')
end

for i=1:10
    if exist(['D',int2str(i),'_frac_dead'],'var');
        temp=eval(['D',int2str(i),'_frac_dead']);
        if i==1
            xlswrite('output_sorted_median.xls',temp,'output','C42')
        elseif i==2
            xlswrite('output_sorted_median.xls',temp,'output','E42')
        elseif i==3
            xlswrite('output_sorted_median.xls',temp,'output','G42')
        elseif i==4
            xlswrite('output_sorted_median.xls',temp,'output','I42')
        elseif i==5
            xlswrite('output_sorted_median.xls',temp,'output','K42')
        elseif i==6
            xlswrite('output_sorted_median.xls',temp,'output','M42')
        elseif i==7
            xlswrite('output_sorted_median.xls',temp,'output','O42')
        elseif i==8
            xlswrite('output_sorted_median.xls',temp,'output','Q42')
        elseif i==9
            xlswrite('output_sorted_median.xls',temp,'output','S42')
        elseif i==10
            xlswrite('output_sorted_median.xls',temp,'output','U42')
        end
    end
    
    if exist(['S',int2str(i),'_frac_dead'],'var');
        temp=eval(['S',int2str(i),'_frac_dead']);
        if i==1
            xlswrite('output_sorted_median.xls',temp,'output','C80')
        elseif i==2
            xlswrite('output_sorted_median.xls',temp,'output','E80')
        elseif i==3
            xlswrite('output_sorted_median.xls',temp,'output','G80')
        elseif i==4
            xlswrite('output_sorted_median.xls',temp,'output','I80')
        elseif i==5
            xlswrite('output_sorted_median.xls',temp,'output','K80')
        elseif i==6
            xlswrite('output_sorted_median.xls',temp,'output','M80')
        elseif i==7
            xlswrite('output_sorted_median.xls',temp,'output','O80')
        elseif i==8
            xlswrite('output_sorted_median.xls',temp,'output','Q80')
        elseif i==9
            xlswrite('output_sorted_median.xls',temp,'output','S80')
        elseif i==10
            xlswrite('output_sorted_median.xls',temp,'output','U80')
        end
    end
    
    if exist(['GD',int2str(i),'_frac_dead'],'var');
        temp=eval(['GD',int2str(i),'_frac_dead']);
        if i==1
            xlswrite('output_sorted_median.xls',temp,'output','C61')
        elseif i==2
            xlswrite('output_sorted_median.xls',temp,'output','E61')
        elseif i==3
            xlswrite('output_sorted_median.xls',temp,'output','G61')
        elseif i==4
            xlswrite('output_sorted_median.xls',temp,'output','I61')
        elseif i==5
            xlswrite('output_sorted_median.xls',temp,'output','K61')
        elseif i==6
            xlswrite('output_sorted_median.xls',temp,'output','M61')
        elseif i==7
            xlswrite('output_sorted_median.xls',temp,'output','O61')
        elseif i==8
            xlswrite('output_sorted_median.xls',temp,'output','Q61')
        elseif i==9
            xlswrite('output_sorted_median.xls',temp,'output','S61')
        elseif i==10
            xlswrite('output_sorted_median.xls',temp,'output','U61')
        end
    end
    
    if exist(['GS',int2str(i),'_frac_dead'],'var');
        temp=eval(['GS',int2str(i),'_frac_dead']);
        if i==1
            xlswrite('output_sorted_median.xls',temp,'output','C99')
        elseif i==2
            xlswrite('output_sorted_median.xls',temp,'output','E99')
        elseif i==3
            xlswrite('output_sorted_median.xls',temp,'output','G99')
        elseif i==4
            xlswrite('output_sorted_median.xls',temp,'output','I99')
        elseif i==5
            xlswrite('output_sorted_median.xls',temp,'output','K99')
        elseif i==6
            xlswrite('output_sorted_median.xls',temp,'output','M99')
        elseif i==7
            xlswrite('output_sorted_median.xls',temp,'output','O99')
        elseif i==8
            xlswrite('output_sorted_median.xls',temp,'output','Q99')
        elseif i==9
            xlswrite('output_sorted_median.xls',temp,'output','S99')
        elseif i==10
            xlswrite('output_sorted_median.xls',temp,'output','U99')
        end
    end
end

clear all
load summarised_output_dead.mat
if exist('M_present','var');
    temp=eval('M_present');
    xlswrite('output_sorted_median.xls',temp,'output','C22')
end

for i=1:10
    if exist(['D',int2str(i),'_present'],'var');
        temp=eval(['D',int2str(i),'_present']);
        if i==1
            xlswrite('output_sorted_median.xls',temp,'output','C41')
        elseif i==2
            xlswrite('output_sorted_median.xls',temp,'output','E41')
        elseif i==3
            xlswrite('output_sorted_median.xls',temp,'output','G41')
        elseif i==4
            xlswrite('output_sorted_median.xls',temp,'output','I41')
        elseif i==5
            xlswrite('output_sorted_median.xls',temp,'output','K41')
        elseif i==6
            xlswrite('output_sorted_median.xls',temp,'output','M41')
        elseif i==7
            xlswrite('output_sorted_median.xls',temp,'output','O41')
        elseif i==8
            xlswrite('output_sorted_median.xls',temp,'output','Q41')
        elseif i==9
            xlswrite('output_sorted_median.xls',temp,'output','S41')
        elseif i==10
            xlswrite('output_sorted_median.xls',temp,'output','U41')
        end
    end
    
    if exist(['S',int2str(i),'_present'],'var');
        temp=eval(['S',int2str(i),'_present']);
        if i==1
            xlswrite('output_sorted_median.xls',temp,'output','C79')
        elseif i==2
            xlswrite('output_sorted_median.xls',temp,'output','E79')
        elseif i==3
            xlswrite('output_sorted_median.xls',temp,'output','G79')
        elseif i==4
            xlswrite('output_sorted_median.xls',temp,'output','I79')
        elseif i==5
            xlswrite('output_sorted_median.xls',temp,'output','K79')
        elseif i==6
            xlswrite('output_sorted_median.xls',temp,'output','M79')
        elseif i==7
            xlswrite('output_sorted_median.xls',temp,'output','O79')
        elseif i==8
            xlswrite('output_sorted_median.xls',temp,'output','Q79')
        elseif i==9
            xlswrite('output_sorted_median.xls',temp,'output','S79')
        elseif i==10
            xlswrite('output_sorted_median.xls',temp,'output','U79')
        end
    end
    
    if exist(['GD',int2str(i),'_present'],'var');
        temp=eval(['GD',int2str(i),'_present']);
        if i==1
            xlswrite('output_sorted_median.xls',temp,'output','C60')
        elseif i==2
            xlswrite('output_sorted_median.xls',temp,'output','E60')
        elseif i==3
            xlswrite('output_sorted_median.xls',temp,'output','G60')
        elseif i==4
            xlswrite('output_sorted_median.xls',temp,'output','I60')
        elseif i==5
            xlswrite('output_sorted_median.xls',temp,'output','K60')
        elseif i==6
            xlswrite('output_sorted_median.xls',temp,'output','M60')
        elseif i==7
            xlswrite('output_sorted_median.xls',temp,'output','O60')
        elseif i==8
            xlswrite('output_sorted_median.xls',temp,'output','Q60')
        elseif i==9
            xlswrite('output_sorted_median.xls',temp,'output','S60')
        elseif i==10
            xlswrite('output_sorted_median.xls',temp,'output','U60')
        end
    end
    
    if exist(['GS',int2str(i),'_present'],'var');
        temp=eval(['GS',int2str(i),'_present']);
        if i==1
            xlswrite('output_sorted_median.xls',temp,'output','C98')
        elseif i==2
            xlswrite('output_sorted_median.xls',temp,'output','E98')
        elseif i==3
            xlswrite('output_sorted_median.xls',temp,'output','G98')
        elseif i==4
            xlswrite('output_sorted_median.xls',temp,'output','I98')
        elseif i==5
            xlswrite('output_sorted_median.xls',temp,'output','K98')
        elseif i==6
            xlswrite('output_sorted_median.xls',temp,'output','M98')
        elseif i==7
            xlswrite('output_sorted_median.xls',temp,'output','O98')
        elseif i==8
            xlswrite('output_sorted_median.xls',temp,'output','Q98')
        elseif i==9
            xlswrite('output_sorted_median.xls',temp,'output','S98')
        elseif i==10
            xlswrite('output_sorted_median.xls',temp,'output','U98')
        end
    end
end

clear all
load summarised_output_ms.mat
if exist('milk_sold_median','var');
    xlswrite('output_sorted_median.xls',milk_sold_median,'output','C13')
end

if exist('milk_sold_min','var');
    xlswrite('output_sorted_median.xls',milk_sold_min,'output','C14')
end

if exist('milk_sold_max','var');
    xlswrite('output_sorted_median.xls',milk_sold_max,'output','C15')
end

clear all
load summarised_output_mp.mat
if exist('M_median_mp','var');
    xlswrite('output_sorted_median.xls',M_median_mp,'output','C10')
end

if exist('M_min_mp','var');
    xlswrite('output_sorted_median.xls',M_min_mp,'output','C11')
end

if exist('M_max_mp','var');
    xlswrite('output_sorted_median.xls',M_max_mp,'output','C12')
end

for i=1:10
    if exist(['D',int2str(i),'_median_mp'],'var');
        temp=eval(['D',int2str(i),'_median_mp']);
        if i==1
            xlswrite('output_sorted_median.xls',temp,'output','C34')
        elseif i==2
            xlswrite('output_sorted_median.xls',temp,'output','E34')
        elseif i==3
            xlswrite('output_sorted_median.xls',temp,'output','G34')
        elseif i==4
            xlswrite('output_sorted_median.xls',temp,'output','I34')
        elseif i==5
            xlswrite('output_sorted_median.xls',temp,'output','K34')
        elseif i==6
            xlswrite('output_sorted_median.xls',temp,'output','M34')
        elseif i==7
            xlswrite('output_sorted_median.xls',temp,'output','O34')
        elseif i==8
            xlswrite('output_sorted_median.xls',temp,'output','Q34')
        elseif i==9
            xlswrite('output_sorted_median.xls',temp,'output','S34')
        elseif i==10
            xlswrite('output_sorted_median.xls',temp,'output','U34')
        end
    end
    
    if exist(['D',int2str(i),'_min_mp'],'var');
        temp=eval(['D',int2str(i),'_min_mp']);
        if i==1
            xlswrite('output_sorted_median.xls',temp,'output','C35')
        elseif i==2
            xlswrite('output_sorted_median.xls',temp,'output','E35')
        elseif i==3
            xlswrite('output_sorted_median.xls',temp,'output','G35')
        elseif i==4
            xlswrite('output_sorted_median.xls',temp,'output','I35')
        elseif i==5
            xlswrite('output_sorted_median.xls',temp,'output','K35')
        elseif i==6
            xlswrite('output_sorted_median.xls',temp,'output','M35')
        elseif i==7
            xlswrite('output_sorted_median.xls',temp,'output','O35')
        elseif i==8
            xlswrite('output_sorted_median.xls',temp,'output','Q35')
        elseif i==9
            xlswrite('output_sorted_median.xls',temp,'output','S35')
        elseif i==10
            xlswrite('output_sorted_median.xls',temp,'output','U35')
        end
    end
    
    if exist(['D',int2str(i),'_max_mp'],'var');
        temp=eval(['D',int2str(i),'_max_mp']);
        if i==1
            xlswrite('output_sorted_median.xls',temp,'output','C36')
        elseif i==2
            xlswrite('output_sorted_median.xls',temp,'output','E36')
        elseif i==3
            xlswrite('output_sorted_median.xls',temp,'output','G36')
        elseif i==4
            xlswrite('output_sorted_median.xls',temp,'output','I36')
        elseif i==5
            xlswrite('output_sorted_median.xls',temp,'output','K36')
        elseif i==6
            xlswrite('output_sorted_median.xls',temp,'output','M36')
        elseif i==7
            xlswrite('output_sorted_median.xls',temp,'output','O36')
        elseif i==8
            xlswrite('output_sorted_median.xls',temp,'output','Q36')
        elseif i==9
            xlswrite('output_sorted_median.xls',temp,'output','S36')
        elseif i==10
            xlswrite('output_sorted_median.xls',temp,'output','U36')
        end
    end
    
    if exist(['GD',int2str(i),'_median_mp'],'var');
        temp=eval(['GD',int2str(i),'_median_mp']);
        if i==1
            xlswrite('output_sorted_median.xls',temp,'output','C53')
        elseif i==2
            xlswrite('output_sorted_median.xls',temp,'output','E53')
        elseif i==3
            xlswrite('output_sorted_median.xls',temp,'output','G53')
        elseif i==4
            xlswrite('output_sorted_median.xls',temp,'output','I53')
        elseif i==5
            xlswrite('output_sorted_median.xls',temp,'output','K53')
        elseif i==6
            xlswrite('output_sorted_median.xls',temp,'output','M53')
        elseif i==7
            xlswrite('output_sorted_median.xls',temp,'output','O53')
        elseif i==8
            xlswrite('output_sorted_median.xls',temp,'output','Q53')
        elseif i==9
            xlswrite('output_sorted_median.xls',temp,'output','S53')
        elseif i==10
            xlswrite('output_sorted_median.xls',temp,'output','U53')
        end
    end
    
    if exist(['GD',int2str(i),'_min_mp'],'var');
        temp=eval(['GD',int2str(i),'_min_mp']);
        if i==1
            xlswrite('output_sorted_median.xls',temp,'output','C54')
        elseif i==2
            xlswrite('output_sorted_median.xls',temp,'output','E54')
        elseif i==3
            xlswrite('output_sorted_median.xls',temp,'output','G54')
        elseif i==4
            xlswrite('output_sorted_median.xls',temp,'output','I54')
        elseif i==5
            xlswrite('output_sorted_median.xls',temp,'output','K54')
        elseif i==6
            xlswrite('output_sorted_median.xls',temp,'output','M54')
        elseif i==7
            xlswrite('output_sorted_median.xls',temp,'output','O54')
        elseif i==8
            xlswrite('output_sorted_median.xls',temp,'output','Q54')
        elseif i==9
            xlswrite('output_sorted_median.xls',temp,'output','S54')
        elseif i==10
            xlswrite('output_sorted_median.xls',temp,'output','U54')
        end
    end
    
    if exist(['GD',int2str(i),'_max_mp'],'var');
        temp=eval(['GD',int2str(i),'_max_mp']);
        if i==1
            xlswrite('output_sorted_median.xls',temp,'output','C55')
        elseif i==2
            xlswrite('output_sorted_median.xls',temp,'output','E55')
        elseif i==3
            xlswrite('output_sorted_median.xls',temp,'output','G55')
        elseif i==4
            xlswrite('output_sorted_median.xls',temp,'output','I55')
        elseif i==5
            xlswrite('output_sorted_median.xls',temp,'output','K55')
        elseif i==6
            xlswrite('output_sorted_median.xls',temp,'output','M55')
        elseif i==7
            xlswrite('output_sorted_median.xls',temp,'output','O55')
        elseif i==8
            xlswrite('output_sorted_median.xls',temp,'output','Q55')
        elseif i==9
            xlswrite('output_sorted_median.xls',temp,'output','S55')
        elseif i==10
            xlswrite('output_sorted_median.xls',temp,'output','U55')
        end
    end
end

clear all
load summarised_output_nbcalv.mat
if exist('M_median_nbcalv','var');
    xlswrite('output_sorted_median.xls',M_median_nbcalv,'output','C16')
end

if exist('M_min_nbcalv','var');
    xlswrite('output_sorted_median.xls',M_min_nbcalv,'output','C17')
end

if exist('M_max_nbcalv','var');
    xlswrite('output_sorted_median.xls',M_max_nbcalv,'output','C18')
end

for i=1:10
    if exist(['D',int2str(i),'_median_nbcalv'],'var');
        temp=eval(['D',int2str(i),'_median_nbcalv']);
        if i==1
            xlswrite('output_sorted_median.xls',temp,'output','C37')
        elseif i==2
            xlswrite('output_sorted_median.xls',temp,'output','E37')
        elseif i==3
            xlswrite('output_sorted_median.xls',temp,'output','G37')
        elseif i==4
            xlswrite('output_sorted_median.xls',temp,'output','I37')
        elseif i==5
            xlswrite('output_sorted_median.xls',temp,'output','K37')
        elseif i==6
            xlswrite('output_sorted_median.xls',temp,'output','M37')
        elseif i==7
            xlswrite('output_sorted_median.xls',temp,'output','O37')
        elseif i==8
            xlswrite('output_sorted_median.xls',temp,'output','Q37')
        elseif i==9
            xlswrite('output_sorted_median.xls',temp,'output','S37')
        elseif i==10
            xlswrite('output_sorted_median.xls',temp,'output','U37')
        end
    end
    
    if exist(['D',int2str(i),'_min_nbcalv'],'var');
        temp=eval(['D',int2str(i),'_min_nbcalv']);
        if i==1
            xlswrite('output_sorted_median.xls',temp,'output','C38')
        elseif i==2
            xlswrite('output_sorted_median.xls',temp,'output','E38')
        elseif i==3
            xlswrite('output_sorted_median.xls',temp,'output','G38')
        elseif i==4
            xlswrite('output_sorted_median.xls',temp,'output','I38')
        elseif i==5
            xlswrite('output_sorted_median.xls',temp,'output','K38')
        elseif i==6
            xlswrite('output_sorted_median.xls',temp,'output','M38')
        elseif i==7
            xlswrite('output_sorted_median.xls',temp,'output','O38')
        elseif i==8
            xlswrite('output_sorted_median.xls',temp,'output','Q38')
        elseif i==9
            xlswrite('output_sorted_median.xls',temp,'output','S38')
        elseif i==10
            xlswrite('output_sorted_median.xls',temp,'output','U38')
        end
    end
    
    if exist(['D',int2str(i),'_max_nbcalv'],'var');
        temp=eval(['D',int2str(i),'_max_nbcalv']);
        if i==1
            xlswrite('output_sorted_median.xls',temp,'output','C39')
        elseif i==2
            xlswrite('output_sorted_median.xls',temp,'output','E39')
        elseif i==3
            xlswrite('output_sorted_median.xls',temp,'output','G39')
        elseif i==4
            xlswrite('output_sorted_median.xls',temp,'output','I39')
        elseif i==5
            xlswrite('output_sorted_median.xls',temp,'output','K39')
        elseif i==6
            xlswrite('output_sorted_median.xls',temp,'output','M39')
        elseif i==7
            xlswrite('output_sorted_median.xls',temp,'output','O39')
        elseif i==8
            xlswrite('output_sorted_median.xls',temp,'output','Q39')
        elseif i==9
            xlswrite('output_sorted_median.xls',temp,'output','S39')
        elseif i==10
            xlswrite('output_sorted_median.xls',temp,'output','U39')
        end
    end
    
    if exist(['GD',int2str(i),'_median_nbcalv'],'var');
        temp=eval(['GD',int2str(i),'_median_nbcalv']);
        if i==1
            xlswrite('output_sorted_median.xls',temp,'output','C56')
        elseif i==2
            xlswrite('output_sorted_median.xls',temp,'output','E56')
        elseif i==3
            xlswrite('output_sorted_median.xls',temp,'output','G56')
        elseif i==4
            xlswrite('output_sorted_median.xls',temp,'output','I56')
        elseif i==5
            xlswrite('output_sorted_median.xls',temp,'output','K56')
        elseif i==6
            xlswrite('output_sorted_median.xls',temp,'output','M56')
        elseif i==7
            xlswrite('output_sorted_median.xls',temp,'output','O56')
        elseif i==8
            xlswrite('output_sorted_median.xls',temp,'output','Q56')
        elseif i==9
            xlswrite('output_sorted_median.xls',temp,'output','S56')
        elseif i==10
            xlswrite('output_sorted_median.xls',temp,'output','U56')
        end
    end
    
    if exist(['GD',int2str(i),'_min_nbcalv'],'var');
        temp=eval(['GD',int2str(i),'_min_nbcalv']);
        if i==1
            xlswrite('output_sorted_median.xls',temp,'output','C57')
        elseif i==2
            xlswrite('output_sorted_median.xls',temp,'output','E57')
        elseif i==3
            xlswrite('output_sorted_median.xls',temp,'output','G57')
        elseif i==4
            xlswrite('output_sorted_median.xls',temp,'output','I57')
        elseif i==5
            xlswrite('output_sorted_median.xls',temp,'output','K57')
        elseif i==6
            xlswrite('output_sorted_median.xls',temp,'output','M57')
        elseif i==7
            xlswrite('output_sorted_median.xls',temp,'output','O57')
        elseif i==8
            xlswrite('output_sorted_median.xls',temp,'output','Q57')
        elseif i==9
            xlswrite('output_sorted_median.xls',temp,'output','S57')
        elseif i==10
            xlswrite('output_sorted_median.xls',temp,'output','U57')
        end
    end
    
    if exist(['GD',int2str(i),'_max_nbcalv'],'var');
        temp=eval(['GD',int2str(i),'_max_nbcalv']);
        if i==1
            xlswrite('output_sorted_median.xls',temp,'output','C58')
        elseif i==2
            xlswrite('output_sorted_median.xls',temp,'output','E58')
        elseif i==3
            xlswrite('output_sorted_median.xls',temp,'output','G58')
        elseif i==4
            xlswrite('output_sorted_median.xls',temp,'output','I58')
        elseif i==5
            xlswrite('output_sorted_median.xls',temp,'output','K58')
        elseif i==6
            xlswrite('output_sorted_median.xls',temp,'output','M58')
        elseif i==7
            xlswrite('output_sorted_median.xls',temp,'output','O58')
        elseif i==8
            xlswrite('output_sorted_median.xls',temp,'output','Q58')
        elseif i==9
            xlswrite('output_sorted_median.xls',temp,'output','S58')
        elseif i==10
            xlswrite('output_sorted_median.xls',temp,'output','U58')
        end
    end
end

clear all
load summarised_output_age_fc.mat
if exist('M_median_age_fc','var');
    xlswrite('output_sorted_median.xls',M_median_age_fc,'output','C1')
end

if exist('M_min_age_fc','var');
    xlswrite('output_sorted_median.xls',M_min_age_fc,'output','C2')
end

if exist('M_max_age_fc','var');
    xlswrite('output_sorted_median.xls',M_max_age_fc,'output','C3')
end

for i=1:10
    if exist(['D',int2str(i),'_median_age_fc'],'var');
        temp=eval(['D',int2str(i),'_median_age_fc']);
        if i==1
            xlswrite('output_sorted_median.xls',temp,'output','C25')
        elseif i==2
            xlswrite('output_sorted_median.xls',temp,'output','E25')
        elseif i==3
            xlswrite('output_sorted_median.xls',temp,'output','G25')
        elseif i==4
            xlswrite('output_sorted_median.xls',temp,'output','I25')
        elseif i==5
            xlswrite('output_sorted_median.xls',temp,'output','K25')
        elseif i==6
            xlswrite('output_sorted_median.xls',temp,'output','M25')
        elseif i==7
            xlswrite('output_sorted_median.xls',temp,'output','O25')
        elseif i==8
            xlswrite('output_sorted_median.xls',temp,'output','Q25')
        elseif i==9
            xlswrite('output_sorted_median.xls',temp,'output','S25')
        elseif i==10
            xlswrite('output_sorted_median.xls',temp,'output','U25')
        end
    end
    
    if exist(['D',int2str(i),'_min_age_fc'],'var');
        temp=eval(['D',int2str(i),'_min_age_fc']);
        if i==1
            xlswrite('output_sorted_median.xls',temp,'output','C26')
        elseif i==2
            xlswrite('output_sorted_median.xls',temp,'output','E26')
        elseif i==3
            xlswrite('output_sorted_median.xls',temp,'output','G26')
        elseif i==4
            xlswrite('output_sorted_median.xls',temp,'output','I26')
        elseif i==5
            xlswrite('output_sorted_median.xls',temp,'output','K26')
        elseif i==6
            xlswrite('output_sorted_median.xls',temp,'output','M26')
        elseif i==7
            xlswrite('output_sorted_median.xls',temp,'output','O26')
        elseif i==8
            xlswrite('output_sorted_median.xls',temp,'output','Q26')
        elseif i==9
            xlswrite('output_sorted_median.xls',temp,'output','S26')
        elseif i==10
            xlswrite('output_sorted_median.xls',temp,'output','U26')
        end
    end
    
    if exist(['D',int2str(i),'_max_age_fc'],'var');
        temp=eval(['D',int2str(i),'_max_age_fc']);
        if i==1
            xlswrite('output_sorted_median.xls',temp,'output','C27')
        elseif i==2
            xlswrite('output_sorted_median.xls',temp,'output','E27')
        elseif i==3
            xlswrite('output_sorted_median.xls',temp,'output','G27')
        elseif i==4
            xlswrite('output_sorted_median.xls',temp,'output','I27')
        elseif i==5
            xlswrite('output_sorted_median.xls',temp,'output','K27')
        elseif i==6
            xlswrite('output_sorted_median.xls',temp,'output','M27')
        elseif i==7
            xlswrite('output_sorted_median.xls',temp,'output','O27')
        elseif i==8
            xlswrite('output_sorted_median.xls',temp,'output','Q27')
        elseif i==9
            xlswrite('output_sorted_median.xls',temp,'output','S27')
        elseif i==10
            xlswrite('output_sorted_median.xls',temp,'output','U27')
        end
    end
    
    if exist(['GD',int2str(i),'_median_age_fc'],'var');
        temp=eval(['GD',int2str(i),'_median_age_fc']);
        if i==1
            xlswrite('output_sorted_median.xls',temp,'output','C44')
        elseif i==2
            xlswrite('output_sorted_median.xls',temp,'output','E44')
        elseif i==3
            xlswrite('output_sorted_median.xls',temp,'output','G44')
        elseif i==4
            xlswrite('output_sorted_median.xls',temp,'output','I44')
        elseif i==5
            xlswrite('output_sorted_median.xls',temp,'output','K44')
        elseif i==6
            xlswrite('output_sorted_median.xls',temp,'output','M44')
        elseif i==7
            xlswrite('output_sorted_median.xls',temp,'output','O44')
        elseif i==8
            xlswrite('output_sorted_median.xls',temp,'output','Q44')
        elseif i==9
            xlswrite('output_sorted_median.xls',temp,'output','S44')
        elseif i==10
            xlswrite('output_sorted_median.xls',temp,'output','U44')
        end
    end
    
    if exist(['GD',int2str(i),'_min_age_fc'],'var');
        temp=eval(['GD',int2str(i),'_min_age_fc']);
        if i==1
            xlswrite('output_sorted_median.xls',temp,'output','C45')
        elseif i==2
            xlswrite('output_sorted_median.xls',temp,'output','E45')
        elseif i==3
            xlswrite('output_sorted_median.xls',temp,'output','G45')
        elseif i==4
            xlswrite('output_sorted_median.xls',temp,'output','I45')
        elseif i==5
            xlswrite('output_sorted_median.xls',temp,'output','K45')
        elseif i==6
            xlswrite('output_sorted_median.xls',temp,'output','M45')
        elseif i==7
            xlswrite('output_sorted_median.xls',temp,'output','O45')
        elseif i==8
            xlswrite('output_sorted_median.xls',temp,'output','Q45')
        elseif i==9
            xlswrite('output_sorted_median.xls',temp,'output','S45')
        elseif i==10
            xlswrite('output_sorted_median.xls',temp,'output','U45')
        end
    end
    
    if exist(['GD',int2str(i),'_max_age_fc'],'var');
        temp=eval(['GD',int2str(i),'_max_age_fc']);
        if i==1
            xlswrite('output_sorted_median.xls',temp,'output','C46')
        elseif i==2
            xlswrite('output_sorted_median.xls',temp,'output','E46')
        elseif i==3
            xlswrite('output_sorted_median.xls',temp,'output','G46')
        elseif i==4
            xlswrite('output_sorted_median.xls',temp,'output','I46')
        elseif i==5
            xlswrite('output_sorted_median.xls',temp,'output','K46')
        elseif i==6
            xlswrite('output_sorted_median.xls',temp,'output','M46')
        elseif i==7
            xlswrite('output_sorted_median.xls',temp,'output','O46')
        elseif i==8
            xlswrite('output_sorted_median.xls',temp,'output','Q46')
        elseif i==9
            xlswrite('output_sorted_median.xls',temp,'output','S46')
        elseif i==10
            xlswrite('output_sorted_median.xls',temp,'output','U46')
        end
    end
end

clear all
load summarised_output_calvint.mat
if exist('M_median_calvint','var');
    xlswrite('output_sorted_median.xls',M_median_calvint,'output','C7')
end

if exist('M_min_calvint','var');
    xlswrite('output_sorted_median.xls',M_min_calvint,'output','C8')
end

if exist('M_max_calvint','var');
    xlswrite('output_sorted_median.xls',M_max_calvint,'output','C9')
end

for i=1:10
    if exist(['D',int2str(i),'_median_calvint'],'var');
        temp=eval(['D',int2str(i),'_median_calvint']);
        if i==1
            xlswrite('output_sorted_median.xls',temp,'output','C31')
        elseif i==2
            xlswrite('output_sorted_median.xls',temp,'output','E31')
        elseif i==3
            xlswrite('output_sorted_median.xls',temp,'output','G31')
        elseif i==4
            xlswrite('output_sorted_median.xls',temp,'output','I31')
        elseif i==5
            xlswrite('output_sorted_median.xls',temp,'output','K31')
        elseif i==6
            xlswrite('output_sorted_median.xls',temp,'output','M31')
        elseif i==7
            xlswrite('output_sorted_median.xls',temp,'output','O31')
        elseif i==8
            xlswrite('output_sorted_median.xls',temp,'output','Q31')
        elseif i==9
            xlswrite('output_sorted_median.xls',temp,'output','S31')
        elseif i==10
            xlswrite('output_sorted_median.xls',temp,'output','U31')
        end
    end
    
    if exist(['D',int2str(i),'_min_calvint'],'var');
        temp=eval(['D',int2str(i),'_min_calvint']);
        if i==1
            xlswrite('output_sorted_median.xls',temp,'output','C32')
        elseif i==2
            xlswrite('output_sorted_median.xls',temp,'output','E32')
        elseif i==3
            xlswrite('output_sorted_median.xls',temp,'output','G32')
        elseif i==4
            xlswrite('output_sorted_median.xls',temp,'output','I32')
        elseif i==5
            xlswrite('output_sorted_median.xls',temp,'output','K32')
        elseif i==6
            xlswrite('output_sorted_median.xls',temp,'output','M32')
        elseif i==7
            xlswrite('output_sorted_median.xls',temp,'output','O32')
        elseif i==8
            xlswrite('output_sorted_median.xls',temp,'output','Q32')
        elseif i==9
            xlswrite('output_sorted_median.xls',temp,'output','S32')
        elseif i==10
            xlswrite('output_sorted_median.xls',temp,'output','U32')
        end
    end
    
    if exist(['D',int2str(i),'_max_calvint'],'var');
        temp=eval(['D',int2str(i),'_max_calvint']);
        if i==1
            xlswrite('output_sorted_median.xls',temp,'output','C33')
        elseif i==2
            xlswrite('output_sorted_median.xls',temp,'output','E33')
        elseif i==3
            xlswrite('output_sorted_median.xls',temp,'output','G33')
        elseif i==4
            xlswrite('output_sorted_median.xls',temp,'output','I33')
        elseif i==5
            xlswrite('output_sorted_median.xls',temp,'output','K33')
        elseif i==6
            xlswrite('output_sorted_median.xls',temp,'output','M33')
        elseif i==7
            xlswrite('output_sorted_median.xls',temp,'output','O33')
        elseif i==8
            xlswrite('output_sorted_median.xls',temp,'output','Q33')
        elseif i==9
            xlswrite('output_sorted_median.xls',temp,'output','S33')
        elseif i==10
            xlswrite('output_sorted_median.xls',temp,'output','U33')
        end
    end
    
    if exist(['GD',int2str(i),'_median_calvint'],'var');
        temp=eval(['GD',int2str(i),'_median_calvint']);
        if i==1
            xlswrite('output_sorted_median.xls',temp,'output','C50')
        elseif i==2
            xlswrite('output_sorted_median.xls',temp,'output','E50')
        elseif i==3
            xlswrite('output_sorted_median.xls',temp,'output','G50')
        elseif i==4
            xlswrite('output_sorted_median.xls',temp,'output','I50')
        elseif i==5
            xlswrite('output_sorted_median.xls',temp,'output','K50')
        elseif i==6
            xlswrite('output_sorted_median.xls',temp,'output','M50')
        elseif i==7
            xlswrite('output_sorted_median.xls',temp,'output','O50')
        elseif i==8
            xlswrite('output_sorted_median.xls',temp,'output','Q50')
        elseif i==9
            xlswrite('output_sorted_median.xls',temp,'output','S50')
        elseif i==10
            xlswrite('output_sorted_median.xls',temp,'output','U50')
        end
    end
    
    if exist(['GD',int2str(i),'_min_calvint'],'var');
        temp=eval(['GD',int2str(i),'_min_calvint']);
        if i==1
            xlswrite('output_sorted_median.xls',temp,'output','C51')
        elseif i==2
            xlswrite('output_sorted_median.xls',temp,'output','E51')
        elseif i==3
            xlswrite('output_sorted_median.xls',temp,'output','G51')
        elseif i==4
            xlswrite('output_sorted_median.xls',temp,'output','I51')
        elseif i==5
            xlswrite('output_sorted_median.xls',temp,'output','K51')
        elseif i==6
            xlswrite('output_sorted_median.xls',temp,'output','M51')
        elseif i==7
            xlswrite('output_sorted_median.xls',temp,'output','O51')
        elseif i==8
            xlswrite('output_sorted_median.xls',temp,'output','Q51')
        elseif i==9
            xlswrite('output_sorted_median.xls',temp,'output','S51')
        elseif i==10
            xlswrite('output_sorted_median.xls',temp,'output','U51')
        end
    end
    
    if exist(['GD',int2str(i),'_max_calvint'],'var');
        temp=eval(['GD',int2str(i),'_max_calvint']);
        if i==1
            xlswrite('output_sorted_median.xls',temp,'output','C52')
        elseif i==2
            xlswrite('output_sorted_median.xls',temp,'output','E52')
        elseif i==3
            xlswrite('output_sorted_median.xls',temp,'output','G52')
        elseif i==4
            xlswrite('output_sorted_median.xls',temp,'output','I52')
        elseif i==5
            xlswrite('output_sorted_median.xls',temp,'output','K52')
        elseif i==6
            xlswrite('output_sorted_median.xls',temp,'output','M52')
        elseif i==7
            xlswrite('output_sorted_median.xls',temp,'output','O52')
        elseif i==8
            xlswrite('output_sorted_median.xls',temp,'output','Q52')
        elseif i==9
            xlswrite('output_sorted_median.xls',temp,'output','S52')
        elseif i==10
            xlswrite('output_sorted_median.xls',temp,'output','U52')
        end
    end
end