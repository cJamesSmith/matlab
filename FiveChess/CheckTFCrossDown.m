function IsThere = CheckTFCrossDown(PinX,PinY,Nodes,ValidMatrix,CheckWho)

% Check Col to search if exist "0xxx0" only for function ThreeFourCross
% Output:  1 if patern is found; 0 if no patern

if IsInRange(PinX-3,PinY+3,Nodes)&&(ValidMatrix(PinX-3,PinY+3)~=-CheckWho)
    if IsInRange(PinX+1,PinY-1,Nodes)&&(ValidMatrix(PinX+1,PinY-1)~=-CheckWho)
        if ValidMatrix(PinX-1,PinY+1)==CheckWho && ValidMatrix(PinX-2,PinY+2)==CheckWho
            IsThere = 1;
            return;
        end
    end
end

if IsInRange(PinX+3,PinY-3,Nodes)&&(ValidMatrix(PinX+3,PinY-3)~=-CheckWho)
    if IsInRange(PinX-1,PinY+1,Nodes)&&(ValidMatrix(PinX-1,PinY+1)~=-CheckWho)
        if ValidMatrix(PinX+1,PinY-1)==CheckWho && ValidMatrix(PinX+2,PinY-2)==CheckWho
            IsThere = 1;
            return;
        end
    end
end

if IsInRange(PinX-4,PinY+4,Nodes)&&(ValidMatrix(PinX-4,PinY+4)~=-CheckWho)
    if IsInRange(PinX+1,PinY-1,Nodes)&&(ValidMatrix(PinX+1,PinY-1)~=-CheckWho)
        if ValidMatrix(PinX-1,PinY+1)==0 && ValidMatrix(PinX-2,PinY+2)==CheckWho && ValidMatrix(PinX-3,PinY+3)==CheckWho
            IsThere = 1;
            return;
        end
        if ValidMatrix(PinX-1,PinY+1)==CheckWho && ValidMatrix(PinX-2,PinY+2)==0 && ValidMatrix(PinX-3,PinY+3)==CheckWho
            IsThere = 1;
            return;
        end
    end
end

if IsInRange(PinX+4,PinY-4,Nodes)&&(ValidMatrix(PinX+4,PinY-4)~=-CheckWho)
    if IsInRange(PinX-1,PinY+1,Nodes)&&(ValidMatrix(PinX-1,PinY+1)~=-CheckWho)
        if ValidMatrix(PinX+1,PinY-1)==0 && ValidMatrix(PinX+2,PinY-2)==CheckWho && ValidMatrix(PinX+3,PinY-3)==CheckWho
            IsThere = 1;
            return;
        end
        if ValidMatrix(PinX+1,PinY-1)==CheckWho && ValidMatrix(PinX+2,PinY-2)==0 && ValidMatrix(PinX+3,PinY-3)==CheckWho
            IsThere = 1;
            return;
        end
    end
end
   
if ~exist('IsThere','var')
    IsThere = 0;
    return;
end

% The End.