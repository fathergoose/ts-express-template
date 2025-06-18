-- migrate:up
CREATE TABLE artists (id SERIAL PRIMARY KEY, name TEXT NOT NULL);

CREATE TABLE generes (id SERIAL PRIMARY KEY, name TEXT NOT NULL);

CREATE TABLE albums (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  album_artist_id INT REFERENCES artists (id),
  genere_id INT REFERENCES generes (id)
);

CREATE TABLE tracks (
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  album_id INT REFERENCES albums (id)
);

CREATE TABLE artists_tracks (
  artist_id INT REFERENCES artists (id), -- CASCADE ?
  track_id INT REFERENCES tracks (id), -- CASCADE ?
  CONSTRAINT artists_tracks_pkey PRIMARY KEY (artist_id, track_id)
);

-- migrate:down
