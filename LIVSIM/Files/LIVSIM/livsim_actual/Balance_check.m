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

%----------------------------Balance_check---------------------------------

%Compare needs for potential production with actual intake
%Calculates actual growth, production and excretion
%version June 2009 ---Mariana Rufino
%--------------------------------------------------------------------------

function [COW]=Balance_check(COW,COW_OLD,PARAM)

BALANCE.ME.Balance=COW.INPUT.ME/COW.NEED.PotGrowthME; 
BALANCE.MP.Balance=COW.INPUT.MP/COW.NEED.PotGrowthMP;

if BALANCE.ME.Balance<1 || BALANCE.MP.Balance<1
    if COW.OUT.Milk==0&&COW.CHAR.PregInd==0&&COW.CHAR.Age>=PARAM.SYS.timestep %non-lactanting and non-pregnant 
        [COW] =case_1(COW,COW_OLD,PARAM,BALANCE);
    elseif COW.OUT.Milk==0&&COW.CHAR.PregInd>0; %non-lactanting and pregnant 
        [COW] =case_2(COW,COW_OLD,PARAM,BALANCE);
    elseif COW.OUT.Milk>0&&COW.CHAR.PregInd==0; %lactanting and non-pregnant
        [COW] =case_3(COW,COW_OLD,PARAM,BALANCE);      
    elseif COW.OUT.Milk>0&&COW.CHAR.PregInd>0; %lactanting and pregnant 
        [COW] =case_4(COW,COW_OLD,PARAM,BALANCE);
    end
end

COW.OUT.CumMilk = COW_OLD.OUT.CumMilk + COW.OUT.Milk; %cummulative milk

if COW.OUT.Milk>0
    COW.OUT.CumDayMilk=COW_OLD.OUT.CumDayMilk +(PARAM.SYS.timestep*PARAM.SYS.YLEN);%cumulative days in milk
end

if COW.CHAR.BW<COW.CHAR.MinBWAgeComb
    COW.CHAR.FeedDeficit=COW.CHAR.FeedDeficit+1;%mortality index
else
    COW.CHAR.FeedDeficit=0;
end

COW.NEED.BasalMaint=0;%basal maintenance set to 0

if COW.OUT.NbCalv>=1&&COW.CHAR.PregInd==0
    COW.OUT.CumDayOpen=COW_OLD.OUT.CumDayOpen+(PARAM.SYS.timestep*PARAM.SYS.YLEN); %cumulative days open
end



           