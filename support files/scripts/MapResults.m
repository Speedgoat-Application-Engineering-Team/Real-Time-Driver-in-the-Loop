%% Load data
% load('GamingEngine_data.mat');
x = data{5}.Values.Data;
y = data{6}.Values.Data;
% ay = data{8};
% xdot_mph = data{9};

%% Set initial location and rotation
lat0 = 42.2995;
lon0 = -83.6988;
h0 = 0;
yaw0 = 0;

%% Transform coordinates
[lat, lon, h] = enu2geodetic(x, -y, 0, lat0, lon0, h0, wgs84Ellipsoid);

%% Create time series data from lat / lon results
lat_ts = data{5};
lat_ts.Name = 'Latitude';
lat_ts.Values.Name = 'Latitude';
lat_ts.Values.Data = lat;

lon_ts = data{5};
lon_ts.Name = 'Longitude';
lon_ts.Values.Name = 'Longitude';
lon_ts.Values.Data = lon;


