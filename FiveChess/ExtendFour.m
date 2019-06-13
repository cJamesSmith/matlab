function [IfCanPut, xi, yi] = ExtendFour(ValidMatrix,Nodes,CheckWho)

% Function: Check x000 or x00 0 which could be extend to four but one 
%            tip is blocked

% Check Patern:  xooo0 0ooox xoo0o0 xo0oo0 0o0oox 0oo0ox

PaternOne = [-CheckWho, CheckWho, CheckWho, CheckWho, 0, 0];
PaternTwo = [0, 0, CheckWho, CheckWho, CheckWho, -CheckWho];
PaternThree = [-CheckWho, CheckWho, CheckWho, 0, CheckWho, 0];
PaternFour =  [-CheckWho, CheckWho, 0, CheckWho, CheckWho, 0];
PaternFive =  flipdim(PaternThree,2);
PaternSix  =  flipdim(PaternFour, 2);

PaternLength = 6;
IfCanPut = 0;

[IsThere, PtnX, PtnY,PtnDirection] = CheckPatern(PaternOne,PaternLength,ValidMatrix,Nodes);
if IsThere
    IfCanPut = 1;
    for ii = 1:length(PtnX)
        if PtnDirection(ii) == -2
            xi = PtnX(ii);
            yi = PtnY(ii)+4;
            return;
            
        elseif PtnDirection(ii) == 2
            xi = PtnX(ii)+4;
            yi = PtnY(ii);
            return;
            
        elseif PtnDirection(ii) == -1
            xi = PtnX(ii)+4;
            yi = PtnY(ii)-4;
            return;
            
        elseif PtnDirection(ii) == +1
            xi = PtnX(ii)+4;
            yi = PtnY(ii)+4;
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

[IsThere, PtnX, PtnY,PtnDirection] = CheckPatern(PaternFour,PaternLength,ValidMatrix,Nodes);
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

[IsThere, PtnX, PtnY,PtnDirection] = CheckPatern(PaternFive,PaternLength,ValidMatrix,Nodes);
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

[IsThere, PtnX, PtnY,PtnDirection] = CheckPatern(PaternSix,PaternLength,ValidMatrix,Nodes);
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


if ~exist('xi','var')
    IfCanPut = 0;
    xi = -1;
    yi = -1;
end

% The End.
