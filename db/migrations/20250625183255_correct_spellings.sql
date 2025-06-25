-- migrate:up
ALTER TABLE albums
RENAME COLUMN genere_id TO genre_id;

ALTER TABLE generes
RENAME TO genres;

ALTER TABLE albums
DROP CONSTRAINT albums_genere_id_fkey;

ALTER TABLE albums ADD CONSTRAINT albums_genre_id_fkey FOREIGN KEY (genre_id) REFERENCES genres (id);

-- migrate:down
