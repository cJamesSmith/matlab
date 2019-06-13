function [IfCanPut, xi, yi] = NeighberPut(xySery, ValidMatrix,Nodes)

% function: find a neighber position of xySery and offer it

[Dumb, LastIndex] = size(xySery);

RandPick = randperm(LastIndex);

ii = 0;
TipX = [];
TipY = [];

for SeryPtCount = 1:LastIndex
    
    X = xySery(1,RandPick(SeryPtCount));
    Y = xySery(2,RandPick(SeryPtCount));
    
    if IsInRange(X,Y+1,Nodes) && ValidMatrix(X,Y+1)==0
        ii = ii + 1;
        TipX(ii) = X;
        TipY(ii) = Y+1;
    end
    
    if IsInRange(X,Y-1,Nodes) && ValidMatrix(X,Y-1)==0
        ii = ii + 1;
        TipX(ii) = X;
        TipY(ii) = Y-1;
    end
    
    if IsInRange(X+1,Y,Nodes) && ValidMatrix(X+1,Y)==0
        ii = ii + 1;
        TipX(ii) = X+1;
        TipY(ii) = Y;
    end
    
    if IsInRange(X-1,Y,Nodes) && ValidMatrix(X-1,Y)==0
        ii = ii + 1;
        TipX(ii) = X-1;
        TipY(ii) = Y;
    end
    
    if IsInRange(X-1,Y-1,Nodes) && ValidMatrix(X-1,Y-1)==0
        ii = ii + 1;
        TipX(ii) = X-1;
        TipY(ii) = Y-1;
    end
    
    if IsInRange(X+1,Y-1,Nodes) && ValidMatrix(X+1,Y-1)==0
        ii = ii + 1;
        TipX(ii) = X+1;
        TipY(ii) = Y-1;
    end
    
    if IsInRange(X+1,Y+1,Nodes) && ValidMatrix(X+1,Y+1)==0
        ii = ii + 1;
        TipX(ii) = X+1;
        TipY(ii) = Y+1;
    end
    
    if IsInRange(X-1,Y+1,Nodes) && ValidMatrix(X-1,Y+1)==0
        ii = ii + 1;
        TipX(ii) = X-1;
        TipY(ii) = Y+1;
    end
    
end

%-------------------------


if ii > 0
    RandPick = randperm(ii);
    for jj = 1:ii
        if ValidMatrix(TipX(RandPick(jj)),TipY(RandPick(jj)))==0
            xi = TipX(RandPick(jj));
            yi = TipY(RandPick(jj));
            IfCanPut = 1;
        end
    end
else
    IfCanPut = 0;
    xi = -1;
    yi = -1;
end

if ~exist('xi','var')
    IfCanPut = 0;
    xi = -1;
    yi = -1;
end

% The End.





