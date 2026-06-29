%------------------------input----------------------------------------

%Jerome                                                         14-03-2008

%--------------------------------------------------------------------------
function [COWS,BREED,PARAM,LivsimMGMT,DIETquantity,DIETquality,CONCENTRATEquantity,CONCENTRATEquality]=inputLIVSIMsimple

%--------------------------------------PARAM.SYS---------------------------
value = dlmread('input\paramSYS.txt','\t',0,1);
fid = fopen('input\paramSYS.txt');
names = textscan(fid, '%s%*[^\n]');
var=char(names{1});
fclose(fid);
[m,n]=size(value);
for i=1:m
    eval([var(i,:) '=value(i,1:n);']);
end

%--------------------------PARAM.SYS---------------------------------------
PARAM.SYS.YLEN=365;
PARAM.SYS.timestep= PARAM.SYS.factor/PARAM.SYS.YLEN;
PARAM.SYS.SimulationStep=round(PARAM.SYS.YLEN/PARAM.SYS.factor);
PARAM.SYS.Monthstep=PARAM.SYS.YLEN/12/PARAM.SYS.YLEN; 

%--------------------------------------------------------------------------

%--------------------------------------------------------------------------


%--------------------------------------COWS--------------------------------
value = dlmread('input\cows.txt','\t',0,0);
names=textread('input\cowVAR.txt','%s'); % for variable names only
var=char(names);
[m,n]=size(value);
for i=1:n
    for k=1:m
        eval([var(k,:) '=value(k,i);']);
    end
    COWS(i)=COW;
end
PARAM.SYS.NBCOW=n;

%--------------------------------------------------------------------------

%--------------------------------BREED-------------------------------------
%---Friesian
fid = fopen('input\Breed-friesian.txt');
names = textscan(fid, '%s%*[^\n]');
var=char(names{1});
fid = fopen('input\Breed-friesian.txt');
nums = textscan(fid, '%s %s %s %s %s %s %s %s','delimiter',char(9));
value=str2double([nums{2:7}]);
fclose (fid);

[m,n]=size(value);
for i=1:m
    val{i} = value(i,find(~isnan(value(i,1:n)))); % remove empty value
    eval([var(i,:) '=val{i};']);
end
BREED.FRIESIAN.BW=BW;
BREED.FRIESIAN.REPR=REPR;
BREED.FRIESIAN.BW=BW;
BREED.FRIESIAN.MORT=MORT;
BREED.FRIESIAN.LACT=LACT;
BREED.FRIESIAN.AFRC=AFRC;

%---Mashona
fid = fopen('input\Breed-mashona.txt');
names = textscan(fid, '%s%*[^\n]');
var=char(names{1});
fid = fopen('input\Breed-mashona.txt');
nums = textscan(fid, '%s %s %s %s %s %s %s %s %s %s','delimiter',char(9));
value=str2double([nums{2:10}]);
fclose (fid);

[m,n]=size(value);
for i=1:m
    val{i} = value(i,find(~isnan(value(i,1:n)))); % remove empty value
    eval([var(i,:) '=val{i};']);
end
BREED.MASHONA.BW=BW;
BREED.MASHONA.REPR=REPR;
BREED.MASHONA.BW=BW;
BREED.MASHONA.MORT=MORT;
BREED.MASHONA.LACT=LACT;
BREED.MASHONA.AFRC=AFRC;

%---Africander
fid = fopen('input\Breed-africander.txt');
names = textscan(fid, '%s%*[^\n]');
var=char(names{1});
fid = fopen('input\Breed-africander.txt');
nums = textscan(fid, '%s %s %s %s %s %s %s %s %s %s','delimiter',char(9));
value=str2double([nums{2:10}]);
fclose (fid);

[m,n]=size(value);
for i=1:m
    val{i} = value(i,find(~isnan(value(i,1:n)))); % remove empty value
    eval([var(i,:) '=val{i};']);
end
BREED.AFRICANDER.BW=BW;
BREED.AFRICANDER.REPR=REPR;
BREED.AFRICANDER.BW=BW;
BREED.AFRICANDER.MORT=MORT;
BREED.AFRICANDER.LACT=LACT;
BREED.AFRICANDER.AFRC=AFRC;
%---Mere
fid = fopen('input\Breed-mere.txt');
names = textscan(fid, '%s%*[^\n]');
var=char(names{1});
fid = fopen('input\Breed-mere.txt');
nums = textscan(fid, '%s %s %s %s %s %s %s %s %s %s','delimiter',char(9));
value=str2double([nums{2:10}]);
fclose (fid);

[m,n]=size(value);
for i=1:m
    val{i} = value(i,find(~isnan(value(i,1:n)))); % remove empty value
    eval([var(i,:) '=val{i};']);
end
BREED.MERE.BW=BW;
BREED.MERE.REPR=REPR;
BREED.MERE.BW=BW;
BREED.MERE.MORT=MORT;
BREED.MERE.LACT=LACT;
BREED.MERE.AFRC=AFRC;
%--------------------------------------------------------------------------

%--------------------------------------DIET -------------------------------
DIETquality = dlmread('input\DIETquality.txt','\t',1,0);
DIETquantity = dlmread('input\DIETquantity.txt','\t',1,0);

%--------------------------------------------------------------------------

%--------------------------------------CONCENTRATE-------------------------
CONCENTRATEquantity = dlmread('input\CONCENTRATEquantity.txt','\t',1,0);
CONCENTRATEquality= dlmread('input\CONCENTRATEquality.txt','\t',1,0);
%--------------------------------------------------------------------------

%--------------------------------------MANAGEMENT--------------------------
fid = fopen('input\LivsimMGMT.txt');
names = textscan(fid, '%s%*[^\n]');
var=char(names{1});
fid = fopen('input\LivsimMGMT.txt');
nums = textscan(fid, '%s %s %s %s','delimiter',char(9));
value=str2double([nums{2:4}]);
fclose (fid);

[m,n]=size(value);
for i=1:m
    val{i} = value(i,find(~isnan(value(i,1:n)))); % remove empty value
    eval([var(i,:) '=val{i};']);
end
%--------------------------------------------------------------------------
