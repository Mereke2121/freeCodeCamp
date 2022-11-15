--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    has_star boolean NOT NULL,
    count_asteroids numeric NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    name character varying(30) NOT NULL,
    moon_id integer NOT NULL,
    planet_id integer NOT NULL,
    has_sputnik boolean NOT NULL,
    is_gas boolean NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL,
    star_id integer NOT NULL,
    moon_count integer NOT NULL,
    is_exo boolean NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: sputnik; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.sputnik (
    name character varying(30) NOT NULL,
    sputnik_id integer NOT NULL,
    moon_id integer NOT NULL
);


ALTER TABLE public.sputnik OWNER TO freecodecamp;

--
-- Name: sputnik_sputnik_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.sputnik_sputnik_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sputnik_sputnik_id_seq OWNER TO freecodecamp;

--
-- Name: sputnik_sputnik_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.sputnik_sputnik_id_seq OWNED BY public.sputnik.sputnik_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    name character varying(30) NOT NULL,
    star_id integer NOT NULL,
    galaxy_id integer,
    planet_count integer NOT NULL,
    is_black_hole boolean NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: sputnik sputnik_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sputnik ALTER COLUMN sputnik_id SET DEFAULT nextval('public.sputnik_sputnik_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Andromeda', 2, true, 100000, 'Спиральная галакитка наблюдаемая в созвездии Андромеды');
INSERT INTO public.galaxy VALUES ('Milky Way', 1, true, 100000, 'Спиральная галактика в которой находятся Земля и Солнце');
INSERT INTO public.galaxy VALUES ('Sombrero', 4, true, 200000, 'Спиральная галактика в созвездье Девы');
INSERT INTO public.galaxy VALUES ('Black-Eye', 5, true, 200000, 'Галактика также известна как галактика Спящая Красавица');
INSERT INTO public.galaxy VALUES ('Whirpool', 6, true, 150000, 'Одна из самых известных галактик');
INSERT INTO public.galaxy VALUES ('NGC-3370', 7, true, 150000, 'Одна из самых красивых галактик');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Europa', 2, 1, false, false);
INSERT INTO public.moon VALUES ('Ganimed', 3, 1, false, false);
INSERT INTO public.moon VALUES ('Kalista', 4, 1, false, false);
INSERT INTO public.moon VALUES ('Luna', 1, 4, true, false);
INSERT INTO public.moon VALUES ('Europa-1', 5, 1, false, true);
INSERT INTO public.moon VALUES ('Europa-2', 6, 1, false, true);
INSERT INTO public.moon VALUES ('Europa-3', 7, 1, false, true);
INSERT INTO public.moon VALUES ('Ganimed-1', 8, 2, false, true);
INSERT INTO public.moon VALUES ('Ganimed-2', 9, 2, false, true);
INSERT INTO public.moon VALUES ('Ganimed-3', 10, 2, false, true);
INSERT INTO public.moon VALUES ('Kalista-1', 11, 3, false, true);
INSERT INTO public.moon VALUES ('Kalista-2', 12, 3, false, true);
INSERT INTO public.moon VALUES ('Kalista-3', 13, 3, false, true);
INSERT INTO public.moon VALUES ('Gimalia', 14, 3, false, true);
INSERT INTO public.moon VALUES ('Amaltea', 15, 3, false, true);
INSERT INTO public.moon VALUES ('Io', 16, 3, false, true);
INSERT INTO public.moon VALUES ('Elara', 17, 3, false, true);
INSERT INTO public.moon VALUES ('Pasife', 18, 3, false, true);
INSERT INTO public.moon VALUES ('Sinope', 19, 3, false, true);
INSERT INTO public.moon VALUES ('Ananke', 20, 3, false, true);
INSERT INTO public.moon VALUES ('Leda', 21, 3, false, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Uran', 3, 1, 27, false);
INSERT INTO public.planet VALUES ('Saturn', 2, 1, 82, false);
INSERT INTO public.planet VALUES ('Jupiter', 1, 1, 79, false);
INSERT INTO public.planet VALUES ('Kepler-388', 5, 2, 21, false);
INSERT INTO public.planet VALUES ('Mars', 6, 1, 12, false);
INSERT INTO public.planet VALUES ('Venera', 7, 1, 12, false);
INSERT INTO public.planet VALUES ('Merkuriy', 8, 1, 12, false);
INSERT INTO public.planet VALUES ('Neptun', 9, 1, 12, false);
INSERT INTO public.planet VALUES ('Pluton', 10, 1, 12, false);
INSERT INTO public.planet VALUES ('Kelt-9', 11, 1, 12, false);
INSERT INTO public.planet VALUES ('Kelt-10', 12, 1, 12, false);
INSERT INTO public.planet VALUES ('Earth', 4, 1, 1, true);


--
-- Data for Name: sputnik; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.sputnik VALUES ('Sputnik-1', 1, 1);
INSERT INTO public.sputnik VALUES ('Explorer-1', 2, 1);
INSERT INTO public.sputnik VALUES ('Ariel-1', 3, 1);
INSERT INTO public.sputnik VALUES ('San-Marco-1', 4, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('Sun', 1, 1, 9, false);
INSERT INTO public.star VALUES ('Sirius', 2, 2, 100, false);
INSERT INTO public.star VALUES ('Kanopus', 5, 4, 150, false);
INSERT INTO public.star VALUES ('Magnetar', 6, 2, 0, false);
INSERT INTO public.star VALUES ('TON-618', 7, 2, 0, true);
INSERT INTO public.star VALUES ('IC-1101', 8, 2, 0, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: sputnik_sputnik_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.sputnik_sputnik_id_seq', 4, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: sputnik sputnik_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sputnik
    ADD CONSTRAINT sputnik_name UNIQUE (name);


--
-- Name: sputnik sputnik_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sputnik
    ADD CONSTRAINT sputnik_pkey PRIMARY KEY (sputnik_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: sputnik sputnik_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sputnik
    ADD CONSTRAINT sputnik_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

