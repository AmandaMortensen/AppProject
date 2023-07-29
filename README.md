# App Development Project



### **Situation**

In this project, I hypothetically worked as a data analyst for an app developer, with the aim of providing data driven insights to make informed recommendations on what kind of app to build. 



### **Task** 

Some of the questions to be explored throughout the data analysis were: 

- What categories are most popular?
- How should the app be priced? 
- How can the app maximise user rating? 




### **Action** 

In order to undertake this project, I did some data exploration and data analysis in SQL, to identify key features of success app (app with high ratings). 




## **Example of Data Exploration**


#Check for the number of unique apps in both tables 

 ```
SELECT COUNT(DISTINCT id) AS UniqueAppIDs 
FROM AppleStore

SELECT COUNT(DISTINCT id) AS UniqueAppIDs 
FROM appleStore_description_combined
 ```


#Check for any missing values in both tables 

 ```
SELECT COUNT(*) AS MissingValues 
FROM AppleStore
WHERE track_name IS NULL OR user_rating is null or prime_genre is NULL

SELECT COUNT(*) AS MissingValues 
FROM appleStore_description_combined
WHERE app_desc is NULL

 ```




## **Example of Data Analysis**


#Get an overview of the apps' ratings 


 ```
SELECT min(user_rating) AS MinRating,
       max(user_rating) AS MaxRating,
       avg(user_rating) AS AvgRating 
 ```



#Determine whether paid apps have higher rating than free apps 

 ```
SELECT CASE
           When price > 0 THEN 'paid'
           ELSE 'free' 
           END AS App_Type,
           avg(user_rating) AS Avg_Rating 
           FROM AppleStore
           GROUP BY App_Type 
 ```
