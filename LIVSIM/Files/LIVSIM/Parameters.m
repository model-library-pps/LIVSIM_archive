%-------------------------------------------------------------------------
%                            PARAMETERS
%Dury Jerome                                                    march 2008

%-------------------------------------------------------------------------

function [PARAM]=Parameters(COW,PARAM,BREED,FEED)


%-------------------------PARAM intialisation------------------------------


%----Pregnancy (year)
PARAM.REPR.PREGN = PARAM.REPR.PregnLenght/PARAM.SYS.YLEN;
%----Lactation lenght
PARAM.LACT.LACLEN=PARAM.LACT.Lenght*PARAM.SYS.Monthstep;                    
%----lactation_without_dry_period
PARAM.LACT.WODRYPE=PARAM.REPR.PREGN-2*PARAM.SYS.Monthstep; %PARAM.SYS.SimulationStep
%----MJ/kg energy value of milk
actual_milk_fat=interp1(PARAM.LACT.MilkFatLP,PARAM.LACT.MilkFat,COW.CHAR.LactInd); check(actual_milk_fat);
PARAM.AFRC.EVl= 0.0406*actual_milk_fat+1.509; 



%Condition index
PARAM.BW.CondIn=[0 .3 1]; 
PARAM.BW.CondFactor=[0 1 1];
%--------------------------------------------------------------------------

%---------------------------AFRC_initialisation----------------------------
PARAM.AFRC.reduction=1;

PARAM.AFRC.L=1;  %animals fed at maintenance and L=2; for growing animals
PARAM.AFRC.CL= 1+0.018*(PARAM.AFRC.L-1); %L is multiple of ME maintenance req. 
PARAM.AFRC.r=-0.024+0.179*(1-exp(-0.278*PARAM.AFRC.L)); %Outflow rate determined by level of feeding


PARAM.AFRC.qm = FEED.ME_av/ FEED.GE_av;         %Metabolisability of GE, dig. and GE data (Ketelaars and Tolkamp (1992) eq. to predict qm


PARAM.AFRC.km = 0.35*PARAM.AFRC.qm + 0.503;     %Efficiency for maintenance
PARAM.AFRC.kl = 0.35*PARAM.AFRC.qm + 0.420;     %Efficiency for lactation
PARAM.AFRC.kf = 0.78*PARAM.AFRC.qm + 0.006;     %growing ruminants
PARAM.AFRC.kg = 0.95*PARAM.AFRC.kl;             %growing lactating ruminants
PARAM.AFRC.kc= 0.133;                %Efficiency for growth of concepta
PARAM.AFRC.kt = 0.84;                %Efficiency for utilisation of mobilised body tissue for lactation
PARAM.AFRC.kz =  PARAM.AFRC.km*log(PARAM.AFRC.km/PARAM.AFRC.kf);
PARAM.AFRC.B = PARAM.AFRC.km/(PARAM.AFRC.km-PARAM.AFRC.kf);

%---Parameter for calibration%%%%

PARAM.AFRC.EVlo=19 ; %MJ/kg  AFRC page 31                                                                       
PARAM.AFRC.MPg=138; %g/kg   AFRC page 40   

%---degree of maturity as defined in AFRC documentation 
if PARAM.AFRC.MaturingStage==1		% early maturing	(e.g. Mashona)
	if COW.CHAR.Sex==0
	    PARAM.AFRC.C2=1.15; PARAM.AFRC.C6=0.9;      
	else
	    PARAM.AFRC.C2=1.30; PARAM.AFRC.C6=0.8;		
	end
elseif PARAM.AFRC.MaturingStage==2	% mid maturing 		(e.g. Africander)
	if COW.CHAR.Sex==0
	    PARAM.AFRC.C2=1.0; PARAM.AFRC.C6=1.0;      
	else
	    PARAM.AFRC.C2=1.15; PARAM.AFRC.C6=0.9;		
	end	
elseif PARAM.AFRC.MaturingStage==3	% late maturing 	(e.g. Mere)
	if COW.CHAR.Sex==0
	PARAM.AFRC.C2=0.7; PARAM.AFRC.C6=1.2;       
	else
	PARAM.AFRC.C2=1.00; PARAM.AFRC.C6=1.0;		
	end
end



