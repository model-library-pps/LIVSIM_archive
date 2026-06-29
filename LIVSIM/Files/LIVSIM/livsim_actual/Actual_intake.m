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

%------------------------actual intake----------------------------------------

%Jerome                                                         14-03-2008

%--------------------------------------------------------------------------

function [COW,FEED]=Actual_intake(COW,COW_OLD,PARAM,LivsimMGMT,FEED,COWS)

PARAM.AFRC.L =2;
PARAM.AFRC.r =-0.024+0.179*(1-exp(-0.278*PARAM.AFRC.L)); %L2 is for growing animals!

%------------------actual intake for calves--------------------------------
if COW_OLD.CHAR.Age<LivsimMGMT.weaningAGE		% jerome change (add "old")
    if COW.INPUT.ME>COW.NEED.PotGrowthME
        COW.INPUT.ME =COW.NEED.PotGrowthME; %ME supply
        %---milk
        if COW.INPUT.MilkME>COW.NEED.PotGrowthME
            COW.INPUT.MilkME =COW.NEED.PotGrowthME;%=Milk_ME;
            COW.INPUT.MilkDM =COW.INPUT.MilkME/PARAM.LACT.MilkME; %kg DM per timestep
            COW.INPUT.MilkMP =(COW.INPUT.MilkDM*1000/PARAM.LACT.MilkDM)*PARAM.LACT.MilkCP/100; % kg Mprot_milk per timestep;
            COW.INPUT.Milk = COW.INPUT.MilkDM*1000/PARAM.LACT.MilkDM;
            milk_given = COW.INPUT.Milk;
        end
        
        %---concentrate
        COW.INPUT.ConcentrateME     =min(COW.INPUT.ConcentrateME,COW.NEED.PotGrowthME-COW.INPUT.MilkME); %MJ per month
        if COW.INPUT.ConcentrateDM>0
            COW.INPUT.ConcentrateDM =COW.INPUT.ConcentrateME/FEED.concentrate.ME;
            COW.INPUT.ConcentrateCP =COW.INPUT.ConcentrateDM*FEED.concentrate.CP/1000;
        else
           COW.INPUT.ConcentrateDM=0;
           COW.INPUT.ConcentrateCP=0;
        end
        %MP for concentrates
        FEED.concentrate.QDProt =FEED.concentrate.a*COW.INPUT.ConcentrateCP;%kg per month   =FEED.forages.UDProt
        FEED.concentrate.SDProt =((FEED.concentrate.b*FEED.concentrate.c)/(FEED.concentrate.c+PARAM.AFRC.r))*COW.INPUT.ConcentrateCP;%kg per month  =SDProt_forages
        FEED.concentrate.ERDP   =0.8*FEED.concentrate.QDProt+FEED.concentrate.SDProt; %kg per month
        FEED.concentrate.MCProt =((7+6*(1-exp(-0.35*PARAM.AFRC.L)))*FEED.concentrate.FME*COW.INPUT.ConcentrateDM)/1000;
        if FEED.concentrate.MCProt>FEED.concentrate.ERDP
            FEED.concentrate.MCProt=FEED.concentrate.ERDP;
        end
        FEED.concentrate.MTProt  =0.75*FEED.concentrate.MCProt;
        FEED.concentrate.DMTProt =0.85*FEED.concentrate.MTProt;
        FEED.concentrate.UDProt  =COW.INPUT.ConcentrateCP-(FEED.concentrate.QDProt+FEED.concentrate.SDProt);
        FEED.concentrate.DUProt  =0.9*(FEED.concentrate.UDProt-6.25*(FEED.concentrate.ADIN/1000)*COW.INPUT.ConcentrateDM);
        FEED.concentrate.Mprot   =FEED.concentrate.DMTProt+FEED.concentrate.DUProt;
        
        COW.INPUT.ConcentrateMP =FEED.concentrate.Mprot;
        COW.INPUT.MP            =COW.INPUT.ConcentrateMP+COW.INPUT.MilkMP;
       
        %---forages
        ME_consumed         =max(0,(COW.NEED.PotGrowthME-COW.INPUT.MilkME-COW.INPUT.ConcentrateME));
        COW.INPUT.DM        =ME_consumed/FEED.ME_av; %kg DM per month   =cows(32)
        COW.INPUT.CP        =COW.INPUT.DM*FEED.forages.CP/1000; %=CP_input_forages;
        %MP for forages
        FEED.forages.QDProt =FEED.forages.a*COW.INPUT.CP;%kg per month   =FEED.forages.UDProt
        FEED.forages.SDProt =((FEED.forages.b*FEED.forages.c)/(FEED.forages.c+PARAM.AFRC.r))*COW.INPUT.CP;%kg per month  =SDProt_forages
        FEED.forages.ERDP   =0.8*FEED.forages.QDProt+FEED.forages.SDProt; %kg per month
        FEED.forages.MCProt =((7+6*(1-exp(-0.35*PARAM.AFRC.L)))*FEED.forages.FME*COW.INPUT.DM)/1000;
        if FEED.forages.MCProt>FEED.forages.ERDP
            FEED.forages.MCProt=FEED.forages.ERDP;
        end
        FEED.forages.MTProt  =0.75*FEED.forages.MCProt;
        FEED.forages.DMTProt =0.85*FEED.forages.MTProt;
        FEED.forages.UDProt  =COW.INPUT.CP-(FEED.forages.QDProt+FEED.forages.SDProt);%=UDProt_forages
        FEED.forages.DUProt  =0.9*(FEED.forages.UDProt-6.25*(FEED.forages.ADIN/1000)*COW.INPUT.DM);
        FEED.forages.Mprot   =FEED.forages.DMTProt+FEED.forages.DUProt;
        COW.INPUT.MP         =COW.INPUT.MilkMP+FEED.forages.Mprot+COW.INPUT.ConcentrateMP;
        %%%Manure
    end
    COW.OUT.CumDMI  =COW_OLD.OUT.CumDMI+COW.INPUT.DM;     %cumulative DM intake
    COW.OUT.CumME   =COW_OLD.OUT.CumME +COW.INPUT.ConcentrateME; %cumulative ME intake
 

    %------------------actual intake for adult--------------------------------
else
    if COW.INPUT.ME>COW.NEED.PotGrowthME
        COW.INPUT.ME        =COW.NEED.PotGrowthME; %ME supply
        COW.INPUT.ConcentrateME     =min(COW.INPUT.ConcentrateME,COW.NEED.PotGrowthME); %MJ per month
        if COW.INPUT.ConcentrateDM>0
            COW.INPUT.ConcentrateDM =COW.INPUT.ConcentrateME/FEED.concentrate.ME;
            COW.INPUT.ConcentrateCP =COW.INPUT.ConcentrateDM*FEED.concentrate.CP/1000;
        end

        %---forages
        ME_consumed         =max(0,COW.NEED.PotGrowthME-COW.INPUT.ConcentrateME);
        COW.INPUT.DM        =ME_consumed/FEED.ME_av; %kg DM per month
        COW.INPUT.CP        =COW.INPUT.DM*FEED.forages.CP/1000; %=CP_input_forages;
        %MP for forages
        FEED.forages.QDProt =FEED.forages.a*COW.INPUT.CP;%kg per month   =FEED.forages.UDProt
        FEED.forages.SDProt =((FEED.forages.b*FEED.forages.c)/(FEED.forages.c+PARAM.AFRC.r))*COW.INPUT.CP;%kg per month  =SDProt_forages
        FEED.forages.ERDP   =0.8*FEED.forages.QDProt+FEED.forages.SDProt; %kg per month
        FEED.forages.MCProt =((7+6*(1-exp(-0.35*PARAM.AFRC.L)))*FEED.forages.FME*COW.INPUT.DM)/1000;
        if FEED.forages.MCProt>FEED.forages.ERDP
            FEED.forages.MCProt=FEED.forages.ERDP;
        end
        FEED.forages.MTProt  =0.75*FEED.forages.MCProt;
        FEED.forages.DMTProt =0.85*FEED.forages.MTProt;
        FEED.forages.UDProt  =COW.INPUT.CP-(FEED.forages.QDProt+FEED.forages.SDProt);%=UDProt_forages
        FEED.forages.DUProt  =0.9*(FEED.forages.UDProt-6.25*(FEED.forages.ADIN/1000)*COW.INPUT.DM);
        FEED.forages.Mprot   =FEED.forages.DMTProt+FEED.forages.DUProt;
        
        %MP for concentrates
        FEED.concentrate.QDProt =FEED.concentrate.a*COW.INPUT.ConcentrateCP;%kg per month   =FEED.forages.UDProt
        FEED.concentrate.SDProt =((FEED.concentrate.b*FEED.concentrate.c)/(FEED.concentrate.c+PARAM.AFRC.r))*COW.INPUT.ConcentrateCP;%kg per month  =SDProt_forages
        FEED.concentrate.ERDP   =0.8*FEED.concentrate.QDProt+FEED.concentrate.SDProt; %kg per month
        FEED.concentrate.MCProt =((7+6*(1-exp(-0.35*PARAM.AFRC.L)))*FEED.concentrate.FME*COW.INPUT.ConcentrateDM)/1000;
        if FEED.concentrate.MCProt>FEED.concentrate.ERDP
            FEED.concentrate.MCProt=FEED.concentrate.ERDP;
        end
        FEED.concentrate.MTProt  =0.75*FEED.concentrate.MCProt;
        FEED.concentrate.DMTProt =0.85*FEED.concentrate.MTProt;
        FEED.concentrate.UDProt  =COW.INPUT.ConcentrateCP-(FEED.concentrate.QDProt+FEED.concentrate.SDProt);
        FEED.concentrate.DUProt  =0.9*(FEED.concentrate.UDProt-6.25*(FEED.concentrate.ADIN/1000)*COW.INPUT.ConcentrateDM);
        FEED.concentrate.Mprot   =FEED.concentrate.DMTProt+FEED.concentrate.DUProt;
        COW.INPUT.ConcentrateMP  =FEED.concentrate.DMTProt+FEED.concentrate.DUProt;
        COW.INPUT.MP             =FEED.forages.Mprot + COW.INPUT.ConcentrateMP;
        %%%Manure
    end
    COW.OUT.CumDMI =COW_OLD.OUT.CumDMI+COW.INPUT.DM;           %cumulative DM intake
    COW.OUT.cumME  =COW_OLD.OUT.CumME+COW.INPUT.ConcentrateME; %cumulative ME intake
end

