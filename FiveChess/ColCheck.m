function [CheckResult, TargetPtXi, TargetPtYi, PtNumber] = ColCheck(xySery,Nodes,CheckWhat)

%---------------------------------------------------------------
% CheckWhat == 5 means check winner
%           == 4 means check 4 series
%           == 3 means check 3 series
%---------------------------------------------------------------
% Output:  CheckResult == 0  False
%                      == 1  True
%---------------------------------------------------------------
% Revised on Sept. 19, 2003 by LI, Xiang: 
% TargetPt?i change from scale to matrix
% Add PtNumber to store how many points returned
%---------------------------------------------------------------

FlagColCheckResult = 0;
Flag = 0;
TargetPtXiMatrix = [];
TargetPtYiMatrix = [];

for ColCount = 1:Nodes
    if isempty(xySery)
        HowMany = 0;
    else
        HowMany = length(find(xySery(2,:)==ColCount));
    end
    
    if HowMany >= CheckWhat
        FindIndex = find(xySery(2,:)==ColCount);
        FindRow = xySery(1,FindIndex);
        SortRow = sort(FindRow);
        for SortRowCount = 1:(HowMany-CheckWhat+1)
            if (SortRow(SortRowCount+CheckWhat-1)-SortRow(SortRowCount)) == (CheckWhat-1)
                if CheckWhat < 5
                    FlagColCheckResult = 1;
                else
                    FlagColCheckResult = 1;
                    CheckPoint = [SortRow(SortRowCount)-1, SortRow(SortRowCount)+5 ; ColCount, ColCount];
                    for ii = 1:length(xySery)
                        % Check if there is 6 sery
                        if isequal(((CheckPoint(:,1)==xySery(:,ii))),[1;1])||isequal(((CheckPoint(:,2)==xySery(:,ii))),[1;1])
                            FlagColCheckResult = 0;
                        end
                    end
                end
                if FlagColCheckResult == 1
                    Flag = Flag+1;
                    TargetPtXiMatrix(Flag) = SortRow(SortRowCount);
                    TargetPtYiMatrix(Flag) = ColCount;
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