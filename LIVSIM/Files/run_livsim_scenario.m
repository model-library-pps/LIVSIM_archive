%------------------------Run_livsim_scenarios------------------------------
%Modified to keep track of the calves of each dam
%Updated May 2009 - Mariana Rufino
%Updated November 2011 -  Nico de Ridder/ Ousmane Sanogo
%-----------------------How to manage feed input---------------------------
% The diet in quantity provided per kg BW per month is given in the file
% Feed input.xls. To manage feed given to lactating cows replace number in
% FeedInput(:,1)== for farmers practice in number 4, when supplemented in  
% dry season but with free grazing in 5 and when kept in stable in the dry
% season in 6. The change needs to be done in line 92, 123 and 147. For 
% potential production use file feed input pot.xls values in feed input.xls    
%--------------------------------------------------------------------------
                        
clear

%-----------------------------INPUT---------------------------------------
addpath(fullfile(pwd,'LIVSIM\input'))
addpath(fullfile(pwd,'LIVSIM'))
addpath(fullfile(pwd,'LIVSIM\livsim_potential'))
addpath(fullfile(pwd,'LIVSIM\livsim_actual'))
addpath(fullfile(pwd,'LIVSIM\output'))
addpath(fullfile(pwd,'LIVSIM\livsim_actual\case_1'))
addpath(fullfile(pwd,'LIVSIM\livsim_actual\case_2'))
addpath(fullfile(pwd,'LIVSIM\livsim_actual\case_3'))
addpath(fullfile(pwd,'LIVSIM\livsim_actual\case_4'))

stop=12; 
months=1:12;

for start=1:12
    
    [COWS,BREED,PARAM,LivsimMGMT,DIETquality,CONCENTRATEquantity,CONCENTRATEquality]=inputLIVSIM;
    load param.mat
    PARAM.milk_allowance=milk_allowance;
    
    %Read feed input from excel file
    load feed_input.mat
    
    WalkingDistance=LivsimMGMT.WalkingDistance;
    weaningAGE=LivsimMGMT.weaningAGE;
    count_dead=0;
    FORAGES=[];
    CONCENTRATE=[];
    clear outputCOWS

    run_months=[months(start:stop),months(1:start-1)];
    temp1=DIETquality(:,2:13);
    temp1=temp1(:,run_months);
    DIETquality(:,2:13)=temp1;
    temp2=FeedInput(:,4:15);
    temp2=temp2(:,run_months);
    FeedInput(:,4:15)=temp2;

    %Reading initial number of cows from excel file
    NbCows=PARAM.SYS.NBCOW;

    for cowNr=1:NbCows
        output1 %It initializes the output
    end
    
    for year=1:PARAM.SYS.SimulationTime
        
        for time=1:12 %months
            
            timeNr=time+(year-1)*PARAM.SYS.SimulationStep;
            number_of_cows_beforenewcalves=length(COWS);
            
            for cowNr=1:number_of_cows_beforenewcalves
                
                COW=COWS(cowNr);
                if COW.CHAR.DEATH==0
                    %Amount of concentrates according to age class and milk production
                    if COW.CHAR.Age>=0&&COW.CHAR.Age<=0.25
                        k=FeedInput(:,1)==7 & FeedInput(:,2)==2;
                    elseif COW.CHAR.Age>0.25&&COW.CHAR.Age<=1
                        k=FeedInput(:,1)==1 & FeedInput(:,2)==2;
                    elseif COW.CHAR.Age>1&&COW.CHAR.Age<=2
                        k=FeedInput(:,1)==2 & FeedInput(:,2)==2;
                    elseif COW.CHAR.Age>2&&COW.CHAR.Age<=3
                        k=FeedInput(:,1)==8 & FeedInput(:,2)==2;
                    elseif COW.CHAR.Age>3&&COW.CHAR.Age<=4
                        k=FeedInput(:,1)==9 & FeedInput(:,2)==2;
                    elseif COW.CHAR.Age>4&&COW.CHAR.Age<=5
                        k=FeedInput(:,1)==10 & FeedInput(:,2)==2;
                    elseif COW.CHAR.Age>5&&COW.OUT.Milk<=0.001 && COW.CHAR.PregInd<0.70 || COW.CHAR.LactInd>1.45
                        k=FeedInput(:,1)==3 & FeedInput(:,2)==2;
                    elseif COW.CHAR.Age>5&&COW.CHAR.Sex==0
                        k=FeedInput(:,1)==3 & FeedInput(:,2)==2;
                    elseif COW.CHAR.Age>3 && (COW.CHAR.LactInd>0.001 || COW.CHAR.PregInd>0.70) && COW.CHAR.LactInd<1.45
                        %Here replace in FeedInput(:,1)== for farmers practice 4,
                        %supplemented 5 and stable 6
                        k=FeedInput(:,1)==6 & FeedInput(:,2)==2;
                    end
                    
                    DIET.ConcentrateQuantity=FeedInput(k,time+3).*COW.CHAR.BW; %Kg per animal
                    %Quality of concentrate
                    [m n]=size(CONCENTRATEquality);
                    NumberOfFeed=m/11;
                    index=1:11:m;
                    DIET.ConcentrateQuality=[CONCENTRATEquality(index,1),reshape(CONCENTRATEquality(:,time+1),11,m/11)'];
                    
                    %forage legumes
                    DIET.ForageQuantity(:,1)=repmat(0,6,1); %creating a empty matrix
                    if COW.CHAR.Age>=0&&COW.CHAR.Age<=0.25
                        h=FeedInput(:,1)==7 & FeedInput(:,2)==1;
                    elseif COW.CHAR.Age>0.25&&COW.CHAR.Age<=1
                        h=FeedInput(:,1)==1 & FeedInput(:,2)==1;
                    elseif COW.CHAR.Age>1&&COW.CHAR.Age<=2
                        h=FeedInput(:,1)==2 & FeedInput(:,2)==1;
                    elseif COW.CHAR.Age>2&&COW.CHAR.Age<=3
                        h=FeedInput(:,1)==8 & FeedInput(:,2)==1;
                    elseif COW.CHAR.Age>3&&COW.CHAR.Age<=4
                        h=FeedInput(:,1)==9 & FeedInput(:,2)==1;
                    elseif COW.CHAR.Age>4&&COW.CHAR.Age<=5
                        h=FeedInput(:,1)==10 & FeedInput(:,2)==1;
                    elseif COW.CHAR.Age>5&&COW.OUT.Milk<=0.001 && COW.CHAR.PregInd<0.70 || COW.CHAR.LactInd>1.45
                        h=FeedInput(:,1)==3 & FeedInput(:,2)==1;
                    elseif COW.CHAR.Age>5&&COW.CHAR.Sex==0
                        h=FeedInput(:,1)==3 & FeedInput(:,2)==1;
                    elseif COW.CHAR.Age>3 && (COW.CHAR.LactInd>0.001 || COW.CHAR.PregInd>0.70) && COW.CHAR.LactInd<1.45
                        %Here replace in FeedInput(:,1)== for farmers practice 4,
                        %supplemented 5 and stable 6
                        h=FeedInput(:,1)==6 & FeedInput(:,2)==1;
                    end
                    ForageQuantity=[FeedInput(h,3),FeedInput(h,time+3).*COW.CHAR.BW];
                    %Pasture grass
                    
                    if COW.CHAR.Age>=0&&COW.CHAR.Age<=0.25
                        d=FeedInput(:,1)==7 & FeedInput(:,2)==3;
                    elseif COW.CHAR.Age>0.25&&COW.CHAR.Age<=1
                        d=FeedInput(:,1)==1 & FeedInput(:,2)==3;
                    elseif COW.CHAR.Age>1&&COW.CHAR.Age<=2
                        d=FeedInput(:,1)==2 & FeedInput(:,2)==3;
                    elseif COW.CHAR.Age>2&&COW.CHAR.Age<=3
                        d=FeedInput(:,1)==8 & FeedInput(:,2)==3;
                    elseif COW.CHAR.Age>3&&COW.CHAR.Age<=4
                        d=FeedInput(:,1)==9 & FeedInput(:,2)==3;
                    elseif COW.CHAR.Age>4&&COW.CHAR.Age<=5
                        d=FeedInput(:,1)==10 & FeedInput(:,2)==3;
                    elseif COW.CHAR.Age>5&&COW.OUT.Milk<=0.001 && COW.CHAR.PregInd<0.70 || COW.CHAR.LactInd>1.45
                        d=FeedInput(:,1)==3 & FeedInput(:,2)==3;
                    elseif COW.CHAR.Age>5&&COW.CHAR.Sex==0
                        d=FeedInput(:,1)==3 & FeedInput(:,2)==3;
                    elseif COW.CHAR.Age>3 && (COW.CHAR.LactInd>0.001 || COW.CHAR.PregInd>0.70) && COW.CHAR.LactInd<1.45
                        %Here replace in FeedInput(:,1)== for farmers practice 4,
                        %supplemented 5 and stable 6
                        d=FeedInput(:,1)==6 & FeedInput(:,2)==3;
                    end
                    
                    ForageQuantity=[ForageQuantity;FeedInput(d,3),FeedInput(d,time+3).*COW.CHAR.BW];
                    for i=1:8; %there are 6 feedstuffs (3 grasses and 3 forages), but 8 IDs for quality
                        w=ForageQuantity(:,1)==i;
                        if sum(w)>0
                            DIET.ForageQuantity(i,1)=ForageQuantity(w,2);
                        end
                    end
                    
                    %Re-arranging feed quality matrix
                    [m n]=size(DIETquality);
                    NumberOfFeed=m/11;
                    index=1:11:m;
                    DIET.ForageQuality=[DIETquality(index,1),reshape(DIETquality(:,time+1),11,m/11)'];
                    
                    [COW_NEW,NEW_COW,NbCows,DIET]=LIVSIM(COW,PARAM,LivsimMGMT,BREED,DIET,COWS,NbCows);
                    
                elseif COW.CHAR.DEATH==1
                    [COW_NEW]=cow_dead(COW);
                    count_dead=count_dead+1;
                    age=COW_NEW.CHAR.Age;
                    when=time;
                else
                    COW_NEW=COW;
                end
                
                COWS(cowNr)=COW_NEW;
                [COWS,NEW_COW]=UpdateHerd(COWS,NEW_COW); %modify for Mexican case
                
                output
                [FORAGES,CONCENTRATE]=save_diet(FORAGES,CONCENTRATE,DIET,cowNr,timeNr,outputCOWS);
                
            end
            
            if NbCows>number_of_cows_beforenewcalves
                for cowNr=number_of_cows_beforenewcalves+1:NbCows
                    output
                end
            end
            
        end
    end
    
    load counter.mat counter
    
    [OUTPUT]=save_outputCOWS(outputCOWS);
    
    save settings_run.mat OUTPUT FORAGES CONCENTRATE start counter
    
    keep_settings_1
end
keep_settings_2