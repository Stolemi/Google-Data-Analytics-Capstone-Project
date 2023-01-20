/*
	Google Data Analytics Capstone project
    
    PART 2: Explore the raw data 
*/

DESCRIBE raw_data_2022;

/*Total number of observations in the dataset
	==>5'667'720
*/
SELECT 
    COUNT(*)
FROM
    raw_data_2022;

/*Variable: ride_id
		==>all ride_id should be 16 characters long and unique
				-5'667'116 ==>there are 604 duplicates to remove
				-there are 3 NULL entries and multiple ride_id different from 16
*/
SELECT 
    COUNT(DISTINCT ride_id) AS count_unique_ride_id
FROM
    raw_data_2022;
    
SELECT 
    COUNT(*), LENGTH(ride_id) AS tot_chars
FROM
    raw_data_2022
GROUP BY tot_chars;

/*Variable: rideable_type
	==>there are two categories of bikes: electric_bike and classic_bike
			-there are 3 NULL entries and 177474 docked_bike entries to remove
*/
SELECT 
    rideable_type, COUNT(*)
FROM
    raw_data_2022
GROUP BY rideable_type;

/*Variable: start/end_station_name
	==>check for maintanance stations, leading-trailing spaces
			-NULL
			-DIVVY CASSETTE REPAIR MOBILE STATION
            -WEST CHI-WATSON
			-'\"Public Rack - Senka \"\"Edward Duke\"\" Park\"', '1'
			-'\"Senka \"\"Edward Duke\"\" Park\"', '2'

*/
SELECT 
    start_station_name, COUNT(*)
FROM
    raw_data_2022
GROUP BY start_station_name
ORDER BY start_station_name;

SELECT 
    end_station_name, COUNT(*)
FROM
    raw_data_2022
GROUP BY end_station_name
ORDER BY end_station_name;

SELECT 
    start_station_name, end_station_name
FROM
    raw_data_2022
WHERE
     start_station_name LIKE '%test%'
	 OR end_station_name LIKE '%test%';

/*NOTA: electric bikes don't have to be locked in a docking station, while classic/docker they have to. 
				==>for this reason there are many NULL in electric_bike: modify where NULL to "Locked on the street"
				==>remove classic/docker bikes with NULL values 
*/
SELECT 
	rideable_type, count(*) as num_of_rides
FROM raw_data_2022
WHERE start_station_name IS NULL AND start_station_id IS NULL OR
    end_station_name IS NULL AND end_station_id IS NULL 
GROUP BY rideable_type;

/*Variable: member_casual
	==>check for possible extra blank spaces: length = 6
			-there are casual/member with 6 chars and others with 7 char
*/
SELECT 
    member_casual, LENGTH(member_casual) AS length_member_casual
FROM
    raw_data_2022
GROUP BY member_casual;


