function [OUTPUT]=save_outputCOWS(outputCOWS)

OUTPUT=[];

OUTPUT=[OUTPUT;
    outputCOWS(2,:,:);      % 1.  ID
    outputCOWS(3,:,:);      % 2.  Sex
    outputCOWS(4,:,:);      % 3.  Age
    outputCOWS(6,:,:);      % 4.  Bw
    outputCOWS(27,:,:);     % 5.  DamID
    outputCOWS(30,:,:);     % 6.  INPUT.DM
    outputCOWS(34,:,:);     % 7.  INPUT.Milk
    outputCOWS(35,:,:);     % 8.  INPUT.ConcentrateDM
    outputCOWS(42,:,:);     % 9.  Milk production
    outputCOWS(45,:,:);     % 10. Faecal dry matter
    outputCOWS(46,:,:);     % 11. Nb. of calves
    outputCOWS(51,:,:);     % 12. Age first calving
    outputCOWS(56,:,:);     % 13. Age last calving
    outputCOWS(13,:,:);     % 14. Death
    ];

