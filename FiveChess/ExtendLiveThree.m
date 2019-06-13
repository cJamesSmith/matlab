function [IfCanPut, xi, yi] = ExtendLiveThree(ValidMatrix,Nodes, CheckWho)

% Function: find out where could be extend to Live three and put buckle
%            there
% Check Patern: 0xx00 00xx0

PaternOne = [0, CheckWho, CheckWho, 0, 0];
PaternTwo = [0, 0, CheckWho, CheckWho, 0];
PaternThree = [0, CheckWho, 0, CheckWho, 0];

PaternLength = 5;
IfCanPut = 0;


[IsThere, PtnX, PtnY,PtnDirection] = CheckPatern(PaternOne,PaternLength,ValidMatrix,Nodes);
if IsThere
    IfCanPut = 1;
    for ii = 1:length(PtnX)
        if PtnDirection(ii) == -2
            xi = PtnX(ii);
            yi = PtnY(ii)+3;
            return;
            
        elseif PtnDirection(ii) == 2
            xi = PtnX(ii)+3;
            yi = PtnY(ii);
            return;
            
        elseif PtnDirection(ii) == -1
            xi = PtnX(ii)+3;
            yi = PtnY(ii)-3;
            return;
            
        elseif PtnDirection(ii) == +1
            xi = PtnX(ii)+3;
            yi = PtnY(ii)+3;
            return;
            
        else
            error('PtnDirection(1) error');
        end
    end
end


[IsThere, PtnX, PtnY,PtnDirection] = CheckPatern(PaternTwo,PaternLength,ValidMatrix,Nodes);
if IsThere
    IfCanPut = 1;
    for ii = 1:length(PtnX)
        if PtnDirection(ii) == -2
            xi = PtnX(ii);
            yi = PtnY(ii)+1;
            return;
            
        elseif PtnDirection(ii) == 2
            xi = PtnX(ii)+1;
            yi = PtnY(ii);
            return;
            
        elseif PtnDirection(ii) == -1
            xi = PtnX(ii)+1;
            yi = PtnY(ii)-1;
            return;
            
        elseif PtnDirection(ii) == +1
            xi = PtnX(ii)+1;
            yi = PtnY(ii)+1;
            return;
            
        else
            error('PtnDirection(1) error');
        end
    end
end

[IsThere, PtnX, PtnY,PtnDirection] = CheckPatern(PaternThree,PaternLength,ValidMatrix,Nodes);
if IsThere
    IfCanPut = 1;
    for ii = 1:length(PtnX)
        if PtnDirection(ii) == -2
            xi = PtnX(ii);
            yi = PtnY(ii)+2;
            return;
            
        elseif PtnDirection(ii) == 2
            xi = PtnX(ii)+2;
            yi = PtnY(ii);
            return;
            
        elseif PtnDirection(ii) == -1
            xi = PtnX(ii)+2;
            yi = PtnY(ii)-2;
            return;
            
        elseif PtnDirection(ii) == +1
            xi = PtnX(ii)+2;
            yi = PtnY(ii)+2;
            return;
            
        else
            error('PtnDirection(1) error');
        end
    end
end

if ~exist('xi','var')
    IfCanPut = 0;
    xi = -1;
    yi = -1;
end

