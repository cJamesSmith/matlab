% PLOTROUTE
% PLOTROUTE(city, route, current_distance, temperature) plots the route and
% display current temperautre and distance.
function plot_route(city, route, current_distance, temperature)

global h;
cycle = route([1:end, 1]);
% update route
set(h,'Xdata',[city(cycle).long],'Ydata',[city(cycle).lat]);

% display current temperature and total distance
xlabel(sprintf('T = %6.1f\tTotal Distance = %6.1f', ...
                    temperature, current_distance));
drawnow