function [IfCanPut, xi, yi] = ThreeFourCross(ValidMatrix,Nodes,CheckWho)

% function: check three-four crossing patern and give the key position

Patern = [CheckWho, CheckWho, CheckWho, 0];
PaternLength = 4;

[IsThere, PtnX, PtnY,PtnDirection] = CheckPatern(Patern,PaternLength,ValidMatrix,Nodes);
if IsThere
    for ii = 1:length(PtnX)
        Flag = 0;
        if PtnDirection(ii) == -2
            PinX = PtnX(ii);
            PinY = PtnY(ii)+3;
            if (IsInRange(PinX,PinY-4,Nodes)&&ValidMatrix(PinX,PinY-4)==0)||(IsInRange(PinX,PinY+1,Nodes)&&ValidMatrix(PinX,PinY+1)==0)
                Flag = Flag + CheckTFCrossUp(PinX,PinY,Nodes,ValidMatrix,CheckWho);
                Flag = Flag + CheckTFCrossDown(PinX,PinY,Nodes,ValidMatrix,CheckWho);
                Flag = Flag + CheckTFCol(PinX,PinY,Nodes,ValidMatrix,CheckWho);
            end
            if Flag ~= 0
                IfCanPut = 1;
                xi = PinX;
                yi = PinY;
                return;
            end
        elseif PtnDirection(ii) == 2
            PinX = PtnX(ii)+3;
            PinY = PtnY(ii);
            if (IsInRange(PinX-4,PinY,Nodes)&&ValidMatrix(PinX-4,PinY)==0)||(IsInRange(PinX+1,PinY,Nodes)&&ValidMatrix(PinX+1,PinY)==0)
                Flag = Flag + CheckTFCrossUp(PinX,PinY,Nodes,ValidMatrix,CheckWho);
                Flag = Flag + CheckTFCrossDown(PinX,PinY,Nodes,ValidMatrix,CheckWho);
                Flag = Flag + CheckTFRow(PinX,PinY,Nodes,ValidMatrix,CheckWho);
            end
            if Flag ~= 0
                IfCanPut = 1;
                xi = PinX;
                yi = PinY;
                return;
            end
            
        elseif PtnDirection(ii) == -1
            PinX = PtnX(ii)+3;
            PinY = PtnY(ii)-3;
            if (IsInRange(PinX-4,PinY+4,Nodes)&&ValidMatrix(PinX-4,PinY+4)==0)||(IsInRange(PinX+1,PinY-1,Nodes)&&ValidMatrix(PinX+1,PinY-1)==0)
                Flag = Flag + CheckTFCol(PinX,PinY,Nodes,ValidMatrix,CheckWho);
                Flag = Flag + CheckTFRow(PinX,PinY,Nodes,ValidMatrix,CheckWho);
                Flag = Flag + CheckTFCrossUp(PinX,PinY,Nodes,ValidMatrix,CheckWho);
            end
            if Flag ~= 0
                IfCanPut = 1;
                xi = PinX;
                yi = PinY;
                return;
            end
            
        elseif PtnDirection(ii) == +1
            PinX = PtnX(ii)+3;
            PinY = PtnY(ii)+3;
            if (IsInRange(PinX-4,PinY-4,Nodes)&&ValidMatrix(PinX-4,PinY-4)==0)||(IsInRange(PinX+1,PinY+1,Nodes)&&ValidMatrix(PinX+1,PinY+1)==0)
                Flag = Flag + CheckTFCol(PinX,PinY,Nodes,ValidMatrix,CheckWho);
                Flag = Flag + CheckTFRow(PinX,PinY,Nodes,ValidMatrix,CheckWho);
                Flag = Flag + CheckTFCrossDown(PinX,PinY,Nodes,ValidMatrix,CheckWho);
            end
            if Flag ~= 0
                IfCanPut = 1;
                xi = PinX;
                yi = PinY;
                return;
            end
        else
            error('PtnDirection(1) error');
        end
            
    end
end


%--------------------------------------


Patern = [0, CheckWho, CheckWho, CheckWho];
PaternLength = 4;

[IsThere, PtnX, PtnY,PtnDirection] = CheckPatern(Patern,PaternLength,ValidMatrix,Nodes);
if IsThere
    for ii = 1:length(PtnX)
        Flag = 0;
        if PtnDirection(ii) == -2
            PinX = PtnX(ii);
            PinY = PtnY(ii);
            if (IsInRange(PinX,PinY-1,Nodes)&&ValidMatrix(PinX,PinY-1)==0)||(IsInRange(PinX,PinY+4,Nodes)&&ValidMatrix(PinX,PinY+4)==0)
                Flag = Flag + CheckTFCrossUp(PinX,PinY,Nodes,ValidMatrix,CheckWho);
                Flag = Flag + CheckTFCrossDown(PinX,PinY,Nodes,ValidMatrix,CheckWho);
                Flag = Flag + CheckTFCol(PinX,PinY,Nodes,ValidMatrix,CheckWho);
            end
            if Flag ~= 0
                IfCanPut = 1;
                xi = PinX;
                yi = PinY;
                return;
            end
        elseif PtnDirection(ii) == 2
            PinX = PtnX(ii);
            PinY = PtnY(ii);
            if (IsInRange(PinX-1,PinY,Nodes)&&ValidMatrix(PinX-1,PinY)==0)||(IsInRange(PinX+4,PinY,Nodes)&&ValidMatrix(PinX+4,PinY)==0)
                Flag = Flag + CheckTFCrossUp(PinX,PinY,Nodes,ValidMatrix,CheckWho);
                Flag = Flag + CheckTFCrossDown(PinX,PinY,Nodes,ValidMatrix,CheckWho);
                Flag = Flag + CheckTFRow(PinX,PinY,Nodes,ValidMatrix,CheckWho);
            end
            if Flag ~= 0
                IfCanPut = 1;
                xi = PinX;
                yi = PinY;
                return;
            end
            
        elseif PtnDirection(ii) == -1
            PinX = PtnX(ii);
            PinY = PtnY(ii);
            if (IsInRange(PinX-1,PinY+1,Nodes)&&ValidMatrix(PinX-1,PinY+1)==0)||(IsInRange(PinX+4,PinY-4,Nodes)&&ValidMatrix(PinX+4,PinY-4)==0)
                Flag = Flag + CheckTFCol(PinX,PinY,Nodes,ValidMatrix,CheckWho);
                Flag = Flag + CheckTFRow(PinX,PinY,Nodes,ValidMatrix,CheckWho);
                Flag = Flag + CheckTFCrossUp(PinX,PinY,Nodes,ValidMatrix,CheckWho);
            end
            if Flag ~= 0
                IfCanPut = 1;
                xi = PinX;
                yi = PinY;
                return;
            end
            
        elseif PtnDirection(ii) == +1
            PinX = PtnX(ii);
            PinY = PtnY(ii);
            if (IsInRange(PinX-1,PinY-1,Nodes)&&ValidMatrix(PinX-1,PinY-1)==0)||(IsInRange(PinX+4,PinY+4,Nodes)&&ValidMatrix(PinX+4,PinY+4)==0)
                Flag = Flag + CheckTFCol(PinX,PinY,Nodes,ValidMatrix,CheckWho);
                Flag = Flag + CheckTFRow(PinX,PinY,Nodes,ValidMatrix,CheckWho);
                Flag = Flag + CheckTFCrossDown(PinX,PinY,Nodes,ValidMatrix,CheckWho);
            end
            if Flag ~= 0
                IfCanPut = 1;
                xi = PinX;
                yi = PinY;
                return;
            end
        else
            error('PtnDirection(1) error');
        end
            
    end
end

%-------------------------------------------


Patern = [-CheckWho, CheckWho, CheckWho, CheckWho, 0, 0];
PaternLength = 6;

[IsThere, PtnX, PtnY,PtnDirection] = CheckPatern(Patern,PaternLength,ValidMatrix,Nodes);
if IsThere
    for ii = 1:length(PtnX)
        Flag = 0;
        if PtnDirection(ii) == -2
            PinX = PtnX(ii);
            PinY = PtnY(ii)+5;
            if (IsInRange(PinX,PinY+1,Nodes)&&ValidMatrix(PinX,PinY+1)~=CheckWho)||(~IsInRange(PinX,PinY+1,Nodes))
                Flag = Flag + CheckTFCrossUp(PinX,PinY,Nodes,ValidMatrix,CheckWho);
                Flag = Flag + CheckTFCrossDown(PinX,PinY,Nodes,ValidMatrix,CheckWho);
                Flag = Flag + CheckTFCol(PinX,PinY,Nodes,ValidMatrix,CheckWho);
            end
            if Flag ~= 0
                IfCanPut = 1;
                xi = PinX;
                yi = PinY;
                return;
            end
        elseif PtnDirection(ii) == 2
            PinX = PtnX(ii)+5;
            PinY = PtnY(ii);
            if (IsInRange(PinX+1,PinY,Nodes)&&ValidMatrix(PinX+1,PinY)~=CheckWho)||(~IsInRange(PinX+1,PinY,Nodes))
                Flag = Flag + CheckTFCrossUp(PinX,PinY,Nodes,ValidMatrix,CheckWho);
                Flag = Flag + CheckTFCrossDown(PinX,PinY,Nodes,ValidMatrix,CheckWho);
                Flag = Flag + CheckTFRow(PinX,PinY,Nodes,ValidMatrix,CheckWho);
            end
            if Flag ~= 0
                IfCanPut = 1;
                xi = PinX;
                yi = PinY;
                return;
            end
            
        elseif PtnDirection(ii) == -1
            PinX = PtnX(ii)+5;
            PinY = PtnY(ii)-5;
            if (IsInRange(PinX+1,PinY-1,Nodes)&&ValidMatrix(PinX+1,PinY-1)~=CheckWho)||(~IsInRange(PinX+1,PinY-1,Nodes))
                Flag = Flag + CheckTFCol(PinX,PinY,Nodes,ValidMatrix,CheckWho);
                Flag = Flag + CheckTFRow(PinX,PinY,Nodes,ValidMatrix,CheckWho);
                Flag = Flag + CheckTFCrossUp(PinX,PinY,Nodes,ValidMatrix,CheckWho);
            end
            if Flag ~= 0
                IfCanPut = 1;
                xi = PinX;
                yi = PinY;
                return;
            end
            
        elseif PtnDirection(ii) == +1
            PinX = PtnX(ii)+5;
            PinY = PtnY(ii)+5;
            if (IsInRange(PinX+1,PinY+1,Nodes)&&ValidMatrix(PinX+1,PinY+1)~=CheckWho)||(~IsInRange(PinX+1,PinY+1,Nodes))
                Flag = Flag + CheckTFCol(PinX,PinY,Nodes,ValidMatrix,CheckWho);
                Flag = Flag + CheckTFRow(PinX,PinY,Nodes,ValidMatrix,CheckWho);
                Flag = Flag + CheckTFCrossDown(PinX,PinY,Nodes,ValidMatrix,CheckWho);
            end
            if Flag ~= 0
                IfCanPut = 1;
                xi = PinX;
                yi = PinY;
                return;
            end
        else
            error('PtnDirection(1) error');
        end
            
    end
end


%-----------------------------------------------------



Patern = [0, 0, CheckWho, CheckWho, CheckWho, -CheckWho];
PaternLength = 6;
IfCanPut = 0;

[IsThere, PtnX, PtnY,PtnDirection] = CheckPatern(Patern,PaternLength,ValidMatrix,Nodes);
if IsThere
    for ii = 1:length(PtnX)
        Flag = 0;
        if PtnDirection(ii) == -2
            PinX = PtnX(ii);
            PinY = PtnY(ii);
            if (IsInRange(PinX,PinY-1,Nodes)&&ValidMatrix(PinX,PinY-1)~=CheckWho)||(~IsInRange(PinX,PinY-1,Nodes))
                Flag = Flag + CheckTFCrossUp(PinX,PinY,Nodes,ValidMatrix,CheckWho);
                Flag = Flag + CheckTFCrossDown(PinX,PinY,Nodes,ValidMatrix,CheckWho);
                Flag = Flag + CheckTFCol(PinX,PinY,Nodes,ValidMatrix,CheckWho);
            end
            if Flag ~= 0
                IfCanPut = 1;
                xi = PinX;
                yi = PinY;
                return;
            end
        elseif PtnDirection(ii) == 2
            PinX = PtnX(ii);
            PinY = PtnY(ii);
            if (IsInRange(PinX-1,PinY,Nodes)&&ValidMatrix(PinX-1,PinY)~=CheckWho)||(~IsInRange(PinX-1,PinY,Nodes))
                Flag = Flag + CheckTFCrossUp(PinX,PinY,Nodes,ValidMatrix,CheckWho);
                Flag = Flag + CheckTFCrossDown(PinX,PinY,Nodes,ValidMatrix,CheckWho);
                Flag = Flag + CheckTFRow(PinX,PinY,Nodes,ValidMatrix,CheckWho);
            end
            if Flag ~= 0
                IfCanPut = 1;
                xi = PinX;
                yi = PinY;
                return;
            end
            
        elseif PtnDirection(ii) == -1
            PinX = PtnX(ii);
            PinY = PtnY(ii);
            if (IsInRange(PinX-1,PinY+1,Nodes)&&ValidMatrix(PinX-1,PinY+1)~=CheckWho)||(~IsInRange(PinX-1,PinY+1,Nodes))
                Flag = Flag + CheckTFCol(PinX,PinY,Nodes,ValidMatrix,CheckWho);
                Flag = Flag + CheckTFRow(PinX,PinY,Nodes,ValidMatrix,CheckWho);
                Flag = Flag + CheckTFCrossUp(PinX,PinY,Nodes,ValidMatrix,CheckWho);
            end
            if Flag ~= 0
                IfCanPut = 1;
                xi = PinX;
                yi = PinY;
                return;
            end
            
        elseif PtnDirection(ii) == +1
            PinX = PtnX(ii);
            PinY = PtnY(ii);
            if (IsInRange(PinX-1,PinY-1,Nodes)&&ValidMatrix(PinX-1,PinY-1)~=CheckWho)||(~IsInRange(PinX-1,PinY-1,Nodes))
                Flag = Flag + CheckTFCol(PinX,PinY,Nodes,ValidMatrix,CheckWho);
                Flag = Flag + CheckTFRow(PinX,PinY,Nodes,ValidMatrix,CheckWho);
                Flag = Flag + CheckTFCrossDown(PinX,PinY,Nodes,ValidMatrix,CheckWho);
            end
            if Flag ~= 0
                IfCanPut = 1;
                xi = PinX;
                yi = PinY;
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

% The End.


