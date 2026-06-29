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

%Update herd: just born calf is added to the herd to be fed by its dam
%Version May 2009 -- Mariana Rufino

%---------------------------------------------------------------------------

function [COWS,NEW_COW]=UpdateHerd(COWS,NEW_COW)

if isempty(NEW_COW)<0.5
    COWS=[COWS,NEW_COW];
    NEW_COW=[];
end