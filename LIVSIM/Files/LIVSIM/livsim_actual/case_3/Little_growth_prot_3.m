%------------------------------Little growth prot 3--------------------------------------

%Little growth for lactating animals prot deficient diet
%version Updated May 2009 ---Mariana Rufino
%--------------------------------------------------------------------------

function [COW]=Little_growth_prot_3(COW,COW_OLD,PARAM)

growth_max =COW.CHAR.GrowthLastMonth;
growth_min =0;
growth_new =mean([growth_max growth_min]);
NeedsProt  =COW.NEED.PotGrowthMP;
tolerance  =PARAM.SYS.tolly*COW.INPUT.MP;

if COW.CHAR.Sex==0
    PARAM.AFRC.C1=1.15;  PARAM.AFRC.C3=1.0; PARAM.AFRC.C4=1.15;
else
    PARAM.AFRC.C1=1.0;   PARAM.AFRC.C3=1.0; PARAM.AFRC.C4=1.10;
end

while abs(COW.INPUT.MP-NeedsProt)>tolerance
    
    COW.BW.average_BW =COW_OLD.CHAR.BW + growth_new*0.5;
    PARAM.AFRC.MPm    =2.30*(COW.BW.average_BW^0.75);
    PARAM.AFRC.MPf    =PARAM.AFRC.C6*(168.07-0.16869*COW.BW.average_BW+0.00016338*COW.BW.average_BW.^2)*(1.12-0.1223*0.5*growth_new/PARAM.SYS.factor)*1.695*0.5*growth_new/PARAM.SYS.factor;  %Growth requirements, knf= 0.59
    NeedsProt         =(PARAM.AFRC.MPm+PARAM.AFRC.MPf)/1000*PARAM.SYS.YLEN*PARAM.SYS.timestep + COW.NEED.LactMP;
    
    if NeedsProt>COW.INPUT.MP
        growth_max =growth_new;
        growth_new =mean([growth_min growth_max]);
    else
        growth_min =growth_new;
        growth_new =mean([growth_max growth_min]);
    end
end
COW.CHAR.BW              =COW_OLD.CHAR.BW+growth_new;
COW.CHAR.GrowthLastMonth =growth_new;
COW.NEED.MaintMP         =PARAM.AFRC.MPm/1000*PARAM.SYS.YLEN*PARAM.SYS.timestep;
COW.NEED.GrowthMP        =PARAM.AFRC.MPf/1000*PARAM.SYS.YLEN*PARAM.SYS.timestep;

%Energy requirements with little growth
PARAM.AFRC.F      =PARAM.AFRC.C1*(0.53*(COW.BW.average_BW/1.08).^0.67);
PARAM.AFRC.A      =0.00917*COW.BW.average_BW + COW.NEED.EnergyWalking*COW.BW.average_BW;  %for dairy cattle
PARAM.AFRC.Mm     =(PARAM.AFRC.F+PARAM.AFRC.A)/PARAM.AFRC.km;
PARAM.AFRC.Em     =PARAM.AFRC.Mm.*PARAM.AFRC.km;
PARAM.AFRC.EVg    =(PARAM.AFRC.C2*(4.1+0.0332*COW.CHAR.BW-0.000009*COW.CHAR.BW^2))/(1-PARAM.AFRC.C3*0.1475*0.5*COW.CHAR.GrowthLastMonth/PARAM.SYS.factor);
PARAM.AFRC.Eg     =PARAM.AFRC.C4*0.5*COW.CHAR.GrowthLastMonth/PARAM.SYS.factor*PARAM.AFRC.EVg;
PARAM.AFRC.R      =PARAM.AFRC.Eg/PARAM.AFRC.Em;
PARAM.AFRC.Mmp    =((PARAM.AFRC.Em./PARAM.AFRC.kz)*log(PARAM.AFRC.B/(PARAM.AFRC.B-PARAM.AFRC.R-1)))*PARAM.SYS.YLEN*PARAM.SYS.timestep;
PARAM.AFRC.L      =2;
PARAM.AFRC.CL     =1-0.018*(PARAM.AFRC.L-1); %L is multiple of ME maintenance req.
COW.NEED.MaintME  =PARAM.AFRC.CL*(PARAM.AFRC.Mm*PARAM.SYS.YLEN*PARAM.SYS.timestep); %register only maintenance
COW.NEED.GrowthME =PARAM.AFRC.CL*PARAM.AFRC.Mmp-COW.NEED.MaintME;

%Check whether energy is enough to achieve calculated little growth
%Update balance
% 
% BALANCE.ME=COW.INPUT.ME/(COW.NEED.MaintME+COW.NEED.GrowthME+COW.NEED.LactME);
% 
% if BALANCE.ME<1
%     need_to_go_to_LG3=1
%     pause
%     Little_growth_3
% end


