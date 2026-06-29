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

%------------------------LIVSIM_potential----------------------------------------

%Jerome                                                         18-03-2008

%--------------------------------------------------------------------------

function [output1,output2]=LIVSIM_potential(COW,FEED,PARAM,BREED);



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


%----------------------Potential calculation-------------------------------
[COW,COW_OLD]=Update(COW,PARAM);
%calculate potential growth  and Potential_Compensatory_growth
[COW]=Potential_growth(COW,PARAM);
%calculate conception based on last season
[COW,NEW_COW]=Calving(COW,PARAM);
%Pregnancies to term end in calving
[COW,COW_OLD]=Conception(COW,COW_OLD,PARAM);
%Energy to walk
[COW]=Walking(COW,PARAM,LivsimMGMT);
%calculate nutrient requirements
[COW,PARAM]=NutritiveRequirements(COW,COW_OLD,PARAM);


[COW]=Gestation(COW,COW_OLD,PARAM);

[COW]=Lactation(COW,COW_OLD,PARAM);
%--------------------------------------------------------------------------


output1=COW.NEED.PotGrowthME;
output2=COW.NEED.PotGrowthMP;




