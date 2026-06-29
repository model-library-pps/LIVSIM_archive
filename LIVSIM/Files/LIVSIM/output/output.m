%----------------------------output----------------------------------------
% this file updates the output variables
% Version June 2009 --Mariana Rufino
%--------------------------------------------------------------------------

outputCOWS(1,cowNr,timeNr+1)=COWS(cowNr).SYS.FarmType;
outputCOWS(2,cowNr,timeNr+1)=COWS(cowNr).SYS.ID;
outputCOWS(3,cowNr,timeNr+1)=COWS(cowNr).CHAR.Sex;
outputCOWS(4,cowNr,timeNr+1)=COWS(cowNr).CHAR.Age;
outputCOWS(5,cowNr,timeNr+1)=COWS(cowNr).CHAR.Stat;
outputCOWS(6,cowNr,timeNr+1)=COWS(cowNr).CHAR.BW;
outputCOWS(7,cowNr,timeNr+1)=COWS(cowNr).CHAR.GrowthLastMonth;
outputCOWS(8,cowNr,timeNr+1)=COWS(cowNr).NEED.PotGrowthME;
outputCOWS(9,cowNr,timeNr+1)=COWS(cowNr).NEED.PotGrowthMP;
outputCOWS(10,cowNr,timeNr+1)=COWS(cowNr).CHAR.MinBWAgeComb;
outputCOWS(11,cowNr,timeNr+1)=COWS(cowNr).CHAR.CalvInd;
outputCOWS(12,cowNr,timeNr+1)=COWS(cowNr).CHAR.PregInd;
outputCOWS(13,cowNr,timeNr+1)=COWS(cowNr).CHAR.DEATH;
outputCOWS(14,cowNr,timeNr+1)=COWS(cowNr).CHAR.Progenitor;
outputCOWS(15,cowNr,timeNr+1)=COWS(cowNr).NEED.MaintME;
outputCOWS(16,cowNr,timeNr+1)=COWS(cowNr).NEED.GrowthME;
outputCOWS(17,cowNr,timeNr+1)=COWS(cowNr).NEED.GestME;
outputCOWS(18,cowNr,timeNr+1)=COWS(cowNr).NEED.LactME;
outputCOWS(19,cowNr,timeNr+1)=COWS(cowNr).NEED.MaintMP;
outputCOWS(20,cowNr,timeNr+1)=COWS(cowNr).NEED.GrowthMP;
outputCOWS(21,cowNr,timeNr+1)=COWS(cowNr).NEED.GestMP;
outputCOWS(22,cowNr,timeNr+1)=COWS(cowNr).NEED.LactMP;
outputCOWS(23,cowNr,timeNr+1)=COWS(cowNr).CHAR.ProbaConception;
outputCOWS(24,cowNr,timeNr+1)=COWS(cowNr).CHAR.RandNbConception;
outputCOWS(25,cowNr,timeNr+1)=COWS(cowNr).CHAR.FeedDeficit;
outputCOWS(26,cowNr,timeNr+1)=COWS(cowNr).NEED.BasalMaint;
outputCOWS(27,cowNr,timeNr+1)=COWS(cowNr).SYS.DamID;
outputCOWS(28,cowNr,timeNr+1)=COWS(cowNr).INPUT.ME;
outputCOWS(29,cowNr,timeNr+1)=COWS(cowNr).INPUT.MP;
outputCOWS(30,cowNr,timeNr+1)=COWS(cowNr).INPUT.DM;
outputCOWS(31,cowNr,timeNr+1)=COWS(cowNr).INPUT.CP;
outputCOWS(32,cowNr,timeNr+1)=COWS(cowNr).INPUT.MilkME;
outputCOWS(33,cowNr,timeNr+1)=COWS(cowNr).INPUT.MilkMP;
outputCOWS(34,cowNr,timeNr+1)=COWS(cowNr).INPUT.Milk;
outputCOWS(35,cowNr,timeNr+1)=COWS(cowNr).INPUT.ConcentrateDM;
outputCOWS(36,cowNr,timeNr+1)=COWS(cowNr).INPUT.ConcentrateCP;
outputCOWS(37,cowNr,timeNr+1)=COWS(cowNr).INPUT.ConcentrateME;
outputCOWS(38,cowNr,timeNr+1)=COWS(cowNr).INPUT.ConcentrateMP;
outputCOWS(39,cowNr,timeNr+1)=COWS(cowNr).CHAR.ProbaDeath;
outputCOWS(40,cowNr,timeNr+1)=COWS(cowNr).CHAR.RandNbMort;
outputCOWS(41,cowNr,timeNr+1)=COWS(cowNr).BreedID;
outputCOWS(42,cowNr,timeNr+1)=COWS(cowNr).OUT.Milk;
outputCOWS(43,cowNr,timeNr+1)=COWS(cowNr).OUT.FaecN;
outputCOWS(44,cowNr,timeNr+1)=COWS(cowNr).OUT.UrinaryN;
outputCOWS(45,cowNr,timeNr+1)=COWS(cowNr).OUT.FaecDM;
outputCOWS(46,cowNr,timeNr+1)=COWS(cowNr).OUT.NbCalv;
outputCOWS(47,cowNr,timeNr+1)=COWS(cowNr).OUT.CumMilk;
outputCOWS(48,cowNr,timeNr+1)=COWS(cowNr).OUT.CumDayMilk;
outputCOWS(49,cowNr,timeNr+1)=COWS(cowNr).OUT.CumDayOpen;
outputCOWS(50,cowNr,timeNr+1)=COWS(cowNr).OUT.AgeFirstConc;
outputCOWS(51,cowNr,timeNr+1)=COWS(cowNr).OUT.AgeFirstCalv;
outputCOWS(52,cowNr,timeNr+1)=COWS(cowNr).OUT.CumME;
outputCOWS(53,cowNr,timeNr+1)=COWS(cowNr).OUT.CumDMI;
outputCOWS(54,cowNr,timeNr+1)=COWS(cowNr).OUT.ForInt;
outputCOWS(55,cowNr,timeNr+1)=COWS(cowNr).OUT.DMoff;
outputCOWS(56,cowNr,timeNr+1)=COWS(cowNr).OUT.AgeLastCalv;
outputCOWS(57,cowNr,timeNr+1)=COWS(cowNr).OUT.CondIndex;


% outputCOWS(57,cowNr,timeNr+1)=COWS(cowNr).CHAR.LactInd;
