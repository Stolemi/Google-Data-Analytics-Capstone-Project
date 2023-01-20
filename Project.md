
## Background
In this case study I am assumed to be a Jr. data analyst working in the marketing analytics team at Cyclist, a bike-share company in Chicago. Cyclist started in 2016 and since then the program has grown to a fleet of almost 6000 bikes that are locked into a network of little less than 700 stations around Chicago. The company offers both classic and electric bikes and has two types of membership: **casuals**, customers who buy single-trip pass or day pass; **members**, customer who purchase an annual pass. 

## Ask 
The analysis conducted by the finance department have determined that Members are the most profitable customers and have tasked the marketing department with organizing a campaign to convert Casuals customer into Members. The marketing department therefore needs to conduct an analysis based on historical data to asses: **What are the difference between Members and Casuals and how these can be exploited in the marketing campaign.

## Prepare
The data is collected directly by Cyclist and for this analysis I restrict the sample to monthly data for 2022. The data is saved in 12 separated files as .csv. 

The data collection team at Cyclist have outlined the main features of the dataset provided:
  1. Each month contains every trip made during that period
  2. 'docked bike' is the old label for 'classic bike'
  3. Classic bike must start and end at a docking station, while electric bikes can start and end their trip anywhere as they include a locker. 
  4. Data should contains only trip longer than one minute and shorter than one day. 

## Process
To combine, clean and perform a quick exploratory analysis I used SQL, in particular MySQL which has some small difference from BigQuery taught during the course. I first created the table *raw_data_2022* and then load the csv files one by one using the command LOAD DATA LOCAL INFILE that allow to import quickly large amount of data. Total number of obserations after import: 5'667'720. Total variables/columns: 13. 

#### Data Exploration 
I conduct a first exploration of the raw data in order to have a clearer idea of what needs to be done to prepare the data for the analysis. Main adjustment to do regard: 
  1. ride_id: it should be unique and 16 characters long 
  2. rideable_type: docked_bike need to be modified to 'classic_bike' as it was the old naming system. 
  3. start/end_station_name: there are 'test' stations included which need to be removed as well as wrong station names. 
  4. remove observations where bike type is 'classic' and start/end_station is NULL 
  5. member_casual: some entries are 7 characters long, which need to be adjusted to 6. 
  6. drop observations with NULL in latitude/longitude columns. 

Example of query: explore ride_id and rideable_type

![](screenshots/Exploration.png)
