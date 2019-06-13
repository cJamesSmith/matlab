disp('FiveChess is going to active. Matlab Workspace will be cleared for it.');
clear;
close all;
disp('FiveChess is running. Waiting for results...');
%-- Load Record --
load fivechessrecord.txt


%-- Parameter Setting --
Nodes = 25; % Nodes must > 5
DifficultLevel = 1; % Set a value of 0 or 1
HumanFirst = floor(rand*2); % Randomly set: 1 Human First; 0 Computer first.
IfMusic = 1;  % 1 == play music after win; 0 == keep silent after win.

%-- Init Figure --
HandleList = InterfaceInit(Nodes);

%-- Init Value --
rand('state',sum(100*clock));
xyHuman = [];
xyCompt = [];
xyIndex = 0;
FlagWin = 0; % if there is a winner
WhoWin = 0; % -1 == Computer win ;  +1 == Human win
ValidMatrix = zeros(Nodes);
%-- set legend --


if HumanFirst
    plot3(0,0,0,'o','MarkerEdgeColor','k','MarkerFaceColor','g','MarkerSize',15);
    plot3(0,0,0,'o','MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',15);
else
    plot3(0,0,0,'o','MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',15);
    plot3(0,0,0,'o','MarkerEdgeColor','k','MarkerFaceColor','g','MarkerSize',15);
end

%-- if Human First --
if HumanFirst
    xyIndex = xyIndex + 1;
    StopPut = 1;
    while StopPut == 1
        [xi, yi] = humaninput(1);
        if isempty(xi)||~exist('xi','var')
            disp('FiveChess is terminated by Human');
            set(HandleList,'Enable','on');
            ShowRecord('Title','Notice','String','FiveChess is terminated by Human');
            return;
        end
        xi = round(xi);
        yi = round(yi);
        if xi>Nodes||xi<=0||yi>Nodes||yi<=0
            StopPut = 1;
        else
            StopPut = 0;
        end
    end
    xyHuman(:, xyIndex) = [xi; yi];
    ValidMatrix(xi,yi) = +1;
    DrawBuckle(xi,yi,+1);  %Draw my chess in figure
    drawnow;
end


%-- Major Loop --
while FlagWin == 0
    xyIndex = xyIndex+1;
    StopPut = 1;
    TrialControlNum = 0;
    while StopPut == 1
        TrialControlNum = TrialControlNum + 1;
        [xi,yi] = ComputerPutBuckle(DifficultLevel,Nodes,xyHuman,xyCompt,ValidMatrix,TrialControlNum);
        if xi<=Nodes&&xi>0&&yi<=Nodes&&yi>0
            StopPut = abs(ValidMatrix(xi,yi));
        else
            StopPut = 1;
        end
        if SSJShou(xi,yi,ValidMatrix,-1,Nodes)
            StopPut = 1;
        end
    end
    xyCompt(:,xyIndex) = [xi; yi];
    ValidMatrix(xi,yi)= -1;
    DrawBuckle(xi,yi,-1);
    FlagWin = CheckWin(xyCompt,Nodes,IfMusic); %Check if Computer win
    if FlagWin
        WhoWin = -1;
    else
        StopPut = 1;
        while StopPut == 1
            [xi, yi] = humaninput(1);
            if isempty(xi)||~exist('xi','var')
                disp('FiveChess is terminated by Human');
                set(HandleList,'Enable','on');
                ShowRecord('Title','Notice','String','FiveChess is terminated by Human');
                return;
            end
            xi = round(xi);
            yi = round(yi);
            if xi<=Nodes&&xi>0&&yi<=Nodes&&yi>0
                StopPut = abs(ValidMatrix(xi,yi));
            else
                StopPut = 1;
            end
            if SSJShou(xi,yi,ValidMatrix,+1,Nodes)
                StopPut = 1;
                disp('3-3 Cross is forbidden by rule');
                ShowRecord('Title','Notice','String','Sorry.   3-3 Cross is forbidden by rule.   You cannot put your buckle here.');
            end
            if StopPut == 1
                disp('you cannot put your buckle here.');
            end
        end
        xyHuman(:, xyIndex) = [xi; yi];
        ValidMatrix(xi,yi) = +1;
        DrawBuckle(xi,yi,+1);  %Draw my chess in figure
        drawnow;
        FlagWin = CheckWin(xyHuman,Nodes,IfMusic);  %Check if Human win
        if FlagWin
            WhoWin = +1;
        end
    end
end


%-- Save Record --
RecordSize = length(fivechessrecord);
fivechessrecord(RecordSize+1) = WhoWin;
save FiveChessRecord.txt fivechessrecord -ASCII -TABS

%-- Enable Buttons --
set(HandleList,'Enable','on');

%-- Show Results --
ShowWinner(WhoWin,HumanFirst,fivechessrecord);

% The End.
