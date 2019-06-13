% DISTANCE_MATRIX
% dis_mat = distance_matrix(city) return the distance matrix
% dis_mat(a, b) is the distance between city_a and city_b
function dis_mat = distance_matrix(city)

number_of_cities = length(city);
R = 6378.137;
for a = 1:number_of_cities
    for b = a+1:number_of_cities
        dis_mat(a, b) = distance_sphere(city(a).long, ...
            city(a).lat, city(b).long, city(b).lat, R);
        dis_mat(b, a) = dis_mat(a, b);
    end
end

% DISTANCE
% d = DISTANCE(lat1, long1, lat2, long2, R) compute distance between points
% on sphere with radians R.
%
% Latitude/Longitude Distance Calculation:
% http://www.mathforum.com/library/drmath/view/51711.html
function d = distance_sphere(long1, lat1, long2, lat2, R)
 
y1 = lat1/180*pi; x1 = long1/180*pi;
y2 = lat2/180*pi; x2 = long2/180*pi;
dy = y1-y2; dx = x1-x2;
d = 2*R*asin(sqrt(sin(dy/2)^2+sin(dx/2)^2*cos(y1)*cos(y2)));