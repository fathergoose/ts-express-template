-- migrate:up
CREATE TABLE artists (id serial PRIMARY KEY, name text NOT NULL);

CREATE TABLE generes (id serial PRIMARY KEY, name text NOT NULL);

CREATE TABLE albums (
    id serial PRIMARY KEY,
    name text NOT NULL,
    album_artist_id int REFERENCES artists (id),
    genere_id int REFERENCES generes (id)
);

CREATE TABLE tracks (
    id serial PRIMARY KEY,
    title text NOT NULL,
    album_id int REFERENCES albums (id)
);

CREATE TABLE artists_tracks (
    artist_id int REFERENCES artists (id), -- CASCADE ?
    track_id int REFERENCES tracks (id), -- CASCADE ?
    CONSTRAINT artists_tracks_pkey PRIMARY KEY (artist_id, track_id)
);

-- migrate:down
