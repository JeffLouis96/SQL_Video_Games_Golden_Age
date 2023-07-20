-- Select all information for the top ten best-selling games
-- Order the results from best-selling game down to tenth best-selling

SELECT *
FROM game_sales
Order by games_sold desc
limit 10

-- Join games_sales and reviews
-- Select a count of the number of games where both critic_score and user_score are null

SELECT COUNT(*) 
FROM game_sales AS g
left JOIN reviews AS r
Using(game)
WHERE r.critic_score IS NULL AND r.user_score Is NULL

-- Select release year and average critic score for each year, rounded and aliased
-- Join the game_sales and reviews tables
-- Group by release year
-- Order the data from highest to lowest avg_critic_score and limit to 10 results

SELECT year , ROUND(AVG(critic_score),2) AS avg_critic_score
FROM game_sales AS g
left JOIN reviews AS r
Using(game)
GROUP BY year
ORDER BY  avg_critic_score dESC, year
LIMIT 10

-- Paste your query from the previous task; update it to add a count of games released in each year called num_games
-- Update the query so that it only returns years that have more than four reviewed games

SELECT year , ROUND(AVG(critic_score),2) AS avg_critic_score, COUNT(critic_score) AS num_games
FROM game_sales AS g
left JOIN reviews AS r
Using(game)

GROUP BY year
HAVING COUNT(critic_score) > 4
ORDER BY avg_critic_score DESC

-- Select the year and avg_critic_score for those years that dropped off the list of critic favorites 
-- Order the results from highest to lowest avg_critic_score

SELECT year, avg_critic_score
FROM top_critic_years
EXCEPT
SELECT year, avg_critic_score
FROM top_critic_years_more_than_four_games
ORDER BY avg_critic_score DESC;
LIMIT 10

-- Select year, an average of user_score, and a count of games released in a given year, aliased and rounded
-- Include only years with more than four reviewed games; group data by year
-- Order data by avg_user_score, and limit to ten results

SELECT g.year, COUNT(g.game) AS num_games, ROUND(AVG(r.user_score),2) AS avg_user_score
FROM game_sales g
INNER JOIN reviews r
ON g.game = r.game
GROUP BY g.year
HAVING COUNT(g.game) > 4
ORDER BY avg_user_score DESC

SELECT year
from top_critic_years_more_than_four_games
inner join top_user_years_more_than_four_games
using(year)

-- Select year and sum of games_sold, aliased as total_games_sold; order results by total_games_sold descending
 SELECT year, sum(games_sold) total_games_sold
 FROM game_sales   
WHERE YEAR IN(1998,2002,2008)
GROUP BY year
ORDER BY total_games_sold desc
LIMIT 10;