<<<<<<< HEAD
-- Show DB Spotify_Youtube_Dataset
USE Spotify_Youtube_Data;
SELECT * FROM Spotify_Youtube_Dataset;

-- Q1. List all tracks with high danceability (greater than 0.8)
SELECT Artist, Track, Album, Danceability
FROM Spotify_Youtube_Dataset
WHERE Danceability > 0.8
ORDER BY Danceability DESC;

-- Q2. Count how many official music videos each artist has
SELECT Artist, COUNT(*) AS official_video_count
FROM Spotify_Youtube_Dataset
WHERE official_video = 1   -- SQL Server uses 1/0, not TRUE/FALSE
GROUP BY Artist;

-- Q3. Get top 10 tracks by Spotify energy score
SELECT TOP 10 Track, Artist, Energy
FROM Spotify_Youtube_Dataset
ORDER BY Energy DESC;

-- Q4. Find tracks with a YouTube view count equal and above 1 billion
SELECT Track, Artist, Views
FROM Spotify_Youtube_Dataset
WHERE Views >= 1000000000
ORDER BY Views DESC;

-- Q5. Get the average tempo per artist
SELECT Artist, AVG(Tempo) AS avg_tempo
FROM Spotify_Youtube_Dataset
GROUP BY Artist;

-- Q6. List tracks where the YouTube title is different from the Spotify track name
SELECT Track, Title, Artist
FROM Spotify_Youtube_Dataset
WHERE Track <> Title;

-- Q7. Retrieve all tracks where the album type is 'single'
SELECT Artist, Track, Album, Album_type
FROM Spotify_Youtube_Dataset
WHERE Album_type = 'single';

-- Q8. Find the YouTube video with the highest like-to-view ratio
SELECT TOP 1 
    Track, 
    Artist, 
    Likes, 
    Views, 
    (Likes * 1.0 / Views) AS like_ratio
FROM Spotify_Youtube_Dataset
WHERE Views > 0
ORDER BY like_ratio DESC;

-- Q9. Show the top 10 longest tracks by duration
SELECT TOP 10 Track, Artist, Duration_ms
FROM Spotify_Youtube_Dataset
ORDER BY Duration_ms DESC;

-- Q10. Find tracks with high acousticness ( > 0.7 ) and low energy ( < 0.4 )
SELECT Track, Artist, Acousticness, Energy
FROM Spotify_Youtube_Dataset
WHERE Acousticness > 0.7 AND Energy < 0.4;

-- Q11. Highest viewed video
SELECT TOP 1 Track, Artist, Channel, Views
FROM Spotify_Youtube_Dataset
ORDER BY Views DESC;

-- Q12. Highest liked video
SELECT TOP 1 Track, Artist, Channel, Likes
FROM Spotify_Youtube_Dataset
ORDER BY Likes DESC;

-- Q13. Highest commented video
SELECT TOP 1 Track, Artist, Channel, Comments
FROM Spotify_Youtube_Dataset
ORDER BY Comments DESC;

-- Q14. Highest streamed track
SELECT TOP 1 Track, Artist, Stream
FROM Spotify_Youtube_Dataset
ORDER BY Stream DESC;

-- Q15. Highest Viewed, Liked, Commented, Streamed video (if any)
-- Used CTE (Common Table Expression) concept where, all the queries are referenced with a single SQL query using WITH keyword
WITH MaxValues AS (
    SELECT
        (SELECT TOP 1 Track FROM Spotify_Youtube_Dataset ORDER BY Views DESC) AS MaxViewsTrack,
        (SELECT TOP 1 Track FROM Spotify_Youtube_Dataset ORDER BY Likes DESC) AS MaxLikesTrack,
        (SELECT TOP 1 Track FROM Spotify_Youtube_Dataset ORDER BY Comments DESC) AS MaxCommentsTrack,
        (SELECT TOP 1 Track FROM Spotify_Youtube_Dataset ORDER BY Stream DESC) AS MaxStreamTrack
)
SELECT 
    s.Track, s.Artist, s.Channel, s.Views, s.Likes, s.Comments, s.Stream
FROM Spotify_Youtube_Dataset s
CROSS JOIN MaxValues m
WHERE s.Track = m.MaxViewsTrack
  AND s.Track = m.MaxLikesTrack
  AND s.Track = m.MaxCommentsTrack
  AND s.Track = m.MaxStreamTrack;
=======
-- Show DB Spotify_Youtube_Dataset
USE Spotify_Youtube_Data;
SELECT * FROM Spotify_Youtube_Dataset;

-- Q1. List all tracks with high danceability (greater than 0.8)
SELECT Artist, Track, Album, Danceability
FROM Spotify_Youtube_Dataset
WHERE Danceability > 0.8
ORDER BY Danceability DESC;

-- Q2. Count how many official music videos each artist has
SELECT Artist, COUNT(*) AS official_video_count
FROM Spotify_Youtube_Dataset
WHERE official_video = 1   -- SQL Server uses 1/0, not TRUE/FALSE
GROUP BY Artist;

-- Q3. Get top 10 tracks by Spotify energy score
SELECT TOP 10 Track, Artist, Energy
FROM Spotify_Youtube_Dataset
ORDER BY Energy DESC;

-- Q4. Find tracks with a YouTube view count equal and above 1 billion
SELECT Track, Artist, Views
FROM Spotify_Youtube_Dataset
WHERE Views >= 1000000000
ORDER BY Views DESC;

-- Q5. Get the average tempo per artist
SELECT Artist, AVG(Tempo) AS avg_tempo
FROM Spotify_Youtube_Dataset
GROUP BY Artist;

-- Q6. List tracks where the YouTube title is different from the Spotify track name
SELECT Track, Title, Artist
FROM Spotify_Youtube_Dataset
WHERE Track <> Title;

-- Q7. Retrieve all tracks where the album type is 'single'
SELECT Artist, Track, Album, Album_type
FROM Spotify_Youtube_Dataset
WHERE Album_type = 'single';

-- Q8. Find the YouTube video with the highest like-to-view ratio
SELECT TOP 1 
    Track, 
    Artist, 
    Likes, 
    Views, 
    (Likes * 1.0 / Views) AS like_ratio
FROM Spotify_Youtube_Dataset
WHERE Views > 0
ORDER BY like_ratio DESC;

-- Q9. Show the top 10 longest tracks by duration
SELECT TOP 10 Track, Artist, Duration_ms
FROM Spotify_Youtube_Dataset
ORDER BY Duration_ms DESC;

-- Q10. Find tracks with high acousticness ( > 0.7 ) and low energy ( < 0.4 )
SELECT Track, Artist, Acousticness, Energy
FROM Spotify_Youtube_Dataset
WHERE Acousticness > 0.7 AND Energy < 0.4;

-- Q11. Highest viewed video
SELECT TOP 1 Track, Artist, Channel, Views
FROM Spotify_Youtube_Dataset
ORDER BY Views DESC;

-- Q12. Highest liked video
SELECT TOP 1 Track, Artist, Channel, Likes
FROM Spotify_Youtube_Dataset
ORDER BY Likes DESC;

-- Q13. Highest commented video
SELECT TOP 1 Track, Artist, Channel, Comments
FROM Spotify_Youtube_Dataset
ORDER BY Comments DESC;

-- Q14. Highest streamed track
SELECT TOP 1 Track, Artist, Stream
FROM Spotify_Youtube_Dataset
ORDER BY Stream DESC;

-- Q15. Highest Viewed, Liked, Commented, Streamed video (if any)
-- Used CTE (Common Table Expression) concept where, all the queries are referenced with a single SQL query using WITH keyword
WITH MaxValues AS (
    SELECT
        (SELECT TOP 1 Track FROM Spotify_Youtube_Dataset ORDER BY Views DESC) AS MaxViewsTrack,
        (SELECT TOP 1 Track FROM Spotify_Youtube_Dataset ORDER BY Likes DESC) AS MaxLikesTrack,
        (SELECT TOP 1 Track FROM Spotify_Youtube_Dataset ORDER BY Comments DESC) AS MaxCommentsTrack,
        (SELECT TOP 1 Track FROM Spotify_Youtube_Dataset ORDER BY Stream DESC) AS MaxStreamTrack
)
SELECT 
    s.Track, s.Artist, s.Channel, s.Views, s.Likes, s.Comments, s.Stream
FROM Spotify_Youtube_Dataset s
CROSS JOIN MaxValues m
WHERE s.Track = m.MaxViewsTrack
  AND s.Track = m.MaxLikesTrack
  AND s.Track = m.MaxCommentsTrack
  AND s.Track = m.MaxStreamTrack;
>>>>>>> 994dcdd4fe26376cc8e96cce49e3c37bf35fc161
-- Result is none/blank because, for all 4 parameters, values are different, not same for all of them