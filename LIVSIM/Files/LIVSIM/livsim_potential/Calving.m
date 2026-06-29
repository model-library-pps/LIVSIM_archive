%------------------------CALVING----------------------------------------

%Calves are born when gestation is finished
%--------------------------Calving-----------------------------------------
%
%Version Updated May 2009 ---Mariana Rufino
%Introduced an index to keep track of the lactation
%--------------------------------------------------------------------------

function [COW,NEW_COW,NbCows]=Calving(COW,PARAM,COW_OLD,NbCows)

NEW_COW=[];

if COW.CHAR.PregInd>0.7&&COW.CHAR.PregInd<=PARAM.REPR.PREGN+PARAM.SYS.timestep
    if COW.CHAR.PregInd>=PARAM.REPR.PREGN;
        [NEW_COW]        =Define_calf(COW,NbCows,PARAM);
        NEW_COW.CHAR.Sex =rand>0.5; %gender of calves
        NEW_COW.CHAR.Age =COW.CHAR.PregInd-PARAM.REPR.PREGN; %age new cows
        
        %Calculate condition index of the dam at calving
        Weight_max        =interp1(PARAM.BW.PotFemaleAge,PARAM.BW.PotFemale,COW_OLD.CHAR.Age); check(Weight_max);
        Weight_min        =interp1(PARAM.BW.ami,PARAM.BW.wmi,COW_OLD.CHAR.Age); check(Weight_min);
        CondIndex         =(COW_OLD.CHAR.BW-Weight_min)/(Weight_max-Weight_min);
        Condition_indices =[1E-9 0.5 1];BWs_at_birth=[15 23 28]; %input in kg
        PARAM.REPR.CBW    =interp1(Condition_indices,BWs_at_birth,CondIndex); check(PARAM.REPR.CBW);
        if NEW_COW.CHAR.Sex>0.5
            Weight_max                   =interp1(PARAM.BW.PotFemaleAge,PARAM.BW.PotFemale,NEW_COW.CHAR.Age); check(Weight_max);
            Weight_min                   =interp1(PARAM.BW.ami,PARAM.BW.wmi,NEW_COW.CHAR.Age); check(Weight_min);
            NEW_COW.CHAR.GrowthLastMonth =Weight_max-PARAM.REPR.CBW;%new potential weight
            NEW_COW.CHAR.BW              =mean([Weight_max PARAM.REPR.CBW]);
            NEW_COW.CHAR.MinBWAgeComb    =Weight_min;
        else
            Weight_max                   =interp1(PARAM.BW.PotMaleAge,PARAM.BW.PotMale,NEW_COW.CHAR.Age); check(Weight_max);
            Weight_min                   =interp1(PARAM.BW.ami,PARAM.BW.wmi,COW.CHAR.Age); check(Weight_min);
            NEW_COW.CHAR.GrowthLastMonth =Weight_max-PARAM.REPR.CBW;%new potential weight
            NEW_COW.CHAR.BW              =Weight_max;
            NEW_COW.CHAR.MinBWAgeComb    =Weight_min;
        end
        
        NbCows           =NbCows+1;
        COW.CHAR.CalvInd =NEW_COW.CHAR.Age;    %calving index
        COW.CHAR.LactInd =NEW_COW.CHAR.Age;    %lactation index
        COW.CHAR.PregInd =0;
        COW.NEED.GestME  =0;
        COW.NEED.GestMP  =0;
        COW.OUT.NbCalv   =COW.OUT.NbCalv+1;      %  cumulative number of calves
        COW.OUT.AgeLastCalv=COW.CHAR.Age;
        if COW.OUT.NbCalv==1
            COW.OUT.AgeFirstCalv=COW.CHAR.Age; %age at first calving
        end
    end
end

if COW.OUT.NbCalv>0.5
    COW.CHAR.Progenitor=1;
else
    COW.CHAR.Progenitor=0;
end