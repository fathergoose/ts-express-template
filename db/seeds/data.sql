INSERT INTO
  genres (name)
VALUES
  ('Rock');

INSERT INTO
  artists (name)
VALUES
  ('U2');

INSERT INTO
  albums (name, album_artist_id, genre_id)
VALUES
  (
    'Songs of Innocence',
    (
      SELECT
        id
      FROM
        artists
      wHERE
        name = 'U2'
    ),
    (
      SELECT
        id
      FROM
        genres
      WHERE
        name = 'Rock'
    )
  );

INSERT INTO
  tracks (title, album_id)
VALUES
  (
    'The Miracle (Of Joey Ramone)',
    (
      SELECT
        id
      FROM
        albums
      WHERE
        name = 'Songs of Innocence'
    )
  );

INSERT INTO
  tracks (title, album_id)
VALUES
  (
    'Every Breaking Wave',
    (
      SELECT
        id
      FROM
        albums
      WHERE
        name = 'Songs of Innocence'
    )
  );
