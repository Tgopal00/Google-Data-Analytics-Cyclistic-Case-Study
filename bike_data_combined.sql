-- Combine the 12 month data tables into a single table containing a full year view of data from April 2022 to March 2023 

CREATE TABLE bike_data_combined AS (
	SELECT * FROM bike_data_2022_04
    UNION ALL
    SELECT * FROM bike_data_2022_05
    UNION ALL
    SELECT * FROM bike_data_2022_06
    UNION ALL
    SELECT * FROM bike_data_2022_07
    UNION ALL
    SELECT * FROM bike_data_2022_08
    UNION ALL
    SELECT * FROM bike_data_2022_09
    UNION ALL
    SELECT * FROM bike_data_2022_10
    UNION ALL
    SELECT * FROM bike_data_2022_11
    UNION ALL
    SELECT * FROM bike_data_2022_12
    UNION ALL
    SELECT * FROM bike_data_2023_01
    UNION ALL
    SELECT * FROM bike_data_2023_02
    UNION ALL
    SELECT * FROM bike_data_2023_03
);

-- Total records = 5,803,720
SELECT COUNT(*)
FROM bike_data_combined;





