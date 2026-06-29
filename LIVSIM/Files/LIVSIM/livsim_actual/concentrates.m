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

%--------------------------------CONCENTRATE-------------------------------
%                   
%Jerome                                                     March 2008
%
%--------------------------------------------------------------------------

function [CONCENTRATEquantity,CONCENTRATEquality]=concentrates(COW,PARAM,MGMT,CONCENTRATE)


Ration_suckling=0;
Ration_pregnant=0; late_pregnancy=7/12;%it was 15 both
Ration_weaners=0;still_calf_age=8/12;
Ration_dry=0;%15 for weaners
Ration_youngs=0;young_age=1.5;
Ration_early_lactating=0;a_terme=9/12;early_lactation=150/365;
Ration_lactating=0; late_lactation=10/12;%it was 15,152 and 30.4


FEED.concentrate.DM=sum(CONCENTRATE.QUANTITY(:,PARAM.SYS.month).*CONCENTRATE.QUALITY(:,1))/sum(CONCENTRATE.QUANTITY(:,PARAM.SYS.month))
CONCENTRATEquality.ME=sum(CONCENTRATE.QUANTITY(:,PARAM.SYS.month).*CONCENTRATE.QUALITY(:,1))/sum(CONCENTRATE.QUANTITY(:,PARAM.SYS.month))


% ME_concentrate=concentrate(1,2);
% FME_concentrate=concentrate(1,4);
% CP_concentrate=concentrate(1,5);
% ADIN_concentrate=concentrate(1,6);
% DMD_concentrate=concentrate(1,7);
% a_concentrate=concentrate(1,8);
% b_concentrate=concentrate(1,9);
% c_concentrate=concentrate(1,10);
% NDF_concentrate=concentrate(1,11);


if COW.CHAR.Age<MGMT.weaningAGE;
    if COW.CHAR.Sex==0
        CONCENTRATE.intake=Ration_suckling*CONCENTRATE.QUALITY.DM/1000;
    else
        CONCENTRATE.intake=Ration_suckling*CONCENTRATE.QUALITY.DM/1000;
    end
else
    if COW.CHAR.Sex==0
        CONCENTRATE.intake=Ration_youngs*CONCENTRATE.QUALITY.DM/1000;
    else
        if COW.CHAR.Stat==0&COW.CHAR.Age<young_age
            if COW.CHAR.Age>=MGMT.weaningAGE&COW.CHAR.Age<still_calf_age
                CONCENTRATE.intake=Ration_weaners*CONCENTRATE.QUALITY.DM/1000;
            else
                CONCENTRATE.intake=Ration_youngs*CONCENTRATE.QUALITY.DM/1000;
            end
        else
            if COW.CHAR.CalvInd==0                                                                  %
                if COW.CHAR.PregInd>=a_terme
                    CONCENTRATE.intake=Ration_early_lactating*CONCENTRATE.QUALITY.DM/1000;
                else
                    CONCENTRATE.intake=Ration_dry*CONCENTRATE.QUALITY.DM/1000;
                end
            else
                if COW.CHAR.PregInd>=late_pregnancy
                    CONCENTRATE.intake=Ration_dry*CONCENTRATE.QUALITY.DM/1000;
                else
                    if COW.CHAR.CalvInd<=early_lactation
                        CONCENTRATE.intake=Ration_early_lactating*CONCENTRATE.QUALITY.DM/1000;
                    else
                        if COW.CHAR.CalvInd<=late_lactation
                            CONCENTRATE.intake=Ration_lactating*CONCENTRATE.QUALITY.DM/1000;
                        else
                            CONCENTRATE.intake=Ration_dry*CONCENTRATE.QUALITY.DM/1000;
                        end
                    end
                end
            end
        end
    end
end


