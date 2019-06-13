function [IsThere, PtnX, PtnY, PtnDirection] = CheckPatern(Patern,PaternLength,ValidMatrix,Nodes)

%--------------------------------------------------
% Function: search one fixed patern on the table
%--------------------------------------------------
% Input: Patern=[]; PaternLength=length(Patern);
%        CheckForWho -1:+1 :: Comp:Human
%--------------------------------------------------
% Output: IsThere  0:1 :: Not Exist : Exist
%         PtnX,PtnY  matrix of start points
%         PtnDirection  if cross, indicate the direction
%                             -1 righ-down; +1 right-up
%                       if row or col, indicate with number
%                             -2 row; +2 col
%--------------------------------------------------
% Example of Patern: [ -1 0 -1 -1 1] PaternLength = 5
%--------------------------------------------------
if length(Patern)~=PaternLength
    error('PaternLength and Patern do not match.');
end

TipX = [];
TipY = [];
TestArea = [];
CountPt = 0;
%-- RowCheck --
for RowNum = 1:Nodes
    for ColNum = 1:(Nodes-PaternLength+1)
        for LoadNum = 1:PaternLength
            TestArea(LoadNum) = ValidMatrix(RowNum,ColNum+LoadNum-1);
        end
        if isequal(TestArea,Patern)
            CountPt = CountPt + 1;
            TipX(CountPt) = RowNum;
            TipY(CountPt) = ColNum;
            TipDirect(CountPt) = -2;
        end
    end
end

%-- ColCheck --
for ColNum = 1:Nodes
    for RowNum = 1:(Nodes-PaternLength+1)
        for LoadNum = 1:PaternLength
            TestArea(LoadNum) = ValidMatrix(RowNum+LoadNum-1,ColNum);
        end
        if isequal(TestArea,Patern)
            CountPt = CountPt + 1;
            TipX(CountPt) = RowNum;
            TipY(CountPt) = ColNum;
            TipDirect(CountPt) = +2;
        end
    end
end

%-- CrossCheck --
  %-- Direct=+1 --
for RowNum = 1:Nodes-PaternLength+1
    for ColNum = 1:Nodes-PaternLength+1
        for LoadNum = 1:PaternLength
            TestArea(LoadNum) = ValidMatrix(RowNum+LoadNum-1,ColNum+LoadNum-1);
        end
        if isequal(TestArea,Patern)
            CountPt = CountPt + 1;
            TipX(CountPt) = RowNum;
            TipY(CountPt) = ColNum;
            TipDirect(CountPt) = +1;
        end
    end
end
  %-- Direction=-1 --
for RowNum = 1:Nodes-PaternLength+1 
    for ColNum = PaternLength:Nodes
        for LoadNum = 1:PaternLength
            TestArea(LoadNum) = ValidMatrix(RowNum+LoadNum-1,ColNum-LoadNum+1);
        end
        if isequal(TestArea,Patern)
            CountPt = CountPt + 1;
            TipX(CountPt) = RowNum;
            TipY(CountPt) = ColNum;
            TipDirect(CountPt) = -1;
        end
    end
end
  
%-- Output --
if CountPt == 0
    IsThere = 0;
    PtnX = 0;
    PtnY = 0;
    PtnDirection = 0;
else
    IsThere = 1;
    PtnX = TipX;
    PtnY = TipY;
    PtnDirection = TipDirect;
end

        
        
        