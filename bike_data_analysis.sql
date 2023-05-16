-- Data Analysis Step 

-- # of casual and member riders in dataset
-- # of casual = 1,744,331
-- # of members = 2,653,869
SELECT 
	member_casual,
	COUNT(*) AS total_riders
FROM bike_data_combined_clean
GROUP BY member_casual;
    
-- bike types used by riders 
-- Casual = docked, electric, and classic (most used - classic)
-- Member = classic and electric (most used - classic)
SELECT 
	member_casual,
    rideable_type,
    COUNT(*) AS total_rides
FROM bike_data_combined_clean
GROUP BY
	member_casual,
    rideable_type
ORDER BY
	member_casual,
    total_rides DESC;

-- Average ride length by user type 
-- Casual riders have longer ride length 
SELECT 
	member_casual,
    AVG(ride_length_in_minutes) AS avg_ride_length
FROM bike_data_combined_clean
GROUP BY member_casual
ORDER BY avg_ride_length DESC;
    
-- # of total rides per day of week 
-- Top two days for casual is Saturday and Sunday while these are the bottom two days for members
-- Top two days for member is Tuesday and Wednesday while these are the bottom two days for casual
SELECT 
	member_casual,
    day_of_the_week,
    COUNT(*) AS total_rides
FROM bike_data_combined_clean
GROUP BY
	member_casual,
    day_of_the_week
ORDER BY 
	member_casual,
    total_rides DESC;

-- # of total rides for each start time of the day
-- Majority of rides for both casual and annual riders are roughly the same with 1PM - 7/8PM being the most favored time
SELECT 
	member_casual,
    start_time_of_day,
    COUNT(*) AS total_rides
FROM bike_data_combined_clean
GROUP BY
	member_casual,
    start_time_of_day
ORDER BY 
	member_casual,
    total_rides DESC;
    
-- # of total rides per month
-- Majority of rides occur during the summer months for both rider types 
-- Least # of rides occur during the winter months 
SELECT 	
	member_casual,
    month_name,
    COUNT(*) AS total_rides
FROM bike_data_combined_clean
GROUP BY
	member_casual,
    month_name
ORDER BY 
	member_casual,
    total_rides DESC;
    
-- # of total rides per season
-- Most rides occur during Summer and Autumn for both annual and casual riders
SELECT 
	member_casual,
    season_name,
    COUNT(*) AS total_rides
FROM bike_data_combined_clean
GROUP BY
	member_casual,
    season_name
ORDER BY 
	member_casual,
    total_rides DESC;

-- Avg. ride_length per day of week
-- On average, casual riders have a longer ride duration across all days of the week 
SELECT 
	member_casual,
    day_of_the_week,
    AVG(ride_length_in_minutes) AS avg_ride_length
FROM bike_data_combined_clean
GROUP BY
	member_casual,
    day_of_the_week
ORDER BY 
	member_casual,
    avg_ride_length DESC;

-- Avg. ride_length for each start time of day
-- Casual riders ride duration is the longest during 10AM to 2PM
-- Annual riders ride duration is the longest during 4PM to 7PM
SELECT 
	member_casual,
    start_time_of_day,
    AVG(ride_length_in_minutes) AS avg_ride_length
FROM bike_data_combined_clean
GROUP BY
	member_casual,
    start_time_of_day
ORDER BY 
	member_casual,
    avg_ride_length DESC;

-- Avg. ride_length per month
SELECT 
	member_casual,
    month_name,
    AVG(ride_length_in_minutes) AS avg_ride_length
FROM bike_data_combined_clean
GROUP BY
	member_casual,
    month_name
ORDER BY 
	member_casual,
    avg_ride_length DESC;

-- Avg. ride_length per season 
SELECT 
	member_casual,
    season_name,
    AVG(ride_length_in_minutes) AS avg_ride_length
FROM bike_data_combined_clean
GROUP BY
	member_casual,
    season_name
ORDER BY 
	member_casual,
    avg_ride_length DESC;

-- Counts of start stations for each user type 
SELECT 
	member_casual,
    start_station_name,
    COUNT(*) AS total_rides
FROM bike_data_combined_clean
GROUP BY
	member_casual,
    start_station_name
ORDER BY 
	member_casual,
    total_rides DESC;

-- Counts of end stations for each user type 
SELECT 
	member_casual,
    end_station_name,
    COUNT(*) AS total_rides
FROM bike_data_combined_clean
GROUP BY
	member_casual,
    end_station_name
ORDER BY 
	member_casual,
	total_rides DESC;


    


    

	

    

