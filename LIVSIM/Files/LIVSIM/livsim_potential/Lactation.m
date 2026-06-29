%-------------------------------------------------------------------------
% Copyright 2013. Wageningen University, Plant Production Systems group,  
% P.O. Box 430, 6700 AK Wageningen, The Netherlands.                      
% You may not use this work except in compliance with the Licence.        
% You may obtain a copy of the Licence at:                                
%                                                                         
% http://models.pps.wur.nl/content/licence-agreement                      
%                                                                         
% Unless required by applicable law or agreed to in writing, software     
% distributed under the Licence is distributed on an "AS IS" basis,       
% WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
%-------------------------------------------------------------------------

%----------------------------Lactation-------------------------------------
%
%Lactation energy needs
%version Updated February 2011 ---Mink Zijlstra
%-------------------------------------------------------------------------

function [COW]=Lactation(COW,COW_OLD,PARAM,COWS)

CALVES=[];
if length(COWS)>1 && COW.BreedID==4 && COW.CHAR.LactInd>PARAM.SYS.Monthstep
    for counter=1:length(COWS)
        if COWS(counter).SYS.DamID==COW.SYS.ID
            CALVES=[CALVES; COWS(counter)];
        end
    end
    j=length(CALVES);
    if CALVES(j).CHAR.Age<=PARAM.LACT.LACLEN && CALVES(j).CHAR.DEATH>0
        lactation_stop=1;
    elseif CALVES(j).CHAR.Age<=PARAM.LACT.LACLEN && CALVES(j).CHAR.DEATH==0
        lactation_stop=0;
    else
        error('this calf seems to be neither dead nor alive')
    end
else
    lactation_stop=0;
end

if COW.CHAR.CalvInd>0 && COW.CHAR.CalvInd<=PARAM.LACT.LACLEN && COW.CHAR.FeedDeficit==0 && COW.CHAR.LactInd>=0.01 && lactation_stop==0 %use calving index to keep tract of lactation
    PARAM.AFRC.L    =2; %Level of feeding for late pregnancy and lactation
    PARAM.AFRC.CL   =1+0.018*(PARAM.AFRC.L-1); %L is multiple of ME maintenance req.
    actual_milk_fat =interp1(PARAM.LACT.MilkFatLP,PARAM.LACT.MilkFat,COW.CHAR.LactInd); check(actual_milk_fat);
    PARAM.AFRC.EVl  =0.0406*actual_milk_fat+1.509;%MJ/kg energy value of milk
    
    if COW.CHAR.CalvInd>0&&COW.CHAR.CalvInd<=2*PARAM.SYS.Monthstep %PARAM.SYS.timestep;
        Weight_min       =interp1(PARAM.BW.ami,PARAM.BW.wmi,COW_OLD.CHAR.Age); check(Weight_min);
        Weight_max       =interp1(PARAM.BW.ama,PARAM.BW.wma,COW_OLD.CHAR.Age); check(Weight_max);
        CondIndex        =min(1,(COW_OLD.CHAR.BW-Weight_min)/(Weight_max-Weight_min));
        Condition_effect =interp1(PARAM.BW.CondIn,PARAM.BW.CondFactor,CondIndex); check(Condition_effect); % this doesn't work!!!!!
        if CondIndex<0
            Condition_effect=0;
        end
        Milk_yield           =interp1(PARAM.LACT.MilkRateLP,PARAM.LACT.MilkRate,COW.CHAR.LactInd); check(Milk_yield);
        Effect_age           =interp1(PARAM.LACT.CriticalAge,PARAM.LACT.Fraction,COW.CHAR.Age); check(Effect_age);
        Milk_production      =PARAM.SYS.timestep*Milk_yield*Effect_age*Condition_effect;
        COW.OUT.Milk         =Milk_production;
        PARAM.AFRC.Ml        =Milk_production*PARAM.AFRC.EVl/PARAM.AFRC.kl; %MJ/month
        COW.NEED.LactME      =PARAM.AFRC.CL*PARAM.AFRC.Ml;
        COW.NEED.PotGrowthME =COW.NEED.PotGrowthME+COW.NEED.LactME; %MJ/timestep;
        
    else
        if COW.CHAR.PregInd<=PARAM.LACT.WODRYPE %dry period
            Weight_min       =interp1(PARAM.BW.ami,PARAM.BW.wmi,COW_OLD.CHAR.Age); check(Weight_min);
            Weight_max       =interp1(PARAM.BW.ama,PARAM.BW.wma,COW_OLD.CHAR.Age); check(Weight_max);
            CondIndex        =(COW_OLD.CHAR.BW-Weight_min)/(Weight_max-Weight_min);
            Condition_effect =interp1(PARAM.BW.CondIn,PARAM.BW.CondFactor,CondIndex); check(Condition_effect);
            if CondIndex<0
                Condition_effect=0;
            end
            Milk_yield           =interp1(PARAM.LACT.MilkRateLP,PARAM.LACT.MilkRate,COW.CHAR.LactInd); check(Milk_yield);
            Milk_yield_old       =interp1(PARAM.LACT.MilkRateLP,PARAM.LACT.MilkRate,COW_OLD.CHAR.LactInd); check(Milk_yield_old);
            Effect_age           =interp1(PARAM.LACT.CriticalAge,PARAM.LACT.Fraction,COW.CHAR.Age); check(Effect_age);
            Milk_production      =mean([Milk_yield_old Milk_yield])*PARAM.SYS.timestep*Effect_age*Condition_effect;
            COW.OUT.Milk         =Milk_production; %kg per timestep
            PARAM.AFRC.Ml        =COW.OUT.Milk*PARAM.AFRC.EVl/PARAM.AFRC.kl; %MJ/month
            COW.NEED.LactME      =PARAM.AFRC.CL*PARAM.AFRC.Ml;
            COW.NEED.PotGrowthME =COW.NEED.PotGrowthME+COW.NEED.LactME; %MJ/timestep;
            
        else
            Milk_production      =0;
            COW.OUT.Milk         =Milk_production; %kg per timestep
            COW.CHAR.LactInd     =0; %kg per timestep
            PARAM.AFRC.Ml        =COW.OUT.Milk*PARAM.AFRC.EVl/PARAM.AFRC.kl; %MJ/month
            COW.NEED.LactME      =PARAM.AFRC.CL*PARAM.AFRC.Ml;
            COW.NEED.PotGrowthME =COW.NEED.PotGrowthME+COW.NEED.LactME; %MJ/timestep;
        end
    end
    
    %MP Lactation requirements
    PARAM.AFRC.MPl       =(COW.OUT.Milk*PARAM.LACT.MilkCP*13.57)/1000; %where CP is crude protein eq. for cattle
    COW.NEED.LactMP      =PARAM.AFRC.MPl; check(COW.NEED.LactMP);
    COW.NEED.PotGrowthMP =COW.NEED.PotGrowthMP+COW.NEED.LactMP; %MJ/timestep;
    
elseif COW.CHAR.FeedDeficit>0&&COW.CHAR.CalvInd>0&&COW.CHAR.CalvInd<=PARAM.LACT.LACLEN||COW.CHAR.CalvInd>0&&COW.CHAR.CalvInd<=PARAM.LACT.LACLEN&&COW.CHAR.LactInd<0.01||lactation_stop==1
    COW.NEED.PotGrowthME =COW.NEED.PotGrowthME;
    COW.NEED.PotGrowthMP =COW.NEED.PotGrowthMP;
    COW.OUT.Milk         =0;
    COW.NEED.LactME      =0;
    COW.NEED.LactMP      =0;
end


