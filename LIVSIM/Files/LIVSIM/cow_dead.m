%------------------------cow dead----------------------------------------

%Jerome                                                         8-04-2008

%--------------------------------------------------------------------------

function [COW_NEW]=cow_dead(COW);
COW_NEW.SYS.FarmType=COW.SYS.FarmType;
COW_NEW.SYS.ID=COW.SYS.ID;
COW_NEW.CHAR.Sex=COW.CHAR.Sex;
COW_NEW.CHAR.Age=COW.CHAR.Age;
COW_NEW.CHAR.Stat=0;
COW_NEW.CHAR.BW=COW.CHAR.BW;
COW_NEW.CHAR.GrowthLastMonth=0;
COW_NEW.NEED.PotGrowthME=0;
COW_NEW.NEED.PotGrowthMP=0;
COW_NEW.CHAR.MinBWAgeComb=0;
COW_NEW.CHAR.CalvInd=0;
COW_NEW.CHAR.PregInd=0;
COW_NEW.CHAR.LactInd=0;
COW_NEW.CHAR.DEATH=2;
COW_NEW.CHAR.Progenitor=0;
COW_NEW.NEED.MaintME=0;
COW_NEW.NEED.GrowthME=0;
COW_NEW.NEED.GestME=0;
COW_NEW.NEED.LactME=0;
COW_NEW.NEED.MaintMP=0;
COW_NEW.NEED.GrowthMP=0;
COW_NEW.NEED.GestMP=0;
COW_NEW.NEED.LactMP=0;
COW_NEW.CHAR.ProbaConception=COW.CHAR.ProbaConception;
COW_NEW.CHAR.RandNbConception=0;
COW_NEW.CHAR.FeedDeficit=0;
COW_NEW.NEED.BasalMaint=0;
COW_NEW.SYS.DamID=COW.SYS.DamID;
COW_NEW.INPUT.ME=0;
COW_NEW.INPUT.MP=0;
COW_NEW.INPUT.DM=0;
COW_NEW.INPUT.CP=0;
COW_NEW.INPUT.MilkME=0;
COW_NEW.INPUT.MilkMP=0;
COW_NEW.INPUT.MilkDM=0;
COW_NEW.INPUT.Milk=0;
COW_NEW.INPUT.ConcentrateDM=0;
COW_NEW.INPUT.ConcentrateCP=0;
COW_NEW.INPUT.ConcentrateME=0;
COW_NEW.INPUT.ConcentrateMP=0;
COW_NEW.CHAR.ProbaDeath=0;
COW_NEW.CHAR.RandNbMort=0;
COW_NEW.BreedID=0;
COW_NEW.OUT.Milk=0;
COW_NEW.OUT.FaecN=0;
COW_NEW.OUT.UrinaryN=0;
COW_NEW.OUT.FaecDM=0;
COW_NEW.OUT.NbCalv=0;
COW_NEW.OUT.CumMilk=0;
COW_NEW.OUT.CumDayMilk=0;
COW_NEW.OUT.CumDayOpen=0;
COW_NEW.OUT.AgeFirstConc=0;
COW_NEW.OUT.AgeFirstCalv=0;
COW_NEW.OUT.AgeLastCalv=0;
COW_NEW.OUT.CumME=0;
COW_NEW.OUT.CumDMI=0;
COW_NEW.OUT.ForInt=0;
COW_NEW.OUT.DMoff=0;
COW_NEW.OUT.CondIndex=COW.OUT.CondIndex;
COW_NEW.BW.average_BW=0;
COW_NEW.NEED.EnergyWalking=0;

