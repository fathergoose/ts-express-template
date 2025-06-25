-- migrate:up
ALTER TABLE genres RENAME CONSTRAINT generes_pkey TO genres_pkey;

-- migrate:down
