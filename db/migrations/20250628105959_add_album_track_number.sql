-- migrate:up
ALTER TABLE tracks ADD album_track_number smallint;


-- migrate:down
ALTER TABLE tracks DROP COLUMN album_track_number;
