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

%--------------------------Potential_growth--------------------------------             
%
%Maximum and minimum BW boundary including compensatory growth
%Version Updated June 2009 -- Mariana Rufino
%--------------------------------------------------------------------------

function [COW]=Potential_growth(COW,PARAM)

%females 
if COW.CHAR.Sex==1
   Weight_max                  =interp1(PARAM.BW.PotFemaleAge,PARAM.BW.PotFemale,COW.CHAR.Age); check(Weight_max);
   Weight_min                  =interp1(PARAM.BW.ami,PARAM.BW.wmi,COW.CHAR.Age); check(Weight_min);
   Diff_pot_weight             =Weight_max-COW.CHAR.BW;
   compensatory_gain           =interp1(PARAM.BW.qmsF,PARAM.BW.CRTF,PARAM.AFRC.qm); check(compensatory_gain);
   comp_gain                   =compensatory_gain*PARAM.SYS.timestep;
   potential_growth_per_animal =min(comp_gain, Diff_pot_weight); %compensatory_gain was multiplied by the timestep twice, this has been corrected
   COW.CHAR.GrowthLastMonth    =potential_growth_per_animal;%new potential weight
   COW.CHAR.BW                 =COW.CHAR.BW+COW.CHAR.GrowthLastMonth;
   COW.CHAR.MinBWAgeComb       =Weight_min;
end

%males 
if COW.CHAR.Sex==0
   Weight_max                  =interp1(PARAM.BW.PotMaleAge,PARAM.BW.PotMale,COW.CHAR.Age); check(Weight_max);
   Weight_min                  =interp1(PARAM.BW.ami,PARAM.BW.wmi,COW.CHAR.Age); check(Weight_min);
   Diff_pot_weight             =Weight_max-COW.CHAR.BW;
   compensatory_gain           =interp1(PARAM.BW.qmsM,PARAM.BW.CRTM,PARAM.AFRC.qm); check(compensatory_gain);
   comp_gain                   =compensatory_gain*PARAM.SYS.timestep;
   potential_growth_per_animal =min(comp_gain, Diff_pot_weight);
   COW.CHAR.GrowthLastMonth    =potential_growth_per_animal;%new potential weight
   COW.CHAR.BW                 =COW.CHAR.BW+COW.CHAR.GrowthLastMonth;
   COW.CHAR.MinBWAgeComb       =Weight_min;
       
       %NEEDS TO CHECKED WITH MADAME RUFINO!!!!!!!!!
       
       %error('bodyweight age combination wrong');
end

