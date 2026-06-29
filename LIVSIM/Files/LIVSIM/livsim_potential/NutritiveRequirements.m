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

%------------------------Nutritive requirement----------------------------------------

%Jerome                                                         19-03-2008

%--------------------------------------------------------------------------
%Nutritive requirements of AFRC (1993)
%version Ago 2007 ---Mariana Rufino
%the general equation: Mmp = CL*( Em/km + Eg/kg + El/kl + Ec/kc);
%Only maintenance

function [COW,PARAM]=NutritiveRequirements(COW,COW_OLD,PARAM)


if COW.CHAR.Sex==0
    PARAM.AFRC.C1=1.15;  PARAM.AFRC.C3=1.0; PARAM.AFRC.C4=1.15; %C6=1.2; C2=0.7;      %parameters from AFRC, 1993
else
    PARAM.AFRC.C1=1.0;   PARAM.AFRC.C3=1.0; PARAM.AFRC.C4=1.10; %C6=0.9;C2=1.15;
end
if COW.CHAR.Age<=PARAM.SYS.timestep
    COW.BW.average_BW =PARAM.REPR.CBW;
else
    COW.BW.average_BW =COW_OLD.CHAR.BW;
end
PARAM.AFRC.F =PARAM.AFRC.C1*(0.53*(COW.BW.average_BW/1.08).^0.67); %F (MJ/d) is fasting metabolism and A is activity allowance (MJ/d)
if COW.CHAR.Sex==1
    PARAM.AFRC.A =0.00917*COW.BW.average_BW+COW.NEED.EnergyWalking*COW.BW.average_BW;  %for dairy cattle
else
    PARAM.AFRC.A =0.00696*COW.BW.average_BW+COW.NEED.EnergyWalking*COW.BW.average_BW; %for beef cattle
end
PARAM.AFRC.Mm        =(PARAM.AFRC.F+PARAM.AFRC.A)/PARAM.AFRC.km;  %MJ/day keep it like this, needed in line 48
PARAM.AFRC.L         =1;  %animals fed at maintenance
PARAM.AFRC.CL        =1-0.018*(PARAM.AFRC.L-1); %L is multiple of ME maintenance req.
COW.NEED.PotGrowthME =PARAM.AFRC.CL*(PARAM.AFRC.Mm*PARAM.SYS.YLEN*PARAM.SYS.timestep); %MJ/timestep
COW.NEED.MaintME     =PARAM.AFRC.CL*(PARAM.AFRC.Mm*PARAM.SYS.YLEN*PARAM.SYS.timestep); %register only maintenance
COW.NEED.BasalMaint  =PARAM.AFRC.Mm;
energy_Maintenance=COW.NEED.MaintME;
%For growing animals (to target potential growth)express weight gain in kg/day
if COW.CHAR.Sex==0&&COW_OLD.CHAR.BW<PARAM.BW.MatureMale&&COW.CHAR.GrowthLastMonth>0||COW.CHAR.Sex==1&&COW_OLD.CHAR.BW<PARAM.BW.MatureFemale&&COW.CHAR.GrowthLastMonth>0          %jerome change
    if COW.CHAR.Age<=PARAM.SYS.timestep
        COW.BW.average_BW=PARAM.REPR.CBW+ 0.5*COW.CHAR.GrowthLastMonth;
    else
        COW.BW.average_BW=COW_OLD.CHAR.BW+ 0.5*COW.CHAR.GrowthLastMonth;
    end
    if COW.CHAR.Sex==0
        PARAM.AFRC.C1=1.15;  PARAM.AFRC.C3=1.0; PARAM.AFRC.C4=1.15; %C6=1.2;C2=0.7;       %parameters from AFRC, 1993
    else
        PARAM.AFRC.C1=1.0;   PARAM.AFRC.C3=1.0; PARAM.AFRC.C4=1.10; %C6=0.9;C2=1.15;
    end
    PARAM.AFRC.F = PARAM.AFRC.C1*(0.53*(COW.BW.average_BW/1.08).^0.67);
    if COW.CHAR.Sex==1
        PARAM.AFRC.A =0.00917*COW.BW.average_BW+COW.NEED.EnergyWalking*COW.BW.average_BW;                         %as to be out (with names)
    else
        PARAM.AFRC.A =0.00696*COW.BW.average_BW+COW.NEED.EnergyWalking*COW.BW.average_BW;
    end
    PARAM.AFRC.Mm        =(PARAM.AFRC.F+PARAM.AFRC.A)/PARAM.AFRC.km;
    PARAM.AFRC.Em        =PARAM.AFRC.Mm.*PARAM.AFRC.km;
    PARAM.AFRC.EVg       =(PARAM.AFRC.C2*(4.1+0.0332*COW.BW.average_BW-0.000009*COW.BW.average_BW^2))/(1-PARAM.AFRC.C3*0.1475*0.5*COW.CHAR.GrowthLastMonth/PARAM.SYS.factor);
    PARAM.AFRC.Eg        =PARAM.AFRC.C4*0.5*COW.CHAR.GrowthLastMonth/PARAM.SYS.factor*PARAM.AFRC.EVg;
    PARAM.AFRC.R         =PARAM.AFRC.Eg/PARAM.AFRC.Em;
    PARAM.AFRC.Mmp       =((PARAM.AFRC.Em/PARAM.AFRC.kz)*log(PARAM.AFRC.B/(PARAM.AFRC.B-PARAM.AFRC.R-1)))*PARAM.SYS.YLEN*PARAM.SYS.timestep;
    PARAM.AFRC.L         =2; %for growing animals
    PARAM.AFRC.CL        =1-0.018*(PARAM.AFRC.L-1); %L is multiple of ME maintenance req.
    COW.NEED.PotGrowthME =PARAM.AFRC.CL*PARAM.AFRC.Mmp; %MJ/timestep
    maint                =PARAM.AFRC.CL*(PARAM.AFRC.Mm*PARAM.SYS.YLEN*PARAM.SYS.timestep); %changed maint to COW.NEED.MaintME
    COW.NEED.GrowthME    =PARAM.AFRC.CL*PARAM.AFRC.Mmp-maint;
    energy_growth=COW.NEED.GrowthME;
end

%PROTEIN REQUIREMENTS
%MPR = NPb/knb + NPd/knd + NPl/knl + NPc/knc + NPf/knf + NPg/kng %(g/d)
%Basal endogenous N(b),concepta(c),hair growth(d),accreted in gain(f),accreted or mobilized when lactating(g),secreted in milk(l), maintenance(m), Efficiencies (knx).

%Maintenance
if COW.CHAR.Age<PARAM.SYS.timestep
    COW.BW.average_BW =CBW_average;
else
    COW.BW.average_BW =COW_OLD.CHAR.BW;
end
PARAM.AFRC.MPm       =2.30*(COW.BW.average_BW^0.75);   %knm= 1 --> MPm=MPb+MPd; (basal + hair);
COW.NEED.PotGrowthMP =PARAM.AFRC.MPm/1000*PARAM.SYS.YLEN*PARAM.SYS.timestep;  % total when only maintenance
COW.NEED.MaintMP     =PARAM.AFRC.MPm/1000*PARAM.SYS.YLEN*PARAM.SYS.timestep; %only maintenance
prot_maintenance=COW.NEED.MaintMP;
%For growing animals (to target potential growth)express weight gain in kg/day
if COW.CHAR.Sex==0&&COW_OLD.CHAR.BW<PARAM.BW.MatureMale&&COW.CHAR.GrowthLastMonth>0||COW.CHAR.Sex==1&&COW_OLD.CHAR.BW<PARAM.BW.MatureFemale&&COW.CHAR.GrowthLastMonth>0                 %jerome change
    if COW.CHAR.Age<PARAM.SYS.timestep
        COW.BW.average_BW =CBW_average+0.5*COW.CHAR.GrowthLastMonth;                                                                                       %jerome add
    else                                                                                                                        %jerome add
        COW.BW.average_BW =COW_OLD.CHAR.BW+0.5*COW.CHAR.GrowthLastMonth;                                                                                       %jerome add
    end                                                                                                                         %jerome add
    PARAM.AFRC.MPm       =2.30*(COW.BW.average_BW^0.75);                                                                                                %jerome add
    PARAM.AFRC.MPf       =PARAM.AFRC.C6*(168.07-0.16869*COW.BW.average_BW+0.00016338*COW.BW.average_BW.^2)*(1.12-0.1223*0.5*COW.CHAR.GrowthLastMonth/PARAM.SYS.factor)*1.695*0.5*COW.CHAR.GrowthLastMonth/PARAM.SYS.factor;  %Growth requirements, knf= 0.59
    COW.NEED.PotGrowthMP =(PARAM.AFRC.MPm+PARAM.AFRC.MPf)/1000*PARAM.SYS.YLEN*PARAM.SYS.timestep; %MJ/timestep both maintenance and growth
    COW.NEED.GrowthMP    =PARAM.AFRC.MPf/1000*PARAM.SYS.YLEN*PARAM.SYS.timestep;
    prot_growth_maint=COW.NEED.PotGrowthMP;
end