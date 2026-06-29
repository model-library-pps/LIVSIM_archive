%----------------------------Little growth 2---------------------------------

%Little growth sub-routine for pregnant cows
%version Updated May 2009 ---Mariana Rufino
%--------------------------------------------------------------------------

function [COW]=Little_growth_2(COW,COW_OLD,PARAM)


growth_max  =COW.CHAR.GrowthLastMonth;
growth_min  =0;
growth_new  =mean([growth_max growth_min]);
NeedsEnergy =COW.NEED.PotGrowthME;
tolerance   =PARAM.SYS.tolly*COW.INPUT.ME;

if COW.CHAR.Sex==0
    PARAM.AFRC.C1=1.15;  PARAM.AFRC.C3=1.0; PARAM.AFRC.C4=1.15;
else
    PARAM.AFRC.C1=1.0;   PARAM.AFRC.C3=1.0; PARAM.AFRC.C4=1.10;
end

while abs(COW.INPUT.ME-NeedsEnergy)>=tolerance
    
    COW.BW.average_BW =COW_OLD.CHAR.BW+ 0.5*growth_new;
    PARAM.AFRC.F      =PARAM.AFRC.C1*(0.53*(COW.BW.average_BW/1.08).^0.67);     %F (MJ/d) is fasting metabolism and A is activity allowance (MJ/d)
    PARAM.AFRC.A      =0.00917*COW.BW.average_BW + COW.NEED.EnergyWalking*COW.BW.average_BW;  %for dairy cattle
    PARAM.AFRC.Mm     =(PARAM.AFRC.F+PARAM.AFRC.A)/PARAM.AFRC.km*PARAM.AFRC.reduction;
    PARAM.AFRC.Em     =PARAM.AFRC.Mm.*PARAM.AFRC.km;
    PARAM.AFRC.EVg    =(PARAM.AFRC.C2*(4.1+0.0332*COW.BW.average_BW-0.000009*COW.BW.average_BW^2))/(1-PARAM.AFRC.C3*0.1475*0.5*growth_new/PARAM.SYS.factor) ;
    PARAM.AFRC.Eg     =PARAM.AFRC.C4*0.5*growth_new/PARAM.SYS.factor*PARAM.AFRC.EVg;
    PARAM.AFRC.R      =PARAM.AFRC.Eg/PARAM.AFRC.Em;
    PARAM.AFRC.Mmp    =((PARAM.AFRC.Em./PARAM.AFRC.kz)*log(PARAM.AFRC.B/(PARAM.AFRC.B-PARAM.AFRC.R-1)))*PARAM.SYS.YLEN*PARAM.SYS.timestep;
    PARAM.AFRC.L      =2;
    PARAM.AFRC.CL     =1-0.018*(PARAM.AFRC.L-1);
    NeedsEnergy       =PARAM.AFRC.Mmp*PARAM.AFRC.CL + COW.NEED.GestME;
    
    if NeedsEnergy>COW.INPUT.ME
        growth_max =growth_new;
        growth_new =mean([growth_min growth_max]);
    else
        growth_min =growth_new;
        growth_new =mean([growth_max growth_min]);
    end
end

COW.CHAR.BW              =COW_OLD.CHAR.BW + growth_new;
COW.CHAR.GrowthLastMonth =growth_new;
COW.NEED.MaintME         =PARAM.AFRC.CL*(PARAM.AFRC.Mm*PARAM.SYS.YLEN*PARAM.SYS.timestep); %register only maintenance
COW.NEED.GrowthME        =PARAM.AFRC.Mmp*PARAM.AFRC.CL-COW.NEED.MaintME ; %growth

%Protein requirements with little growth
PARAM.AFRC.MPm    =2.30 * COW.CHAR.BW^0.75;
COW.NEED.MaintMP  =PARAM.AFRC.MPm/1000*PARAM.SYS.YLEN*PARAM.SYS.timestep; %only maintenance
PARAM.AFRC.MPf    =PARAM.AFRC.C6*(168.07-0.16869*COW.CHAR.BW+0.00016338*COW.CHAR.BW.^2)*(1.12-0.1223*0.5*COW.CHAR.GrowthLastMonth/PARAM.SYS.factor)*1.695*0.5*COW.CHAR.GrowthLastMonth/PARAM.SYS.factor;  %Growth requirements, knf= 0.59
COW.NEED.GrowthMP =PARAM.AFRC.MPf/1000*PARAM.SYS.YLEN*PARAM.SYS.timestep;

%Check whether protein is enough to achieve calculated little growth -
%Update Balance
% 
%  BALANCE.MP=COW.INPUT.MP/(COW.NEED.MaintMP+COW.NEED.GrowthMP+COW.NEED.GestMP);
% 
% %if MP input is not enough, reduce growth further
%  if BALANCE.MP<1
%      need_to_go_to_LGP2=1
%      pause    
%      Little_growth_prot_2 
%  end