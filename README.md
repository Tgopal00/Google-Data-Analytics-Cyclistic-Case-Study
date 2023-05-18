# Google Data Analytics Capstone Project: Cyclistic Case Study 
This optional capstone project is from the final course of the [Google Data Analytics Professional Certificate](https://www.coursera.org/professional-certificates/google-data-analytics) on Coursera. 

## INTRODUCTION
For this case study, I have been asked to perform many real-world tasks of a junior data analyst working in the marketing analyst team at a fictional company, Cyclistic. In order to answer the key business questions, I will follow the steps of the data analysis process: [**ask**](https://github.com/Tgopal00/Google-Data-Analytics-Cyclistic-Case-Study#step-1-ask), [**prepare**](https://github.com/Tgopal00/Google-Data-Analytics-Cyclistic-Case-Study/blob/main/README.md#step-2-prepare), **process**, **analyze**, **share**, and **act**.

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
### 3b. Further Cleaning in MySQL
#### 1. Importing and Combining Data Sets
#### 2. Cleaning Data Sets 




