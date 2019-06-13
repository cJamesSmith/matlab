function [CheckResult, TargetPtXi, TargetPtYi,PtNumber] = RowCheck(xySery,Nodes,CheckWhat)

%---------------------------------------------------------------
% CheckWhat == 5 means check winner
%           == 4 means check 4 series
%           == 3 means check 3 series
%---------------------------------------------------------------
% Output:  CheckResult == 0  False
%                      == 1  True
%---------------------------------------------------------------

FlagRowCheckResult = 0; 
Flag = 0;
TargetPtXiMatrix = [];
TargetPtYiMatrix = [];

for RowCount = 1:Nodes
    if isempty(xySery)
        HowMany = 0;
    else
        HowMany = length(find(xySery(1,:)==RowCount));
    end
    
    if HowMany >= CheckWhat
        FindIndex = find(xySery(1,:)==RowCount);
        FindCol = xySery(2,FindIndex);
        SortCol = sort(FindCol);
        for SortColCount = 1:(HowMany-CheckWhat+1)
            if (SortCol(SortColCount+CheckWhat-1)-SortCol(SortColCount)) == (CheckWhat-1)
                if CheckWhat < 5
                    FlagRowCheckResult = 1;
                else
                    FlagRowCheckResult = 1;
                    CheckPoint = [RowCount, RowCount; SortCol(SortColCount)-1, SortCol(SortColCount)+5];
                    for ii = 1:length(xySery)
                        % Check if there is 6 sery.
                        if isequal(((CheckPoint(:,1)==xySery(:,ii))),[1;1])||isequal(((CheckPoint(:,2)==xySery(:,ii))),[1;1])
                            FlagRowCheckResult = 0;
                        end
                    end
                end
                if FlagRowCheckResult == 1
                    Flag = Flag + 1;
                    TargetPtXiMatrix(Flag) = RowCount;
                    TargetPtYiMatrix(Flag) = SortCol(SortColCount);
                end
            end
        end
    end
end

if Flag == 0
    CheckResult = 0;
    PtNumber = 0;
    TargetPtXi = 0;
    TargetPtYi = 0;
else
    CheckResult = 1;
    PtNumber = Flag;
    TargetPtXi = TargetPtXiMatrix;
    TargetPtYi = TargetPtYiMatrix;
end


% The End.
