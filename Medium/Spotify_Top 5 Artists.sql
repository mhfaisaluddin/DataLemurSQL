-- Query to determine the top 5 artist whose songs appear in the Top 10 of the global_song_rank
-- the table: artists , songs , global_song_rank

WITH artist_ranking AS(
SELECT a.artist_name,
  DENSE_RANK() OVER(ORDER BY COUNT(a.artist_name) DESC) AS artist_rank
FROM global_song_rank gs 
  LEFT JOIN songs s ON gs.song_id = s.song_id
  LEFT JOIN artists a ON s.artist_id = a.artist_id
WHERE gs.rank <= 10
GROUP BY 1
)

SELECT *
FROM artist_ranking
WHERE artist_rank <= 5