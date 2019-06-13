set(HandleList,'Enable','off');
hold off
IfMusic = 1;
Row = 1:Nodes;
Col = 1:Nodes;
Height = 0.1*ones(Nodes,Nodes);
mesh(Row,Col,Height);
axis square;
axis tight;
view([0, 90]);
hold on;
set(gca,'SortMethod');

if HumanFirst
    FirstSery = xyHuman;
    FirstSide = 1;
    SecondSery = xyCompt(:,2:end);
    SecondSide = -1;
else
    FirstSery = xyCompt;
    FirstSide = -1;
    SecondSery = xyHuman;
    SecondSide = 1;
end

%-- set legend --
if HumanFirst
    plot3(0,0,0,'s','MarkerEdgeColor','k','MarkerFaceColor','g','MarkerSize',10);
    plot3(0,0,0,'o','MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',10);
else
    plot3(0,0,0,'o','MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',10);
    plot3(0,0,0,'s','MarkerEdgeColor','k','MarkerFaceColor','g','MarkerSize',10);
end

[Dumb, LengthF] = size(FirstSery);
[Dumb, LengthS] = size(SecondSery);
StepMax = max(LengthF,LengthS);

for Step = 1:StepMax+1
    if Step <= LengthF
        DrawBuckle(FirstSery(1,Step),FirstSery(2,Step),FirstSide);
    else
        FlagWin = CheckWin(SecondSery,Nodes, IfMusic);
        if FlagWin
            ShowWinner(WhoWin,HumanFirst,fivechessrecord);
            break;
        end
    end
    pause(1.25);    
    if Step <= LengthS
        DrawBuckle(SecondSery(1,Step),SecondSery(2,Step),SecondSide);
    else
        FlagWin = CheckWin(FirstSery,Nodes, IfMusic);
        if FlagWin
            ShowWinner(WhoWin,HumanFirst,fivechessrecord);
            break;
        end
    end
    pause(1.25);
end
set(HandleList,'Enable','on');

clear Row Col Height FirstSery SecondSery FirstSide SecondSide Dumb LengthF LengthS StepMax Step IfMusic;

% The End.