-- Top 5 richest billionaire in the world, from highest to lowest -- 
SELECT name, networth_b
FROM billionaire.bill
ORDER BY networth_b DESC
LIMIT 5;

-- Which industry is most billionaire in --
SELECT industry, COUNT(industry) AS billionaire_count
FROM billionaire.bill
GROUP BY industry
ORDER BY billionaire_count DESC
LIMIT 1;

-- What is the average age of billionaires in the world --
SELECT AVG(age) as average_age
FROM billionaire.bill

-- Who is the youngest billionaire --
SELECT name, age
FROM billionaire.bill
WHERE age = (SELECT MIN(age) FROM billionaire.bill);

-- What is the top 3 countries with the most billionaires --
SELECT country, COUNT(country) AS billionaire_count
FROM billionaire.bill
GROUP BY country
ORDER BY billionaire_count DESC
LIMIT 3;

-- What is the self made billionaire percentage from the total billionaire --
SELECT
	selfmade, 
	COUNT(selfmade), 
	COUNT(selfmade) * 100/(SELECT COUNT(*) FROM billionaire.bill) AS percentage
FROM billionaire.bill
GROUP BY selfmade;

-- What is the percentage of female self made billionaires from the total billionaire --
SELECT COUNT(selfmade) AS female_selfmade, 
	(COUNT(*)/(SELECT COUNT(*) FROM billionaire.bill))*100 AS percentage
FROM billionaire.bill
WHERE selfmade = 'TRUE' AND gender = 'F';
