CREATE TABLE appleStore_description_combined AS 

SELECT * FROM appleStore_description1

UNION ALL 

SELECT * FROM appleStore_description2

UNION ALL 

SELECT * FROM appleStore_description3

UNION ALL 

SELECT * FROM appleStore_description4

**EXPLONATORY DATA ANALYSIS**

-- check the number of unique apps in both tables 

SELECT COUNT(DISTINCT id) AS UniqueAppIDs 
FROM AppleStore

SELECT COUNT(DISTINCT id) AS UniqueAppIDs 
FROM appleStore_description_combined


-- check for any missing values 

SELECT COUNT(*) AS MissingValues 
FROM AppleStore
WHERE track_name IS NULL OR user_rating is null or prime_genre is NULL

SELECT COUNT(*) AS MissingValues 
FROM appleStore_description_combined
WHERE app_desc is NULL


-- Find out the number of apps per genre 

SELECT prime_genre, COUNT(*) AS NumApps
FROM AppleStore
GROUP by prime_genre
Order by NumApps DESC

-- Get an overview of the apps' ratings 
SELECT min(user_rating) AS MinRating,
       max(user_rating) AS MaxRating,
       avg(user_rating) AS AvgRating 
       
FROM AppleStore

**FINDING INSIGHTS** 

-- Determine whether paid apps have higher rating than free apps 

SELECT CASE
           When price > 0 THEN 'paid'
           ELSE 'free' 
           END AS App_Type,
           avg(user_rating) AS Avg_Rating 
           FROM AppleStore
           GROUP BY App_Type 
           
-- check if apps with more supported languages have higher ratings 

SELECT CASE 

         WHEN lang_num < 10 then '< 10 languages'
         WHEN lang_num BETWEEN 10 AND 30 then '10 - 30 languages' 
         ELSE '> 30 languages'
         END AS language_bucket, 
         avg(user_rating) AS Avg_Rating 
         FROM AppleStore
         GROUP BY language_bucket
         ORDER BY Avg_Rating DESC 
         
-- Check genre with low ratings 

SELECT prime_genre,
       avg(user_rating) AS Avg_Rating 
FROM AppleStore
GROUP by prime_genre
ORDER by Avg_Rating ASC 
LIMIT 10

-- Check if there is a correlation between the length of the app description and user rating 


SELECT CASE
          When length(b.app_desc) <500 then 'Short' 
          When length(b.app_desc) BETWEEN 500 and 1000 then 'Medium' 
          Else 'Long'
          END AS description_length_bucket,
          avg(a.user_rating) AS average_rating
   
FROm 

AppleStore AS A

JOIN 

appleStore_description_combined AS B

ON a.id = b.id

GROUP by description_length_bucket
ORDER by average_rating DESC

-- Check top rated apps for each genre 

SELECT 
       prime_genre, 
       track_name,
       user_rating
FROM (
      SELECT prime_genre,
             track_name,
             user_rating,
  RANK() OVER(PARTITION BY prime_genre ORDER BY user_rating DESC, rating_count_tot DESC) AS rank 
  
  FROM AppleStore
  ) AS a 
  WHERE 
  a.rank = 1 
           
