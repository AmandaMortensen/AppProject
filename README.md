# App Development Project

Data exploration, data analysis, SQL

### **Situation**

In this project, I hypothetically worked as a Data Analyst for an App Developer, with the aim of providing data driven insights through a data anlysis in SQL, to make informed recommendations on what features the App Developer should include in the app, and what go-to-market strategy to leverage.


### **Task** 

As always, I started my work out by identifying the aim of the data analysis, what case the analysis is meant to solve/inform Finally, I then outlined the needs/requirements from the key stakeholder.

Based on the above, I tasked myself with first conducting data exploration to ensure our data is clean, before then ging to data analysis.  

Some of the questions to be explored in the data analysis were: 
- What categories are most popular?
- How should the app be priced? 
- How can the app maximise user rating?
  
Finally,the project entailed writing recommendations for App Developer based on the data analysis.


### **Action** 

I approached this project by first conducting some date exploration, to ensure that our data is ready for further analysis, this included looking into the number of fields in both tables, as well as looking for any missing values (see below for examples from the exploration)
Following the exploration, I begun on the data analysis to identify key features of success app (app with high ratings, alongside with finding the anwsers to the questions above. 

Based on the data analysis I the following conclusions were found: 

- Paid apps generally acheive higher ratings than free apps 
- Apps supporting between 10 - 30 languages have better ratings
- Finance and book apps have the lowest ratings
- Apps with longer descriptions have a higher rating
- The apps have an average rating of 3.5 


**Recommendations** 
1. In terms of price, the App Developer should consider charging money for his app, as the analysis shows people (for a multitude of reasons), tend to rate paid apps higher than free apps 
2. For languagues, it is not about having the most quantity of languges, so the App Developer should more foucs on supporting the right languages by looking into the most popular 10 - 30 languages spoken where the app is going to be published
2. The analysis suggest that the needs of finance and book apps are not being met (as they have the lowest rating), this could represent a market opportunity, since the current apps are not satifsfying the users  
3. The average rating of apps is 3.5, so in order stand out from the crowd the developer should aim for a rating higher than that
4. The developer should prioritise to craft a long and detailed description of the app being developed. This is because the data shows, that apps with what is considered a "long" description, have the higest user rating


## Project Preview 

### **Example of Data Exploration**


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


### **Example of Data Analysis**


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


