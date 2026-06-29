%----------------------------Weight_loss-----------------------------------

%Weight loss sub-routine: growing with energy deficient diet
%version updated May 2009 ---Mariana Rufino
%--------------------------------------------------------------------------

function [COW]=Weight_loss(COW,COW_OLD,PARAM)

loss_abs_max =COW_OLD.CHAR.BW-COW.CHAR.MinBWAgeComb;
loss_abs_min =0;
loss_new     =mean([loss_abs_max loss_abs_min]);
loss_min     =0;
loss_max     =loss_abs_max;

if COW.CHAR.Age<=PARAM.SYS.timestep
    COW.BW.average_BW=COW.CHAR.BW-0.5*loss_new; %this weight is the minimum weight!
else
    COW.BW.average_BW=COW_OLD.CHAR.BW-0.5*loss_new;
end

if COW.CHAR.Sex==0
    PARAM.AFRC.C1=1.15;  PARAM.AFRC.C3=0; PARAM.AFRC.C4=1.15;        %parameters from AFRC, 1993
else
    PARAM.AFRC.C1=1.0;   PARAM.AFRC.C3=0; PARAM.AFRC.C4=1.10;
end

PARAM.AFRC.F = PARAM.AFRC.C1*(0.53*(COW.BW.average_BW/1.08).^0.67);
if COW.CHAR.Sex==1
    PARAM.AFRC.A = 0.00917*COW.BW.average_BW + COW.NEED.EnergyWalking*COW.BW.average_BW;  %for dairy cattle
else
    PARAM.AFRC.A = 0.00696*COW.BW.average_BW + COW.NEED.EnergyWalking*COW.BW.average_BW; %for beef cattle
end
PARAM.AFRC.Mm            =((PARAM.AFRC.F+PARAM.AFRC.A)/PARAM.AFRC.km)*PARAM.AFRC.reduction;
NeedsEnergy              =PARAM.AFRC.Mm*PARAM.SYS.YLEN*PARAM.SYS.timestep;
tolerance1               =PARAM.SYS.tolly*NeedsEnergy; % Ous add Energy
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
    if loss_min==loss_new && loss_min==loss_max
        COW.NEED.MaintME
        COW.INPUT.ME
        error('help')
    end
    
    if NeedsEnergy>Energy_supply_new
        loss_min=loss_new;
        loss_new=mean([loss_min loss_max]);
    else
        loss_max=loss_new;
        loss_new=mean([loss_max loss_min]);
    end
    
    if COW.CHAR.Age<=PARAM.SYS.timestep
        COW.BW.average_BW=CBW_average; %this weight is the minimum weight!
    else
        COW.BW.average_BW=COW_OLD.CHAR.BW-0.5*loss_new;
    end
    
    PARAM.AFRC.F = PARAM.AFRC.C1*(0.53*(COW.BW.average_BW/1.08).^0.67);
    
    if COW.CHAR.Sex==1
        PARAM.AFRC.A = 0.00917*COW.BW.average_BW + COW.NEED.EnergyWalking*COW.BW.average_BW;  %for dairy cattle
    else
        PARAM.AFRC.A = 0.00696*COW.BW.average_BW + COW.NEED.EnergyWalking*COW.BW.average_BW; %for beef cattle
    end
    
    PARAM.AFRC.Mm            =((PARAM.AFRC.F+PARAM.AFRC.A)/PARAM.AFRC.km)*PARAM.AFRC.reduction;
    NeedsEnergy              =PARAM.AFRC.Mm*PARAM.SYS.YLEN*PARAM.SYS.timestep; check(NeedsEnergy);
    COW.NEED.MaintME         =NeedsEnergy; %register only maintenance (ous add Energy)
    tolerance1               =PARAM.SYS.tolly*NeedsEnergy; % ous add Energy
    energy_from_weight_loss  =PARAM.AFRC.EVlo*loss_new; %19 MJ/kg released due to weight loss
    Energy_supply_new        =COW.INPUT.ME+energy_from_weight_loss;
    protein_from_weight_loss =PARAM.AFRC.MPg/1000*loss_new; %g/kg BW loss kng = 1.0 for cows BW loss NPg = MPg
    Protein_supply_new       =COW.INPUT.MP+protein_from_weight_loss;
    COW.CHAR.BW              =COW_OLD.CHAR.BW-loss_new;
    COW.CHAR.GrowthLastMonth =-loss_new;
end

COW.INPUT.MP      =Protein_supply_new;
COW.INPUT.ME      =Energy_supply_new;
BALANCE.ME.BWloss =COW.INPUT.ME/COW.NEED.MaintME;

if loss_new>=tolerance2
    if Energy_supply_new<COW.NEED.MaintME
        COW.CHAR.FeedDeficit =2; %animal is dead
        COW.CHAR.DEATH       =1;
    else
        COW.CHAR.FeedDeficit =COW_OLD.CHAR.FeedDeficit+1; %animal is sick
        COW.NEED.MaintME     =Energy_supply_new; %only available, below maintenance
    end
end
PARAM.AFRC.MPm   =2.30*(COW_OLD.CHAR.BW-0.5*loss_new)^0.75;
COW.NEED.MaintMP =PARAM.AFRC.MPm/1000*PARAM.SYS.YLEN*PARAM.SYS.timestep; %only maintenance

%Check whether protein is enough after BW loss
BALANCE.MP.BWloss =COW.INPUT.MP/(COW.NEED.MaintMP+COW.NEED.LactMP);

if BALANCE.MP.BWloss<1
    if COW.INPUT.MP<=COW.NEED.MaintMP
        COW.OUT.Milk    =0;
        COW.NEED.LactMP =0;
    else
        COW.NEED.LactMP =Protein_supply_new-COW.NEED.MaintMP;
        COW.OUT.Milk    =COW.NEED.LactMP*1000/(PARAM.LACT.MilkCP*13.57);
    end
end

