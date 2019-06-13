function [IfCanPut, xi, yi] = CheckHeartFour(ValidMatrix,Nodes,CheckWho)

% Function: Check patern of **0* or *0** with two tips free

PaternOne = [0, CheckWho, CheckWho, 0, CheckWho, 0];
PaternTwo = [0, CheckWho, 0, CheckWho, CheckWho, 0];

PaternLength = 6;
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

% The End.
