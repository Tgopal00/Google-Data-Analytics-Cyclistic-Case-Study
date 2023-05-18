# Google Data Analytics Capstone Project: Cyclistic Case Study 
This optional capstone project is from the final course of the [Google Data Analytics Professional Certificate](https://www.coursera.org/professional-certificates/google-data-analytics) on Coursera. 

## INTRODUCTION
For this case study, I have been asked to perform many real-world tasks of a junior data analyst working in the marketing analyst team at a fictional company, Cyclistic. In order to answer the key business questions, I will follow the steps of the data analysis process: [**ask**](https://github.com/Tgopal00/Google-Data-Analytics-Cyclistic-Case-Study#step-1-ask), [**prepare**](https://github.com/Tgopal00/Google-Data-Analytics-Cyclistic-Case-Study#step-2-prepare), [**process**](https://github.com/Tgopal00/Google-Data-Analytics-Cyclistic-Case-Study#step-3-process), **analyze**, **share**, and **act**.

## STEP 1: ASK
### How Does a Bike-Share Navigate Speedy Success?
### 1a. Background
Cyclistic is a bike-share program that features more than 5,800 bicycles and 600 docking stations across Chicago. Cyclistic sets itself apart from other bike-share programs by providing a variety of bikes to their riders which makes bike-share more inclusive to people with disabilities and riders who cannot use a standard two-wheeled bike.

Cyclistic's current marketing strategy relies on building general awareness and appealing to broader consumer segments. For instance, Cyclistic offers various pricing plans: single-ride passses, full-day passes, and annual memberships, which helps attract more customers. Customers who purchase single-ride or full-day passes are **casual riders**. Customers who purchase annual memberships are **Cyclistic members**.

Cyclistic's finance analysts have determined that annual members are more profitable than casual riders. Moreno, the director of marketing and my manager, believes that maximizing the number of annual members will be essential to future growth. To do this, Moreno believes that creating a marketing campaign that targets current Cyclistic casual riders will provide us with a better chance of converting them into members. 

Moreno has set a clear goal: Design marketing strategies aimed at converting casual riders into annual members.

### 1b. Business Objectives
1. How do annual members and casual riders use Cyclistic bikes differently?
2. Why would casual riders buy Cyclistic annual memberships?
3. How can Cyclistic use digital media to influence casual riders to become members?

Moreno has assigned me with the first question to answer: **How do annual members and casual riders use Cyclistic bikes differently?** 

### 1c. Business Task
To examine the differences between casual and annual members who use Cyclistic bikes with the goal of determining how to convert casual riders into annual members, thus, maximizing the number of annual memberships and furthering the company's future success.

### 1d. Key Stakeholder
**Cyclistic executive team**: The detailed-oriented executive team will decide whether to approve my recommended marketing program. My recommendations must be backed up with *compelling insights* and *professional data visualizations*.

## STEP 2: PREPARE
### 2a. Data Source 
I will use Cyclistic's historial data to analyze and identify trends from April 2022 to March 2023. The datasets will be downloaded from [divvy-tripdata](https://divvy-tripdata.s3.amazonaws.com/index.html) and have been made available by Motivate International Inc. under this [license](https://ride.divvybikes.com/data-license-agreement). Due to data-privacy issues, riders' personal identifiable information is not provided. 

*NOTE: The datasets have a different name because Cyclistic is a fictional company. For the purposes of this case study, the datasets are appropriate and will allow me to answer the business objectives.*

### 2b. Description of Data Set 
There are 12 files following the naming convention of "YYYYMM-divvy-tripdata". Each file includes information for one month and consists of 13 columns. The title of each column as well as a brief description of it's contents are described down below: 

1. **ride_id**: unique alpha-numeric id of each rider
2. **rideable_type**: type of bike (docked, classic, or electric) used by each rider 
3. **started_at**: datetime of the start of each ride
4. **ended_at**: datetime of the end of each ride
5. **start_station_name**: name of start station
6. **start_station_id**: unique alpha-numeric or integer only id for each start station
7. **end_station_name**: name of end station
8. **end_station_id**: unique alpha-numeric or integer only id for each end station
9. **start_lat**: start station latitude
10. **start_lng**: start station longitude
11. **end_lat**: end station latitude
12. **end_lng**: end station longitude
13. **member_casual**: type (member or casual) of riders 

### 2c. Does your data ROCCC?
A good data source is: **R**eliable, **O**riginal, **C**omprehensive, **C**urrent, and **C**ited. In other words, it ROCCC's! I will examine the datasets based on these five factors to determine if the datasets are good sources of data. 

- **Reliable:** MED - Some of the datasets have a number of missing values in the following columns: start_station_name, end_station_name, start_station_id, and end_station_id which means the data is not complete. However, the remaining columns have no missing values and are accurate. 
- **Original:** HIGH - Divvy bikes collects their own data on rider usage 
- **Comprehensive:** MED - Despite some of the data sets being incomplete, the datasets include a decent amount of information that will allow me to answer the business question. 
- **Current:** HIGH - The datasets include data from April 2022 to March 2023 which means it is pretty current.
- **Cited:** HIGH - The datasets were created and provided by Divvy, a bike-share program located in Chicago. The datasets are updated and made public on a monthly basis.

Overall, the dataset is considered to be of good quality and will be useful in producing recommendations for the company. 

## STEP 3: PROCESS
### 3a. Initial Cleaning in Excel
To account for easier import into MySQL, I did some initial cleaning of each file in Excel by completing the following:
1. *Checked if each column had the appropriate data types*

      The started_at and ended_at columns consisted of datatime values formatted as "MM/DD/YY hh:mm". A custom datetime format formatted as       "YYYY-MM-DD hh:mm:ss" was created for both columns since this is the appropriate datetime value that MySQL accepts. The remaining      columns consisted of the appropriate data types. 

2. *Deleted columns not relevant to answering the business objectives* 

   The following columns were deleted: start_station_id, end_station_id, start_lat, start_lng, end_lat, end_lang. 
   
   NOTE: While the longitude and latitude columns for both the start and end stations would be useful in visualizing a map, I chose not to  include this in my analysis. 
   
3. *Added two new columns*

   I added two new columns: ride_length and day_of_week. The *ride_length* column consists of the duration of each ride and was found by subtracting the started_at column from the ended_at column. The *day_of_week* column consists of the day of the week that each ride started and was found by using the WEEKDAY command in Excel. This returned an integer value where 1 = Sunday and 7 = Saturday. 
   
### 3b. Further Cleaning in MySQL

MySQL Queries:
- For Step 1, refer to [combining data](https://github.com/Tgopal00/Google-Data-Analytics-Cyclistic-Case-Study/blob/main/bike_data_combined.sql)
- For Step 2 & 3, refer to [cleaning data](https://github.com/Tgopal00/Google-Data-Analytics-Cyclistic-Case-Study/blob/main/bike_data_cleaned.sql)

1. *Importing and Combining Data Sets*

   Once the initial cleaning of the files were completed in Excel, the files were converted into CSV format and were uploaded to MySQL in the form of tables. Each table represented a single data file. In total, there were 12 tables and they were combined into a single table called "bike_data_combined" to create a full year view of the data from April 2022 to March 2023. In total, the combined table resulted in 5,803,720 records.
   
2. *Cleaning Combined Data Table and Creating a New Table*

   I begain to further clean the combined data table by first checking for duplicate values. There were no duplicate records found. Next, I checked for missing values. I found there were a number of missing values from the start_station_name and the end_station_name column and I did not want those records to be a part of my analysis. In addition to this, I checked for ride_length values that could affect my analysis. For example, a ride_length value that is negative, less than one minute, or greater than 24 hours. 
   
   I created a new table called "bike_data_combined_clean" by selecting all the columns from the "bike_data_combined" table where the start_station_name and end_station_name columns did not have null values and where the ride_length columns had values greater than or equal to a minute and less than or equal to 24 hours. This resulted in a final clean data table with 4,398,200 records.
   
3. *Adding New Columns to "bike_data_combined_clean"*

   To aid in my analysis, I included a few more columns that would be helpful in answering the business objectives. I created a new **day_of_the_week** column in order to change the integer value to the actual day it represented. I created a **month_name** and **season_name** column to examine the differences among members and casual riders during various times of the year. I created a **start_time_of_day** column to analyze rides by time of day. Finally, I created a **ride_length_in_minutes** column to allow me to easily apply aggregate functions to analyze the values. 








