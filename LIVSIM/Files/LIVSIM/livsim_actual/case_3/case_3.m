%------------------------------Case 3--------------------------------------
%CASE 3: growing, lactating
%version updated May 2009 ---Mariana Rufino
%--------------------------------------------------------------------------

function [COW]=case_3(COW,COW_OLD,PARAM,BALANCE)

BALANCE.ME.Case =COW.INPUT.ME/(COW.NEED.MaintME+COW.NEED.LactME); 
BALANCE.MP.Case =COW.INPUT.MP/(COW.NEED.MaintMP+COW.NEED.LactMP);

if BALANCE.ME.Case<BALANCE.MP.Case
    if BALANCE.ME.Case>=1
        [COW] =Little_growth_3(COW,COW_OLD,PARAM);
    else
        [COW] =Weight_loss_3(COW,COW_OLD,PARAM);
    end
else
    if BALANCE.MP.Case>=1
        [COW] =Little_growth_prot_3(COW,COW_OLD,PARAM);
    else
        [COW] =Weight_loss_prot_3(COW,COW_OLD,PARAM);
    end
end





