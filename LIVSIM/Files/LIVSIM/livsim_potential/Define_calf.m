%----------------------------Define_calf-----------------------------------
% this file initiates the field structure for a newborn calf and ensures
% that no residual information is passed on from the mother to the calf.
% 
% Version October 2009 ---Mink Zijlstra
%--------------------------------------------------------------------------

function [NEW_COW]=Define_calf(COW,NbCows,PARAM) 

NEW_COW.SYS.FarmType          =0;
NEW_COW.SYS.ID                =NbCows + 1;      %new ID to the calf
NEW_COW.CHAR.Sex              =0;
NEW_COW.CHAR.Age              =0;
NEW_COW.CHAR.Stat             =0;
NEW_COW.CHAR.BW               =PARAM.REPR.CBW;  %mettre poids naissance selon scenarios (cont= 18; RA=23 et sta=28 kg)
NEW_COW.CHAR.GrowthLastMonth  =0;
NEW_COW.CHAR.PotGrowth        =0;
NEW_COW.NEED.PotGrowthME      =0;
NEW_COW.NEED.PotGrowthMP      =0;
NEW_COW.CHAR.MinBWAgeComb     =0;
NEW_COW.CHAR.CalvInd          =0;
NEW_COW.CHAR.PregInd          =0;
NEW_COW.CHAR.LactInd          =0;
NEW_COW.CHAR.DEATH            =0;
NEW_COW.CHAR.Replaced         =0;
NEW_COW.CHAR.Progenitor       =0;
NEW_COW.NEED.MaintME          =0;
NEW_COW.NEED.GrowthME         =0;
NEW_COW.NEED.GestME           =0;
NEW_COW.NEED.LactME           =0;
NEW_COW.NEED.MaintMP          =0;
NEW_COW.NEED.GrowthMP         =0;
NEW_COW.NEED.GestMP           =0;
NEW_COW.NEED.LactMP           =0;
NEW_COW.CHAR.ProbaConception  =0;
NEW_COW.CHAR.RandNbConception =0;
NEW_COW.CHAR.FeedDeficit      =0;
NEW_COW.NEED.BasalMaint       =0;
NEW_COW.SYS.DamID             =COW.SYS.ID;      %keep track of the dam ID
NEW_COW.INPUT.ME              =0;
NEW_COW.INPUT.MP              =0;
NEW_COW.INPUT.DM              =0;
NEW_COW.INPUT.CP              =0;
NEW_COW.INPUT.MilkME          =0;
NEW_COW.INPUT.MilkMP          =0;
NEW_COW.INPUT.Milk            =0;
NEW_COW.INPUT.MilkDM          =0;
NEW_COW.INPUT.ConcentrateDM   =0;
NEW_COW.INPUT.ConcentrateCP   =0;
NEW_COW.INPUT.ConcentrateME   =0;
NEW_COW.INPUT.ConcentrateMP   =0;
NEW_COW.CHAR.ProbaDeath       =0;
NEW_COW.CHAR.RandNbMort       =0;
NEW_COW.BreedID               =COW.BreedID;
NEW_COW.OUT.Milk              =0;
NEW_COW.OUT.Dry               =0;
NEW_COW.OUT.FaecN             =0;
NEW_COW.OUT.UrinaryN          =0;
NEW_COW.OUT.FaecDM            =0;
NEW_COW.OUT.NbCalv            =0;
NEW_COW.OUT.NbLact            =0;
NEW_COW.OUT.CumMilk           =0;
NEW_COW.OUT.CumDayMilk        =0;
NEW_COW.OUT.CumDayOpen        =0;
NEW_COW.OUT.AgeFirstConc      =0;
NEW_COW.OUT.AgeFirstCalv      =0;
NEW_COW.OUT.AgeLastCalv       =0;
NEW_COW.OUT.CumME             =0;
NEW_COW.OUT.CumDMI            =0;
NEW_COW.OUT.ForInt            =0;
NEW_COW.OUT.DMoff             =0;
NEW_COW.OUT.CondIndex         =0;
NEW_COW.BW.average_BW         =0;
NEW_COW.NEED.EnergyWalking    =0;