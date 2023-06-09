# Google Data Analytics Capstone Project: Cyclistic Case Study 
This optional capstone project is from the final course of the [Google Data Analytics Professional Certificate](https://www.coursera.org/professional-certificates/google-data-analytics) on Coursera. 

## INTRODUCTION
For this case study, I have been asked to perform many real-world tasks of a junior data analyst working in the marketing analyst team at a fictional company, Cyclistic. In order to answer the key business questions, I will follow the steps of the data analysis process: [**ask**](https://github.com/Tgopal00/Google-Data-Analytics-Cyclistic-Case-Study#step-1-ask), [**prepare**](https://github.com/Tgopal00/Google-Data-Analytics-Cyclistic-Case-Study#step-2-prepare), [**process**](https://github.com/Tgopal00/Google-Data-Analytics-Cyclistic-Case-Study#step-3-process), [**analyze**](https://github.com/Tgopal00/Google-Data-Analytics-Cyclistic-Case-Study#step-4-analyze), [**share**](https://github.com/Tgopal00/Google-Data-Analytics-Cyclistic-Case-Study#step-5-share), and [**act**](https://github.com/Tgopal00/Google-Data-Analytics-Cyclistic-Case-Study#step-6-act).

***MySQL Queries:***
- [bike_data_combined](https://github.com/Tgopal00/Google-Data-Analytics-Cyclistic-Case-Study/blob/main/bike_data_combined.sql)
- [bike_data_cleaned](https://github.com/Tgopal00/Google-Data-Analytics-Cyclistic-Case-Study/blob/main/bike_data_cleaned.sql)
- [bike_data_analysis](https://github.com/Tgopal00/Google-Data-Analytics-Cyclistic-Case-Study/blob/main/bike_data_analysis.sql)

***Data Visualization:***
- [Tableau Dashboard](https://public.tableau.com/app/profile/tishmattie.gopal/viz/GoogleDataAnalyticsCyclisticCaseStudy/GoogleDataAnalyticsCyclisticCaseStudy)

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

### 2c. Does the data ROCCC?
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

      The started_at and ended_at columns consisted of datetime values formatted as "MM/DD/YY hh:mm". A custom datetime format formatted as       "YYYY-MM-DD hh:mm:ss" was created for both columns since this is the appropriate datetime value that MySQL accepts. The remaining      columns consisted of the appropriate data types. 

2. *Deleted columns not relevant to answering the business objectives* 

   The following columns were deleted: start_station_id, end_station_id, start_lat, start_lng, end_lat, end_lang. 
   
   NOTE: While the longitude and latitude columns for both the start and end stations would be useful in visualizing a map, I chose not to  include this in my analysis. 
   
3. *Added two new columns*

   I added two new columns: ride_length and day_of_week. The *ride_length* column consists of the duration of each ride and was found by subtracting the started_at column from the ended_at column. The *day_of_week* column consists of the day of the week that each ride started and was found by using the WEEKDAY command in Excel. This returned an integer value where 1 = Sunday and 7 = Saturday. 
   
### 3b. Further Cleaning in MySQL

**MySQL Queries:**
- For Step 1, refer to [bike_data_combined](https://github.com/Tgopal00/Google-Data-Analytics-Cyclistic-Case-Study/blob/main/bike_data_combined.sql)
- For Step 2 & 3, refer to [bike_data_cleaned](https://github.com/Tgopal00/Google-Data-Analytics-Cyclistic-Case-Study/blob/main/bike_data_cleaned.sql) 

1. *Importing and Combining Data Sets*

   Once the initial cleaning of the files were completed in Excel, the files were converted into CSV format and were uploaded to MySQL in the form of tables. Each table represented a single data file. In total, there were 12 tables and they were combined into a single table called "bike_data_combined" to create a full year view of the data from April 2022 to March 2023. In total, the combined table resulted in 5,803,720 records.
   
2. *Cleaning Combined Data Table and Creating a New Table*

   I begain to further clean the combined data table by first checking for duplicate values. There were no duplicate records found. Next, I checked for missing values. I found there were a number of missing values from the start_station_name and the end_station_name column and I did not want those records to be a part of my analysis. In addition to this, I checked for ride_length values that could affect my analysis. For example, a ride_length value that is negative, less than one minute, or greater than 24 hours was not included in my analysis.
   
   I created a new table called "bike_data_combined_clean" by selecting all the columns from the "bike_data_combined" table where the start_station_name and end_station_name columns did not have null values and where the ride_length columns had values greater than or equal to a minute and less than or equal to 24 hours. This resulted in a final clean data table with 4,398,200 records.
   
3. *Adding New Columns to "bike_data_combined_clean"*

   To aid in my analysis, I included a few more columns that would be helpful in answering the business objectives. I created a new **day_of_the_week** column in order to change the integer value to the actual day it represented. I created a **month_name** and **season_name** column to examine the differences among members and casual riders during various times of the year. I created a **start_time_of_day** column to analyze rides by time of day. Finally, I created a **ride_length_in_minutes** column to allow me to easily apply aggregate functions to analyze the values. 
   
## STEP 4: ANALYZE 
**MySQL Query:** Refer to [bike_data_analysis](https://github.com/Tgopal00/Google-Data-Analytics-Cyclistic-Case-Study/blob/main/bike_data_analysis.sql)

The business objective is to determine how casual and annual members differ and to design a new marketing strategy to convert casual riders into annual members, thus maximizing the number of annual memberships. In order to determine how casual and annual members differed, I decided to consider a number of factors I thought to be important in determining the differences between these two types of riders. 

To examine how casual and annual members differed I...
- Determined how many casual and annual members were in the dataset
- Determined the most favored bike type of casual and annual riders
- Calculated the average ride length for both rider types
- Examined the number of rides by day of the week, start time of the day, month, and season for both rider types 
- Calculated the average ride length by the day of the week, start time of the day, month, and season for both rider types
- Determined the top 10 start and end stations for each rider type

## STEP 5: SHARE
**Tableau:** Check out my final visualization by clicking [here](https://public.tableau.com/app/profile/tishmattie.gopal/viz/GoogleDataAnalyticsCyclisticCaseStudy/GoogleDataAnalyticsCyclisticCaseStudy)

Based on my analysis, I found that there are differences between casual and annual members. Here I will further describe the findings of my analysis as well as include necessary charts, graphs, and tables that help visualize trends/relationships found in the data. 

1. *Descriptive Statistics*

    <img width="415" alt="Screenshot 2023-05-20 at 6 50 11 PM" src="https://github.com/Tgopal00/Google-Data-Analytics-Cyclistic-Case-Study/assets/118848690/f903cdcf-0dda-45ab-b107-37d7c4fa3559">
    
    This table represents a summary of the data set. In total, there were 4,398,200 riders with around 60% of the riders being members and 40% being casual riders. On average, casual riders ride their bikes for longer periods of time compared to members. 
    
2. *Type of Bikes Used By Riders*

    <img width="477" alt="Screenshot 2023-05-20 at 6 50 23 PM" src="https://github.com/Tgopal00/Google-Data-Analytics-Cyclistic-Case-Study/assets/118848690/c24c9c88-6f14-4eb9-869b-93f56526733f">

    Classic and electric bikes are the most commonly used bikes by both members and casual riders. However, there are roughly 10% of casual riders who prefer docked bikes. 
    
3. *Number of Rides by Day of the Week, Start Time of the Day, Month, and Season for Both Rider Types*
      
      <img width="493" alt="Screenshot 2023-05-20 at 6 55 05 PM" src="https://github.com/Tgopal00/Google-Data-Analytics-Cyclistic-Case-Study/assets/118848690/0d79a563-b911-4337-9918-919209fef24b">
    
    Casual riders have the greatest total rides on the weekends and the lowest total rides on the weekdays. Interestingly, members have the lowest total rides on the weekends and the greatest total rides on the weekdays. 
    
    <img width="977" alt="Screenshot 2023-05-20 at 7 02 40 PM" src="https://github.com/Tgopal00/Google-Data-Analytics-Cyclistic-Case-Study/assets/118848690/24880cc6-77c5-45d1-af8c-2899081b8475">
    
    For both members and casual riders, 5PM is the most popular time of day to ride. When examining members, there are two peaks throughout the day that have the most total rides. The first peak is at 8AM and consists of 173,006 total rides and the second peak is at 5PM and consists of 286,415 rides. When examining casual riders, there are some peaks throughout the day but these peaks are relatively close to one another and indicates that there is a steady/gradual increase of total rides from the morning leading up to 5PM, which is the highest peak that consists of 167,967 total rides, before there is a drop in total rides after this point.
    
    <img width="856" alt="Screenshot 2023-05-20 at 7 05 17 PM" src="https://github.com/Tgopal00/Google-Data-Analytics-Cyclistic-Case-Study/assets/118848690/2c0cc956-1c5d-41ae-a4a3-fe1898add215">
    
    June, July, and August is the most popular months for both casual riders and members while December, January, and February is the least popular months. There is minimal gap found between the total rides for members and causal riders for the month of July, thus indicating that July is the most favorable month for both types of riders.
    
    <img width="573" alt="Screenshot 2023-05-20 at 7 07 58 PM" src="https://github.com/Tgopal00/Google-Data-Analytics-Cyclistic-Case-Study/assets/118848690/90097c7d-c6fb-4017-a183-30036f9f400f">
    
    Autumn and Summer are the most popular seasons to ride for both casual riders and members, with Summer consisting of the most total rides for both rider types. When examining casual riders, Summer is the most popular by far, consisting of 859,913 total rides which is roughly twice the amount of total rides found in Autumn. 

4. *Average Ride Length by Day of the Week, Start Time of the Day, Month, and Season for Both Rider Types*

     <img width="614" alt="Screenshot 2023-05-20 at 7 11 17 PM" src="https://github.com/Tgopal00/Google-Data-Analytics-Cyclistic-Case-Study/assets/118848690/d7462e68-509e-4dd8-adfc-3915b004dbed">
    
    Overall, casual riders tend to ride for longer periods of time compared to members. For both rider types, the ride durations remain relatively stable throughout the week. However, the weekends consist of slightly longer ride durations compared to weekdays. 
    
    <img width="980" alt="Screenshot 2023-05-20 at 7 11 25 PM" src="https://github.com/Tgopal00/Google-Data-Analytics-Cyclistic-Case-Study/assets/118848690/d646f1b7-3535-4cf0-b617-492016d6cf46">
    
    Members and casual riders vary greatly in terms of their average ride length throughout the day. Throughout the day, the ride duration for members remain relatively stable and does not vary all that much. The lowest average ride length is around 10 minutes while the greatest is around 13 minutes. However, casual riders have average ride lengths that are as low as 15 minutes and as great as 28 minutes. Casual riders ride the longest between 10AM and 2PM and the shortest between 5AM to 8AM. 
    
    <img width="818" alt="Screenshot 2023-05-20 at 7 11 53 PM" src="https://github.com/Tgopal00/Google-Data-Analytics-Cyclistic-Case-Study/assets/118848690/8c8979c1-c66b-45e5-8100-93536cf34bb7">
    
    Members ride the longest in May, June, and July and casual riders ride the longest in April, May, and June. Once again, it is evident here that casual riders enjoy riding for longer durations of time compared to members. 
    
    <img width="548" alt="Screenshot 2023-05-20 at 7 12 12 PM" src="https://github.com/Tgopal00/Google-Data-Analytics-Cyclistic-Case-Study/assets/118848690/9c135057-72ca-4ed6-8897-26e7dced475f">
    
    Spring and Summer is the most popular times of the year for both members and casual riders. Members ride the longest in the Summer while casual riders ride the longest in the Spring. 

5. *Top 10 Start and End Stations for Each Rider Type* 

      <img width="1150" alt="Screenshot 2023-05-20 at 7 14 23 PM" src="https://github.com/Tgopal00/Google-Data-Analytics-Cyclistic-Case-Study/assets/118848690/763ec254-f9c5-4a93-96ab-32c33d3e7523">
      
      <img width="1143" alt="Screenshot 2023-05-20 at 7 14 35 PM" src="https://github.com/Tgopal00/Google-Data-Analytics-Cyclistic-Case-Study/assets/118848690/b4bfc380-4e2b-44ff-969a-522231743fe2">
    
    In terms of start stations, casual riders begin most of their rides near parks, shorelines, shopping centers, restaurants, museums, and theaters, just to name a few. On the other hand, members often start their rides near grocery stores, food centers, transportation centers, universities, resedential areas, parks, and shorelines, just to name a few. There are some overlap between members and casual riders, such as their preference for parks, museums, and being near the shoreline. 
    
    In terms of end stations, both casual riders and members end at similar stations they started at. When examining casual riders, their third most popular end station is Millenium Park, which consists of a variety of leisure activities and attractions. 

## STEP 6: ACT
### 6a. What are the main trends/relationships identified in the analysis? 
- There are approximately 10% of casual riders that have a preference for docked bikes.
- Casual riders ride approximately two times the amount of members and prefer to ride on the weekends whereas members prefer to ride on the weekdays. 
- For members, work hours (8AM and 5PM) is considered the most popular time of day to ride and the duration of their trips are relatively stable. However, for casual riders, 5PM is considered the most popular time of day to ride but the duration of their trips are the longest from 10AM to 2PM.
- Summer is the most popular time of the year for both casual riders and members. 
- Preferred start and end stations of casual riders consist of parks, museums, theaters, shorelines, and other recreational sites, thus indicating their preference for attractions and leisure activities. Preferred start and end stations for members consist of universities, transporation centers, grocery stores, and resedential areas, thus indicating there preference for using bikes as a way to carry out their daily routines (e.g. going to and from work, home, buying goods, etc.). 

### 6b. How can these trends apply to Cyclistic's new marketing strategy?
After identifying the main differences between casual riders and members, a new marketing strategy in order to convert casual riders into members should consider these three recommendations:

1. Casual riders are the most active on weekends, during the summer months, and at attraction areas, and so it would be important to consider implementing new membership plans that would be benefical to casual riders. For instance, offering discounted membership plans during the summer months or weekend only memberships and placing these ads at the preferred start and end stations of casual riders. 
2. Casual riders have a preference for docked bikes. Providing discounts or special offers on these types of bikes may convert some casual riders to members.
3. Lastly, it would be wise to consider the trip durations of casual riders. Implementing a system where longer rides can equate to memberships discounts and sales may influence casual riders to convert to members.

### 6c. Next steps/Future Directions
For the future growth of Cyclistic, it would be important to gather more data on the riders in order to bring in more customers. For example, knowing the age of people who frequently ride Cyclistic bikes and whether they are a student, employed, unemployed, etc. will allow for stronger marketing campaigns or even new membership plans (e.g. student or off-peak memberships) that can aid in the growth of Cyclistic.
