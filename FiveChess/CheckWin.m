function FlagWin = CheckWin(xySery,Nodes,IfMusic)

% Output: FlagWin == 0 means no winner; == 1 means winner exist
%---------------------------------------------------------------
% CheckWhat == 5 means check winner
%           == 4 means check 4 series
%           == 3 means check 3 series
%---------------------------------------------------------------
CheckWhat = 5; % Check winner

%-- Row Check --
[FlagRowFive, DumbX, DumbY, PtNumber] = RowCheck(xySery,Nodes,CheckWhat);
if FlagRowFive == 1
    XFinal = DumbX(1)*ones(1,5);
    YFinal = DumbY(1):DumbY(1)+4;
    ZFinal = 0.1*ones(1,5);
    if IfMusic
        load('gong','Fs','y');
        sound(0.2*y);
        clear y Fs
    end
    for ii = 1:5
        plot3(XFinal,YFinal,ZFinal,'p','MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',12);
        pause(1/10);
        plot3(XFinal,YFinal,ZFinal,'p','MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',12);
        pause(1/10);
    end
    plot3(XFinal,YFinal,ZFinal,'p','MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',12);
    drawnow;
end
%-- Col Check --
[FlagColFive, DumbX, DumbY, PtNumber] = ColCheck(xySery,Nodes,CheckWhat);
if FlagColFive == 1
    XFinal = DumbX(1):DumbX(1)+4;
    YFinal = DumbY(1)*ones(1,5);
    ZFinal = 0.1*ones(1,5);
    if IfMusic
    load('gong','Fs','y');
    sound(0.2*y);
    clear y Fs
    end
    for ii = 1:5
        plot3(XFinal,YFinal,ZFinal,'p','MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',12);
        pause(1/10);
        plot3(XFinal,YFinal,ZFinal,'p','MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',12);
        pause(1/10)
    end
    plot3(XFinal,YFinal,ZFinal,'p','MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',12);
    drawnow;
end

%-- Row-Col Cross Check --
[FlagCrossFive, DumbX, DumbY, SeryDirection, PtNumber] = CrossCheck(xySery,Nodes,CheckWhat);
if FlagCrossFive == 1 && SeryDirection == +1
    XFinal = DumbX(1):DumbX(1)+4;
    YFinal = DumbY(1):DumbY(1)+4;
    ZFinal = 0.1*ones(1,5);
    if IfMusic
    load('gong','Fs','y');
    sound(0.2*y);
    clear y Fs
    end
    for ii = 1:5
        plot3(XFinal,YFinal,ZFinal,'p','MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',12);
        pause(1/10);
        plot3(XFinal,YFinal,ZFinal,'p','MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',12);
        pause(1/10);
    end
    plot3(XFinal,YFinal,ZFinal,'p','MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',12);
    drawnow;
elseif FlagCrossFive == 1 && SeryDirection == -1
    XFinal = DumbX(1):DumbX(1)+4;
    YFinal = DumbY(1):-1:DumbY(1)-4; % Must add ":-1:" here. Or it will generate an empty matrix.
    ZFinal = 0.1*ones(1,5);
    if IfMusic
    load('gong','Fs','y');
    sound(0.2*y);
    clear y Fs
    end
    for ii = 1:5
        plot3(XFinal,YFinal,ZFinal,'p','MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',12);
        pause(1/10);
        plot3(XFinal,YFinal,ZFinal,'p','MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',12);
        pause(1/10);
    end
    plot3(XFinal,YFinal,ZFinal,'p','MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',12);
    drawnow;
end

%-- Return Check Value --
if FlagRowFive || FlagColFive || FlagCrossFive
    FlagWin = 1;
    return;
else
    FlagWin = 0;
    return;
end

% The End.
    
                        
            
            
            
    
                
