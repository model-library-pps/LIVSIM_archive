%------------------------------Weight loss prot----------------------------

%Weight loss sub-routine: growing with protein deficient diet
%version updated 2009 ---Mariana Rufino
%--------------------------------------------------------------------------

function [COW]=Weight_loss_prot(COW,COW_OLD,PARAM)

loss_abs_max =COW_OLD.CHAR.BW-COW.CHAR.MinBWAgeComb;
loss_abs_min =0;
loss_new     =mean([loss_abs_max loss_abs_min]);
loss_min     =0;
loss_max     =loss_abs_max;

if COW.CHAR.Age<PARAM.SYS.timestep
    COW.BW.average_BW=CBW_average;
else
    COW.BW.average_BW=COW_OLD.CHAR.BW-0.5*loss_new;
end

PARAM.AFRC.MPm           =2.30*(COW.BW.average_BW^0.75);
NeedsProt                =PARAM.AFRC.MPm/1000*PARAM.SYS.YLEN*PARAM.SYS.timestep;
tolerance1               =PARAM.SYS.tolly*NeedsProt;
tolerance2               =(1-PARAM.SYS.tolly)*loss_abs_max;
COW.CHAR.BW              =COW_OLD.CHAR.BW; %reset BW values to last month
COW.CHAR.GrowthLastMonth =0;
COW.NEED.GrowthME        =0;
COW.NEED.GrowthMP        =0; %no growth

if COW.CHAR.Sex==0
    PARAM.AFRC.C1=1.15;  PARAM.AFRC.C3=0; PARAM.AFRC.C4=1.15;        %parameters from AFRC, 1993
else
    PARAM.AFRC.C1=1.0;   PARAM.AFRC.C3=0; PARAM.AFRC.C4=1.10;
end
energy_from_weight_loss  =PARAM.AFRC.EVlo*loss_new; %19 MJ/kg released due to weight loss
Energy_supply_new        =COW.INPUT.ME+energy_from_weight_loss;
protein_from_weight_loss =PARAM.AFRC.MPg/1000*loss_new; %g/kg BW loss kng = 1.0 for cows BW loss NPg = MPg
Protein_supply_new       =COW.INPUT.MP+protein_from_weight_loss;

while abs(Protein_supply_new-NeedsProt)>=tolerance1&&loss_new<=tolerance2
    
    if NeedsProt>Protein_supply_new
        loss_min=loss_new;
        loss_new=mean([loss_min loss_max]);
    else
        loss_max=loss_new;
        loss_new=mean([loss_max loss_min]);
    end
    
    if COW.CHAR.Age<PARAM.SYS.timestep
        COW.BW.average_BW=CBW_average;
    else
        COW.BW.average_BW=COW_OLD.CHAR.BW-0.5*loss_new;
    end
    
    PARAM.AFRC.MPm           =2.30*(COW.BW.average_BW^0.75);
    NeedsProt                =PARAM.AFRC.MPm/1000*PARAM.SYS.YLEN*PARAM.SYS.timestep;
    COW.NEED.MaintMP         =NeedsProt;
    tolerance1               =PARAM.SYS.tolly*NeedsProt;
    energy_from_weight_loss  =PARAM.AFRC.EVlo*loss_new; %19 MJ/kg released due to weight loss
    Energy_supply_new        =COW.INPUT.ME+energy_from_weight_loss;
    protein_from_weight_loss =PARAM.AFRC.MPg/1000*loss_new; %g/kg BW loss kng = 1.0 for cows BW loss NPg = MPg
    Protein_supply_new       =COW.INPUT.MP+protein_from_weight_loss;
    COW.CHAR.BW              =COW_OLD.CHAR.BW-loss_new;
    COW.CHAR.GrowthLastMonth =-loss_new;
end

if loss_new>=tolerance2
    if Protein_supply_new<COW.NEED.MaintMP;
        COW.CHAR.FeedDeficit=2; %animal is dead
        COW.CHAR.DEATH=1;
    else
        COW.CHAR.FeedDeficit=COW_OLD.CHAR.FeedDeficit+1; %animal is sick
        COW.NEED.MaintMP=Protein_supply_new;
    end
end 
PARAM.AFRC.F     =PARAM.AFRC.C1*(0.53*(COW.BW.average_BW/1.08).^0.67);
PARAM.AFRC.A     =0.00917*COW.BW.average_BW+COW.NEED.EnergyWalking*COW.BW.average_BW;
PARAM.AFRC.Mm    =(PARAM.AFRC.F+PARAM.AFRC.A)/PARAM.AFRC.km*PARAM.AFRC.reduction;
COW.NEED.MaintME =PARAM.AFRC.Mm*PARAM.SYS.YLEN*PARAM.SYS.timestep;

%Check whether enegy is enough after BW loss
