
SELECT *
FROM game_sales
Order by games_sold desc
limit 10

SELECT COUNT(*) 
FROM game_sales AS g
left JOIN reviews AS r
Using(game)
WHERE r.critic_score IS NULL AND r.user_score Is NULL

SELECT year , ROUND(AVG(critic_score),2) AS avg_critic_score
FROM game_sales AS g
left JOIN reviews AS r
Using(game)
GROUP BY year
ORDER BY  avg_critic_score dESC, year
LIMIT 10

SELECT year , ROUND(AVG(critic_score),2) AS avg_critic_score, COUNT(critic_score) AS num_games
FROM game_sales AS g
left JOIN reviews AS r
Using(game)

GROUP BY year
HAVING COUNT(critic_score) > 4
ORDER BY avg_critic_score DESC

SELECT year, avg_critic_score
FROM top_critic_years
EXCEPT
SELECT year, avg_critic_score
FROM top_critic_years_more_than_four_games
ORDER BY avg_critic_score DESC;
LIMIT 10

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

 SELECT year, sum(games_sold) total_games_sold
 FROM game_sales   
WHERE YEAR IN(1998,2002,2008)
GROUP BY year
ORDER BY total_games_sold desc
LIMIT 10;
