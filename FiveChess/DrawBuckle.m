function DrawBuckle(xi,yi,WhichSide)

% Input: /interger/ xi, yi, WhichSide = -1 or +1
% WhichSide: -1 means computer; +1 means Human
delaytime = 1/5;

switch WhichSide
    case -1
        plot3(xi,yi,0.1,'o','MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',15);
        pause(delaytime);
        plot3(xi,yi,0.1,'o','MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',15);
        pause(delaytime);
        plot3(xi,yi,0.1,'o','MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',15);
    case +1
        plot3(xi,yi,0.1,'s','MarkerEdgeColor','k','MarkerFaceColor','g','MarkerSize',15);
        % pause(delaytime);
        % plot3(xi,yi,0.1,'s','MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',15);
        % pause(delaytime);
        % plot3(xi,yi,0.1,'s','MarkerEdgeColor','k','MarkerFaceColor','g','MarkerSize',15);
    otherwise
        error('WhichSide error: Do not know which side is to handle');
end

% The End.

