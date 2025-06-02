SELECT * FROM video_games_sales
SELECT max(EU_Sales) as max_eu_sales from video_games_sales

/*Top 10 best-selling games by global sales*/
SELECT Name, Platform, Publisher, Global_Sales
FROM video_games_sales
ORDER BY Global_Sales DESC
LIMIT 10;

/*Top 10 best-selling publishers by global sales*/
SELECT Publisher, SUM(Global_Sales) AS Total_Global_Sales
FROM video_games_sales
GROUP BY Publisher
ORDER BY Total_Global_Sales DESC
LIMIT 10;

/*Most popular genres in North America*/
SELECT Genre, SUM(NA_Sales) as Total_NA_Sales from video_games_sales
GROUP BY Genre
order by Total_NA_Sales DESC
Limit 10;

/*Most popular genres in Japan*/
SELECT Genre, SUM(JP_Sales) AS Total_JP_Sales
FROM video_games_sales
GROUP BY Genre
ORDER BY Total_JP_Sales DESC;


/*Most popular genres in Europe*/
SELECT Genre, Sum(EU_Sales) as Total_EU_Sales from video_games_sales
group by Genre
order by Total_EU_Sales DESC
;

/*Games sold well globally but failed in Japan*/
SELECT Name, Platform, Publisher, Global_Sales, JP_Sales
FROM video_games_sales
WHERE Global_Sales >= 1.0 AND JP_Sales <= 0.1
ORDER BY Global_Sales DESC

/*Games sold well globally but failed in North America*/
SELECT Name, Platform, Publisher, Global_Sales, NA_Sales
FROM video_games_sales
WHERE Global_Sales >= 1.0 AND NA_Sales <= 0.1
ORDER BY Global_Sales DESC

/*Games sold well globally but failed in Europe*/
SELECT Name, Platform, Publisher, Global_Sales, EU_Sales
FROM video_games_sales
WHERE Global_Sales >= 1.0 AND EU_Sales <= 0.1
ORDER BY Global_Sales DESC

/*Year with highest total sales*/
SELECT Year, Sum(Global_Sales) as Total_Global_Sales from video_games_sales
group by year
order by Total_Global_Sales DESC
Limit 1;

/*Platform-genre that have the best average global sales*/
Select Platform, Genre, AVG(Global_Sales) as Average_Global_Sales from video_games_sales
Group by Platform, Genre
HAVING Count(*) > 5
Order by Average_Global_Sales DESC
Limit 1

/*Global games sales changes over the years*/
SELECT Year, Sum(Global_Sales) as Total_Global_Sales
FROM video_games_sales
Group by Year
Order by year;

/*Dominating platform in different regions*/
SELECT Platform, Sum(JP_Sales) as Total_JP_Sales, Sum(NA_Sales) as Total_NA_Sales, Sum(EU_Sales) as Total_EU_Sales
From video_games_sales
group by platform
order by Total_NA_Sales DESC

/*Platform shares in Japan*/
SELECT Platform,
       SUM(JP_Sales) AS Total_JP_Sales,
       (SUM(JP_Sales) * 100.0 / (SELECT SUM(JP_Sales) FROM video_games_sales)) AS JP_Sales_Percentage
FROM video_games_sales
GROUP BY Platform
ORDER BY JP_Sales_Percentage DESC;

/*Platform shares in North America*/
SELECT Platform,
       SUM(NA_Sales) AS Total_NA_Sales,
       (SUM(NA_Sales) * 100.0 / (SELECT SUM(NA_Sales) FROM video_games_sales)) AS NA_Sales_Percentage
FROM video_games_sales
GROUP BY Platform
ORDER BY NA_Sales_Percentage DESC;

/*Platform shares in Europe*/
SELECT Platform,
       SUM(EU_Sales) AS Total_EU_Sales,
       (SUM(EU_Sales) * 100.0 / (SELECT SUM(EU_Sales) FROM video_games_sales)) AS EU_Sales_Percentage
FROM video_games_sales
GROUP BY Platform
ORDER BY EU_Sales_Percentage DESC;








