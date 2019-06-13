% PLOT_CHINA
% map_of_china = plot_china(province, border, city)
% draws the map of China, and returns the route handle.
function map_of_china = plot_china(province, border, city)

global h;
% draws the map of China
plot(province.long, province.lat, 'k');
hold on;
plot(border.long, border.lat, 'k', 'LineWidth', 1.5);

% plot the NaN route, and global the handle
h = plot(nan, nan, 'b-', 'LineWidth', 1.5);
map_of_china = h;

% plot the provincial capital
plot([city(2:end).long], [city(2:end).lat], 'o', 'MarkerSize', 3, ...
    'MarkerEdgeColor', 'g', 'MarkerFaceColor', 'g');
%plot Beijing
plot(city(1).long, city(1).lat, 'p', 'MarkerSize', 5,...
    'MarkerEdgeColor', 'r', 'MarkerFaceColor', 'r');