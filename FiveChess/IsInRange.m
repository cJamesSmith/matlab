function FlagIsInRange = IsInRange(xi,yi,Nodes)

% Output: FlagIsInRange == 1 means (xi,yi) is in range
%                       == 0 means (xi,yi) exceed the range

if xi>0 && xi<=Nodes && yi>0 && yi<=Nodes
    FlagIsInRange = 1;
    return;
else
    FlagIsInRange = 0;
    return;
end
% The End.

