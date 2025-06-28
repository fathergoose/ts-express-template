----------------------------------------
-- U2 Songs of Innocence
----------------------------------------
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
        SELECT id
        FROM
            artists
        WHERE
            name = 'U2'
    ),
    (
        SELECT id
        FROM
            genres
        WHERE
            name = 'Rock'
    )
);

WITH soi AS (
    SELECT id
    FROM
        albums
    WHERE
        name = 'Songs of Innocence'
    LIMIT 1
)

INSERT INTO
tracks (title, album_id)
VALUES
(
    'The Miracle (Of Joey Ramone)',
    (SELECT id FROM soi)
),
(
    'Every Breaking Wave',
    (SELECT id FROM soi)
); -- continue adding tracks

----------------------------------------
-- Radiohead | Ok Computer
----------------------------------------
INSERT INTO
genres (name)
VALUES
('Alternative');

INSERT INTO
artists (name)
VALUES
('Radiohead');

INSERT INTO
albums (name, album_artist_id, genre_id)
VALUES
(
    'Ok Computer',
    (
        SELECT id
        FROM
            artists
        WHERE
            name = 'Radiohead'
    ),
    (
        SELECT id
        FROM
            genres
        WHERE
            name = 'Alternative'
    )
);

WITH okcomp AS (
    SELECT id
    FROM
        albums
    WHERE
        name = 'Ok Computer'
    LIMIT 1
)

INSERT INTO
tracks (album_track_number, title, album_id)
VALUES
(
    1,
    'Airbag',
    (SELECT id FROM okcomp)
),
(
    2,
    'Paranoid Android',
    (SELECT id FROM okcomp)
),
(
    3,
    'Subterranean Homesick Alien',
    (SELECT id FROM okcomp)
),
(
    4,
    'Exit Music (For A Film)',
    (SELECT id FROM okcomp)
),
(
    5,
    'Let Down',
    (SELECT id FROM okcomp)
),
(
    6,
    'Karma Police',
    (SELECT id FROM okcomp)
),
(
    7,
    'Fitter Happier',
    (SELECT id FROM okcomp)
),
(
    8,
    'Electioneering',
    (SELECT id FROM okcomp)
),
(
    9,
    'Climbing Up the Walls',
    (SELECT id FROM okcomp)
),
(
    10,
    'No Suprises',
    (SELECT id FROM okcomp)
),
(
    11,
    'Lucky',
    (SELECT id FROM okcomp)
),
(
    12,
    'The Tourist',
    (SELECT id FROM okcomp)
);
