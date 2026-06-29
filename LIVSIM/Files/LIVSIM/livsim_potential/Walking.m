%Energy need fro walking during grazing

function [COW]=Walking(COW,PARAM,LivsimMGMT)

COW.NEED.EnergyWalking=LivsimMGMT.WalkingDistance*PARAM.AFRC.EnergyWalking/1000; 
%kJ/kg BW
