%---------------------------Update-----------------------------------------
%
%This file updates states variables: age, pregnancy, calving and lact index
%Version updated June 2009 - Mariana Rufino
%--------------------------------------------------------------------------

function [COW,COW_OLD]=Update(COW,PARAM)

%store old values of cows
COW_OLD=COW;
%Update age, gestation, calving interval
if isempty(COW)<1
    COW.CHAR.Age=COW.CHAR.Age + PARAM.SYS.timestep;
    if COW.CHAR.PregInd>0&COW.CHAR.PregInd<=PARAM.REPR.PREGN+PARAM.SYS.timestep
        COW.CHAR.PregInd=COW.CHAR.PregInd+PARAM.SYS.timestep;
        COW.CHAR.ProbaConception=0;
        COW.CHAR.RandNbConception=0;
    end
    if COW.CHAR.CalvInd>0
        COW.CHAR.CalvInd=COW.CHAR.CalvInd+PARAM.SYS.timestep;
        if COW.CHAR.CalvInd>=PARAM.LACT.LACLEN
            COW.OUT.Milk=0;
            COW.NEED.LactME=0;
            COW.NEED.LactMP=0;
            COW.CHAR.LactInd=0;
        else
           COW.CHAR.LactInd=COW.CHAR.LactInd+PARAM.SYS.timestep;
            if COW.CHAR.CalvInd>PARAM.SYS.timestep&COW.CHAR.CalvInd<PARAM.LACT.LACLEN&COW_OLD.OUT.Milk<0.1
                COW.CHAR.LactInd=0;
            end
        end
    end
end

