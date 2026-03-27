
CREATE TABLE person ( 
    person_id        INTEGER,
    name             VARCHAR NOT NULL,
    year             SMALLINT,
    comment          VARCHAR(255) NOT NULL DEFAULT ''
);

CREATE TABLE band ( 
    band_id          INTEGER,
    name             VARCHAR NOT NULL,
    year             SMALLINT,
    comment          VARCHAR(255) NOT NULL DEFAULT ''
);

CREATE TABLE band_person
(
    band_id    INTEGER,
    person_id  INTEGER
);

CREATE TABLE album
(
    album_id  INTEGER,
    name      VARCHAR,
    band_id   INTEGER,
    year      SMALLINT
);

CREATE TABLE music_instrument(
    id            INTEGER,
    parent_id     INTEGER,
    name          VARCHAR,
    type          INTEGER
);

CREATE TABLE list1(
  id INTEGER
);

CREATE TABLE mytable_int(
    a INTEGER,
    b INTEGER
);

CREATE TABLE mytable_str(
    str_a VARCHAR,
    str_b VARCHAR
);


CREATE TABLE band_extended ( 
    band_id   INTEGER,
    name      VARCHAR NOT NULL,
    year      SMALLINT,
    comment   VARCHAR(255) NOT NULL DEFAULT '',
    n_albums  INTEGER,
    n_songs   INTEGER
);

CREATE TABLE album_archive
(
    album_id INTEGER,
    name     VARCHAR,
    band_id  INTEGER,
    year     SMALLINT
);

CREATE TABLE band_old ( 
    band_id      INTEGER,
    name         VARCHAR NOT NULL,
    year         SMALLINT,
    comment      VARCHAR(255) NOT NULL DEFAULT ''
);

CREATE TABLE calendar_year(
  year INTEGER
);

CREATE TABLE album_small
(
    album_id INTEGER,
    name     VARCHAR,
    band_id  INTEGER,
    year     SMALLINT
);

CREATE TABLE band_small ( 
    band_id   INTEGER,
    name      VARCHAR NOT NULL,
    year      SMALLINT,
    comment   VARCHAR(255) NOT NULL DEFAULT ''
);