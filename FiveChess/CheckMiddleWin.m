function [IfCanPut, xi, yi] = CheckMiddleWin(ValidMatrix,Nodes,CheckForWho)

% Function: Check paterns of *0*** and **0** and ***0*
% Input: CheckForWho == -1 mean Computer; +1 means Human
% Notice: Acturally, we can revise the code to make it
%      check for any given patern.
% Output: location of 0 which could be put a buckle
% Notice: only handle style of (***0*) not handle *(***0*) or (***0*)*

PaternOne = [CheckForWho, 0, CheckForWho, CheckForWho, CheckForWho];
PaternTwo = [CheckForWho, CheckForWho, 0, CheckForWho, CheckForWho];
PaternThree = [CheckForWho, CheckForWho, CheckForWho, 0, CheckForWho];
PaternLength = 5;
IfCanPut = 0;

[IsThere, PtnX, PtnY,PtnDirection] = CheckPatern(PaternOne,PaternLength,ValidMatrix,Nodes);
if IsThere
    IfCanPut = 1;
    for ii = 1:length(PtnX)
        if PtnDirection(ii) == -2
            if (IsInRange(PtnX(ii),PtnY(ii)-1,Nodes)&&ValidMatrix(PtnX(ii),PtnY(ii)-1)==CheckForWho)||(IsInRange(PtnX(ii),PtnY(ii)+5,Nodes) && ValidMatrix(PtnX(ii),PtnY(ii)+5)==CheckForWho)
            else
            xi = PtnX(ii);
            yi = PtnY(ii)+1;
            return;
            end
        elseif PtnDirection(ii) == 2
            if (IsInRange(PtnX(ii)-1,PtnY(ii),Nodes)&&ValidMatrix(PtnX(ii)-1,PtnY(ii))==CheckForWho)||(IsInRange(PtnX(ii)+5,PtnY(ii),Nodes) && ValidMatrix(PtnX(ii)+5,PtnY(ii))==CheckForWho)
            else
            xi = PtnX(ii)+1;
            yi = PtnY(ii);
            return;
            end
        elseif PtnDirection(ii) == -1
            if (IsInRange(PtnX(ii)-1,PtnY(ii)+1,Nodes)&&ValidMatrix(PtnX(ii)-1,PtnY(ii)+1)==CheckForWho)||(IsInRange(PtnX(ii)+5,PtnY(ii)-5,Nodes) && ValidMatrix(PtnX(ii)+5,PtnY(ii)-5)==CheckForWho)
            else
            xi = PtnX(ii)+1;
            yi = PtnY(ii)-1;
            return;
            end
        elseif PtnDirection(ii) == +1
            if (IsInRange(PtnX(ii)-1,PtnY(ii)-1,Nodes)&&ValidMatrix(PtnX(ii)-1,PtnY(ii)-1)==CheckForWho)||(IsInRange(PtnX(ii)+5,PtnY(ii)+5,Nodes) && ValidMatrix(PtnX(ii)+5,PtnY(ii)+5)==CheckForWho)
            else
            xi = PtnX(ii)+1;
            yi = PtnY(ii)+1;
            return;
            end
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
            if (IsInRange(PtnX(ii),PtnY(ii)-1,Nodes)&&ValidMatrix(PtnX(ii),PtnY(ii)-1)==CheckForWho)||(IsInRange(PtnX(ii),PtnY(ii)+5,Nodes) && ValidMatrix(PtnX(ii),PtnY(ii)+5)==CheckForWho)
            else
            xi = PtnX(ii);
            yi = PtnY(ii)+2;
            return;
            end
        elseif PtnDirection(ii) == 2
            if (IsInRange(PtnX(ii)-1,PtnY(ii),Nodes)&&ValidMatrix(PtnX(ii)-1,PtnY(ii))==CheckForWho)||(IsInRange(PtnX(ii)+5,PtnY(ii),Nodes) && ValidMatrix(PtnX(ii)+5,PtnY(ii))==CheckForWho)
            else
            xi = PtnX(ii)+2;
            yi = PtnY(ii);
            return;
            end
        elseif PtnDirection(ii) == -1
            if (IsInRange(PtnX(ii)-1,PtnY(ii)+1,Nodes)&&ValidMatrix(PtnX(ii)-1,PtnY(ii)+1)==CheckForWho)||(IsInRange(PtnX(ii)+5,PtnY(ii)-5,Nodes) && ValidMatrix(PtnX(ii)+5,PtnY(ii)-5)==CheckForWho)
            else
            xi = PtnX(ii)+2;
            yi = PtnY(ii)-2;
            return;
            end
        elseif PtnDirection(ii) == +1
            if (IsInRange(PtnX(ii)-1,PtnY(ii)-1,Nodes)&&ValidMatrix(PtnX(ii)-1,PtnY(ii)-1)==CheckForWho)||(IsInRange(PtnX(ii)+5,PtnY(ii)+5,Nodes) && ValidMatrix(PtnX(ii)+5,PtnY(ii)+5)==CheckForWho)
            else
            xi = PtnX(ii)+2;
            yi = PtnY(ii)+2;
            return;
            end
        else
            error('PtnDirection(1) error');
        end
    end
end


[IsThere, PtnX, PtnY,PtnDirection] = CheckPatern(PaternThree,PaternLength,ValidMatrix,Nodes);

if IsThere
    IfCanPut = 1;
    for ii = 1:length(PtnX)
        if PtnDirection(1) == -2
            if (IsInRange(PtnX(ii),PtnY(ii)-1,Nodes)&&ValidMatrix(PtnX(ii),PtnY(ii)-1)==CheckForWho)||(IsInRange(PtnX(ii),PtnY(ii)+5,Nodes) && ValidMatrix(PtnX(ii),PtnY(ii)+5)==CheckForWho)
            else
            xi = PtnX(1);
            yi = PtnY(1)+3;
            return;
            end
        elseif PtnDirection(1) == 2
            if (IsInRange(PtnX(ii)-1,PtnY(ii),Nodes)&&ValidMatrix(PtnX(ii)-1,PtnY(ii))==CheckForWho)||(IsInRange(PtnX(ii)+5,PtnY(ii),Nodes) && ValidMatrix(PtnX(ii)+5,PtnY(ii))==CheckForWho)
            else
            xi = PtnX(1)+3;
            yi = PtnY(1);
            return;
            end
        elseif PtnDirection(1) == -1
            if (IsInRange(PtnX(ii)-1,PtnY(ii)+1,Nodes)&&ValidMatrix(PtnX(ii)-1,PtnY(ii)+1)==CheckForWho)||(IsInRange(PtnX(ii)+5,PtnY(ii)-5,Nodes) && ValidMatrix(PtnX(ii)+5,PtnY(ii)-5)==CheckForWho)
            else
            xi = PtnX(1)+3;
            yi = PtnY(1)-3;
            return;
            end
        elseif PtnDirection(1) == +1
            if (IsInRange(PtnX(ii)-1,PtnY(ii)-1,Nodes)&&ValidMatrix(PtnX(ii)-1,PtnY(ii)-1)==CheckForWho)||(IsInRange(PtnX(ii)+5,PtnY(ii)+5,Nodes) && ValidMatrix(PtnX(ii)+5,PtnY(ii)+5)==CheckForWho)
            else
            xi = PtnX(1)+3;
            yi = PtnY(1)+3;
            return;
            end
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


