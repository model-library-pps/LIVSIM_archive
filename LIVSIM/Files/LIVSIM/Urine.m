%------------------------URINE----------------------------------------

%Jerome                                                         02-04-2008
%Urine production
%version Ago 2007 ---Mariana Rufino
%--------------------------------------------------------------------------

function [COW]=Urine(COW,COW_OLD,PARAM)

BEN=0.35*(COW.CHAR.BW^0.75)*PARAM.SYS.factor/1000; %is a proportion of maintenance, expressed in g N/day
if COW.CHAR.BW<COW_OLD.CHAR.BW
    N_weight_loss=138/1000*abs(COW.CHAR.GrowthLastMonth)/6.25;
else
    N_weight_loss=0;
end
COW.OUT.UrinaryN = max(0.01,((COW.INPUT.CP+COW.INPUT.ConcentrateCP)/6.25+N_weight_loss)-COW.OUT.FaecN-BEN-(COW.NEED.LactMP/6.25));

