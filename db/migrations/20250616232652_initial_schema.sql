-- migrate:up
CREATE TABLE artists (id SERIAL PRIMARY KEY, name TEXT NOT NULL)
CREATE TABLE generes (id SERIAL PRIMARY KEY, name TEXT NOT NULL)
CREATE TABLE albums (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  album_artist_id INTEGER REFERENCES artists (id),
  genere_id INTEGER REFERENCES generes (id)
)
CREATE TABLE tracks (
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  artist_id
)
-- migrate:down
