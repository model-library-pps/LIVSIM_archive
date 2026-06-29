%store key outputs of LIVSIM during large multiple simulations

 %milk production (145 soit 12 ans et apres metre 145 à la place de 13)
milk_production_animal1=reshape(outputCOWS(42,1,:),1,145);
k=isnan(milk_production_animal1);
milk_production_animal1(k)=0;
total_milk(counter)=sum(milk_production_animal1);

%body weight
bodyweight_animal1=reshape(outputCOWS(6,1,:),1,145);
k=bodyweight_animal1>0;
subset=bodyweight_animal1(k);
total_BW(counter)=subset(end);

%faeces
[a,b,c]=size(outputCOWS);
faecDM_animal1=reshape(outputCOWS(45,1,:),1,145);
k=isnan(faecDM_animal1);
faecDM_animal1(k)=0;
total_faecDM1(counter)=sum(faecDM_animal1);

if b>1
    faecDM_animal2=reshape(outputCOWS(45,2,:),1,145);
    k=isnan(faecDM_animal2);
    faecDM_animal2(k)=0;
    total_faecDM2(counter)=sum(faecDM_animal2);
else
    total_faecDM2(counter)=0;
end

%  %ages des anx
ages_animal1=reshape(outputCOWS(4,1,:),1,145);
total_age_at_end(counter)=ages_animal1(end);

%intakes
MEint_animal1=reshape(outputCOWS(28,1,:),1,145);
total_MEint(counter)=sum(MEint_animal1);

MPint_animal1=reshape(outputCOWS(29,1,:),1,145);
total_MPint(counter)=sum(MPint_animal1);

DMint_animal1=reshape(outputCOWS(30,1,:),1,145);
total_DMint(counter)=sum(DMint_animal1);

CPint_animal1=reshape(outputCOWS(31,1,:),1,145);
total_CPint(counter)=sum(CPint_animal1);

%age at first calving
Afirstcalv_animal1=reshape(outputCOWS(51,1,:),1,145);
k=find(Afirstcalv_animal1>0);
if numel(k)>0
    first_data=k(1);
    total_Afirstcalv(counter)=Afirstcalv_animal1(first_data);
else
    total_Afirstcalv(counter)=0;
end

nbrecalf_peranimal=reshape(outputCOWS(46,1,:),1,145);
total_nbrecalf(counter)=nbrecalf_peranimal(end);

%only for animals with calves!!
if total_nbrecalf(counter)>0.5
    total_calvinginterval(counter)=(total_age_at_end(counter)-total_Afirstcalv(counter))./total_nbrecalf(counter);
else
    total_calvinginterval(counter)=0;
end
