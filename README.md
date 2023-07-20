# SQL_Video_Games_Golden_Age

Getting Started:

To use these SQL queries, you will need access to a database containing the relevant data. The database should have two main tables: game_sales and reviews. The game_sales table contains information about game sales, including the game name (game) and the number of games sold (games_sold). The reviews table contains information about game reviews, including the game name (game), the critic score (critic_score), and the user score (user_score).

1. Top Ten Best-Selling Games
This query retrieves all information from game_sales table and orders by game sold.

2. Count of Games with Null Critic and User Scores
This query joins the game_sales and reviews tables and selects a count of the number of games where both critic_score and user_score are null.

3. Average Critic Scores by Release Year
This query selects the release year and average critic score for each year, rounded and aliased. It joins the game_sales and reviews tables, groups the data by release year, and orders the data from the highest to the lowest average critic score. The results are limited to the top 10.

4. Average Critic Scores with Minimum Games Reviewed
This query builds upon the previous query and adds a count of games released in each year called num_games. It only returns years that have more than four reviewed games.

5. Years with Dropping Critic Favorites
This query selects the year and avg_critic_score for those years that dropped off the list of critic favorites. The results are ordered from the highest to the lowest average critic score.

6. Average User Scores by Release Year
This query selects the year, an average of user_score, and a count of games released in a given year, aliased and rounded. It includes only years with more than four reviewed games and groups the data by year. The results are ordered by avg_user_score, and it is limited to ten results.

7. Years with Both Top Critic and User Favorites
This query selects the years that appear in both the top critic and top user favorite lists.

8. Top Games Sold in Specific Years
This query selects the year and the sum of games_sold (aliased as total_games_sold) for specific years (1998, 2002, and 2008). The results are ordered by total_games_sold in descending order, and it is limited to 10 results.

