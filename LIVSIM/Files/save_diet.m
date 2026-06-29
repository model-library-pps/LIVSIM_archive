function [FORAGES,CONCENTRATE]=save_diet(FORAGES,CONCENTRATE,DIET,cowNr,timeNr,outputCOWS)

forage1  =max(0,DIET.ForageQuantity(1,:)/sum(DIET.ForageQuantity)*outputCOWS(30,cowNr,timeNr));
forage2  =max(0,DIET.ForageQuantity(2,:)/sum(DIET.ForageQuantity)*outputCOWS(30,cowNr,timeNr));
forage3  =max(0,DIET.ForageQuantity(3,:)/sum(DIET.ForageQuantity)*outputCOWS(30,cowNr,timeNr));
pasture1 =max(0,DIET.ForageQuantity(4,:)/sum(DIET.ForageQuantity)*outputCOWS(30,cowNr,timeNr));
pasture2 =max(0,DIET.ForageQuantity(5,:)/sum(DIET.ForageQuantity)*outputCOWS(30,cowNr,timeNr));
pasture3 =max(0,DIET.ForageQuantity(6,:)/sum(DIET.ForageQuantity)*outputCOWS(30,cowNr,timeNr));

if sum(DIET.ConcentrateQuantity)>0
    concentrate1 =max(0,DIET.ConcentrateQuantity(1,:)/sum(DIET.ConcentrateQuantity)*outputCOWS(35,cowNr,timeNr));
    concentrate2 =max(0,DIET.ConcentrateQuantity(2,:)/sum(DIET.ConcentrateQuantity)*outputCOWS(35,cowNr,timeNr));
    concentrate3 =max(0,DIET.ConcentrateQuantity(3,:)/sum(DIET.ConcentrateQuantity)*outputCOWS(35,cowNr,timeNr));
else
    concentrate1=0;
    concentrate2=0;
    concentrate3=0;
end


FORAGES(:,cowNr,timeNr)=[
    forage1
    forage2
    forage3
    pasture1
    pasture2
    pasture3
    ];

CONCENTRATE(:,cowNr,timeNr)=[
    concentrate1
    concentrate2
    concentrate3
    ];