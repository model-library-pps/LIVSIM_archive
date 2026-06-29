%------------------------------Case 2--------------------------------------
%CASE 2: growing pregnant, non-lactating
%Version Updated May 2009 ---Mariana Rufino
%--------------------------------------------------------------------------

function [COW]=case_2(COW,COW_OLD,PARAM,BALANCE)

BALANCE.ME.Case =COW.INPUT.ME/(COW.NEED.MaintME+COW.NEED.GestME); 
BALANCE.MP.Case =COW.INPUT.MP/(COW.NEED.MaintMP+COW.NEED.GestMP);

if BALANCE.ME.Case<BALANCE.MP.Case
    if BALANCE.ME.Case>=1
        [COW] =Little_growth_2(COW,COW_OLD,PARAM);
    else
        [COW] =Weight_loss_2(COW,COW_OLD,PARAM);
    end
else
    if BALANCE.MP.Case>=1
        [COW] =Little_growth_prot_2(COW,COW_OLD,PARAM);
    else
        [COW] =Weight_loss_prot_2(COW,COW_OLD,PARAM);
    end
end
