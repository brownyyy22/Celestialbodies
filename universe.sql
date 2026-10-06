CREATE DATABASE universe;
\connect universe

CREATE TABLE galaxy (
galaxy_id SERIAL PRIMARY KEY,
name VARCHAR(50) NOT NULL UNIQUE,
galaxy_type VARCHAR(30) NOT NULL,
age_in_billions_of_years NUMERIC(4, 2) NOT NULL,
has_life BOOLEAN NOT NULL,
description TEXT NOT NULL
);

CREATE TABLE star (
star_id SERIAL PRIMARY KEY,
name VARCHAR(50) NOT NULL UNIQUE,
galaxy_id INT NOT NULL REFERENCES galaxy(galaxy_id),
spectral_type VARCHAR(10) NOT NULL,
age_in_millions_of_years INT NOT NULL,
is_spherical BOOLEAN NOT NULL
);

CREATE TABLE planet (
planet_id SERIAL PRIMARY KEY,
name VARCHAR(50) NOT NULL UNIQUE,
star_id INT NOT NULL REFERENCES star(star_id),
planet_type VARCHAR(30) NOT NULL,
age_in_millions_of_years INT NOT NULL,
distance_from_star NUMERIC(10, 2) NOT NULL,
has_life BOOLEAN NOT NULL
);

CREATE TABLE moon (
moon_id SERIAL PRIMARY KEY,
name VARCHAR(50) NOT NULL UNIQUE,
planet_id INT NOT NULL REFERENCES planet(planet_id),
diameter_in_km INT NOT NULL,
is_spherical BOOLEAN NOT NULL,
description TEXT NOT NULL
);

CREATE TABLE nebula (
nebula_id SERIAL PRIMARY KEY,
name VARCHAR(50) NOT NULL UNIQUE,
nebula_type VARCHAR(30) NOT NULL,
distance_from_earth NUMERIC(10, 2) NOT NULL,
is_visible BOOLEAN NOT NULL,
description TEXT NOT NULL
);

INSERT INTO galaxy (name, galaxy_type, age_in_billions_of_years, has_life, description) VALUES
('Milky Way', 'Spiral', 13.60, TRUE, 'The home galaxy of the Solar System.'),
('Andromeda', 'Spiral', 10.00, FALSE, 'The nearest large galaxy to the Milky Way.'),
('Triangulum', 'Spiral', 12.00, FALSE, 'A smaller spiral galaxy in the Local Group.'),
('Large Magellanic Cloud', 'Irregular', 13.20, FALSE, 'A satellite galaxy of the Milky Way.'),
('Small Magellanic Cloud', 'Irregular', 13.00, FALSE, 'A dwarf galaxy near the Milky Way.'),
('Messier 87', 'Elliptical', 13.20, FALSE, 'A giant elliptical galaxy in the Virgo Cluster.');

INSERT INTO star (name, galaxy_id, spectral_type, age_in_millions_of_years, is_spherical) VALUES
('Sun', 1, 'G2V', 4600, TRUE),
('Sirius', 1, 'A1V', 242, TRUE),
('Proxima Centauri', 1, 'M5.5Ve', 4850, TRUE),
('Vega', 1, 'A0V', 455, TRUE),
('Betelgeuse', 1, 'M1-M2', 10000, TRUE),
('Rigel', 1, 'B8Ia', 8000, TRUE);

INSERT INTO planet (name, star_id, planet_type, age_in_millions_of_years, distance_from_star, has_life) VALUES
('Mercury', 1, 'Terrestrial', 4500, 57.91, FALSE),
('Venus', 1, 'Terrestrial', 4500, 108.21, FALSE),
('Earth', 1, 'Terrestrial', 4540, 149.60, TRUE),
('Mars', 1, 'Terrestrial', 4500, 227.92, FALSE),
('Jupiter', 1, 'Gas giant', 4500, 778.57, FALSE),
('Saturn', 1, 'Gas giant', 4500, 1433.53, FALSE),
('Uranus', 1, 'Ice giant', 4500, 2872.46, FALSE),
('Neptune', 1, 'Ice giant', 4500, 4495.06, FALSE),
('Sirius b', 2, 'White dwarf', 242, 20.00, FALSE),
('Proxima b', 3, 'Terrestrial', 4850, 7.50, FALSE),
('Vega b', 4, 'Gas giant', 455, 80.00, FALSE),
('Rigel b', 6, 'Gas giant', 8000, 100.00, FALSE);

INSERT INTO moon (name, planet_id, diameter_in_km, is_spherical, description) VALUES
('Moon', 3, 3474, TRUE, 'Earthâs only natural satellite.'),
('Phobos', 4, 22, FALSE, 'The larger and innermost moon of Mars.'),
('Deimos', 4, 12, FALSE, 'The smaller and outermost moon of Mars.'),
('Io', 5, 3643, TRUE, 'A volcanically active moon of Jupiter.'),
('Europa', 5, 3122, TRUE, 'An icy moon of Jupiter.'),
('Ganymede', 5, 5268, TRUE, 'The largest moon in the Solar System.'),
('Callisto', 5, 4821, TRUE, 'A heavily cratered moon of Jupiter.'),
('Amalthea', 5, 167, FALSE, 'A small inner moon of Jupiter.'),
('Himalia', 5, 140, FALSE, 'A prograde irregular moon of Jupiter.'),
('Elara', 5, 86, FALSE, 'An irregular moon of Jupiter.'),
('Mimas', 6, 396, TRUE, 'A small icy moon of Saturn.'),
('Enceladus', 6, 504, TRUE, 'An icy moon with water-rich plumes.'),
('Tethys', 6, 1062, TRUE, 'An icy moon of Saturn.'),
('Dione', 6, 1123, TRUE, 'A moon of Saturn with bright ice cliffs.'),
('Rhea', 6, 1528, TRUE, 'The second-largest moon of Saturn.'),
('Titan', 6, 5150, TRUE, 'A moon of Saturn with a dense atmosphere.'),
('Hyperion', 6, 270, FALSE, 'A porous, irregularly shaped moon of Saturn.'),
('Iapetus', 6, 1469, TRUE, 'A moon of Saturn with contrasting hemispheres.'),
('Miranda', 7, 472, TRUE, 'An unusually varied moon of Uranus.'),
('Ariel', 7, 1158, TRUE, 'A bright icy moon of Uranus.'),
('Umbriel', 7, 1169, TRUE, 'A dark icy moon of Uranus.'),
('Titania', 7, 1578, TRUE, 'The largest moon of Uranus.'),
('Oberon', 7, 1523, TRUE, 'The outermost major moon of Uranus.'),
('Triton', 8, 2707, TRUE, 'A large retrograde moon of Neptune.');

INSERT INTO nebula (name, nebula_type, distance_from_earth, is_visible, description) VALUES
('Orion Nebula', 'Diffuse', 1344.00, TRUE, 'A stellar nursery in the constellation Orion.'),
('Crab Nebula', 'Supernova remnant', 6500.00, TRUE, 'The remnant of a supernova observed in 1054.'),
('Eagle Nebula', 'Emission', 7000.00, TRUE, 'A star-forming region that includes the Pillars of Creation.');

