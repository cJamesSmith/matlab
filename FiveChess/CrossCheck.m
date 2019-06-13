function [CheckResult, TargetPtXi, TargetPtYi, SeryDirection,PtNumber] = CrossCheck(xySery,Nodes,CheckWhat)

%---------------------------------------------------------------
% CheckWhat == 5 means check winner
%           == 4 means check 4 series
%           == 3 means check 3 series
%---------------------------------------------------------------
% Output:  CheckResult == 0  False
%                      == 1  True
%---------------------------------------------------------------
% SeryDirection == +1 means to the right-up direction
%               == -1 means to the right-down direction
%---------------------------------------------------------------


FlagCrossCheckResult = 0;
Flag = 0;
TargetPtXiMatrix = [];
TargetPtYiMatrix = [];
SeryDirectionMatrix = [];
if isempty(xySery)
    xyCheck = [];
    HowMany = 0;
else
    [xySort, xySortIndex] = sort(xySery, 2);
    xyCheck = [xySort(1,:); xySery(2,xySortIndex(1,:))];
    [Dumb,HowMany] = size(xyCheck);
end
for PointCount = 1:HowMany
    PlusPt = 0;
    MinusPt = 0;
    xi = xyCheck(1,PointCount);
    yi = xyCheck(2,PointCount);
    for ii = PointCount:HowMany
        for jj = 1:CheckWhat-1
            if isequal([xi+jj; yi+jj]==xyCheck(:,ii),[1;1])
                PlusPt = PlusPt + 1;
            end
            if isequal([xi+jj; yi-jj]==xyCheck(:,ii),[1;1])
                MinusPt = MinusPt + 1;
            end
        end
    end
    if PlusPt == (CheckWhat-1) || MinusPt == (CheckWhat-1)
        FlagCrossCheckResult = 1;
        if CheckWhat < 5
            if PlusPt == CheckWhat-1
                Flag = Flag + 1;
                TargetPtXiMatrix(Flag) = xi;
                TargetPtYiMatrix(Flag) = yi;
                SeryDirectionMatrix(Flag) = +1;
            end
            if MinusPt == CheckWhat-1
                Flag = Flag + 1;
                TargetPtXiMatrix(Flag) = xi;
                TargetPtYiMatrix(Flag) = yi;
                SeryDirectionMatrix(Flag) = -1;
            end
        else
            % Check if there is 6 sery
            if PlusPt == CheckWhat-1
                CheckPoint = [xi-1, xi+5; yi-1, yi+5];
                SeryDirectionTemp = +1;
            elseif MinusPt == CheckWhat-1
                CheckPoint = [xi-1, xi+5; yi+1, yi-5];
                SeryDirectionTemp = -1;
            end
            for kk = 1:HowMany
                if isequal(((CheckPoint(:,1)==xyCheck(:,kk))),[1;1])||isequal(((CheckPoint(:,2)==xyCheck(:,kk))),[1;1])
                    FlagCrossCheckResult = 0;
                end
            end
            if FlagCrossCheckResult == 1
                Flag = Flag + 1;
                TargetPtXiMatrix(Flag) = xi;
                TargetPtYiMatrix(Flag) = yi;
                SeryDirectionMatrix(Flag) = SeryDirectionTemp;
            end
        end
    end
end
        
if Flag == 0
    CheckResult = 0;
    PtNumber = 0;
    TargetPtXi = 0;
    TargetPtYi = 0;
    SeryDirection = 0;
else
    CheckResult = 1;
    PtNumber = Flag;
    TargetPtXi = TargetPtXiMatrix;
    TargetPtYi = TargetPtYiMatrix;
    SeryDirection = SeryDirectionMatrix;
end

% The End.
