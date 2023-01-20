/*
	Google Data Analytics Capstone project
    
    PART 3: Cleaning data 
*/

/*STEP 1: remove bad rides for docker/classic bikes
	==>bad rides are those where the is no starting or ending station

NOTE: the following two queries are correct but it takes to long to create the temporary table "cleaned_rides", thus I drop 
bad rides for docked/classic bikes using the WHERE clause
*/

/*
CREATE TEMPORARY TABLE bad_rides
    SELECT ride_id AS bad_ride_id
	FROM (
		SELECT 
			ride_id, rideable_type, start_station_name, start_station_id, end_station_name, end_station_id
		FROM raw_data_2022
	WHERE 
		start_station_name IS NULL AND start_station_id IS  NULL AND
		end_station_name IS  NULL AND end_station_id IS  NULL AND
		rideable_type = 'classic_bike' OR rideable_type = 'docked_bike'
		) AS Bad_rides;
        
CREATE TEMPORARY TABLE cleaned_rides
SELECT 
    *
FROM
    no_nulls n
        LEFT JOIN
    bad_rides bad ON n.ride_id = bad.bad_ride_id
WHERE
    bad.bad_ride_id IS NULL;
*/
    
CREATE TEMPORARY TABLE drop_bad_rides
SELECT 
    *
FROM
    raw_data_2022
WHERE
        ((start_station_name IS NOT NULL AND start_station_id IS  NOT NULL AND
		end_station_name IS  NOT NULL AND end_station_id IS  NOT NULL) AND
        (rideable_type = 'classic_bike' OR rideable_type = 'docked_bike')) OR
        (rideable_type = 'electric_bike');
    
/*STEP 2: drop NULL values in columns. Except for columns "start/end_station_name" that need to be adjusted for electric_bike*/
CREATE TEMPORARY TABLE drop_nulls
SELECT 
    *
FROM
    drop_bad_rides
WHERE
    ride_id IS NOT NULL
        AND rideable_type IS NOT NULL
        AND started_at IS NOT NULL
        AND ended_at IS NOT NULL
        AND start_lng IS NOT NULL
        AND start_lat IS NOT NULL
        AND end_lng IS NOT NULL
        AND end_lat IS NOT NULL
        AND member_casual IS NOT NULL;

    
/*STEP 3: Adjust variables: 
				-set 'docked_bike' as 'classic_bike'
				-when start/end_station_name = NULL (Note: now is only the case where type = electric_bike), set start/end_station_name = "Locked Outside"
				-member_casual is in some cases written as "member\r" ==>keep only first 6 chars with SUBSTR()
*/
CREATE TEMPORARY TABLE adjust_names_spaces
SELECT 
    ride_id,
    REPLACE(rideable_type, "docked_bike", "classic_bike") AS bike_type,
    started_at,
    ended_at,
    IFNULL(start_station_name, 'Locked Outside') AS starting_stat_name,
    IFNULL(end_station_name, 'Locked Outside') AS ending_stat_name,
    start_lng,
    start_lat,
    end_lng,
    end_lat,
    SUBSTR(member_casual, 1,6) AS member_type
FROM
    drop_nulls;

-- Check NULL values 
SELECT 
    bike_type, starting_stat_name, ending_stat_name
FROM
    adjust_names_spaces
WHERE
    starting_stat_name IS NULL
        OR ending_stat_name IS NULL;
        
-- Check length of member_type
SELECT 
    member_type, LENGTH(member_type)
FROM
    adjust_names_spaces
GROUP BY member_type;

/*STEP 4: 
	-compute trip_duration
	-set day of week names
    -extract month 
*/
CREATE TEMPORARY TABLE  data_ride_duration
SELECT 
    *,
    CASE
        WHEN day_of_week2 = 1 THEN 'Sunday'
        WHEN day_of_week2 = 2 THEN 'Monday'
        WHEN day_of_week2 = 3 THEN 'Tuesday'
        WHEN day_of_week2 = 4 THEN 'Wednesday'
        WHEN day_of_week2 = 5 THEN 'Thursday'
        WHEN day_of_week2 = 6 THEN 'Friday'
        ELSE 'Saturday'
    END AS day_of_week
FROM
    (SELECT 								/*This subquery is performed first, thus the variable day_of_week_2 is created and can be manipulated in the main query*/
        *,
            TIMESTAMPDIFF(MINUTE, started_at, ended_at) AS ride_duration,
            DAYOFWEEK(started_at) AS day_of_week2,
            EXTRACT(MONTH FROM started_at) AS month,
            EXTRACT(HOUR FROM started_at) AS hour
    FROM
        adjust_names_spaces) AS Table_1;

/*STEP 5: 
	-drop ride_id != 16chars
    -drop maintanance/test stations
*/
CREATE TABLE cleaned_data_final AS
SELECT 
    *
FROM
    data_ride_duration
WHERE
    LENGTH(ride_id) = 16
        AND ride_duration > 1
        AND ride_duration < 1440
        AND starting_stat_name <> 'DIVVY CASSETTE REPAIR MOBILE STATION'
        AND starting_stat_name <> 'WEST CHI-WATSON'
        AND starting_stat_name <> "Public Rack - Senka ""Edward Duke"" Park"
        AND starting_stat_name <> "Senka ""Edward Duke"" Park"
        AND ending_stat_name NOT LIKE '%test%'
        AND ending_stat_name <> 'DIVVY CASSETTE REPAIR MOBILE STATION'
        AND ending_stat_name <> 'WEST CHI-WATSON'
        AND ending_stat_name <> "Public Rack - Senka ""Edward Duke"" Park"
        AND ending_stat_name <> "Senka ""Edward Duke"" Park"
        AND ending_stat_name NOT LIKE '%test%';


