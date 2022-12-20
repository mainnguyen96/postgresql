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

DROP DATABASE postgres;
--
-- Name: postgres; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE postgres OWNER TO postgres;

\connect postgres

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

--
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    play integer NOT NULL,
    user_id integer
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    name character varying(30) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (45, 889, 16);
INSERT INTO public.games VALUES (46, 77, 16);
INSERT INTO public.games VALUES (47, 944, 17);
INSERT INTO public.games VALUES (48, 851, 17);
INSERT INTO public.games VALUES (49, 641, 16);
INSERT INTO public.games VALUES (50, 16, 16);
INSERT INTO public.games VALUES (51, 323, 16);
INSERT INTO public.games VALUES (52, 1, 16);
INSERT INTO public.games VALUES (53, 898, 18);
INSERT INTO public.games VALUES (54, 996, 18);
INSERT INTO public.games VALUES (55, 74, 19);
INSERT INTO public.games VALUES (56, 727, 19);
INSERT INTO public.games VALUES (57, 344, 18);
INSERT INTO public.games VALUES (58, 417, 18);
INSERT INTO public.games VALUES (59, 618, 18);
INSERT INTO public.games VALUES (60, 960, 20);
INSERT INTO public.games VALUES (61, 558, 20);
INSERT INTO public.games VALUES (62, 798, 21);
INSERT INTO public.games VALUES (63, 924, 21);
INSERT INTO public.games VALUES (64, 968, 20);
INSERT INTO public.games VALUES (65, 366, 20);
INSERT INTO public.games VALUES (66, 217, 20);
INSERT INTO public.games VALUES (67, 411, 22);
INSERT INTO public.games VALUES (68, 597, 22);
INSERT INTO public.games VALUES (69, 912, 23);
INSERT INTO public.games VALUES (70, 947, 23);
INSERT INTO public.games VALUES (71, 274, 22);
INSERT INTO public.games VALUES (72, 814, 22);
INSERT INTO public.games VALUES (73, 179, 22);
INSERT INTO public.games VALUES (74, 379, 24);
INSERT INTO public.games VALUES (75, 787, 24);
INSERT INTO public.games VALUES (76, 268, 25);
INSERT INTO public.games VALUES (77, 691, 25);
INSERT INTO public.games VALUES (78, 780, 24);
INSERT INTO public.games VALUES (79, 247, 24);
INSERT INTO public.games VALUES (80, 142, 24);
INSERT INTO public.games VALUES (81, 203, 26);
INSERT INTO public.games VALUES (82, 550, 26);
INSERT INTO public.games VALUES (83, 36, 27);
INSERT INTO public.games VALUES (84, 911, 27);
INSERT INTO public.games VALUES (85, 174, 26);
INSERT INTO public.games VALUES (86, 275, 26);
INSERT INTO public.games VALUES (87, 160, 26);
INSERT INTO public.games VALUES (88, 412, 28);
INSERT INTO public.games VALUES (89, 497, 28);
INSERT INTO public.games VALUES (90, 776, 29);
INSERT INTO public.games VALUES (91, 683, 29);
INSERT INTO public.games VALUES (92, 380, 28);
INSERT INTO public.games VALUES (93, 229, 28);
INSERT INTO public.games VALUES (94, 588, 28);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (16, 'user_1671531347043');
INSERT INTO public.users VALUES (17, 'user_1671531347042');
INSERT INTO public.users VALUES (18, 'user_1671531553015');
INSERT INTO public.users VALUES (19, 'user_1671531553014');
INSERT INTO public.users VALUES (20, 'user_1671531597356');
INSERT INTO public.users VALUES (21, 'user_1671531597355');
INSERT INTO public.users VALUES (22, 'user_1671531623829');
INSERT INTO public.users VALUES (23, 'user_1671531623828');
INSERT INTO public.users VALUES (24, 'user_1671531691473');
INSERT INTO public.users VALUES (25, 'user_1671531691472');
INSERT INTO public.users VALUES (26, 'user_1671531719796');
INSERT INTO public.users VALUES (27, 'user_1671531719795');
INSERT INTO public.users VALUES (28, 'user_1671531759900');
INSERT INTO public.users VALUES (29, 'user_1671531759899');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 94, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 29, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

