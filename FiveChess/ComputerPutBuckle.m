function [xi,yi] = ComputerPutBuckle(DifficultLevel,Nodes,xyHuman,xyCompt,ValidMatrix,TrialControlNum)
switch DifficultLevel
    case 0
        xy= floor(rand(1,2)*Nodes+1);
        xi = xy(1);
        yi = xy(2);
        return;
    case 1
        if isempty(xyCompt)&&isempty(xyHuman)
            xy= floor(rand(1,2)*Nodes+1);
            xi = 13;
            yi = 13;
            return;
        else    
        switch TrialControlNum
            case 1
                % Check Self WinPatern and Fill it
                [IfCanPut, XDumb, YDumb] = CheckMiddleWin(ValidMatrix,Nodes,-1);
                xi = XDumb;
                yi = YDumb;
                return;
            case 2
                % Check Self 4 and Extend it
                [IfCanPut, XDumb, YDumb] = CheckSelfFour(xyCompt,Nodes,ValidMatrix,-1); % -1 Check xyCompt
                xi = XDumb;
                yi = YDumb;
                return;                
            case 3
                % Check Enemy 4 and Block it
                [IfCanPut, XDumb, YDumb] = CheckSelfFour(xyHuman,Nodes,ValidMatrix,+1); % +1 Check xyHuman
                xi = XDumb;
                yi = YDumb;
                return;               
            case 4
                % Check Enemy WinPater and Block it
                [IfCanPut, XDumb, YDumb] = CheckMiddleWin(ValidMatrix,Nodes,+1);
                xi = XDumb;
                yi = YDumb;
                return;                
            case 5               
                % Check Self  0**0*0 pattern
                [IfCanPut, XDumb, YDumb] = CheckHeartFour(ValidMatrix,Nodes,-1);
                xi = XDumb;
                yi = YDumb;
                return;
                
            case 6
                % Check Self Live 3 and Extend it 
                [IfCanPut, XDumb, YDumb] = CheckLiveThree(xyCompt,Nodes,ValidMatrix);
                xi = XDumb;
                yi = YDumb;
                return;                
            case 7
                %------------------------------------------
                %  Check self 3-4 Crossing here
                %------------------------------------------
                [IfCanPut, XDumb, YDumb] = ThreeFourCross(ValidMatrix,Nodes,-1);
                xi = XDumb;
                yi = YDumb;
                return;                
            case 8    
                % Check Enemy 0**0*0 pattern
                [IfCanPut, XDumb, YDumb] = CheckHeartFour(ValidMatrix,Nodes,+1);
                xi = XDumb;
                yi = YDumb;
                return;                 
            case 9
                % Check Enemy Live 3 and Block it
                [IfCanPut, XDumb, YDumb] = CheckLiveThree(xyHuman,Nodes,ValidMatrix);
                xi = XDumb;
                yi = YDumb;
                return;                
            case 10
                [IfCanPut, XDumb, YDumb] = ThreeFourCross(ValidMatrix,Nodes,+1);
                xi = XDumb;
                yi = YDumb;
                return;                
            case 11    
                % Check Self add to 4: **0* or ***0 (Only one tip blocked)
                [IfCanPut, XDumb, YDumb] = ExtendFour(ValidMatrix,Nodes, -1);
                xi = XDumb;
                yi = YDumb;
                return;                                
            case 12
                % Check Self add to 3
                [IfCanPut, XDumb, YDumb] = ExtendLiveThree(ValidMatrix,Nodes, -1);
                xi = XDumb;
                yi = YDumb;
                return;                                
            case 13
                % Check Enemy add to 4
                [IfCanPut, XDumb, YDumb] = ExtendFour(ValidMatrix,Nodes, +1);
                xi = XDumb;
                yi = YDumb;
                return;                
            case 14
                % Check Enemy Probable 3
                [IfCanPut, XDumb, YDumb] = ExtendLiveThree(ValidMatrix,Nodes, +1);
                xi = XDumb;
                yi = YDumb;
                return;                
            case 15
                % Neighber Self put
                [IfCanPut, XDumb, YDumb] = NeighberPut(xyCompt, ValidMatrix, Nodes);
                xi = XDumb;
                yi = YDumb;
                return;                
            case 16
                % Neighber Enemy put
                [IfCanPut, XDumb, YDumb] = NeighberPut(xyHuman, ValidMatrix, Nodes);
                xi = XDumb;
                yi = YDumb;
                return;                
            otherwise
                % Random put
                xy= floor(rand(1,2)*Nodes+1);
                while ValidMatrix(xy(1),xy(2))
                    xy= floor(rand(1,2)*Nodes+1);
                end
                xi = xy(1);
                yi = xy(2);
                return;                
        end
        end
    otherwise
        error('DifficultLevel Error');
end