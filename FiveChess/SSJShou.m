function IsJShou = SSJShou(xi,yi,ValidMatrix,CheckWho,Nodes)

% Function: whether it's a 3-3 forbidden position or not
% Output: 0 means no, 1 means it's a 3-3 forbidden position

if xi>Nodes||xi<=0||yi>Nodes||yi<=0
    IsJShou = 1;
    return;
end

Patern=[0, CheckWho, CheckWho, CheckWho, 0];
PaternLength = 5;
PtNum = 0;
Xs = [];
Ys = [];
if ValidMatrix(xi,yi) == 0
    ValidMatrix(xi,yi) = CheckWho;
else
    IsJShou = 1;
    return;
end

[IsThere, PtnX, PtnY,PtnDirection] = CheckPatern(Patern,PaternLength,ValidMatrix,Nodes);
if IsThere
    for ii = 1:length(PtnX)
        if PtnDirection(ii) == -2
            PtNum = PtNum + 1;
            Xs(PtNum) = PtnX(ii);
            Ys(PtNum) = PtnY(ii)+1;
            PtNum = PtNum + 1;
            Xs(PtNum) = PtnX(ii);
            Ys(PtNum) = PtnY(ii)+2;
            PtNum = PtNum + 1;
            Xs(PtNum) = PtnX(ii);
            Ys(PtNum) = PtnY(ii)+3;
        elseif PtnDirection(ii) == 2
            PtNum = PtNum + 1;
            Xs(PtNum) = PtnX(ii)+1;
            Ys(PtNum) = PtnY(ii);
            PtNum = PtNum + 1;
            Xs(PtNum) = PtnX(ii)+2;
            Ys(PtNum) = PtnY(ii);
            PtNum = PtNum + 1;
            Xs(PtNum) = PtnX(ii)+3;
            Ys(PtNum) = PtnY(ii);

        elseif PtnDirection(ii) == -1
            PtNum = PtNum + 1;
            Xs(PtNum) = PtnX(ii)+1;
            Ys(PtNum) = PtnY(ii)-1;
            PtNum = PtNum + 1;
            Xs(PtNum) = PtnX(ii)+2;
            Ys(PtNum) = PtnY(ii)-2;
            PtNum = PtNum + 1;
            Xs(PtNum) = PtnX(ii)+3;
            Ys(PtNum) = PtnY(ii)-3;

        elseif PtnDirection(ii) == +1
            PtNum = PtNum + 1;
            Xs(PtNum) = PtnX(ii)+1;
            Ys(PtNum) = PtnY(ii)+1;
            PtNum = PtNum + 1;
            Xs(PtNum) = PtnX(ii)+2;
            Ys(PtNum) = PtnY(ii)+2;
            PtNum = PtNum + 1;
            Xs(PtNum) = PtnX(ii)+3;
            Ys(PtNum) = PtnY(ii)+3;

        else
            error('PtnDirection(1) error');
        end
    end
    
    if PtNum > 1
        for jj = 1:PtNum
            for kk = jj+1:PtNum
                if Xs(jj)==Xs(kk)&&Ys(jj)==Ys(kk)
                    IsJShou = 1;
                    return;
                end
            end
        end
    end
end

if ~exist('IsJShou','var')
    IsJShou = 0;
end

% The End.
