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

%--------------------------Potential_intake--------------------------------
%
%LIVSIM Feed calculations
%version June 2010 -- Mink Zijlstra
%--------------------------------------------------------------------------

function [PARAM,COW,FEED]=potential_intake(COW,PARAM,LivsimMGMT,DIET,FEED,COWS)

PARAM.AFRC.L    =2;
PARAM.AFRC.r    =-0.024+0.179*(1-exp(-0.278*PARAM.AFRC.L)); %Outflow rate determined by level of feeding

if COW.CHAR.Age<LivsimMGMT.weaningAGE;
    
    m=length(COWS);
    if COW.SYS.DamID>-999
        for counter=1:m
            %check which cow is the mother of the current calf
            if COWS(counter).SYS.ID==COW.SYS.DamID
                Dam =COWS(counter);
            end
        end
    else
        Dam=[];
    end
    if ~isempty(Dam)
        %The calf gets 66% of its dam's milk, Bengaly and al 1993 for Mere (Mali) - remove for Mexico
        Milk_intake=PARAM.milk_allowance*Dam.OUT.Milk;
        mother_milk=Milk_intake;

    else
        Milk_all_rate_old =interp1(LivsimMGMT.MilkAllowanceAge,LivsimMGMT.MilkAllowance,COW.CHAR.Age); check(Milk_all_rate_old);%kg per month
        Milk_all_rate     =interp1(LivsimMGMT.MilkAllowanceAge,LivsimMGMT.MilkAllowance,COW.CHAR.Age+PARAM.SYS.timestep); check(Milk_all_rate);
        Milk_intake       =(Milk_all_rate_old+Milk_all_rate)/2*PARAM.SYS.timestep; %kg per timestep
        given_milk=Milk_intake;
   
    end
    
    COW.INPUT.MilkME =Milk_intake*PARAM.LACT.MilkME*PARAM.LACT.MilkDM/1000; %MJ per month
    COW.INPUT.MilkMP =Milk_intake*PARAM.LACT.MilkCP/100; % =kg milk_prot per month
    COW.INPUT.Milk =Milk_intake; %kg milk available per timestep
 
    energy_milk=COW.INPUT.MilkME;
    prot_milk=COW.INPUT.MilkMP;
    Intake_concentrate =sum(DIET.ConcentrateQuantity(:,1));
    Intake_forages     =(0.0107*COW.CHAR.BW/(1-FEED.forages.DMD))*PARAM.SYS.factor; %Conrad
   %Intake_forages=(0.016*COW.CHAR.BW+3.273*FEED.forages.DMD+0.012*FEED.forages.CP-0.004*FEED.forages.NDF)*PARAM.SYS.factor; % Ruminant
    
    %Feed_available=(sum(Quantity)-Forage_consumption)*fraction_allocated;
    Feed_available          =sum(DIET.ForageQuantity);
    COW.INPUT.DM            =min(sum(Feed_available*FEED.forages.DM/1000),Intake_forages);
 
    COW.INPUT.CP            =COW.INPUT.DM*FEED.forages.CP/1000;
    ME_input                =COW.INPUT.DM*FEED.forages.ME;
    COW.INPUT.ConcentrateDM =Intake_concentrate;%=DM_input_concentrate;
    COW.INPUT.ConcentrateCP =COW.INPUT.ConcentrateDM*FEED.concentrate.CP/1000;%=CP_input_concentrate;
    COW.INPUT.ConcentrateME =COW.INPUT.ConcentrateDM*FEED.concentrate.ME;%=ME_input_concentrate;
    COW.INPUT.ME            =COW.INPUT.MilkME+ME_input+COW.INPUT.ConcentrateME;
    
    %---MP for forages
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
    
    %---MP for concentrates
    FEED.concentrate.QDProt =FEED.concentrate.a*COW.INPUT.ConcentrateCP;
    FEED.concentrate.SDProt =((FEED.concentrate.b*FEED.concentrate.c)/(FEED.concentrate.c+PARAM.AFRC.r))*COW.INPUT.ConcentrateCP;
    FEED.concentrate.ERDP   =0.8*FEED.concentrate.QDProt+FEED.concentrate.SDProt;
    FEED.concentrate.MCProt =((7+6*(1-exp(-0.35*PARAM.AFRC.L)))*FEED.concentrate.FME*COW.INPUT.ConcentrateDM)/1000;
    if FEED.concentrate.MCProt>FEED.concentrate.ERDP
        FEED.concentrate.MCProt=FEED.concentrate.ERDP;
    end
    FEED.concentrate.MTProt  =0.75*FEED.concentrate.MCProt;
    FEED.concentrate.DMTProt =0.85*FEED.concentrate.MTProt;
    FEED.concentrate.UDProt  =COW.INPUT.ConcentrateCP-(FEED.concentrate.QDProt+FEED.concentrate.SDProt);
    FEED.concentrate.DUProt  =0.9*(FEED.concentrate.UDProt-6.25*(FEED.concentrate.ADIN/1000)*COW.INPUT.ConcentrateDM);
    COW.INPUT.ConcentrateMP  =FEED.concentrate.DMTProt+FEED.concentrate.DUProt;
    COW.INPUT.MP             =COW.INPUT.MilkMP+FEED.forages.Mprot+COW.INPUT.ConcentrateMP;
end

%animals after weaning
if COW.CHAR.Age>=LivsimMGMT.weaningAGE;
    COW.INPUT.MilkME =0;
    COW.INPUT.MilkMP =0;
    COW.INPUT.MilkDM =0;
    COW.INPUT.Milk =0;
    if COW.CHAR.Sex==1
        coefIntake =interp1(PARAM.LACT.MilkFatLP,PARAM.BW.IntLact,COW.CHAR.LactInd); check(coefIntake);
    else
        coefIntake =1;
    end
    Intake_concentrate      =sum(DIET.ConcentrateQuantity(:,1)); % Here we give the codes for the survival analysis- need to change this!
    Intake_forages          =(0.0107*COW.CHAR.BW/(1-FEED.forages.DMD))*PARAM.SYS.factor*coefIntake;
   %Intake_forages=(0.016*COW.CHAR.BW+3.273*FEED.forages.DMD+0.012*FEED.forages.CP-0.004*FEED.forages.NDF)*PARAM.SYS.factor; % Ruminant
    Feed_available          =sum(DIET.ForageQuantity);
    COW.OUT.DMoff           =Feed_available*FEED.forages.DM/1000;
    
    %Dry matter per animal
    COW.INPUT.DM            =min(sum(Feed_available*FEED.forages.DM/1000),Intake_forages); %=DM_input_forages;
    ME_input                =COW.INPUT.DM*FEED.forages.ME; %=ME_input_forages;
    COW.INPUT.CP            =COW.INPUT.DM*FEED.forages.CP/1000; %=CP_input_forages;
    COW.INPUT.ConcentrateDM =Intake_concentrate;%=DM_input_concentrate;
    COW.INPUT.ConcentrateCP =COW.INPUT.ConcentrateDM*FEED.concentrate.CP/1000;%=CP_input_concentrate;
    COW.INPUT.ConcentrateME =COW.INPUT.ConcentrateDM*FEED.concentrate.ME;%=ME_input_concentrate;
    COW.INPUT.ME            =ME_input+COW.INPUT.ConcentrateME;
    
    %---MP for forages
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
    
    %---MP for concentrates
    FEED.concentrate.QDProt =FEED.concentrate.a*COW.INPUT.ConcentrateCP;
    FEED.concentrate.SDProt =((FEED.concentrate.b*FEED.concentrate.c)/(FEED.concentrate.c+PARAM.AFRC.r))*COW.INPUT.ConcentrateCP;
    FEED.concentrate.ERDP   =0.8*FEED.concentrate.QDProt+FEED.concentrate.SDProt;
    FEED.concentrate.MCProt =((7+6*(1-exp(-0.35*PARAM.AFRC.L)))*FEED.concentrate.FME*COW.INPUT.ConcentrateDM)/1000;
    if FEED.concentrate.MCProt>FEED.concentrate.ERDP
        FEED.concentrate.MCProt=FEED.concentrate.ERDP;
    end
    FEED.concentrate.MTProt  =0.75*FEED.concentrate.MCProt;
    FEED.concentrate.DMTProt =0.85*FEED.concentrate.MTProt;
    FEED.concentrate.UDProt  =COW.INPUT.ConcentrateCP-(FEED.concentrate.QDProt+FEED.concentrate.SDProt);
    FEED.concentrate.DUProt  =0.9*(FEED.concentrate.UDProt-6.25*(FEED.concentrate.ADIN/1000)*COW.INPUT.ConcentrateDM);
    COW.INPUT.ConcentrateMP  =FEED.concentrate.DMTProt+FEED.concentrate.DUProt;
    COW.INPUT.MP             =COW.INPUT.MilkMP+FEED.forages.Mprot+COW.INPUT.ConcentrateMP;
    
    %%%%%%Manure production module, recalculated in Actual Intake%%%%%%%%
    %Manure
end
%feed_offered=COW.INPUT.DM
%energy=COW.INPUT.ME
%age=COW.CHAR.Age
%bw=COW.CHAR.BW
%energyMA=COW.NEED.MaintME
%pause