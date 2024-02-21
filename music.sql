-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE artists
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE producers
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL,
  album TEXT NOT NULL
);

CREATE TABLE songs_artists_producers
(
  id SERIAL PRIMARY KEY,
  songs_id INTEGER REFERENCES songs(id),
  artists_id INTEGER REFERENCES artists(id),
  producers_id INTEGER REFERENCES producers(id)
);

INSERT INTO artists
(name)
VALUES
('Hanson'), --1
('Queen'), --2
('Mariah Carey'), --3
('Boyz II Men'), --4
('Lady Gaga'), --5
('Bradley Cooper'), --6
('Nickelback'), --7
('Jay Z'), --8
('Alicia Keys'), --9
('Katy Perry'), --10
('Juicy J'), --11
('Maroon 5'), --12
('Christina Aguilera'), --13
('Avril Lavigne'), --14
('Destiny''s Child') --15
;

INSERT INTO producers
(name)
VALUES
('Dust Brothers'), --1
('Stephen Lironi'), --2
('Roy Thomas Baker'), --3
('Walter Afanasieff'), --4
('Benjamin Rice'), --5
('Rick Parashar'), --6
('Al Shux'), --7
('Max Martin'), --8
('Cirkut'), --9
('Shellback'), --10
('Benny Blanco'), --11
('The Matrix'), --12
('Darkchild') --13
;

INSERT INTO songs
  (title, duration_in_seconds, release_date, album)
VALUES
  ('MMMBop', 238, '1997-04-15', 'Middle of Nowhere'),
  ('Bohemian Rhapsody', 355, '1975-10-31', 'A Night at the Opera'),
  ('One Sweet Day', 282, '1995-11-14', 'Daydream'),
  ('Shallow', 216, '2018-09-27', 'A Star Is Born'),
  ('How You Remind Me', 223, '2001-08-21', 'Silver Side Up'),
  ('New York State of Mind', 276, '2009-10-20', 'The Blueprint 3'),
  ('Dark Horse', 215, '2013-12-17', 'Prism'),
  ('Moves Like Jagger', 201, '2011-06-21', 'Hands All Over'),
  ('Complicated', 244, '2002-05-14', 'Let Go'),
  ('Say My Name', 240, '1999-11-07', 'The Writing''s on the Wall')
;

INSERT INTO songs_artists_producers
(songs_id, artists_id, producers_id)
VALUES
(1,1,1),
(1,1,2),
(2,2,3),
(3,3,4),
(3,4,4),
(4,5,5),
(4,6,5),
(5,7,6),
(6,8,7),
(6,9,7),
(7,10,8),
(7,11,9),
(8,12,10),
(8,13,11),
(9,14,12),
(10,15,13)
;
