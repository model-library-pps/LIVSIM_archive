%-------------------------------------------------------------------------
% Copyright 2013. Wageningen University, Plant Production Systems group,  
% P.O. Box 430, 6700 AK Wageningen, The Netherlands.                      
% You may not use this work except in compliance with the Licence.        
% You may obtain a copy of the Licence at:                                
%                                                                         
% http://models.pps.wur.nl/content/licence-agreement                      
%                                                                         
% Unless required by applicable law or agreed to in writing, software     
% distributed under the Licence is distributed on an "AS IS" basis,       
% WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
%-------------------------------------------------------------------------

%-------------------------------------------------------------------------
%                       FEED TRANSLATION
%27/07/2007
%-------------------------------------------------------------------------

function [FEED]=Feed_translation(DIET)


%Feed quality weighted  (grass ans forages)

FEED.forages.DM     =sum(DIET.ForageQuantity.*DIET.ForageQuality(:,2))/sum(DIET.ForageQuantity);
FEED.forages.ME     =sum(DIET.ForageQuantity.*DIET.ForageQuality(:,3))/sum(DIET.ForageQuantity);
FEED.forages.GE     =sum(DIET.ForageQuantity.*DIET.ForageQuality(:,4))/sum(DIET.ForageQuantity);
FEED.forages.FME    =sum(DIET.ForageQuantity.*DIET.ForageQuality(:,5))/sum(DIET.ForageQuantity);
FEED.forages.CP     =sum(DIET.ForageQuantity.*DIET.ForageQuality(:,6))/sum(DIET.ForageQuantity);
FEED.forages.ADIN   =sum(DIET.ForageQuantity.*DIET.ForageQuality(:,7))/sum(DIET.ForageQuantity);
FEED.forages.DMD    =sum(DIET.ForageQuantity.*DIET.ForageQuality(:,8))/sum(DIET.ForageQuantity);
FEED.forages.a      =sum(DIET.ForageQuantity.*DIET.ForageQuality(:,9))/sum(DIET.ForageQuantity);
FEED.forages.b      =sum(DIET.ForageQuantity.*DIET.ForageQuality(:,10))/sum(DIET.ForageQuantity);
FEED.forages.c      =sum(DIET.ForageQuantity.*DIET.ForageQuality(:,11))/sum(DIET.ForageQuantity);
FEED.forages.NDF    =sum(DIET.ForageQuantity.*DIET.ForageQuality(:,12))/sum(DIET.ForageQuantity);


if sum(DIET.ConcentrateQuantity)>0
FEED.concentrate.DM   =sum(DIET.ConcentrateQuantity.*DIET.ConcentrateQuality(:,2))/sum(DIET.ConcentrateQuantity);
FEED.concentrate.ME   =sum(DIET.ConcentrateQuantity.*DIET.ConcentrateQuality(:,3))/sum(DIET.ConcentrateQuantity);
FEED.concentrate.GE   =sum(DIET.ConcentrateQuantity.*DIET.ConcentrateQuality(:,4))/sum(DIET.ConcentrateQuantity);
FEED.concentrate.FME  =sum(DIET.ConcentrateQuantity.*DIET.ConcentrateQuality(:,5))/sum(DIET.ConcentrateQuantity);
FEED.concentrate.CP   =sum(DIET.ConcentrateQuantity.*DIET.ConcentrateQuality(:,6))/sum(DIET.ConcentrateQuantity);
FEED.concentrate.ADIN =sum(DIET.ConcentrateQuantity.*DIET.ConcentrateQuality(:,7))/sum(DIET.ConcentrateQuantity);
FEED.concentrate.DMD  =sum(DIET.ConcentrateQuantity.*DIET.ConcentrateQuality(:,8))/sum(DIET.ConcentrateQuantity);
FEED.concentrate.a    =sum(DIET.ConcentrateQuantity.*DIET.ConcentrateQuality(:,9))/sum(DIET.ConcentrateQuantity);
FEED.concentrate.b    =sum(DIET.ConcentrateQuantity.*DIET.ConcentrateQuality(:,10))/sum(DIET.ConcentrateQuantity);
FEED.concentrate.c    =sum(DIET.ConcentrateQuantity.*DIET.ConcentrateQuality(:,11))/sum(DIET.ConcentrateQuantity);
FEED.concentrate.NDF  =sum(DIET.ConcentrateQuantity.*DIET.ConcentrateQuality(:,12))/sum(DIET.ConcentrateQuantity);
else
FEED.concentrate.DM   =0;
FEED.concentrate.ME   =0;
FEED.concentrate.GE   =0;
FEED.concentrate.FME  =0;
FEED.concentrate.CP   =0;
FEED.concentrate.ADIN =0;
FEED.concentrate.DMD  =0;
FEED.concentrate.a    =0;
FEED.concentrate.b    =0;
FEED.concentrate.c    =0;
FEED.concentrate.NDF  =0;   

end

FEED.ME_av =FEED.forages.ME;
FEED.GE_av =FEED.forages.GE;



