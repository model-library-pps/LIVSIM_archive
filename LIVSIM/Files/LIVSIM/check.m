%----------------------------check----------------------------------------
% this file checks the validity of interpolations
% Version October 2009 ---Mark van Wijk
%--------------------------------------------------------------------------

function check(variable)
if isnan(variable)
    error('table out of bounds')
end