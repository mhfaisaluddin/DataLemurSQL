-- Query to output the user id, song id, and cumulative count song plays as of 4 August 2022.
-- Tables: songs_history, songs_weekly

SELECT user_id, song_id, SUM(song_plays) AS song_count
FROM (
  SELECT user_id, song_id, song_plays
  FROM songs_history
  UNION ALL
  SELECT user_id, song_id, COUNT(song_id) AS song_plays
  FROM songs_weekly
  WHERE listen_time <= '08/04/2022 23:59:59'
  GROUP BY user_id, song_id
) AS report
GROUP BY user_id, song_id
ORDER BY song_count DESC;