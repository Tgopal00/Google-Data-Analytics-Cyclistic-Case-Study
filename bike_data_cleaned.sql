-- Clean up bike_data_combined table some more 

-- Check for duplicates
-- Total distinct records = 5,803,707 which suggests that duplicate records are present
SELECT COUNT(DISTINCT ride_id) 
FROM bike_data_combined;

-- Determine which ride_id has duplicates 
-- Unsure why ride_id is returned in scientific notation. Does not affect actual ride_id. Come back to fix...
SELECT
	ride_id,
    COUNT(ride_id)
FROM bike_data_combined
GROUP BY ride_id
HAVING COUNT(ride_id) > 1;

-- Checked if duplicate records were exactly the same. No duplicate records found
-- Check-in: Total records = 5,803,720
SELECT *
FROM bike_data_combined
WHERE ride_id IN (
	'1.28E+18',
    '1.74E+13',
    '2.65E+21',
    '2.98E+61',
    '3.58317E+15',
    '5.41E+19',
    '5.63E+14',
    '7.33E+14',
    '7.41E+21',
    '7.71E+14',
    '8.51327E+15',
    '8.95515E+15',
    '9.68806E+15')
ORDER BY ride_id;
    
-- For analysis, we want appropriate ride_length values and to remove records with missing station names 
-- 4,398,200 records
SELECT COUNT(*) 
FROM bike_data_combined
WHERE 
	start_station_name IS NOT NULL AND
    end_station_name IS NOT NULL AND 
    ride_length >= '00:01:00' AND ride_length <= '24:00:00';


-- Create new table with clean data 
CREATE TABLE bike_data_combined_clean AS
	SELECT *
    FROM bike_data_combined
    WHERE
		start_station_name IS NOT NULL AND
		end_station_name IS NOT NULL AND 
		ride_length >= '00:01:00' AND ride_length <= '24:00:00';

-- After cleaning data, new total records = 4,398,200
SELECT COUNT(*)
FROM bike_data_combined_clean;

-- Add a column for the days of the week 
ALTER TABLE bike_data_combined_clean
ADD day_of_the_week VARCHAR(10);
UPDATE bike_data_combined_clean
SET day_of_the_week = DAYNAME(started_at);

-- Add a column for the month name 
ALTER TABLE bike_data_combined_clean
ADD month_name VARCHAR(10);
UPDATE bike_data_combined_clean
SET month_name = MONTHNAME(started_at);

-- Add a column for start_time_of_day to retrieve hour (1 to 12) and AM or PM
ALTER TABLE bike_data_combined_clean
ADD start_time_of_day VARCHAR(10);
UPDATE bike_data_combined_clean
SET start_time_of_day = DATE_FORMAT(started_at, "%l %p");

-- Add a column that has ride_length in minutes 
ALTER TABLE bike_data_combined_clean
ADD ride_length_in_minutes DECIMAL(9,2);
UPDATE bike_data_combined_clean
SET ride_length_in_minutes = (
	EXTRACT(HOUR FROM ride_length) * 60 +
    EXTRACT(MINUTE FROM ride_length) +
    EXTRACT(SECOND FROM ride_length) / 60);
    
-- Add a column for the seasons
ALTER TABLE bike_data_combined_clean
ADD season_name VARCHAR(15);
UPDATE bike_data_combined_clean
SET season_name = CASE month_name
	WHEN 'January' THEN 'Winter'
    WHEN 'February' THEN 'Winter'
    WHEN 'March' THEN 'Spring'
    WHEN 'April' THEN 'Spring'
    WHEN 'May' THEN 'Spring'
    WHEN 'June' THEN 'Summer'
    WHEN 'July' THEN 'Summer'
    WHEN 'August' THEN 'Summer'
    WHEN 'September' THEN 'Autumn'
    WHEN 'October' THEN 'Autumn'
    WHEN 'November' THEN 'Autumn'
    WHEN 'December' THEN 'Winter'
END;

