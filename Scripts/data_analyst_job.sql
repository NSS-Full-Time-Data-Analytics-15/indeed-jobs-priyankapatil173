--Q1.How many rows are in the data_analyst_jobs table?
SELECT COUNT(*) 
FROM data_analyst_jobs;
--ANSWER=1793

--Q2.Write a query to look at just the first 10 rows.
--What company is associated with the job posting on the 10th row?
SELECT * 
FROM data_analyst_jobs
LIMIT 10;
--ANSWER=XTO Land Data Analyst

--Q3.How many postings are in Tennessee?
SELECT count(location) AS count_loc
FROM data_analyst_jobs
WHERE location='TN';
--ANSWER=21

---How many are there in either Tennessee or Kentucky?
SELECT location,count(location) AS count_location
FROM data_analyst_jobs
WHERE location IN('TN','KY')
GROUP BY location;
--ANSWER= TN(21),KY(6)

--Q4.How many postings in Tennessee have a star rating above 4?
SELECT count(*) AS count_posting
FROM data_analyst_jobs
Where star_rating >=4 AND location='TN';
--ANSWER=4

--Q5.How many postings in the dataset have a review count between 500 and 1000?
SELECT count(*) AS new_review_count
FROM data_analyst_jobs
WHERE review_count BETWEEN 500 AND 1000;
--ANSWER=151

--Q6.Show the average star rating for companies in each state. 
--The output should show the state as state and the average rating for the state as avg_rating.
--Which state shows the highest average rating?
SELECT location AS state,ROUND(avg(star_rating),2)AS avg_rating
FROM data_analyst_jobs
WHERE star_rating IS NOT NULL
GROUP BY state
ORDER BY avg_rating DESC;
--ANSWER=NE(4.20)

--Q7.Select unique job titles from the data_analyst_jobs table. 
--How many are there?
SELECT COUNT(DISTINCT(title))
FROM data_analyst_jobs;
--ANSWER=881

--Q8,How many unique job titles are there for California companies?
SELECT COUNT(DISTINCT(title))
FROM data_analyst_jobs
WHERE location='CA';
--ANSWER=230

--Q9.Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations. 
--How many companies are there with more that 5000 reviews across all locations?

SELECT company,review_count,ROUND(avg(star_rating),2) AS new_avg_rating
FROM data_analyst_jobs
GROUP BY company,review_count
HAVING (review_count) > 5000 AND company IS NOT NULL

SELECT COUNT(DISTINCT company) AS count_company
FROM data_analyst_jobs
WHERE review_count > 5000 AND company IS NOT NULL;
--ANSWER=40

--Q10.Add the code to order the query in #9 from highest to lowest average star rating.
--Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? 
--What is that rating?
SELECT company,review_count,ROUND(avg(star_rating),2) AS new_avg_rating
FROM data_analyst_jobs
GROUP BY company,review_count
HAVING (review_count) > 5000 AND company IS NOT NULL
ORDER BY new_avg_rating DESC;
--ANSWER=American Express(4.20 rating)

--Q11.Find all the job titles that contain the word ‘Analyst’.
--How many different job titles are there?
SELECT title
FROM data_analyst_jobs
WHERE title LIKE '%Analyst%';

SELECT COUNT (title) AS total_title
FROM data_analyst_jobs
WHERE title NOT LIKE '%Analyst%';
--ANSWER=157

--Q12.How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’?
--What word do these positions have in common?
SELECT title,COUNT (title) AS total_title
FROM data_analyst_jobs
WHERE title NOT LIKE '%Analyst%' AND title NOT LIKE '%Analytics%'
GROUP BY title;

SELECT COUNT(DISTINCT title)AS jo_title
FROM data_analyst_jobs
WHERE title NOT LIKE '%Analyst%' AND title NOT LIKE '%Analytics%';
--ANSWER=26(common word is Data)

--BONUS QUESTION

SELECT DISTINCT (domain),skill,days_since_posing
FROM data_analyst_jobs
WHERE skill='SQL' AND days_since_posing >21 AND domain IS NOT NULL
ORDER BY days_since_posing DESC
LIMIT 4;

