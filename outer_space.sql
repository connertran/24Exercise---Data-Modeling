-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space;

CREATE TABLE stars
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE galaxies
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE moons
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around INTEGER REFERENCES stars,
  galaxy INTEGER REFERENCES galaxies
);

CREATE TABLE planets_moons
(
  id SERIAL PRIMARY KEY,
  planets_id INTEGER REFERENCES planets,
  moons_id INTEGER REFERENCES moons
);

INSERT INTO galaxies
(name)
  VALUES
  ('Milky Way');

INSERT INTO stars
  (name)
  VALUES
  ('The Sun'),
  ('Proxima Centauri'),
  ('Gliese 876');

INSERT INTO moons
  (name)
  VALUES
  ('The Moon'), --1
  ('Phobos'), --2
  ('Deimos'), --3
  ('Naiad'), --4
  ('Thalassa'), --5
  ('Despina'), --6
  ('Galatea'), --7
  ('Larissa'), --8
  ('S/2004 N 1'), --9
  ('Proteus'), --10
  ('Triton'), --11
  ('Nereid'), --12
  ('Halimede'), --13
  ('Sao'), --14
  ('Laomedeia'), --15
  ('Psamathe'), --16
  ('Neso'); --17

INSERT INTO planets
  (name, orbital_period_in_years, orbits_around, galaxy)
VALUES
  ('Earth', 1.00, 1, 1),
  ('Mars', 1.88, 1, 1),
  ('Venus', 0.62, 1, 1),
  ('Neptune', 164.8, 1, 1),
  ('Proxima Centauri b', 0.03, 2, 1),
  ('Gliese 876 b', 0.23, 3, 1);

INSERT INTO planets_moons
  (planets_id, moons_id)
  VALUES
  (1,1),
  (2,2),
  (2,3),
  (4,4),
  (4,5),
  (4,6),
  (4,7),
  (4,8),
  (4,9),
  (4,10),
  (4,11),
  (4,12),
  (4,13),
  (4,14),
  (4,15),
  (4,16),
  (4,17);
