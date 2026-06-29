%----------------------------Weight loss 2-----------------------------------

%Weight loss sub-routine: growing with energy deficient diet
%version May 2009 ---Mariana Rufino
%--------------------------------------------------------------------------

function [COW]=Weight_loss_2(COW,COW_OLD,PARAM)

loss_abs_max =COW_OLD.CHAR.BW-COW.CHAR.MinBWAgeComb;
loss_abs_min =0;
loss_new     =mean([loss_abs_max loss_abs_min]);
loss_min     =0;
loss_max     =loss_abs_max;

COW.BW.average_BW =COW_OLD.CHAR.BW-0.5*loss_new;

if COW.CHAR.Sex==0
    PARAM.AFRC.C1=1.15;  PARAM.AFRC.C3=0; PARAM.AFRC.C4=1.15;
else
    PARAM.AFRC.C1=1.0;   PARAM.AFRC.C3=0; PARAM.AFRC.C4=1.10;
end

PARAM.AFRC.F             =PARAM.AFRC.C1*(0.53*(COW.BW.average_BW/1.08).^0.67);
PARAM.AFRC.A             =0.00917*COW.BW.average_BW + COW.NEED.EnergyWalking*COW.BW.average_BW;  %for dairy cattle
PARAM.AFRC.Mm            =((PARAM.AFRC.F+PARAM.AFRC.A)/PARAM.AFRC.km)*PARAM.AFRC.reduction;
NeedsEnergy              =PARAM.AFRC.Mm*PARAM.SYS.YLEN*PARAM.SYS.timestep + COW.NEED.GestME;
tolerance1               =PARAM.SYS.tolly*NeedsEnergy;
tolerance2               =(1-PARAM.SYS.tolly)*loss_abs_max;
COW.CHAR.BW              =COW_OLD.CHAR.BW; %reset BW values to last month
COW.CHAR.GrowthLastMonth =0;
COW.NEED.GrowthME        =0;
COW.NEED.GrowthMP        =0; %no growth

energy_from_weight_loss  =PARAM.AFRC.EVlo*loss_new; %19 MJ/kg released due to weight loss
Energy_supply_new        =COW.INPUT.ME+energy_from_weight_loss;
protein_from_weight_loss =PARAM.AFRC.MPg/1000*loss_new; %g/kg BW loss kng = 1.0 for cows BW loss NPg = MPg
Protein_supply_new       =COW.INPUT.MP+protein_from_weight_loss;

while abs(Energy_supply_new-NeedsEnergy)>=tolerance1&&loss_new<=tolerance2
    
    if NeedsEnergy>Energy_supply_new
        loss_min=loss_new;
        loss_new=mean([loss_min loss_max]);
    else
        loss_max=loss_new;
        loss_new=mean([loss_max loss_min]);
    end
    
    COW.BW.average_BW        =COW_OLD.CHAR.BW-0.5*loss_new;
    PARAM.AFRC.F             =PARAM.AFRC.C1*(0.53*(COW.BW.average_BW/1.08).^0.67);
    PARAM.AFRC.A             =0.00917*COW.BW.average_BW + COW.NEED.EnergyWalking*COW.BW.average_BW;  %for dairy cattle
    PARAM.AFRC.Mm            =((PARAM.AFRC.F+PARAM.AFRC.A)/PARAM.AFRC.km)*PARAM.AFRC.reduction;
    NeedsEnergy              =PARAM.AFRC.Mm*PARAM.SYS.YLEN*PARAM.SYS.timestep + COW.NEED.GestME;
    COW.NEED.MaintME         =NeedsEnergy-COW.NEED.GestME; %register only maintenance
    tolerance1               =PARAM.SYS.tolly*NeedsEnergy;
    energy_from_weight_loss  =PARAM.AFRC.EVlo*loss_new; %19 MJ/kg released due to weight loss
    Energy_supply_new        =COW.INPUT.ME+energy_from_weight_loss;
    protein_from_weight_loss =PARAM.AFRC.MPg/1000*loss_new; %g/kg BW loss kng = 1.0 for cows BW loss NPg = MPg
    Protein_supply_new       =COW.INPUT.MP+protein_from_weight_loss;
    COW.CHAR.BW              =COW_OLD.CHAR.BW-loss_new;
    COW.CHAR.GrowthLastMonth =-loss_new;
end

if loss_new>=tolerance2
    if Energy_supply_new<COW.NEED.MaintME
        COW.CHAR.FeedDeficit =2; %animal is dead - Here I should include abortion
        COW.CHAR.DEATH       =1;
    else
        COW.CHAR.FeedDeficit =COW_OLD.CHAR.FeedDeficit+1; %animal is sick
        COW.NEED.MaintME     =Energy_supply_new-COW.NEED.GestME; %to support foetus
        COW.NEED.MaintMP     =Protein_supply_new-COW.NEED.GestMP;
    end
end
PARAM.AFRC.MPm   =2.30*(COW_OLD.CHAR.BW-0.5*loss_new)^0.75;
COW.NEED.MaintMP =PARAM.AFRC.MPm/1000*PARAM.SYS.YLEN*PARAM.SYS.timestep; %only maintenance

%Check whether protein is enough after BW loss
BALANCE.MP.BWloss =COW.INPUT.MP/(COW.NEED.MaintMP+COW.NEED.GestMP);

if BALANCE.MP.BWloss<1
    if COW.INPUT.MP<=COW.NEED.MaintMP+COW.NEED.GestMP
        %cause abortion
        %COW.CHAR.PregInd=0;
        %COW.NEED.GestMP=0;
        %COW.NEED.GestME=0;
        %COW.CHAR.CalvInd=0;
        COW.CHAR.FeedDeficit=COW_OLD.CHAR.FeedDeficit+1;
        
    else
        COW.CHAR.FeedDeficit=COW_OLD.CHAR.FeedDeficit+1; %animal is seriuosly sick
    end
end