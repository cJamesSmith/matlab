function [IfCanPut, xi, yi] = CheckLiveThree(xyCompt,Nodes,ValidMatrix)

% Function: Find out any live 3 and return one possible blocking/extending position
% IfCanPut == 0 means no this position;  == 1 means position returned.

CheckWhat = 3;
TipX = [];
TipY = [];
CountPt = 0;

[FlagRowFour, DumbX, DumbY,PtNumber] = RowCheck(xyCompt,Nodes,CheckWhat);
if FlagRowFour == 1
    for ii = 1:PtNumber
        if IsInRange(DumbX(ii),DumbY(ii)-1,Nodes) && ValidMatrix(DumbX(ii),DumbY(ii)-1) == 0
            if IsInRange(DumbX(ii),DumbY(ii)+CheckWhat,Nodes) && ValidMatrix(DumbX(ii),DumbY(ii)+CheckWhat) == 0
                CountPt = CountPt + 1;
                TipX(CountPt) = DumbX(ii);
                TipY(CountPt) = DumbY(ii)-1;
                CountPt = CountPt + 1;
                TipX(CountPt) = DumbX(ii);
                TipY(CountPt) = DumbY(ii)+CheckWhat;
                if IsInRange(DumbX(ii),DumbY(ii)-2,Nodes) && ValidMatrix(DumbX(ii),DumbY(ii)-2) == 0
                    IfCanPut = 1;
                    xi = DumbX(ii);
                    yi = DumbY(ii)-1;
                    return;
                end
                if IsInRange(DumbX(ii),DumbY(ii)+CheckWhat+1,Nodes) && ValidMatrix(DumbX(ii),DumbY(ii)+CheckWhat+1) == 0
                    IfCanPut = 1;
                    xi = DumbX(ii);
                    yi = DumbY(ii)+CheckWhat;
                    return;
                end
            end
        end
    end
end

[FlagColFour, DumbX, DumbY,PtNumber] = ColCheck(xyCompt,Nodes,CheckWhat);
if FlagColFour == 1
    for ii = 1:PtNumber
        if IsInRange(DumbX(ii)-1,DumbY(ii),Nodes) && ValidMatrix(DumbX(ii)-1,DumbY(ii)) == 0
            if IsInRange(DumbX(ii)+CheckWhat,DumbY(ii),Nodes) && ValidMatrix(DumbX(ii)+CheckWhat,DumbY(ii)) == 0
                CountPt = CountPt + 1;
                TipX(CountPt) = DumbX(ii)-1;
                TipY(CountPt) = DumbY(ii);
                CountPt = CountPt + 1;
                TipX(CountPt) = DumbX(ii)+CheckWhat;
                TipY(CountPt) = DumbY(ii);
                if IsInRange(DumbX(ii)-2,DumbY(ii),Nodes) && ValidMatrix(DumbX(ii)-2,DumbY(ii)) == 0
                    IfCanPut = 1;
                    xi = DumbX(ii)-1;
                    yi = DumbY(ii);
                    return;
                end
                if IsInRange(DumbX(ii)+CheckWhat+1,DumbY(ii),Nodes) && ValidMatrix(DumbX(ii)+CheckWhat+1,DumbY(ii)) == 0
                    IfCanPut = 1;
                    xi = DumbX(ii)+CheckWhat;
                    yi = DumbY(ii);
                    return;
                end
            end
        end
    end
end

[FlagCrossFour, DumbX, DumbY, SeryDirection,PtNumber] = CrossCheck(xyCompt,Nodes,CheckWhat);
if FlagCrossFour == 1
    for ii = 1:PtNumber
        if SeryDirection(ii) == +1
            if IsInRange(DumbX(ii)-1,DumbY(ii)-1,Nodes) && ValidMatrix(DumbX(ii)-1,DumbY(ii)-1) == 0
                if IsInRange(DumbX(ii)+CheckWhat,DumbY(ii)+CheckWhat,Nodes) && ValidMatrix(DumbX(ii)+CheckWhat,DumbY(ii)+CheckWhat) == 0
                    CountPt = CountPt + 1;
                    TipX(CountPt) = DumbX(ii) - 1;
                    TipY(CountPt) = DumbY(ii) - 1;
                    CountPt = CountPt + 1;
                    TipX(CountPt) = DumbX(ii) + CheckWhat;
                    TipY(CountPt) = DumbY(ii) + CheckWhat;
                    if IsInRange(DumbX(ii)-2,DumbY(ii)-2,Nodes) && ValidMatrix(DumbX(ii)-2,DumbY(ii)-2) == 0
                        IfCanPut = 1;
                        xi = DumbX(ii)-1;
                        yi = DumbY(ii)-1;
                        return;
                    end
                    if IsInRange(DumbX(ii)+CheckWhat+1,DumbY(ii)+CheckWhat+1,Nodes) && ValidMatrix(DumbX(ii)+CheckWhat+1,DumbY(ii)+CheckWhat+1) == 0
                        IfCanPut = 1;
                        xi = DumbX(ii)+CheckWhat;
                        yi = DumbY(ii)+CheckWhat;
                        return;
                    end
                end
            end
        end
        if SeryDirection(ii) == -1
            if IsInRange(DumbX(ii)-1,DumbY(ii)+1,Nodes) && ValidMatrix(DumbX(ii)-1,DumbY(ii)+1) == 0
                if IsInRange(DumbX(ii)+CheckWhat,DumbY(ii)-CheckWhat,Nodes) && ValidMatrix(DumbX(ii)+CheckWhat,DumbY(ii)-CheckWhat) == 0
                    CountPt = CountPt + 1;
                    TipX(CountPt) = DumbX(ii) - 1;
                    TipY(CountPt) = DumbY(ii) + 1;
                    CountPt = CountPt + 1;
                    TipX(CountPt) = DumbX(ii) + CheckWhat;
                    TipY(CountPt) = DumbY(ii) - CheckWhat;
                    if IsInRange(DumbX(ii)-2,DumbY(ii)+2,Nodes) && ValidMatrix(DumbX(ii)-2,DumbY(ii)+2) == 0
                        IfCanPut = 1;
                        xi = DumbX(ii)-1;
                        yi = DumbY(ii)+1;
                        return;
                    end
                    if IsInRange(DumbX(ii)+CheckWhat+1,DumbY(ii)-CheckWhat-1,Nodes) && ValidMatrix(DumbX(ii)+CheckWhat+1,DumbY(ii)-CheckWhat-1) == 0
                        IfCanPut = 1;
                        xi = DumbX(ii)+CheckWhat;
                        yi = DumbY(ii)-CheckWhat;
                        return;
                    end
                end
            end
        end
    end
end


if CountPt == 0
    IfCanPut = 0;
    xi = -1;
    yi = -1;
else
    IfCanPut = 1;
    TipIndex = randperm(CountPt);
    TipChosen = TipIndex(1); 
    xi = TipX(TipChosen);
    yi = TipY(TipChosen);
end


% The End.



