function IsThere = CheckTFCol(PinX,PinY,Nodes,ValidMatrix,CheckWho)

% Check Col to search if exist "0xxx0" only for function ThreeFourCross
% Output:  1 if patern is found; 0 if no patern

if IsInRange(PinX-3,PinY,Nodes)&&(ValidMatrix(PinX-3,PinY)~=-CheckWho)
    if IsInRange(PinX+1,PinY,Nodes)&&(ValidMatrix(PinX+1,PinY)~=-CheckWho)
        if ValidMatrix(PinX-1,PinY)==CheckWho && ValidMatrix(PinX-2,PinY)==CheckWho
            IsThere = 1;
            return;
        end
    end
end

if IsInRange(PinX+3,PinY,Nodes)&&(ValidMatrix(PinX+3,PinY)~=-CheckWho)
    if IsInRange(PinX-1,PinY,Nodes)&&(ValidMatrix(PinX-1,PinY)~=-CheckWho)
        if ValidMatrix(PinX+1,PinY)==CheckWho && ValidMatrix(PinX+2,PinY)==CheckWho
            IsThere = 1;
            return;
        end
    end
end

if IsInRange(PinX-4,PinY,Nodes)&&(ValidMatrix(PinX-4,PinY)~=-CheckWho)
    if IsInRange(PinX+1,PinY,Nodes)&&(ValidMatrix(PinX+1,PinY)~=-CheckWho)
        if ValidMatrix(PinX-1,PinY)==0 && ValidMatrix(PinX-2,PinY)==CheckWho && ValidMatrix(PinX-3,PinY)==CheckWho
            IsThere = 1;
            return;
        end
        if ValidMatrix(PinX-1,PinY)==CheckWho && ValidMatrix(PinX-2,PinY)==0 && ValidMatrix(PinX-3,PinY)==CheckWho
            IsThere = 1;
            return;
        end
    end
end

if IsInRange(PinX+4,PinY,Nodes)&&(ValidMatrix(PinX+4,PinY)~=-CheckWho)
    if IsInRange(PinX-1,PinY,Nodes)&&(ValidMatrix(PinX-1,PinY)~=-CheckWho)
        if ValidMatrix(PinX+1,PinY)==0 && ValidMatrix(PinX+2,PinY)==CheckWho && ValidMatrix(PinX+3,PinY)==CheckWho
            IsThere = 1;
            return;
        end
        if ValidMatrix(PinX+1,PinY)==CheckWho && ValidMatrix(PinX+2,PinY)==0 && ValidMatrix(PinX+3,PinY)==CheckWho
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
