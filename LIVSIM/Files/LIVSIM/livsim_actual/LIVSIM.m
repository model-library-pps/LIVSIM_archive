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

%----------------------------LIVSIM----------------------------------------
%This is the manager of livsim, the function used in the runner:
%run_livsim.m. Update_herd is included here, to keep track of calves
%that are now linked to their dams.

%Version Updated May 2009 --- Mariana Rufino
%--------------------------------------------------------------------------

function     [COW_NEW,NEW_COW,NbCows,DIET]=LIVSIM(COW,PARAM,LivsimMGMT,BREED,DIET,COWS,NbCows)

[FEED]=Feed_translation(DIET);
NEW_COW=[];

%------------------------Breed parameter selection-------------------------

if COW.BreedID==1
    PARAM.BW=BREED.MASHONA.BW;
    PARAM.REPR=BREED.MASHONA.REPR;
    PARAM.MORT=BREED.MASHONA.MORT;
    PARAM.LACT=BREED.MASHONA.LACT;
    PARAM.AFRC=BREED.MASHONA.AFRC;
    [PARAM]=Parameters(COW,PARAM,BREED,FEED);
end
if COW.BreedID==2
    PARAM.BW=BREED.AFRICANDER.BW;
    PARAM.REPR=BREED.AFRICANDER.REPR;
    PARAM.MORT=BREED.AFRICANDER.MORT;
    PARAM.LACT=BREED.AFRICANDER.LACT;
    PARAM.AFRC=BREED.AFRICANDER.AFRC;
    [PARAM]=Parameters(COW,PARAM,BREED,FEED);
end
if COW.BreedID==3
    PARAM.BW=BREED.FRIESIAN.BW;
    PARAM.REPR=BREED.FRIESIAN.REPR;
    PARAM.MORT=BREED.FRIESIAN.MORT;
    PARAM.LACT=BREED.FRIESIAN.LACT;
    PARAM.AFRC=BREED.FRIESIAN.AFRC;
    [PARAM]=Parameters(COW,PARAM,BREED,FEED);
end
if COW.BreedID==4
    PARAM.BW=BREED.MERE.BW;
    PARAM.REPR=BREED.MERE.REPR;
    PARAM.MORT=BREED.MERE.MORT;
    PARAM.LACT=BREED.MERE.LACT;
    PARAM.AFRC=BREED.MERE.AFRC;
    [PARAM]=Parameters(COW,PARAM,BREED,FEED);
end

%--------------------------------------------------------------------------


[PARAM,COW,FEED]=potential_intake(COW,PARAM,LivsimMGMT,DIET,FEED,COWS);
[COW]=Mortality(COW,PARAM);

if COW.CHAR.DEATH==0
    %------------------------Potential requirements calculation------------

    [COW,COW_OLD]=Update(COW,PARAM);
    %calculate potential growth  and Potential_Compensatory_growth
    [COW]=Potential_growth(COW,PARAM);

    %Pregnancies to term end in calving
    [COW,NEW_COW,NbCows]=Calving(COW,PARAM,COW_OLD,NbCows);

    %calculate conception based on data (BW) of the last season
    [COW,COW_OLD]=Conception(COW,COW_OLD,PARAM);

    %Energy expenditure to walk
    [COW]=Walking(COW,PARAM,LivsimMGMT);

    %Calculate nutrient requirements
    [COW,PARAM]=NutritiveRequirements(COW,COW_OLD,PARAM);
    [COW]=Gestation(COW,COW_OLD,PARAM);
    [COW]=Lactation(COW,COW_OLD,PARAM,COWS);
    
    %----------------------------------------------------------------------

    %------------------------Actual requirements calculation---------------
    [COW,FEED]=Actual_intake(COW,COW_OLD,PARAM,LivsimMGMT,FEED,COWS);
    [COW]=Manure(COW,FEED);
    [COW]=Balance_check(COW,COW_OLD,PARAM);
    [COW]=Urine(COW,COW_OLD,PARAM);
    %----------------------------------------------------------------------
    
end

COW_NEW = COW;



