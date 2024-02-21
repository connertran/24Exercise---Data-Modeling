-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE cities
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE countries
(
  id SERIAL PRIMARY KEY,
  country TEXT NOT NULL
);

CREATE TABLE airlines
(
  id SERIAL PRIMARY KEY,
  airline TEXT NOT NULL
);

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  seat TEXT NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline INTEGER REFERENCES airlines,
  from_city INTEGER REFERENCES cities,
  from_country INTEGER REFERENCES countries,
  to_city INTEGER REFERENCES cities,
  to_country INTEGER REFERENCES countries
);

INSERT INTO airlines
(airline)
VALUES
('United'),
('British Airways'),
('Delta'),
('TUI Fly Belgium'),
('Air China'),
('American Airlines'),
('Avianca Brasil')
;

INSERT INTO countries
(country)
VALUES
('United States'), --1
('Japan'), --2
('France'),--3
('UAE'),--4
('Brazil'),--5
('United Kingdom'),--6
('Mexico'),--7
('Morocco'),--8
('China'),--9
('Chile')--10
;

INSERT INTO cities
  (name)
  VALUES
  ('Washington DC'), --1
  ('Tokyo'), --2
  ('Los Angeles'), --3
  ('Seattle'), --4
  ('Paris'), --5
  ('Dubai'), --6
  ('New York'), --7
  ('Cedar Rapids'), --8
  ('Charlotte'), --9
  ('Sao Paolo'), --10
  ('London'), --11
  ('Las Vegas'), --12
  ('Mexico City'), --13
  ('Casablanca'), --14
  ('Beijing'), --15
  ('Chicago'), --16
  ('New Orleans'), --17
  ('Santiago') --18
  ;
  
INSERT INTO tickets
  (first_name, last_name, seat, departure, arrival, airline, from_city, from_country, to_city, to_country)
VALUES
  ('Jennifer', 'Finch', '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 1, 1, 4, 1),
  ('Thadeus', 'Gathercoal', '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 2, 2, 2, 11, 6),
  ('Sonja', 'Pauley', '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 3, 3, 1, 12, 1),
  ('Jennifer', 'Finch', '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 3, 4, 1, 13, 7),
  ('Waneta', 'Skeleton', '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 4, 5, 3, 14, 8),
  ('Thadeus', 'Gathercoal', '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 5, 6, 4, 15, 9),
  ('Berkie', 'Wycliff', '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 1, 7, 1, 9, 1),
  ('Alvin', 'Leathes', '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 6, 8, 1, 16, 1),
  ('Berkie', 'Wycliff', '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 6, 9, 1, 17,1),
  ('Cory', 'Squibbes', '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 7, 10, 5, 18, 10);