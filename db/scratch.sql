-- SQL is a bit confusing because one starts off by defining the fields to
-- retrun then from what data source, and finally any filtering / ordering
--
-- This is a good query to stare at and learn from
--
-- Get a list of all the tracks in the db
SELECT
    t.title,
    a.name AS album,
    g.name AS genre,
    ar.name AS artist
FROM albums AS a
INNER JOIN genres AS g ON a.genre_id = g.id
INNER JOIN artists AS ar ON a.album_artist_id = ar.id
INNER JOIN tracks AS t ON a.id = t.album_id;
