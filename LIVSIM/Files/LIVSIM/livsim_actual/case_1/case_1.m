%------------------------------Case 1--------------------------------------
%CASE 1: growing non-pregnant, non-lactating animals
%version updated May 2009 ---Mariana Rufino
%--------------------------------------------------------------------------

function [COW]=case_1(COW,COW_OLD,PARAM,BALANCE)

BALANCE.ME.Case =COW.INPUT.ME/COW.NEED.MaintME;
BALANCE.MP.Case =COW.INPUT.MP/COW.NEED.MaintMP;

if BALANCE.ME.Case<BALANCE.MP.Case
    if BALANCE.ME.Case>=1
        [COW] =Little_growth(COW,COW_OLD,PARAM);
    else
        [COW] =Weight_loss(COW,COW_OLD,PARAM);
    end
else
    if BALANCE.MP.Case>=1
        [COW] =Little_growth_prot(COW,COW_OLD,PARAM);%more than maintenance
    else
        [COW] =Weight_loss_prot(COW,COW_OLD,PARAM);
    end
end

