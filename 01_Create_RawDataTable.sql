/*
	Google Data Analytics Capstone project
    
    PART 1: create table combining .csv files
*/

/*STEP 0: set local_infile variable ON in order to use LOAD DATA LOCAL INFILE to read .csv*/
SHOW GLOBAL VARIABLES LIKE 'local_infile';
SET GLOBAL local_infile = 'ON';
SHOW GLOBAL VARIABLES LIKE 'local_infile';


/*STEP 1: create table where to load the data from the csv*/
DROP TABLE IF EXISTS raw_data_2022_v2;

CREATE TABLE raw_data_2022_v2
(
ride_id VARCHAR (50) NULL,
rideable_type VARCHAR (50) NULL,
started_at DATETIME NULL,
ended_at DATETIME NULL,
start_station_name VARCHAR (100) NULL,
start_station_id VARCHAR (100) NULL,
end_station_name VARCHAR (100) NULL,
end_station_id VARCHAR (100) NULL,
start_lat FLOAT NULL,
start_lng FLOAT NULL,
end_lat FLOAT NULL,
end_lng FLOAT NULL,
member_casual VARCHAR (50) NULL
);


/*STEP 2: load data from the csv. 
	OSS: set criteria to show "NULL" value for specific variables
*/
LOAD DATA LOCAL INFILE '/Users/emiliano/Desktop/Projects/Google_Certificate/Data/202201-divvy-tripdata.csv'
INTO TABLE raw_data_2022_v2
FIELDS TERMINATED BY ','
-- ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@ride_id, rideable_type, started_at, ended_at, @start_station_name, @start_station_id, @end_station_name, @end_station_id, start_lat, start_lng, @end_lat, @end_lng, member_casual)
SET
-- started_at = DATE_FORMAT(@started_at, "%Y-%m-%d %H:%i-%s"),
ride_id = NULLIF(@ride_id, ''),
start_station_name = NULLIF(@start_station_name,''),
start_station_id = NULLIF(@start_station_id, "" ),
end_station_name = NULLIF(@end_station_name,""),
end_station_id = NULLIF(@end_station_id, ""),
end_lat = NULLIF(@end_lat,0 ),
end_lng = NULLIF(@end_lng,0 );

LOAD DATA LOCAL INFILE '/Users/emiliano/Desktop/Projects/Google_Certificate/Data/202202-divvy-tripdata.csv'
INTO TABLE raw_data_2022_v2
FIELDS TERMINATED BY ','
-- ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@ride_id, rideable_type, started_at, ended_at, @start_station_name, @start_station_id, @end_station_name, @end_station_id, start_lat, start_lng, @end_lat, @end_lng, member_casual)
SET
-- started_at = DATE_FORMAT(@started_at, "%Y-%m-%d %H:%i-%s"),
ride_id = NULLIF(@ride_id, ''),
start_station_name = NULLIF(@start_station_name,''),
start_station_id = NULLIF(@start_station_id, "" ),
end_station_name = NULLIF(@end_station_name,""),
end_station_id = NULLIF(@end_station_id, ""),
end_lat = NULLIF(@end_lat,0 ),
end_lng = NULLIF(@end_lng,0 );

LOAD DATA LOCAL INFILE '/Users/emiliano/Desktop/Projects/Google_Certificate/Data/202203-divvy-tripdata.csv'
INTO TABLE raw_data_2022_v2
FIELDS TERMINATED BY ','
-- ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@ride_id, rideable_type, started_at, ended_at, @start_station_name, @start_station_id, @end_station_name, @end_station_id, start_lat, start_lng, @end_lat, @end_lng, member_casual)
SET
-- started_at = DATE_FORMAT(@started_at, "%Y-%m-%d %H:%i-%s"),
ride_id = NULLIF(@ride_id, ''),
start_station_name = NULLIF(@start_station_name,''),
start_station_id = NULLIF(@start_station_id, "" ),
end_station_name = NULLIF(@end_station_name,""),
end_station_id = NULLIF(@end_station_id, ""),
end_lat = NULLIF(@end_lat,0 ),
end_lng = NULLIF(@end_lng,0 );

LOAD DATA LOCAL INFILE '/Users/emiliano/Desktop/Projects/Google_Certificate/Data/202204-divvy-tripdata.csv'
INTO TABLE raw_data_2022_v2
FIELDS TERMINATED BY ','
-- ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@ride_id, rideable_type, started_at, ended_at, @start_station_name, @start_station_id, @end_station_name, @end_station_id, start_lat, start_lng, @end_lat, @end_lng, member_casual)
SET
-- started_at = DATE_FORMAT(@started_at, "%Y-%m-%d %H:%i-%s"),
ride_id = NULLIF(@ride_id, ''),
start_station_name = NULLIF(@start_station_name,''),
start_station_id = NULLIF(@start_station_id, "" ),
end_station_name = NULLIF(@end_station_name,""),
end_station_id = NULLIF(@end_station_id, ""),
end_lat = NULLIF(@end_lat,0 ),
end_lng = NULLIF(@end_lng,0 );

LOAD DATA LOCAL INFILE '/Users/emiliano/Desktop/Projects/Google_Certificate/Data/202205-divvy-tripdata.csv'
INTO TABLE raw_data_2022_v2
FIELDS TERMINATED BY ','
-- ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@ride_id, rideable_type, started_at, ended_at, @start_station_name, @start_station_id, @end_station_name, @end_station_id, start_lat, start_lng, @end_lat, @end_lng, member_casual)
SET
-- started_at = DATE_FORMAT(@started_at, "%Y-%m-%d %H:%i-%s"),
ride_id = NULLIF(@ride_id, ''),
start_station_name = NULLIF(@start_station_name,''),
start_station_id = NULLIF(@start_station_id, "" ),
end_station_name = NULLIF(@end_station_name,""),
end_station_id = NULLIF(@end_station_id, ""),
end_lat = NULLIF(@end_lat,0 ),
end_lng = NULLIF(@end_lng,0 );

LOAD DATA LOCAL INFILE '/Users/emiliano/Desktop/Projects/Google_Certificate/Data/202206-divvy-tripdata.csv'
INTO TABLE raw_data_2022_v2
FIELDS TERMINATED BY ','
-- ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@ride_id, rideable_type, started_at, ended_at, @start_station_name, @start_station_id, @end_station_name, @end_station_id, start_lat, start_lng, @end_lat, @end_lng, member_casual)
SET
-- started_at = DATE_FORMAT(@started_at, "%Y-%m-%d %H:%i-%s"),
ride_id = NULLIF(@ride_id, ''),
start_station_name = NULLIF(@start_station_name,''),
start_station_id = NULLIF(@start_station_id, "" ),
end_station_name = NULLIF(@end_station_name,""),
end_station_id = NULLIF(@end_station_id, ""),
end_lat = NULLIF(@end_lat,0 ),
end_lng = NULLIF(@end_lng,0 );

LOAD DATA LOCAL INFILE '/Users/emiliano/Desktop/Projects/Google_Certificate/Data/202207-divvy-tripdata.csv'
INTO TABLE raw_data_2022_v2
FIELDS TERMINATED BY ','
-- ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@ride_id, rideable_type, started_at, ended_at, @start_station_name, @start_station_id, @end_station_name, @end_station_id, start_lat, start_lng, @end_lat, @end_lng, member_casual)
SET
-- started_at = DATE_FORMAT(@started_at, "%Y-%m-%d %H:%i-%s"),
ride_id = NULLIF(@ride_id, ''),
start_station_name = NULLIF(@start_station_name,''),
start_station_id = NULLIF(@start_station_id, "" ),
end_station_name = NULLIF(@end_station_name,""),
end_station_id = NULLIF(@end_station_id, ""),
end_lat = NULLIF(@end_lat,0 ),
end_lng = NULLIF(@end_lng,0 );

LOAD DATA LOCAL INFILE '/Users/emiliano/Desktop/Projects/Google_Certificate/Data/202208-divvy-tripdata.csv'
INTO TABLE raw_data_2022_v2
FIELDS TERMINATED BY ','
-- ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@ride_id, rideable_type, started_at, ended_at, @start_station_name, @start_station_id, @end_station_name, @end_station_id, start_lat, start_lng, @end_lat, @end_lng, member_casual)
SET
-- started_at = DATE_FORMAT(@started_at, "%Y-%m-%d %H:%i-%s"),
ride_id = NULLIF(@ride_id, ''),
start_station_name = NULLIF(@start_station_name,''),
start_station_id = NULLIF(@start_station_id, "" ),
end_station_name = NULLIF(@end_station_name,""),
end_station_id = NULLIF(@end_station_id, ""),
end_lat = NULLIF(@end_lat,0 ),
end_lng = NULLIF(@end_lng,0 );

LOAD DATA LOCAL INFILE '/Users/emiliano/Desktop/Projects/Google_Certificate/Data/202209-divvy-tripdata.csv'
INTO TABLE raw_data_2022_v2
FIELDS TERMINATED BY ','
-- ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@ride_id, rideable_type, started_at, ended_at, @start_station_name, @start_station_id, @end_station_name, @end_station_id, start_lat, start_lng, @end_lat, @end_lng, member_casual)
SET
-- started_at = DATE_FORMAT(@started_at, "%Y-%m-%d %H:%i-%s"),
ride_id = NULLIF(@ride_id, ''),
start_station_name = NULLIF(@start_station_name,''),
start_station_id = NULLIF(@start_station_id, "" ),
end_station_name = NULLIF(@end_station_name,""),
end_station_id = NULLIF(@end_station_id, ""),
end_lat = NULLIF(@end_lat,0 ),
end_lng = NULLIF(@end_lng,0 );

LOAD DATA LOCAL INFILE '/Users/emiliano/Desktop/Projects/Google_Certificate/Data/202210-divvy-tripdata.csv'
INTO TABLE raw_data_2022_v2
FIELDS TERMINATED BY ','
-- ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@ride_id, rideable_type, started_at, ended_at, @start_station_name, @start_station_id, @end_station_name, @end_station_id, start_lat, start_lng, @end_lat, @end_lng, member_casual)
SET
-- started_at = DATE_FORMAT(@started_at, "%Y-%m-%d %H:%i-%s"),
ride_id = NULLIF(@ride_id, ''),
start_station_name = NULLIF(@start_station_name,''),
start_station_id = NULLIF(@start_station_id, "" ),
end_station_name = NULLIF(@end_station_name,""),
end_station_id = NULLIF(@end_station_id, ""),
end_lat = NULLIF(@end_lat,0 ),
end_lng = NULLIF(@end_lng,0 );

LOAD DATA LOCAL INFILE '/Users/emiliano/Desktop/Projects/Google_Certificate/Data/202211-divvy-tripdata.csv'
INTO TABLE raw_data_2022_v2
FIELDS TERMINATED BY ','
-- ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@ride_id, rideable_type, started_at, ended_at, @start_station_name, @start_station_id, @end_station_name, @end_station_id, start_lat, start_lng, @end_lat, @end_lng, member_casual)
SET
-- started_at = DATE_FORMAT(@started_at, "%Y-%m-%d %H:%i-%s"),
ride_id = NULLIF(@ride_id, ''),
start_station_name = NULLIF(@start_station_name,''),
start_station_id = NULLIF(@start_station_id, "" ),
end_station_name = NULLIF(@end_station_name,""),
end_station_id = NULLIF(@end_station_id, ""),
end_lat = NULLIF(@end_lat,0 ),
end_lng = NULLIF(@end_lng,0 );

LOAD DATA LOCAL INFILE '/Users/emiliano/Desktop/Projects/Google_Certificate/Data/202212-divvy-tripdata.csv'
INTO TABLE raw_data_2022_v2
FIELDS TERMINATED BY ','
-- ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@ride_id, rideable_type, started_at, ended_at, @start_station_name, @start_station_id, @end_station_name, @end_station_id, start_lat, start_lng, @end_lat, @end_lng, member_casual)
SET
-- started_at = DATE_FORMAT(@started_at, "%Y-%m-%d %H:%i-%s"),
ride_id = NULLIF(@ride_id, ''),
start_station_name = NULLIF(@start_station_name,''),
start_station_id = NULLIF(@start_station_id, "" ),
end_station_name = NULLIF(@end_station_name,""),
end_station_id = NULLIF(@end_station_id, ""),
end_lat = NULLIF(@end_lat,0 ),
end_lng = NULLIF(@end_lng,0 );
