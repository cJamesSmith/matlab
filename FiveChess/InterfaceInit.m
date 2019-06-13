function HandleList = InterfaceInit(Nodes)
Row = 1:Nodes;
Col = 1:Nodes;
Height = 0.1*ones(Nodes,Nodes);
load INFO;
KeyValue = VersionInfor(end);
Translate = VersionInfor(1:end-1);
VersionInformation = Translate+KeyValue;
figNumber=figure( ...
        'Name','Five Chess', ...
        'NumberTitle','off', ...
        'Visible','off');
        axes( ...
        'Units','normalized', ...
        'Position',[0.05 0.05 0.75 0.90], ...
        'Visible','off');
% Information for all buttons
    xPos=0.85;
    btnLen=0.10;
    btnWid=0.10;
% Spacing between the button and the next command's label
    spacing=0.05;
    % The CONSOLE frame
    frmBorder=0.02;
    yPos=0.05-frmBorder;
    frmPos=[xPos-frmBorder yPos btnLen+2*frmBorder 0.9+2*frmBorder];
    h=uicontrol( ...
        'Style','frame', ...
        'Units','normalized', ...
        'Position',frmPos, ...
        'BackgroundColor',[0.50 0.50 0.50]);
    % Set up the UserGuide
    btnNumber=1;
    yPos=0.90-(btnNumber-1)*(btnWid+spacing)-0.1;
    txtPos=[xPos-0.015 yPos-spacing btnLen+0.03 (btnWid+0.1)*5/6];
    txtHndl=uicontrol( ...
        'Style','edit', ...
        'HorizontalAlignment','left', ...
        'Units','normalized', ...
        'Max',10, ...
        'BackgroundColor',[0.50 0.50 0.50], ...
        'Position',txtPos, ...
        'Enable','inactive',...
        'Callback','makevase(''eval'')', ...
        'String','');
    % Save this handle for future use
    set(gcf,'UserData',txtHndl);
    set(txtHndl,'String','In case you would stop this round, please press ENTER');
    set(txtHndl,'FontSize',8.0);
    set(txtHndl,'FontWeight','light');
    set(txtHndl,'FontAngle','normal');
    % Set up the Version infor
    btnNumber=1;
    VersionInfor = setstr(VersionInformation);
    yPos=0.90-(btnNumber-1)*(btnWid+spacing)-0.1-1.5*(btnWid+0.1);
    txtPos=[xPos-0.015 yPos-spacing btnLen+0.03 btnWid+0.1];
    txtHndl=uicontrol( ...
        'Style','edit', ...
        'HorizontalAlignment','left', ...
        'Units','normalized', ...
        'Max',10, ...
        'BackgroundColor',[0.5 0.5 0.5], ...
        'Position',txtPos, ...
        'Enable','inactive',...
        'Callback','makevase(''eval'')', ...
        'String','');
    % Save this handle for future use
    set(gcf,'UserData',txtHndl);
    set(txtHndl,'String',VersionInfor);
    set(txtHndl,'FontSize',8.0);
    set(txtHndl,'FontWeight','bold');
    % The START button
    labelStr='Start';
    cmdStr='start';
    callbackStr='FiveChess;';
    btnPos=[xPos 0.31 btnLen btnWid];
    startHndl=uicontrol( ...
        'Style','pushbutton', ...
        'Units','normalized', ...
        'Position',btnPos, ...
        'String',labelStr, ...
        'Interruptible','on', ...
        'Callback',callbackStr);
    % The Replay button
    labelStr='Replay';
    cmdStr='Replay';
    callbackStr='Replay;';
    % Generic popup button information
    btnPos=[xPos 0.18 btnLen btnWid];
    replayHndl=uicontrol( ...
        'Style','pushbutton', ...
        'Units','normalized', ...
        'Position',btnPos, ...
        'String',labelStr, ...
        'Interruptible','on', ...
        'Callback',callbackStr);
    % The Close button
labelStr='Close';
    callbackStr='close(gcf)';
    closeHndl=uicontrol( ...
        'Style','push', ...
        'Units','normalized', ...
        'Position',[xPos 0.05 btnLen 0.10], ...
        'String',labelStr, ...
        'Callback',callbackStr);
 hndlList=[startHndl replayHndl closeHndl];
    set(figNumber, ...
        'Visible','on', ...
        'UserData',hndlList);
   set([startHndl replayHndl closeHndl],'Enable','off');
   set(gcf,'Position',[0 0 1000 800]);
   figure(figNumber);
hold on;
mesh(Row,Col,Height,'FaceColor','k','EdgeColor','w');
axis square;
axis tight;
view([0, 90]);
hold on;
set(gca,'SortMethod');
HandleList = hndlList;
return;