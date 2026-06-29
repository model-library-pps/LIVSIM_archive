%----------------------------Mortality---------------------------------

%Jerome                                                         01-04-2008


%mortality due to natural causes
%version Ago 2007 ---Mariana Rufino
%--------------------------------------------------------------------------

function [COW]=Mortality(COW,PARAM)

if COW.CHAR.Sex==1
    annual_rate=interp1(PARAM.MORT.RateAG,PARAM.MORT.RateFemale,COW.CHAR.Age);
    P = 1-(1-annual_rate)^(1/12);
    COW.CHAR.ProbaDeath=P;
    probability=rand;
    COW.CHAR.RandNbMort=probability;
    if probability<=P
        COW.CHAR.FeedDeficit=2;
    end
else
    annual_rate=interp1(PARAM.MORT.RateAG,PARAM.MORT.RateMale,COW.CHAR.Age);
    P = 1-(1-annual_rate)^(1/12);
    COW.CHAR.ProbaDeath=P;
    probability=rand;
    COW.CHAR.RandNbMort=probability;
    if probability<=P
        COW.CHAR.FeedDeficit=2;
    end
end

if COW.CHAR.FeedDeficit>2;
    COW.CHAR.DEATH=1;
    cow_dead=1
    age=COW.CHAR.Age
    pause
end

%for pregnant cows

if COW.CHAR.FeedDeficit>1 & COW.CHAR.PregInd>0;
    COW.CHAR.DEATH=1;
end
    


