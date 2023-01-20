/*
	Google Data Analytics Capstone project
    
    PART 4: Explorative analsis
*/

/*STEP 1: percentage of Members and Casuals*/
SELECT member_type,
	COUNT(*)  *100  / (
		SELECT COUNT(*) 
		FROM cleaned_data_final
		) AS percentage_by_member_type
	FROM cleaned_data_final
	GROUP BY member_type;
    
/*STEP 2: total rides per: member type, bike type*/
SELECT 
    member_type, bike_type, COUNT(*) AS num_rides
FROM
    cleaned_data_final
GROUP BY member_type, bike_type
ORDER BY member_type, bike_type;

/*STEP 3: Average ride duration per: 
					-day
					-member/day
					-bike/day
*/
SELECT 
    day_of_week, AVG(ride_duration)
FROM
    cleaned_data_final
GROUP BY day_of_week;

-- Member Type
SELECT 
    day_of_week, AVG(ride_duration) AS avg_duration_member
FROM
    cleaned_data_final
WHERE
    member_type = 'member'
GROUP BY day_of_week;

SELECT 
    day_of_week, AVG(ride_duration) AS avg_duration_casual
FROM
    cleaned_data_final
WHERE
    member_type = 'casual'
GROUP BY day_of_week;

-- Bike Type
SELECT 
    day_of_week, AVG(ride_duration) AS avg_duration_electric
FROM
    cleaned_data_final
WHERE
    bike_type = 'electric_bike'
GROUP BY day_of_week;

SELECT 
    day_of_week, AVG(ride_duration) AS avg_duration_classic
FROM
    cleaned_data_final
WHERE
    bike_type = 'classic_bike'
GROUP BY day_of_week;

/*STEP 4: total rides per
					-hour 
					-day
                    -month
                    -start station
                    -end station
*/
-- Hour
SELECT 
    member_type, hour, COUNT(*) AS num_rides_hour
FROM
    cleaned_data_final
GROUP BY member_type , hour
ORDER BY member_type, hour ASC;

-- Day of week
SELECT 
    member_type, day_of_week, COUNT(*) AS num_rides_day
FROM
    cleaned_data_final
GROUP BY member_type , day_of_week
ORDER BY member_type, day_of_week ASC;

-- Month
SELECT 
    member_type, month, COUNT(*) AS num_rides_month
FROM
    cleaned_data_final
GROUP BY member_type , month
ORDER BY member_type, month ASC;

-- Start Station
SELECT 
    member_type, starting_stat_name, COUNT(*) AS num_rides_start_station
FROM
    cleaned_data_final
GROUP BY member_type , starting_stat_name
ORDER BY member_type, starting_stat_name;

-- End Station
SELECT 
    member_type, ending_stat_name, COUNT(*) AS num_rides_end_station
FROM
    cleaned_data_final
GROUP BY member_type , ending_stat_name
ORDER BY member_type, ending_stat_name;

/*STEP 5: adjust latitude and longitude*/
CREATE TEMPORARY TABLE start_lat_long
SELECT 
    starting_stat_name,
    ROUND(AVG(start_lng), 4) AS start_longitude,
    ROUND(AVG(start_lat), 4) AS start_latitude,
    COUNT(*) AS start_num_rides
FROM
    cleaned_data_final
GROUP BY starting_stat_name;

CREATE TEMPORARY TABLE end_lat_long
SELECT 
    ending_stat_name,
    ROUND(AVG(end_lng), 4) AS end_longitude,
    ROUND(AVG(start_lat), 4) AS end_latitude,
    COUNT(*) AS end_num_rides
FROM
    cleaned_data_final
GROUP BY ending_stat_name;


CREATE TABLE  data_for_visualization AS 
SELECT 
    ride_id,
    ride_duration,
    member_type,
    bike_type,
    started_at,
    ended_at,
    cl.starting_stat_name,
    start_longitude,
    start_latitude,
    cl.ending_stat_name,
    end_longitude,
    end_latitude,
    month,
    day_of_week,
    hour
FROM
    cleaned_data_final cl
        LEFT JOIN
    start_lat_long start_lalng ON cl.starting_stat_name = start_lalng.starting_stat_name
        LEFT JOIN
    end_lat_long end_lalng ON cl.ending_stat_name = end_lalng.ending_stat_name
ORDER BY started_at; 

