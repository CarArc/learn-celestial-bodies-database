--
-- PostgreSQL database dump
--

\restrict pPQ6opTl9oK8nfFyoufRGvzKoEanhlq7GzGrtFpbKmvEdiel6lti0iniTOdcoeD

-- Dumped from database version 15.16
-- Dumped by pg_dump version 15.16

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';


ALTER DATABASE universe OWNER TO postgres;

\unrestrict pPQ6opTl9oK8nfFyoufRGvzKoEanhlq7GzGrtFpbKmvEdiel6lti0iniTOdcoeD
\connect universe
\restrict pPQ6opTl9oK8nfFyoufRGvzKoEanhlq7GzGrtFpbKmvEdiel6lti0iniTOdcoeD

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: comet; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text NOT NULL,
    period_in_years integer NOT NULL,
    is_periodic boolean NOT NULL
);


ALTER TABLE public.comet OWNER TO postgres;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO postgres;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric(12,2) NOT NULL,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL
);


ALTER TABLE public.galaxy OWNER TO postgres;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO postgres;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    planet_id integer NOT NULL,
    description text NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    is_spherical boolean NOT NULL,
    distance_from_planet numeric(10,2) NOT NULL
);


ALTER TABLE public.moon OWNER TO postgres;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO postgres;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    star_id integer NOT NULL,
    description text NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    has_life boolean NOT NULL,
    planet_type character varying(30) NOT NULL
);


ALTER TABLE public.planet OWNER TO postgres;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO postgres;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_id integer NOT NULL,
    description text NOT NULL,
    temperature_in_kelvin integer NOT NULL,
    mass_in_solar_units numeric(10,2) NOT NULL,
    is_spherical boolean NOT NULL
);


ALTER TABLE public.star OWNER TO postgres;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO postgres;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.comet VALUES (1, 'Halley', 'Most famous short-period comet', 76, true);
INSERT INTO public.comet VALUES (2, 'Hale-Bopp', 'Very bright long-period comet', 2533, true);
INSERT INTO public.comet VALUES (3, 'NEOWISE', 'Comet visible in 2020', 6800, true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy', 13600, 0.00, true, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest large spiral galaxy', 10000, 2537000.00, false, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral galaxy in Local Group', 12000, 3000000.00, false, true);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Interacting grand-design spiral galaxy', 400, 23000000.00, false, true);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Galaxy with bright nucleus and dust lane', 9000, 31100000.00, false, true);
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 'Supergiant elliptical galaxy', 13000, 53000000.00, false, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 'Earth natural satellite', 4510, true, 384400.00);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 'Inner moon of Mars', 4500, false, 9376.00);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 'Outer moon of Mars', 4500, false, 23463.00);
INSERT INTO public.moon VALUES (4, 'Io', 5, 'Volcanically active moon of Jupiter', 4500, true, 421700.00);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 'Icy moon with subsurface ocean', 4500, true, 670900.00);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 'Largest moon in Solar System', 4500, true, 1070400.00);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 'Heavily cratered Jovian moon', 4500, true, 1882700.00);
INSERT INTO public.moon VALUES (8, 'Titan', 6, 'Largest moon of Saturn', 4500, true, 1221870.00);
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, 'Icy moon with plumes', 4500, true, 238042.00);
INSERT INTO public.moon VALUES (10, 'Mimas', 6, 'Small Saturnian moon', 4500, true, 185539.00);
INSERT INTO public.moon VALUES (11, 'Tethys', 6, 'Mid-sized Saturnian moon', 4500, true, 294619.00);
INSERT INTO public.moon VALUES (12, 'Dione', 6, 'Saturn moon with icy cliffs', 4500, true, 377396.00);
INSERT INTO public.moon VALUES (13, 'Rhea', 6, 'Second largest moon of Saturn', 4500, true, 527108.00);
INSERT INTO public.moon VALUES (14, 'Iapetus', 6, 'Moon with two-tone surface', 4500, true, 3560820.00);
INSERT INTO public.moon VALUES (15, 'Miranda', 7, 'Small moon of Uranus', 4500, true, 129390.00);
INSERT INTO public.moon VALUES (16, 'Ariel', 7, 'Bright moon of Uranus', 4500, true, 190900.00);
INSERT INTO public.moon VALUES (17, 'Umbriel', 7, 'Dark moon of Uranus', 4500, true, 266000.00);
INSERT INTO public.moon VALUES (18, 'Titania', 7, 'Largest moon of Uranus', 4500, true, 436300.00);
INSERT INTO public.moon VALUES (19, 'Oberon', 7, 'Outer major moon of Uranus', 4500, true, 583500.00);
INSERT INTO public.moon VALUES (20, 'Triton', 8, 'Largest moon of Neptune', 4500, true, 354759.00);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'Small rocky planet', 4500, false, 'terrestrial');
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'Hot rocky planet', 4500, false, 'terrestrial');
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'Blue planet with life', 4540, true, 'terrestrial');
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'Red rocky planet', 4500, false, 'terrestrial');
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'Largest gas giant', 4500, false, 'gas giant');
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'Gas giant with rings', 4500, false, 'gas giant');
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 'Ice giant with axial tilt', 4500, false, 'ice giant');
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 'Farthest known giant planet', 4500, false, 'ice giant');
INSERT INTO public.planet VALUES (9, 'Proxima b', 2, 'Exoplanet orbiting Proxima Centauri', 4850, false, 'terrestrial');
INSERT INTO public.planet VALUES (10, 'Sirius b-I', 3, 'Fictional planet around Sirius', 3000, false, 'gas giant');
INSERT INTO public.planet VALUES (11, 'Andromeda Prime', 4, 'Fictional planet in Andromeda system', 5200, false, 'terrestrial');
INSERT INTO public.planet VALUES (12, 'Triangulum One', 5, 'Fictional planet in Triangulum system', 4100, false, 'ice giant');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G-type main-sequence star', 5778, 1.00, true);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 'Red dwarf closest to the Sun', 3042, 0.12, true);
INSERT INTO public.star VALUES (3, 'Sirius', 1, 'Brightest star in Earth night sky', 9940, 2.06, true);
INSERT INTO public.star VALUES (4, 'Alpheratz', 2, 'Bright star associated with Andromeda', 13000, 3.80, true);
INSERT INTO public.star VALUES (5, 'M33-V1', 3, 'Variable star in Triangulum', 7000, 8.00, true);
INSERT INTO public.star VALUES (6, 'M87-Delta', 6, 'Hypothetical named star in M87', 9500, 4.20, true);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

\unrestrict pPQ6opTl9oK8nfFyoufRGvzKoEanhlq7GzGrtFpbKmvEdiel6lti0iniTOdcoeD

