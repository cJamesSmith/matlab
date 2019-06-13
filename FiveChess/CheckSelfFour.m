function [IfCanPut, xi, yi] = CheckSelfFour(xyCompt,Nodes,ValidMatrix,CheckForWho)

%-----------------------------------------------------------------------
% Output: IfCanPut == 0 mean no point to put;  == 1 means point returned
%-----------------------------------------------------------------------
% Function: Find out any live 4 series and block it (CheckEnemyFour)
%        or find out any live 4 series and extend it (CheckSelfFour)
%-----------------------------------------------------------------------
% Input: CheckForWho == -1 means for Computer
%                    == +1 means for Human
%-----------------------------------------------------------------------


CheckWhat = 4;
TipX = [];
TipY = [];
CountPt = 0;
MustPut = 0;

[FlagRowFour, DumbX, DumbY,PtNumber] = RowCheck(xyCompt,Nodes,CheckWhat);
if FlagRowFour == 1
    IfCanPut = 1;
    for ii = 1:PtNumber
        if IsInRange(DumbX(ii),DumbY(ii)-2,Nodes) 
            if ValidMatrix(DumbX(ii),DumbY(ii)-2)~=CheckForWho 
                MustPut = 1;
            end
        else
            MustPut = 1;
        end
        
        if IsInRange(DumbX(ii),DumbY(ii)+5,Nodes) 
            if ValidMatrix(DumbX(ii),DumbY(ii)+5)~=CheckForWho
                if MustPut == 1
                    MustPut = 12; % 0 no; 1 left; 2 right; 12 both
                else
                    MustPut = 2;
                end
            end
        else
            if MustPut == 1
                MustPut = 12; % 0 no; 1 left; 2 right; 12 both
            else
                MustPut = 2;
            end
        end
        if (IsInRange(DumbX(ii),DumbY(ii)-1,Nodes)&&ValidMatrix(DumbX(ii),DumbY(ii)-1)==CheckForWho)||(IsInRange(DumbX(ii),DumbY(ii)+4,Nodes)&&ValidMatrix(DumbX(ii),DumbY(ii)+4)==CheckForWho)
            MustPut = 0;
        end
        
        
        if IsInRange(DumbX(ii),DumbY(ii)-1,Nodes) && ValidMatrix(DumbX(ii),DumbY(ii)-1) == 0 && ( MustPut==1 || MustPut == 12)
            CountPt = CountPt + 1;
            TipX(CountPt) = DumbX(ii);
            TipY(CountPt) = DumbY(ii)-1;
        end
        
        if IsInRange(DumbX(ii),DumbY(ii)+4,Nodes) && ValidMatrix(DumbX(ii),DumbY(ii)+4) == 0 && (MustPut==2 || MustPut==12)
            CountPt = CountPt + 1;
            TipX(CountPt) = DumbX(ii);
            TipY(CountPt) = DumbY(ii)+4;
        end
    end
end

MustPut = 0;

[FlagColFour, DumbX, DumbY,PtNumber] = ColCheck(xyCompt,Nodes,CheckWhat);
if FlagColFour == 1
    IfCanPut = 1;
    for ii = 1:PtNumber
        if IsInRange(DumbX(ii)-2,DumbY(ii),Nodes) 
            if ValidMatrix(DumbX(ii)-2,DumbY(ii))~=CheckForWho 
                MustPut = 1;
            end
        else
            MustPut = 1;
        end
        
        if IsInRange(DumbX(ii)+5,DumbY(ii),Nodes) 
            if ValidMatrix(DumbX(ii)+5,DumbY(ii))~=CheckForWho
                if MustPut == 1
                    MustPut = 12; % 0 no; 1 left; 2 right; 12 both
                else
                    MustPut = 2;
                end
            end
        else
            if MustPut == 1
                MustPut = 12; % 0 no; 1 left; 2 right; 12 both
            else
                MustPut = 2;
            end     
        end
        if (IsInRange(DumbX(ii)-1,DumbY(ii),Nodes)&&ValidMatrix(DumbX(ii)-1,DumbY(ii))==CheckForWho)||(IsInRange(DumbX(ii)+4,DumbY(ii),Nodes)&&ValidMatrix(DumbX(ii)+4,DumbY(ii))==CheckForWho)
            MustPut = 0;
        end
        
        if IsInRange(DumbX(ii)-1,DumbY(ii),Nodes) && ValidMatrix(DumbX(ii)-1,DumbY(ii)) == 0 &&(MustPut==1||MustPut==12)
            CountPt = CountPt + 1;
            TipX(CountPt) = DumbX(ii)-1;
            TipY(CountPt) = DumbY(ii);
        end
        
        if IsInRange(DumbX(ii)+4,DumbY(ii),Nodes) && ValidMatrix(DumbX(ii)+4,DumbY(ii)) == 0 &&(MustPut==2||MustPut==12)
            CountPt = CountPt + 1;
            TipX(CountPt) = DumbX(ii)+4;
            TipY(CountPt) = DumbY(ii);
        end
        
    end
end

MustPut = 0;

[FlagCrossFour, DumbX, DumbY, SeryDirection,PtNumber] = CrossCheck(xyCompt,Nodes,CheckWhat);
if FlagCrossFour == 1
    IfCanPut = 1;
    for ii = 1:PtNumber
        if SeryDirection(ii) == +1
            if IsInRange(DumbX(ii)-2,DumbY(ii)-2,Nodes) 
                if ValidMatrix(DumbX(ii)-2,DumbY(ii)-2)~=CheckForWho 
                    MustPut = 1;
                end
            else
                MustPut = 1;
            end
            
            if IsInRange(DumbX(ii)+5,DumbY(ii)+5,Nodes) 
                if ValidMatrix(DumbX(ii)+5,DumbY(ii)+5)~=CheckForWho
                    if MustPut == 1
                        MustPut = 12; % 0 no; 1 left; 2 right; 12 both
                    else
                        MustPut = 2;
                    end
                end
            else
                if MustPut == 1
                    MustPut = 12; % 0 no; 1 left; 2 right; 12 both
                else
                    MustPut = 2;
                end
            end    
if (IsInRange(DumbX(ii)-1,DumbY(ii)-1,Nodes)&&ValidMatrix(DumbX(ii)-1,DumbY(ii)-1)==CheckForWho)||(IsInRange(DumbX(ii)+4,DumbY(ii)+4,Nodes)&&ValidMatrix(DumbX(ii)+4,DumbY(ii)+4)==CheckForWho)
      MustPut = 0;
end
  
            
            if IsInRange(DumbX(ii)-1,DumbY(ii)-1,Nodes) && ValidMatrix(DumbX(ii)-1,DumbY(ii)-1) == 0 && (MustPut==1||MustPut==12)
                CountPt = CountPt + 1;
                TipX(CountPt) = DumbX(ii)-1;
                TipY(CountPt) = DumbY(ii)-1;
            end
            if IsInRange(DumbX(ii)+4,DumbY(ii)+4,Nodes) && ValidMatrix(DumbX(ii)+4,DumbY(ii)+4) == 0 && (MustPut==2||MustPut==12)
                CountPt = CountPt + 1;
                TipX(CountPt) = DumbX(ii) + 4;
                TipY(CountPt) = DumbY(ii) + 4;
            end
            
        end
        
        MustPut = 0;
        
        if SeryDirection(ii) == -1
            
            if IsInRange(DumbX(ii)-2,DumbY(ii)+2,Nodes) 
                if ValidMatrix(DumbX(ii)-2,DumbY(ii)+2)~=CheckForWho 
                    MustPut = 1;
                end
            else
                MustPut = 1;
            end
            
            if IsInRange(DumbX(ii)+5,DumbY(ii)-5,Nodes) 
                if ValidMatrix(DumbX(ii)+5,DumbY(ii)-5)~=CheckForWho
                    if MustPut == 1
                        MustPut = 12; % 0 no; 1 left; 2 right; 12 both
                    else
                        MustPut = 2;
                    end
                end
            else
                if MustPut == 1
                    MustPut = 12; % 0 no; 1 left; 2 right; 12 both
                else
                    MustPut = 2;
                end
            end    
if (IsInRange(DumbX(ii)-1,DumbY(ii)+1,Nodes)&&ValidMatrix(DumbX(ii)-1,DumbY(ii)+1)==CheckForWho)||(IsInRange(DumbX(ii)+4,DumbY(ii)-4,Nodes)&&ValidMatrix(DumbX(ii)+4,DumbY(ii)-4)==CheckForWho)
      MustPut = 0;
end
            if IsInRange(DumbX(ii)-1,DumbY(ii)+1,Nodes) && ValidMatrix(DumbX(ii)-1,DumbY(ii)+1) == 0 && (MustPut==1||MustPut==12)
                CountPt = CountPt + 1;
                TipX(CountPt) = DumbX(ii)-1;
                TipY(CountPt) = DumbY(ii)+1;
            end
            if IsInRange(DumbX(ii)+4,DumbY(ii)-4,Nodes) && ValidMatrix(DumbX(ii)+4,DumbY(ii)-4) == 0 && (MustPut==2||MustPut==12)
                CountPt = CountPt + 1;
                TipX(CountPt) = DumbX(ii) + 4;
                TipY(CountPt) = DumbY(ii) - 4;
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

    
