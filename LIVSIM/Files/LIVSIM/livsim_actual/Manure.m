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

%----------------------------Manure production-----------------------------

%Jerome                                                         01-04-2008

%version Ago 2007 ---Mariana Rufino
%--------------------------------------------------------------------------

function [COW]=Manure(COW,FEED)


COW.OUT.FaecDM       =(COW.INPUT.DM*(1-FEED.forages.DMD))+(COW.INPUT.ConcentrateDM*(1-FEED.concentrate.DMD));
Faecal_N_forages     =0.1*FEED.forages.UDProt/6.25+FEED.forages.ADIN/1000*COW.INPUT.DM+0.25*FEED.forages.MCProt/6.25+0.15*FEED.forages.DMTProt/6.25;
Faecal_N_concentrate =0.1*FEED.concentrate.UDProt/6.25+FEED.concentrate.ADIN/1000*COW.INPUT.ConcentrateDM+0.25*FEED.concentrate.MCProt/6.25+0.15*FEED.concentrate.DMTProt/6.25;
COW.OUT.FaecN        =Faecal_N_forages+Faecal_N_concentrate;														



