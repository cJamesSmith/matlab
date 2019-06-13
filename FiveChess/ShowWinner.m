function ShowWinner(WhoWin,HumanFirst,fivechessrecord)

% Input: WhoWin == -1 means computer wins; +1 means human wins

switch WhoWin
    case -1
        disp('Computer Wins!');
        if HumanFirst
            legend('You fool!','Computer is the Winner!','Location','northwest');
        else
            legend('Computer is the Winner!','You fool!','Location','northwest');
        end
    case +1
        disp('Human Wins!');
        if HumanFirst
            legend('You are the Winner!','Computer fool!','Location','northwest');
        else
            legend('Computer fool!','You are the Winner!','Location','northwest');
        end
    otherwise
        error('WhoWin error. No winner.');
end

RecordSize = length(fivechessrecord);
ComptWinRecord = RecordSize-nnz(fivechessrecord+1);
HumanWinRecord = RecordSize-nnz(fivechessrecord-1);
HumanWinRate = HumanWinRecord/(HumanWinRecord+ComptWinRecord)*100; % 100%
CIV = 2*sqrt(HumanWinRate*(100-HumanWinRate))/sqrt(HumanWinRecord+ComptWinRecord);
LowShrp = HumanWinRate-CIV;
HighShrp = HumanWinRate+CIV;
if LowShrp<0
    LowShrp = 0;
end
if HighShrp > 100
    HighShrp = 100;
end
disp(['Record shows you win  ', int2str(HumanWinRecord),'  times while Computer wins  ',int2str(ComptWinRecord),'  times.']);
disp(['The Probability that you win next round is ', int2str(LowShrp),'% to ',int2str(HighShrp),'% ']);


ShowRecord('Title','Record','String',['Do you know?   ', 'Record shows you win  ', int2str(HumanWinRecord),' times while Computer wins  ',int2str(ComptWinRecord),' times.  ', ...
    'The Probability that you win next round is  ', int2str(LowShrp),'%  to  ',int2str(HighShrp),'% ' ]);
% The End.
