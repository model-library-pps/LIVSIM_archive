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

%------------------------GESTATION----------------------------------------

%Jerome                                                         02-04-2008
%Gestation energy needs 
%version Ago 2007 ---Mariana Rufino
%--------------------------------------------------------------------------


function [COW]=Gestation(COW,COW_OLD,PARAM)

if COW.CHAR.PregInd>0
    t         =COW.CHAR.PregInd*PARAM.SYS.YLEN; %transform to days
    t_old     =(COW.CHAR.PregInd-PARAM.SYS.timestep)*PARAM.SYS.YLEN;
    Et_actual =10^(151.665-151.64*exp(-0.0000576*t)); %energy retention (MJ) in gravid foetus, “t” days from conception
    Et_old    =10^(151.665-151.64*exp(-0.0000576*t_old)); 
    Mc        =((mean([Et_actual Et_old])-Et_old)/PARAM.AFRC.kc);
    if COW.CHAR.PregInd<=0.65
        COW.NEED.GestME      =Mc;
        COW.NEED.PotGrowthME =COW.NEED.PotGrowthME+Mc; 
    else
        PARAM.AFRC.L         =1; 
        PARAM.AFRC.CL        =1+0.018*(PARAM.AFRC.L-1); %L is multiple of ME maintenance req.
        COW.NEED.GestME      =PARAM.AFRC.CL*Mc;
        COW.NEED.PotGrowthME =COW.NEED.PotGrowthME+PARAM.AFRC.CL*Mc;
    end

    %MP gestation requirements
    TPt                  =10^(3.707-5.698*exp(-0.00262*t)); %tissue protein retention (kg) at time "t" 
    TPt_old              =10^(3.707-5.698*exp(-0.00262*t_old));
    MPc                  =1.01*PARAM.REPR.CBW*mean([TPt TPt_old])*exp(-0.00262*(t-t_old));
    COW.NEED.GestMP      =MPc/1000*PARAM.SYS.YLEN*PARAM.SYS.timestep;
    COW.NEED.PotGrowthMP =COW.NEED.PotGrowthMP + COW.NEED.GestMP; %kg/timestep;
end
