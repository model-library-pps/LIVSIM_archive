%-------------------------------------------------------------------------
%                           Conception
%Mariana Rufino                                              January 2009
%Modified for application in Mali
%Feasible set
%-------------------------------------------------------------------------


function [COW,COW_OLD]=Conception(COW,COW_OLD,PARAM)

if COW.CHAR.Sex==1 && COW.CHAR.PregInd==0 && COW.CHAR.Age>=PARAM.REPR.Age(1)
    WeightLimit=interp1(PARAM.REPR.Age,PARAM.REPR.Weights,COW.CHAR.Age); check(WeightLimit);
    if COW_OLD.CHAR.BW>=WeightLimit %use the weight of the last month
        COW.CHAR.Stat=1;
    else
        COW.CHAR.Stat=0;
    end
end

%Probability of conception from Konandreas and Anderson (1982)with free Breeding

if COW.CHAR.Sex==1&&COW.CHAR.Stat==1&&COW.CHAR.PregInd==0
    clear annual_rate;
    calving_rate            = 0.9; % Coulomb, 1970; Wagenaar and Kontrohr 1986 Modelling extensive..."
    age_effect_calving_rate =interp1(PARAM.REPR.CalvRateAge,PARAM.REPR.CalvRate,COW.CHAR.Age); check(age_effect_calving_rate);%input data changed
    annual_rate             =calving_rate*age_effect_calving_rate;
    P                       =1-(1-annual_rate)^(1/12);
    %Effect of postpartum from Wagenaar and Kontrohr 1986
    if COW.OUT.NbCalv==0
        mn=1;
    else
        if COW.CHAR.CalvInd>0.0001&&COW.CHAR.CalvInd<2*PARAM.SYS.Monthstep %PARAM.SYS.timestep 
            mn=0;
        else
            postpartum_length =[2/12 7/12 144/12]; % à verifier
            mn_estimated      =[0.5 1.0 1.0];
            mn                =interp1(postpartum_length,mn_estimated,COW.CHAR.CalvInd); check(mn);
        end
    end
    
    %Presence of bull
    if PARAM.REPR.Bull==1
        mb=1;
    else
        mb=0;
    end
    %Effect of condition
    Weight_max =interp1(PARAM.BW.PotFemaleAge,PARAM.BW.PotFemale,COW_OLD.CHAR.Age); check(Weight_max);
    Weight_min =interp1(PARAM.BW.ami,PARAM.BW.wmi,COW_OLD.CHAR.Age); check(Weight_min);
    CondIndex  =min(1,(COW_OLD.CHAR.BW-Weight_min)/(Weight_max-Weight_min));
    
    %Adapted from Wagenaar and Kontrohr (1986)
    if CondIndex<=0.2
        mc=0;
    elseif CondIndex>0.2&&CondIndex<=0.5
        mc=2.66670*CondIndex-0.5333 ;
    elseif CondIndex>0.5&&CondIndex<=0.9
        mc=0.5*CondIndex+0.65;
    elseif CondIndex>0.9&&CondIndex<=1
        mc=2.4-1.5*CondIndex;
    end
    %Calculation of monthly probability
    Prob=P*mn*mb*mc;
    COW.OUT.ProbaConception=mc;
    COW.OUT.CondIndex = CondIndex;
 
    COW.CHAR.ProbaConception=Prob;
    COW.CHAR.RandNbConception=rand;
    if COW.CHAR.RandNbConception<=Prob
        COW.CHAR.PregInd=PARAM.SYS.timestep;
        if COW.OUT.NbCalv==0
            COW.OUT.AgeFirstConc=COW.CHAR.Age; %age at first conception
        end
    else
        COW.CHAR.PregInd=0;
    end
end