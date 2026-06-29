%------------------------------Case 4--------------------------------------
%CASE 4: growing, gestating and lactating
%version Updated May 2009 ---Mariana Rufino
%--------------------------------------------------------------------------

function [COW]=case_4(COW,COW_OLD,PARAM,BALANCE)

BALANCE.ME.Case =COW.INPUT.ME/(COW.NEED.MaintME+COW.NEED.LactME+COW.NEED.GestME); 
BALANCE.MP.Case =COW.INPUT.MP/(COW.NEED.MaintMP+COW.NEED.LactMP+COW.NEED.GestMP);

if BALANCE.ME.Case<BALANCE.MP.Case
    if BALANCE.ME.Case>=1
        [COW] =Little_growth_4(COW,COW_OLD,PARAM);
    else
        [COW] =Weight_loss_4(COW,COW_OLD,PARAM);
    end
else
    if BALANCE.MP.Case>=1
        [COW] =Little_growth_prot_4(COW,COW_OLD,PARAM);
    else
        [COW] =Weight_loss_prot_4(COW,COW_OLD,PARAM);
    end
end
