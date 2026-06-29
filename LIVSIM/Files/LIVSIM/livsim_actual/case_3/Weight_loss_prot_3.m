%------------------------------Weight_loss_prot_3----------------------------

%Weight loss sub-routine for lactating cows
%version Updated May 2009 ---Mariana Rufino
%--------------------------------------------------------------------------

function [COW]=Weight_loss_prot_3(COW,COW_OLD,PARAM)

abs_loss_max   =COW_OLD.CHAR.BW-COW.CHAR.MinBWAgeComb;
max_change     =interp1(PARAM.BW.MaxLostLP,PARAM.BW.MaxLost,COW.CHAR.LactInd); check(max_change);
limit_max_loss =max_change*PARAM.SYS.timestep; %animals become sick with more weight loss
loss_abs_max   =min(abs_loss_max,limit_max_loss);
loss_abs_min   =0;
loss_new       =mean([loss_abs_max loss_abs_min]);
loss_min       =0;
loss_max       =loss_abs_max;

COW.BW.average_BW=COW_OLD.CHAR.BW-0.5*loss_new;

if COW.CHAR.Sex==0
    PARAM.AFRC.C1=1.15; PARAM.AFRC.C3=0; PARAM.AFRC.C4=1.15;
else
    PARAM.AFRC.C1=1.0;  PARAM.AFRC.C3=0; PARAM.AFRC.C4=1.10; %C6=0.9;  C2=1.15;
end

PARAM.AFRC.F             =PARAM.AFRC.C1*(0.53*(COW.BW.average_BW/1.08).^0.67);
PARAM.AFRC.A             =0.00917*COW.BW.average_BW + COW.NEED.EnergyWalking*COW.BW.average_BW;  %for dairy cattle
PARAM.AFRC.Mm            =((PARAM.AFRC.F+PARAM.AFRC.A)/PARAM.AFRC.km)*PARAM.AFRC.reduction;
PARAM.AFRC.L             =1;  
PARAM.AFRC.CL            =1-0.018*(PARAM.AFRC.L-1);
NeedsEnergy              =PARAM.AFRC.Mm*PARAM.SYS.YLEN*PARAM.SYS.timestep + COW.NEED.LactME;
PARAM.AFRC.MPm           =2.30*(COW.BW.average_BW^0.75);
NeedsProt                =PARAM.AFRC.MPm/1000*PARAM.SYS.YLEN*PARAM.SYS.timestep+ COW.NEED.LactMP;
tolerance1               =PARAM.SYS.tolly*NeedsProt;
tolerance2               =(1-PARAM.SYS.tolly)*loss_abs_max;
COW.CHAR.BW              =COW_OLD.CHAR.BW; %reset BW values to last month
COW.CHAR.GrowthLastMonth =0;
COW.NEED.GrowthME        =0;
COW.NEED.GrowthMP        =0; %no growth

protein_from_weight_loss =PARAM.AFRC.MPg/1000*loss_new; %g/kg BW loss kng = 1.0 for cows BW loss NPg = MPg
Protein_supply_new       =COW.INPUT.MP+protein_from_weight_loss;
energy_from_weight_loss  =PARAM.AFRC.EVlo*loss_new; %19 MJ/kg released due to weight loss
Energy_supply_new        =COW.INPUT.ME+energy_from_weight_loss;

while abs(Protein_supply_new-NeedsProt)>=tolerance1&&loss_new<=tolerance2
    
    if NeedsProt>Protein_supply_new
        loss_min=loss_new;
        loss_new=mean([loss_min loss_max]);
    else
        loss_max=loss_new;
        loss_new=mean([loss_max loss_min]);
    end
    
    COW.BW.average_BW        =COW_OLD.CHAR.BW-0.5*loss_new;
    PARAM.AFRC.MPm           =2.30*(COW.BW.average_BW^0.75);
    NeedsProt                =PARAM.AFRC.MPm/1000*PARAM.SYS.YLEN*PARAM.SYS.timestep+COW.NEED.LactMP;
    COW.NEED.MaintMP         =NeedsProt-COW.NEED.LactMP;
    tolerance1               =PARAM.SYS.tolly*NeedsProt;
    energy_from_weight_loss  =PARAM.AFRC.EVlo*loss_new; %19 MJ/kg released due to weight loss
    Energy_supply_new        =COW.INPUT.ME+energy_from_weight_loss;
    protein_from_weight_loss =PARAM.AFRC.MPg/1000*loss_new; %g/kg BW loss kng = 1.0 for cows BW loss NPg = MPg
    Protein_supply_new       =COW.INPUT.MP+protein_from_weight_loss;
    COW.CHAR.BW              =COW_OLD.CHAR.BW-loss_new;
    COW.CHAR.GrowthLastMonth =-loss_new; % Pas claire ici
end

COW.INPUT.MP      =Protein_supply_new;
COW.INPUT.ME      =Energy_supply_new;
BALANCE.MP.BWloss =COW.INPUT.MP/(COW.NEED.MaintMP+COW.NEED.LactMP);

if loss_new>=tolerance2
    if Protein_supply_new<COW.NEED.MaintMP;
        COW.NEED.LactMP      =0;
        COW.NEED.MaintME     =Energy_supply_new;
        COW.NEED.MaintMP     =Protein_supply_new;
        COW.CHAR.FeedDeficit =COW_OLD.CHAR.FeedDeficit+1; %animal is sick
        COW.CHAR.LactInd     =0;
        if Protein_supply_new<(0.70*COW.NEED.MaintMP)
            COW.CHAR.DEATH   =1;
        end
    else
        COW.CHAR.FeedDeficit =COW_OLD.CHAR.FeedDeficit+1; %animal is sick
        COW.NEED.LactMP      =Protein_supply_new-COW.NEED.MaintMP;
    end
end

%Calculate energy needs after BW loss
PARAM.AFRC.F     =PARAM.AFRC.C1*(0.53*(COW.BW.average_BW/1.08).^0.67);
PARAM.AFRC.A     =0.00917*COW.BW.average_BW + COW.NEED.EnergyWalking*COW.BW.average_BW;  %dairy cattle
PARAM.AFRC.Mm    =(PARAM.AFRC.F+PARAM.AFRC.A)/PARAM.AFRC.km*PARAM.AFRC.reduction;
COW.NEED.MaintME =PARAM.AFRC.Mm*PARAM.SYS.YLEN*PARAM.SYS.timestep;
COW.OUT.Milk     =COW.NEED.LactMP*1000/(PARAM.LACT.MilkCP*13.57); %
if COW.OUT.Milk<0.1
    COW.CHAR.LactInd=0;
end

COW.NEED.LactME  =COW.OUT.Milk*PARAM.AFRC.EVl/PARAM.AFRC.kl; check(COW.NEED.LactME); %MJ/timestep

%Check whether ME input is enough, otherwise reduce milk production further
BALANCE.ME.BWloss =COW.INPUT.ME/(COW.NEED.MaintME+COW.NEED.LactME);

if BALANCE.ME.BWloss<1
    if COW.INPUT.ME<=COW.NEED.MaintME
        COW.OUT.Milk         =0;
        COW.NEED.LactME      =0;
        COW.CHAR.FeedDeficit =COW_OLD.CHAR.FeedDeficit+1; %animal is sick
        COW.CHAR.LactInd     =0;
    else
        COW.NEED.LactME      =Energy_supply_new-COW.NEED.MaintME;
        COW.OUT.Milk         =(COW.NEED.LactME*PARAM.AFRC.kl/PARAM.AFRC.EVl)/PARAM.AFRC.CL;
    end
end