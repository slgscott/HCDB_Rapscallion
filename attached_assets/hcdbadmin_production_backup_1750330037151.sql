--
-- PostgreSQL database dump
--

-- Dumped from database version 16.9
-- Dumped by pg_dump version 16.5

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
-- Name: drizzle; Type: SCHEMA; Schema: -; Owner: neondb_owner
--

CREATE SCHEMA drizzle;


ALTER SCHEMA drizzle OWNER TO neondb_owner;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: __drizzle_migrations; Type: TABLE; Schema: drizzle; Owner: neondb_owner
--

CREATE TABLE drizzle.__drizzle_migrations (
    id integer NOT NULL,
    hash text NOT NULL,
    created_at bigint
);


ALTER TABLE drizzle.__drizzle_migrations OWNER TO neondb_owner;

--
-- Name: __drizzle_migrations_id_seq; Type: SEQUENCE; Schema: drizzle; Owner: neondb_owner
--

CREATE SEQUENCE drizzle.__drizzle_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE drizzle.__drizzle_migrations_id_seq OWNER TO neondb_owner;

--
-- Name: __drizzle_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: drizzle; Owner: neondb_owner
--

ALTER SEQUENCE drizzle.__drizzle_migrations_id_seq OWNED BY drizzle.__drizzle_migrations.id;


--
-- Name: api_settings; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.api_settings (
    id integer NOT NULL,
    data_type text NOT NULL,
    source_url text NOT NULL,
    api_key text,
    notes text,
    is_default boolean DEFAULT false,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.api_settings OWNER TO neondb_owner;

--
-- Name: api_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.api_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.api_settings_id_seq OWNER TO neondb_owner;

--
-- Name: api_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.api_settings_id_seq OWNED BY public.api_settings.id;


--
-- Name: crossing_times; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.crossing_times (
    id integer NOT NULL,
    date text NOT NULL,
    safe_from_1 text,
    safe_to_1 text,
    safe_from_2 text,
    safe_to_2 text,
    unsafe_from_1 text,
    unsafe_to_1 text,
    unsafe_from_2 text,
    unsafe_to_2 text,
    status text DEFAULT 'active'::text NOT NULL,
    notes text,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.crossing_times OWNER TO neondb_owner;

--
-- Name: crossing_times_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.crossing_times_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.crossing_times_id_seq OWNER TO neondb_owner;

--
-- Name: crossing_times_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.crossing_times_id_seq OWNED BY public.crossing_times.id;


--
-- Name: tide_data; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.tide_data (
    id integer NOT NULL,
    date text NOT NULL,
    high_tide_1_time text,
    high_tide_1_height real,
    low_tide_1_time text,
    low_tide_1_height real,
    high_tide_2_time text,
    high_tide_2_height real,
    low_tide_2_time text,
    low_tide_2_height real,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.tide_data OWNER TO neondb_owner;

--
-- Name: tide_data_backup_2025-06-16T10-01-22-509Z; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public."tide_data_backup_2025-06-16T10-01-22-509Z" (
    id integer,
    date text,
    high_tide_1_time text,
    high_tide_1_height real,
    low_tide_1_time text,
    low_tide_1_height real,
    high_tide_2_time text,
    high_tide_2_height real,
    low_tide_2_time text,
    low_tide_2_height real,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public."tide_data_backup_2025-06-16T10-01-22-509Z" OWNER TO neondb_owner;

--
-- Name: tide_data_backup_2025-06-16T10-01-44-757Z; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public."tide_data_backup_2025-06-16T10-01-44-757Z" (
    id integer,
    date text,
    high_tide_1_time text,
    high_tide_1_height real,
    low_tide_1_time text,
    low_tide_1_height real,
    high_tide_2_time text,
    high_tide_2_height real,
    low_tide_2_time text,
    low_tide_2_height real,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public."tide_data_backup_2025-06-16T10-01-44-757Z" OWNER TO neondb_owner;

--
-- Name: tide_data_backup_2025-06-16T10-04-09-926Z; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public."tide_data_backup_2025-06-16T10-04-09-926Z" (
    id integer,
    date text,
    high_tide_1_time text,
    high_tide_1_height real,
    low_tide_1_time text,
    low_tide_1_height real,
    high_tide_2_time text,
    high_tide_2_height real,
    low_tide_2_time text,
    low_tide_2_height real,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public."tide_data_backup_2025-06-16T10-04-09-926Z" OWNER TO neondb_owner;

--
-- Name: tide_data_backup_2025-06-16T10-09-21-128Z; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public."tide_data_backup_2025-06-16T10-09-21-128Z" (
    id integer,
    date text,
    high_tide_1_time text,
    high_tide_1_height real,
    low_tide_1_time text,
    low_tide_1_height real,
    high_tide_2_time text,
    high_tide_2_height real,
    low_tide_2_time text,
    low_tide_2_height real,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public."tide_data_backup_2025-06-16T10-09-21-128Z" OWNER TO neondb_owner;

--
-- Name: tide_data_backup_2025-06-16T11-43-26-751Z; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public."tide_data_backup_2025-06-16T11-43-26-751Z" (
    id integer,
    date text,
    high_tide_1_time text,
    high_tide_1_height real,
    low_tide_1_time text,
    low_tide_1_height real,
    high_tide_2_time text,
    high_tide_2_height real,
    low_tide_2_time text,
    low_tide_2_height real,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public."tide_data_backup_2025-06-16T11-43-26-751Z" OWNER TO neondb_owner;

--
-- Name: tide_data_backup_2025-06-16T12-19-54-764Z; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public."tide_data_backup_2025-06-16T12-19-54-764Z" (
    id integer,
    date text,
    high_tide_1_time text,
    high_tide_1_height real,
    low_tide_1_time text,
    low_tide_1_height real,
    high_tide_2_time text,
    high_tide_2_height real,
    low_tide_2_time text,
    low_tide_2_height real,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public."tide_data_backup_2025-06-16T12-19-54-764Z" OWNER TO neondb_owner;

--
-- Name: tide_data_backup_2025-06-16T12-33-29-771Z; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public."tide_data_backup_2025-06-16T12-33-29-771Z" (
    id integer,
    date text,
    high_tide_1_time text,
    high_tide_1_height real,
    low_tide_1_time text,
    low_tide_1_height real,
    high_tide_2_time text,
    high_tide_2_height real,
    low_tide_2_time text,
    low_tide_2_height real,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public."tide_data_backup_2025-06-16T12-33-29-771Z" OWNER TO neondb_owner;

--
-- Name: tide_data_backup_2025-06-16T12-35-27-682Z; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public."tide_data_backup_2025-06-16T12-35-27-682Z" (
    id integer,
    date text,
    high_tide_1_time text,
    high_tide_1_height real,
    low_tide_1_time text,
    low_tide_1_height real,
    high_tide_2_time text,
    high_tide_2_height real,
    low_tide_2_time text,
    low_tide_2_height real,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public."tide_data_backup_2025-06-16T12-35-27-682Z" OWNER TO neondb_owner;

--
-- Name: tide_data_backup_2025-06-16T16-01-18-918Z; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public."tide_data_backup_2025-06-16T16-01-18-918Z" (
    id integer,
    date text,
    high_tide_1_time text,
    high_tide_1_height real,
    low_tide_1_time text,
    low_tide_1_height real,
    high_tide_2_time text,
    high_tide_2_height real,
    low_tide_2_time text,
    low_tide_2_height real,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public."tide_data_backup_2025-06-16T16-01-18-918Z" OWNER TO neondb_owner;

--
-- Name: tide_data_backup_2025-06-17T05-52-48-005Z; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public."tide_data_backup_2025-06-17T05-52-48-005Z" (
    id integer,
    date text,
    high_tide_1_time text,
    high_tide_1_height real,
    low_tide_1_time text,
    low_tide_1_height real,
    high_tide_2_time text,
    high_tide_2_height real,
    low_tide_2_time text,
    low_tide_2_height real,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public."tide_data_backup_2025-06-17T05-52-48-005Z" OWNER TO neondb_owner;

--
-- Name: tide_data_backup_2025-06-18T11-56-45-187Z; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public."tide_data_backup_2025-06-18T11-56-45-187Z" (
    id integer,
    date text,
    high_tide_1_time text,
    high_tide_1_height real,
    low_tide_1_time text,
    low_tide_1_height real,
    high_tide_2_time text,
    high_tide_2_height real,
    low_tide_2_time text,
    low_tide_2_height real,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public."tide_data_backup_2025-06-18T11-56-45-187Z" OWNER TO neondb_owner;

--
-- Name: tide_data_backup_2025-06-18T15-17-24-035Z; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public."tide_data_backup_2025-06-18T15-17-24-035Z" (
    id integer,
    date text,
    high_tide_1_time text,
    high_tide_1_height real,
    low_tide_1_time text,
    low_tide_1_height real,
    high_tide_2_time text,
    high_tide_2_height real,
    low_tide_2_time text,
    low_tide_2_height real,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public."tide_data_backup_2025-06-18T15-17-24-035Z" OWNER TO neondb_owner;

--
-- Name: tide_data_backup_2025-06-18T23-03-54-049Z; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public."tide_data_backup_2025-06-18T23-03-54-049Z" (
    id integer,
    date text,
    high_tide_1_time text,
    high_tide_1_height real,
    low_tide_1_time text,
    low_tide_1_height real,
    high_tide_2_time text,
    high_tide_2_height real,
    low_tide_2_time text,
    low_tide_2_height real,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public."tide_data_backup_2025-06-18T23-03-54-049Z" OWNER TO neondb_owner;

--
-- Name: tide_data_backup_2025-06-19T02-16-36-497Z; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public."tide_data_backup_2025-06-19T02-16-36-497Z" (
    id integer,
    date text,
    high_tide_1_time text,
    high_tide_1_height real,
    low_tide_1_time text,
    low_tide_1_height real,
    high_tide_2_time text,
    high_tide_2_height real,
    low_tide_2_time text,
    low_tide_2_height real,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public."tide_data_backup_2025-06-19T02-16-36-497Z" OWNER TO neondb_owner;

--
-- Name: tide_data_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.tide_data_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tide_data_id_seq OWNER TO neondb_owner;

--
-- Name: tide_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.tide_data_id_seq OWNED BY public.tide_data.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username text NOT NULL,
    password text NOT NULL
);


ALTER TABLE public.users OWNER TO neondb_owner;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO neondb_owner;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: weather_data; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.weather_data (
    id integer NOT NULL,
    date text NOT NULL,
    temperature integer,
    condition text,
    description text,
    wind_speed integer,
    humidity integer,
    wind_direction text,
    temperature_min real,
    temperature_max real,
    precipitation_sum real,
    wind_speed_max real,
    wind_direction_dominant integer,
    uv_index_max real,
    source text,
    cloudcover integer,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.weather_data OWNER TO neondb_owner;

--
-- Name: weather_data_backup_2025-06-15T14-19-00-898Z; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public."weather_data_backup_2025-06-15T14-19-00-898Z" (
    id integer,
    date text,
    temperature integer,
    condition text,
    description text,
    wind_speed integer,
    humidity integer,
    wind_direction text,
    temperature_min real,
    temperature_max real,
    precipitation_sum real,
    wind_speed_max real,
    wind_direction_dominant integer,
    uv_index_max real,
    source text,
    cloudcover integer
);


ALTER TABLE public."weather_data_backup_2025-06-15T14-19-00-898Z" OWNER TO neondb_owner;

--
-- Name: weather_data_backup_2025-06-15T14-32-41-487Z; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public."weather_data_backup_2025-06-15T14-32-41-487Z" (
    id integer,
    date text,
    temperature integer,
    condition text,
    description text,
    wind_speed integer,
    humidity integer,
    wind_direction text,
    temperature_min real,
    temperature_max real,
    precipitation_sum real,
    wind_speed_max real,
    wind_direction_dominant integer,
    uv_index_max real,
    source text,
    cloudcover integer
);


ALTER TABLE public."weather_data_backup_2025-06-15T14-32-41-487Z" OWNER TO neondb_owner;

--
-- Name: weather_data_backup_2025-06-15T20-42-37-793Z; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public."weather_data_backup_2025-06-15T20-42-37-793Z" (
    id integer,
    date text,
    temperature integer,
    condition text,
    description text,
    wind_speed integer,
    humidity integer,
    wind_direction text,
    temperature_min real,
    temperature_max real,
    precipitation_sum real,
    wind_speed_max real,
    wind_direction_dominant integer,
    uv_index_max real,
    source text,
    cloudcover integer
);


ALTER TABLE public."weather_data_backup_2025-06-15T20-42-37-793Z" OWNER TO neondb_owner;

--
-- Name: weather_data_backup_2025-06-15T21-37-00-411Z; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public."weather_data_backup_2025-06-15T21-37-00-411Z" (
    id integer,
    date text,
    temperature integer,
    condition text,
    description text,
    wind_speed integer,
    humidity integer,
    wind_direction text,
    temperature_min real,
    temperature_max real,
    precipitation_sum real,
    wind_speed_max real,
    wind_direction_dominant integer,
    uv_index_max real,
    source text,
    cloudcover integer
);


ALTER TABLE public."weather_data_backup_2025-06-15T21-37-00-411Z" OWNER TO neondb_owner;

--
-- Name: weather_data_backup_2025-06-16T09-31-12-359Z; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public."weather_data_backup_2025-06-16T09-31-12-359Z" (
    id integer,
    date text,
    temperature integer,
    condition text,
    description text,
    wind_speed integer,
    humidity integer,
    wind_direction text,
    temperature_min real,
    temperature_max real,
    precipitation_sum real,
    wind_speed_max real,
    wind_direction_dominant integer,
    uv_index_max real,
    source text,
    cloudcover integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public."weather_data_backup_2025-06-16T09-31-12-359Z" OWNER TO neondb_owner;

--
-- Name: weather_data_backup_2025-06-16T09-34-48-021Z; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public."weather_data_backup_2025-06-16T09-34-48-021Z" (
    id integer,
    date text,
    temperature integer,
    condition text,
    description text,
    wind_speed integer,
    humidity integer,
    wind_direction text,
    temperature_min real,
    temperature_max real,
    precipitation_sum real,
    wind_speed_max real,
    wind_direction_dominant integer,
    uv_index_max real,
    source text,
    cloudcover integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public."weather_data_backup_2025-06-16T09-34-48-021Z" OWNER TO neondb_owner;

--
-- Name: weather_data_backup_2025-06-16T09-41-59-262Z; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public."weather_data_backup_2025-06-16T09-41-59-262Z" (
    id integer,
    date text,
    temperature integer,
    condition text,
    description text,
    wind_speed integer,
    humidity integer,
    wind_direction text,
    temperature_min real,
    temperature_max real,
    precipitation_sum real,
    wind_speed_max real,
    wind_direction_dominant integer,
    uv_index_max real,
    source text,
    cloudcover integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public."weather_data_backup_2025-06-16T09-41-59-262Z" OWNER TO neondb_owner;

--
-- Name: weather_data_backup_2025-06-16T09-48-22-840Z; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public."weather_data_backup_2025-06-16T09-48-22-840Z" (
    id integer,
    date text,
    temperature integer,
    condition text,
    description text,
    wind_speed integer,
    humidity integer,
    wind_direction text,
    temperature_min real,
    temperature_max real,
    precipitation_sum real,
    wind_speed_max real,
    wind_direction_dominant integer,
    uv_index_max real,
    source text,
    cloudcover integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public."weather_data_backup_2025-06-16T09-48-22-840Z" OWNER TO neondb_owner;

--
-- Name: weather_data_backup_2025-06-16T09-52-11-991Z; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public."weather_data_backup_2025-06-16T09-52-11-991Z" (
    id integer,
    date text,
    temperature integer,
    condition text,
    description text,
    wind_speed integer,
    humidity integer,
    wind_direction text,
    temperature_min real,
    temperature_max real,
    precipitation_sum real,
    wind_speed_max real,
    wind_direction_dominant integer,
    uv_index_max real,
    source text,
    cloudcover integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public."weather_data_backup_2025-06-16T09-52-11-991Z" OWNER TO neondb_owner;

--
-- Name: weather_data_backup_2025-06-16T09-54-23-427Z; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public."weather_data_backup_2025-06-16T09-54-23-427Z" (
    id integer,
    date text,
    temperature integer,
    condition text,
    description text,
    wind_speed integer,
    humidity integer,
    wind_direction text,
    temperature_min real,
    temperature_max real,
    precipitation_sum real,
    wind_speed_max real,
    wind_direction_dominant integer,
    uv_index_max real,
    source text,
    cloudcover integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public."weather_data_backup_2025-06-16T09-54-23-427Z" OWNER TO neondb_owner;

--
-- Name: weather_data_backup_2025-06-16T11-43-14-408Z; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public."weather_data_backup_2025-06-16T11-43-14-408Z" (
    id integer,
    date text,
    temperature integer,
    condition text,
    description text,
    wind_speed integer,
    humidity integer,
    wind_direction text,
    temperature_min real,
    temperature_max real,
    precipitation_sum real,
    wind_speed_max real,
    wind_direction_dominant integer,
    uv_index_max real,
    source text,
    cloudcover integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public."weather_data_backup_2025-06-16T11-43-14-408Z" OWNER TO neondb_owner;

--
-- Name: weather_data_backup_2025-06-16T12-19-30-393Z; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public."weather_data_backup_2025-06-16T12-19-30-393Z" (
    id integer,
    date text,
    temperature integer,
    condition text,
    description text,
    wind_speed integer,
    humidity integer,
    wind_direction text,
    temperature_min real,
    temperature_max real,
    precipitation_sum real,
    wind_speed_max real,
    wind_direction_dominant integer,
    uv_index_max real,
    source text,
    cloudcover integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public."weather_data_backup_2025-06-16T12-19-30-393Z" OWNER TO neondb_owner;

--
-- Name: weather_data_backup_2025-06-16T12-22-29-449Z; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public."weather_data_backup_2025-06-16T12-22-29-449Z" (
    id integer,
    date text,
    temperature integer,
    condition text,
    description text,
    wind_speed integer,
    humidity integer,
    wind_direction text,
    temperature_min real,
    temperature_max real,
    precipitation_sum real,
    wind_speed_max real,
    wind_direction_dominant integer,
    uv_index_max real,
    source text,
    cloudcover integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public."weather_data_backup_2025-06-16T12-22-29-449Z" OWNER TO neondb_owner;

--
-- Name: weather_data_backup_2025-06-16T12-29-12-248Z; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public."weather_data_backup_2025-06-16T12-29-12-248Z" (
    id integer,
    date text,
    temperature integer,
    condition text,
    description text,
    wind_speed integer,
    humidity integer,
    wind_direction text,
    temperature_min real,
    temperature_max real,
    precipitation_sum real,
    wind_speed_max real,
    wind_direction_dominant integer,
    uv_index_max real,
    source text,
    cloudcover integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public."weather_data_backup_2025-06-16T12-29-12-248Z" OWNER TO neondb_owner;

--
-- Name: weather_data_backup_2025-06-16T16-00-07-866Z; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public."weather_data_backup_2025-06-16T16-00-07-866Z" (
    id integer,
    date text,
    temperature integer,
    condition text,
    description text,
    wind_speed integer,
    humidity integer,
    wind_direction text,
    temperature_min real,
    temperature_max real,
    precipitation_sum real,
    wind_speed_max real,
    wind_direction_dominant integer,
    uv_index_max real,
    source text,
    cloudcover integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public."weather_data_backup_2025-06-16T16-00-07-866Z" OWNER TO neondb_owner;

--
-- Name: weather_data_backup_2025-06-16T17-15-01-227Z; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public."weather_data_backup_2025-06-16T17-15-01-227Z" (
    id integer,
    date text,
    temperature integer,
    condition text,
    description text,
    wind_speed integer,
    humidity integer,
    wind_direction text,
    temperature_min real,
    temperature_max real,
    precipitation_sum real,
    wind_speed_max real,
    wind_direction_dominant integer,
    uv_index_max real,
    source text,
    cloudcover integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public."weather_data_backup_2025-06-16T17-15-01-227Z" OWNER TO neondb_owner;

--
-- Name: weather_data_backup_2025-06-17T05-52-24-877Z; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public."weather_data_backup_2025-06-17T05-52-24-877Z" (
    id integer,
    date text,
    temperature integer,
    condition text,
    description text,
    wind_speed integer,
    humidity integer,
    wind_direction text,
    temperature_min real,
    temperature_max real,
    precipitation_sum real,
    wind_speed_max real,
    wind_direction_dominant integer,
    uv_index_max real,
    source text,
    cloudcover integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public."weather_data_backup_2025-06-17T05-52-24-877Z" OWNER TO neondb_owner;

--
-- Name: weather_data_backup_2025-06-17T11-16-24-980Z; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public."weather_data_backup_2025-06-17T11-16-24-980Z" (
    id integer,
    date text,
    temperature integer,
    condition text,
    description text,
    wind_speed integer,
    humidity integer,
    wind_direction text,
    temperature_min real,
    temperature_max real,
    precipitation_sum real,
    wind_speed_max real,
    wind_direction_dominant integer,
    uv_index_max real,
    source text,
    cloudcover integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public."weather_data_backup_2025-06-17T11-16-24-980Z" OWNER TO neondb_owner;

--
-- Name: weather_data_backup_2025-06-17T17-15-36-079Z; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public."weather_data_backup_2025-06-17T17-15-36-079Z" (
    id integer,
    date text,
    temperature integer,
    condition text,
    description text,
    wind_speed integer,
    humidity integer,
    wind_direction text,
    temperature_min real,
    temperature_max real,
    precipitation_sum real,
    wind_speed_max real,
    wind_direction_dominant integer,
    uv_index_max real,
    source text,
    cloudcover integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public."weather_data_backup_2025-06-17T17-15-36-079Z" OWNER TO neondb_owner;

--
-- Name: weather_data_backup_2025-06-18T05-16-18-465Z; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public."weather_data_backup_2025-06-18T05-16-18-465Z" (
    id integer,
    date text,
    temperature integer,
    condition text,
    description text,
    wind_speed integer,
    humidity integer,
    wind_direction text,
    temperature_min real,
    temperature_max real,
    precipitation_sum real,
    wind_speed_max real,
    wind_direction_dominant integer,
    uv_index_max real,
    source text,
    cloudcover integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public."weather_data_backup_2025-06-18T05-16-18-465Z" OWNER TO neondb_owner;

--
-- Name: weather_data_backup_2025-06-18T11-16-22-169Z; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public."weather_data_backup_2025-06-18T11-16-22-169Z" (
    id integer,
    date text,
    temperature integer,
    condition text,
    description text,
    wind_speed integer,
    humidity integer,
    wind_direction text,
    temperature_min real,
    temperature_max real,
    precipitation_sum real,
    wind_speed_max real,
    wind_direction_dominant integer,
    uv_index_max real,
    source text,
    cloudcover integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public."weather_data_backup_2025-06-18T11-16-22-169Z" OWNER TO neondb_owner;

--
-- Name: weather_data_backup_2025-06-18T15-17-46-590Z; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public."weather_data_backup_2025-06-18T15-17-46-590Z" (
    id integer,
    date text,
    temperature integer,
    condition text,
    description text,
    wind_speed integer,
    humidity integer,
    wind_direction text,
    temperature_min real,
    temperature_max real,
    precipitation_sum real,
    wind_speed_max real,
    wind_direction_dominant integer,
    uv_index_max real,
    source text,
    cloudcover integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public."weather_data_backup_2025-06-18T15-17-46-590Z" OWNER TO neondb_owner;

--
-- Name: weather_data_backup_2025-06-18T17-16-17-302Z; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public."weather_data_backup_2025-06-18T17-16-17-302Z" (
    id integer,
    date text,
    temperature integer,
    condition text,
    description text,
    wind_speed integer,
    humidity integer,
    wind_direction text,
    temperature_min real,
    temperature_max real,
    precipitation_sum real,
    wind_speed_max real,
    wind_direction_dominant integer,
    uv_index_max real,
    source text,
    cloudcover integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public."weather_data_backup_2025-06-18T17-16-17-302Z" OWNER TO neondb_owner;

--
-- Name: weather_data_backup_2025-06-18T18-24-22-136Z; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public."weather_data_backup_2025-06-18T18-24-22-136Z" (
    id integer,
    date text,
    temperature integer,
    condition text,
    description text,
    wind_speed integer,
    humidity integer,
    wind_direction text,
    temperature_min real,
    temperature_max real,
    precipitation_sum real,
    wind_speed_max real,
    wind_direction_dominant integer,
    uv_index_max real,
    source text,
    cloudcover integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public."weather_data_backup_2025-06-18T18-24-22-136Z" OWNER TO neondb_owner;

--
-- Name: weather_data_backup_2025-06-18T19-14-04-295Z; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public."weather_data_backup_2025-06-18T19-14-04-295Z" (
    id integer,
    date text,
    temperature integer,
    condition text,
    description text,
    wind_speed integer,
    humidity integer,
    wind_direction text,
    temperature_min real,
    temperature_max real,
    precipitation_sum real,
    wind_speed_max real,
    wind_direction_dominant integer,
    uv_index_max real,
    source text,
    cloudcover integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public."weather_data_backup_2025-06-18T19-14-04-295Z" OWNER TO neondb_owner;

--
-- Name: weather_data_backup_2025-06-18T19-36-52-480Z; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public."weather_data_backup_2025-06-18T19-36-52-480Z" (
    id integer,
    date text,
    temperature integer,
    condition text,
    description text,
    wind_speed integer,
    humidity integer,
    wind_direction text,
    temperature_min real,
    temperature_max real,
    precipitation_sum real,
    wind_speed_max real,
    wind_direction_dominant integer,
    uv_index_max real,
    source text,
    cloudcover integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public."weather_data_backup_2025-06-18T19-36-52-480Z" OWNER TO neondb_owner;

--
-- Name: weather_data_backup_2025-06-18T19-44-03-926Z; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public."weather_data_backup_2025-06-18T19-44-03-926Z" (
    id integer,
    date text,
    temperature integer,
    condition text,
    description text,
    wind_speed integer,
    humidity integer,
    wind_direction text,
    temperature_min real,
    temperature_max real,
    precipitation_sum real,
    wind_speed_max real,
    wind_direction_dominant integer,
    uv_index_max real,
    source text,
    cloudcover integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public."weather_data_backup_2025-06-18T19-44-03-926Z" OWNER TO neondb_owner;

--
-- Name: weather_data_backup_2025-06-18T22-18-47-673Z; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public."weather_data_backup_2025-06-18T22-18-47-673Z" (
    id integer,
    date text,
    temperature integer,
    condition text,
    description text,
    wind_speed integer,
    humidity integer,
    wind_direction text,
    temperature_min real,
    temperature_max real,
    precipitation_sum real,
    wind_speed_max real,
    wind_direction_dominant integer,
    uv_index_max real,
    source text,
    cloudcover integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public."weather_data_backup_2025-06-18T22-18-47-673Z" OWNER TO neondb_owner;

--
-- Name: weather_data_backup_2025-06-18T23-03-29-447Z; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public."weather_data_backup_2025-06-18T23-03-29-447Z" (
    id integer,
    date text,
    temperature integer,
    condition text,
    description text,
    wind_speed integer,
    humidity integer,
    wind_direction text,
    temperature_min real,
    temperature_max real,
    precipitation_sum real,
    wind_speed_max real,
    wind_direction_dominant integer,
    uv_index_max real,
    source text,
    cloudcover integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public."weather_data_backup_2025-06-18T23-03-29-447Z" OWNER TO neondb_owner;

--
-- Name: weather_data_backup_2025-06-18T23-06-26-245Z; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public."weather_data_backup_2025-06-18T23-06-26-245Z" (
    id integer,
    date text,
    temperature integer,
    condition text,
    description text,
    wind_speed integer,
    humidity integer,
    wind_direction text,
    temperature_min real,
    temperature_max real,
    precipitation_sum real,
    wind_speed_max real,
    wind_direction_dominant integer,
    uv_index_max real,
    source text,
    cloudcover integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public."weather_data_backup_2025-06-18T23-06-26-245Z" OWNER TO neondb_owner;

--
-- Name: weather_data_backup_2025-06-18T23-15-39-214Z; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public."weather_data_backup_2025-06-18T23-15-39-214Z" (
    id integer,
    date text,
    temperature integer,
    condition text,
    description text,
    wind_speed integer,
    humidity integer,
    wind_direction text,
    temperature_min real,
    temperature_max real,
    precipitation_sum real,
    wind_speed_max real,
    wind_direction_dominant integer,
    uv_index_max real,
    source text,
    cloudcover integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public."weather_data_backup_2025-06-18T23-15-39-214Z" OWNER TO neondb_owner;

--
-- Name: weather_data_backup_2025-06-18T23-26-47-639Z; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public."weather_data_backup_2025-06-18T23-26-47-639Z" (
    id integer,
    date text,
    temperature integer,
    condition text,
    description text,
    wind_speed integer,
    humidity integer,
    wind_direction text,
    temperature_min real,
    temperature_max real,
    precipitation_sum real,
    wind_speed_max real,
    wind_direction_dominant integer,
    uv_index_max real,
    source text,
    cloudcover integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public."weather_data_backup_2025-06-18T23-26-47-639Z" OWNER TO neondb_owner;

--
-- Name: weather_data_backup_2025-06-18T23-58-08-507Z; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public."weather_data_backup_2025-06-18T23-58-08-507Z" (
    id integer,
    date text,
    temperature integer,
    condition text,
    description text,
    wind_speed integer,
    humidity integer,
    wind_direction text,
    temperature_min real,
    temperature_max real,
    precipitation_sum real,
    wind_speed_max real,
    wind_direction_dominant integer,
    uv_index_max real,
    source text,
    cloudcover integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public."weather_data_backup_2025-06-18T23-58-08-507Z" OWNER TO neondb_owner;

--
-- Name: weather_data_backup_2025-06-19T05-40-51-184Z; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public."weather_data_backup_2025-06-19T05-40-51-184Z" (
    id integer,
    date text,
    temperature integer,
    condition text,
    description text,
    wind_speed integer,
    humidity integer,
    wind_direction text,
    temperature_min real,
    temperature_max real,
    precipitation_sum real,
    wind_speed_max real,
    wind_direction_dominant integer,
    uv_index_max real,
    source text,
    cloudcover integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public."weather_data_backup_2025-06-19T05-40-51-184Z" OWNER TO neondb_owner;

--
-- Name: weather_data_backup_2025-06-19T07-29-39-984Z; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public."weather_data_backup_2025-06-19T07-29-39-984Z" (
    id integer,
    date text,
    temperature integer,
    condition text,
    description text,
    wind_speed integer,
    humidity integer,
    wind_direction text,
    temperature_min real,
    temperature_max real,
    precipitation_sum real,
    wind_speed_max real,
    wind_direction_dominant integer,
    uv_index_max real,
    source text,
    cloudcover integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public."weather_data_backup_2025-06-19T07-29-39-984Z" OWNER TO neondb_owner;

--
-- Name: weather_data_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.weather_data_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.weather_data_id_seq OWNER TO neondb_owner;

--
-- Name: weather_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.weather_data_id_seq OWNED BY public.weather_data.id;


--
-- Name: __drizzle_migrations id; Type: DEFAULT; Schema: drizzle; Owner: neondb_owner
--

ALTER TABLE ONLY drizzle.__drizzle_migrations ALTER COLUMN id SET DEFAULT nextval('drizzle.__drizzle_migrations_id_seq'::regclass);


--
-- Name: api_settings id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.api_settings ALTER COLUMN id SET DEFAULT nextval('public.api_settings_id_seq'::regclass);


--
-- Name: crossing_times id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.crossing_times ALTER COLUMN id SET DEFAULT nextval('public.crossing_times_id_seq'::regclass);


--
-- Name: tide_data id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.tide_data ALTER COLUMN id SET DEFAULT nextval('public.tide_data_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: weather_data id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.weather_data ALTER COLUMN id SET DEFAULT nextval('public.weather_data_id_seq'::regclass);


--
-- Data for Name: __drizzle_migrations; Type: TABLE DATA; Schema: drizzle; Owner: neondb_owner
--

COPY drizzle.__drizzle_migrations (id, hash, created_at) FROM stdin;
\.


--
-- Data for Name: api_settings; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.api_settings (id, data_type, source_url, api_key, notes, is_default, created_at, updated_at) FROM stdin;
8	tide_data	https://admiraltyapi.azure-api.net/	3d7c92648eed4d15a5b175c5fe90a7d7	UK Hydrographic Office (UKHO) V2 API - Valid subscription key	t	2025-06-10 21:31:56.297862	2025-06-10 21:57:51.302
1	crossing_times	https://www.northumberland.gov.uk/Roads/Roads-traffic-and-parking/Holy-Island.aspx	\N	Northumberland County Council - No direct API available. Manual extraction from official PDF documents. Authentication: None required (public government data).	f	2025-06-10 19:41:59.264972	2025-06-10 21:16:55.708
4	crossing_times	https://holyislandcrossingtimes.northumberland.gov.uk/	\N	Northumberland County Council - No direct API available. Manual extraction from official PDF documents. Authentication: None required (public government data).	f	2025-06-10 21:16:55.881006	2025-06-10 21:17:09.151
5	crossing_times	https://holyislandcrossingtimes.northumberland.gov.uk/	\N	Northumberland County Council - No direct API available. Manual extraction from official PDF documents. Authentication: None required (public government data).	t	2025-06-10 21:17:09.322526	2025-06-10 21:17:09.284
9	weather_data	https://api.open-meteo.com/	\N	Open-Meteo API - Free weather forecasting service with comprehensive daily forecast data including temperature ranges, precipitation, wind, and UV index. No API key required.	t	2025-06-10 22:54:27.24764	2025-06-10 23:04:32.439
3	weather_data	https://api.open-meteo.com/	\N	Open-Meteo API - Free weather forecasting service with comprehensive daily forecast data including temperature ranges, precipitation, wind, and UV index. No API key required.	f	2025-06-10 19:41:59.264972	2025-06-10 23:04:37.843
2	tide_data	https://admiraltyapi.portal.azure-api.net/	\N	UK Hydrographic Office (UKHO) - API key required (subscription-based). Documentation: https://www.admiralty.co.uk/ukho/developer-portal	f	2025-06-10 19:41:59.264972	2025-06-10 21:29:21.781
6	tide_data	https://admiraltyapi.portal.azure-api.net/	rgb-MGZ!tey4kqc5fdn	UK Hydrographic Office (UKHO) - API key required (subscription-based). Documentation: https://www.admiralty.co.uk/ukho/developer-portal	f	2025-06-10 21:29:21.951944	2025-06-10 21:30:24.475
7	tide_data	https://admiraltyapi.portal.azure-api.net/	rgb-MGZ!tey4kqc5fdn	UK Hydrographic Office (UKHO) - API key required (subscription-based). Documentation: https://www.admiralty.co.uk/ukho/developer-portal	f	2025-06-10 21:30:24.64234	2025-06-10 21:31:56.129
\.


--
-- Data for Name: crossing_times; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.crossing_times (id, date, safe_from_1, safe_to_1, safe_from_2, safe_to_2, unsafe_from_1, unsafe_to_1, unsafe_from_2, unsafe_to_2, status, notes, created_at, updated_at) FROM stdin;
31	2025-07-01	10:45	18:25	22:45	06:40	18:25	22:45	06:40	11:20	active	Official Northumberland County Council data	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
32	2025-07-02	11:20	19:20	23:15	07:40	19:20	23:15	07:40	11:50	active	Official Northumberland County Council data	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
33	2025-07-03	11:50	20:20	23:50	08:40	20:20	23:50	08:40	12:30	active	Official Northumberland County Council data	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
34	2025-07-04	12:30	21:15	00:40	09:40	21:15	00:40	09:40	13:20	active	Official Northumberland County Council data	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
35	2025-07-05	00:40	09:40	13:20	22:10	09:40	13:20	22:10	01:40	active	Official Northumberland County Council data	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
36	2025-07-06	01:40	10:45	14:20	23:05	10:45	14:20	23:05	02:50	active	Official Northumberland County Council data	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
37	2025-07-07	02:50	11:40	15:35	23:55	11:40	15:35	23:55	04:00	active	Official Northumberland County Council data	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
38	2025-07-08	04:00	12:30	16:40	00:40	12:30	16:40	00:40	05:10	active	Official Northumberland County Council data	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
39	2025-07-09	05:10	13:05	17:40	01:15	13:05	17:40	01:15	06:05	active	Official Northumberland County Council data	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
40	2025-07-10	06:05	13:40	18:40	01:45	13:40	18:40	01:45	07:00	active	Official Northumberland County Council data	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
41	2025-07-11	07:00	14:15	19:25	02:20	14:15	19:25	02:20	07:45	active	Official Northumberland County Council data	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
42	2025-07-12	07:45	14:50	20:15	02:55	14:50	20:15	02:55	08:30	active	Official Northumberland County Council data	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
43	2025-07-13	08:30	15:25	20:55	03:30	15:25	20:55	03:30	09:10	active	Official Northumberland County Council data	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
44	2025-07-14	09:10	16:05	21:35	04:10	16:05	21:35	04:10	09:50	active	Official Northumberland County Council data	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
45	2025-07-15	09:50	16:50	22:10	04:55	16:50	22:10	04:55	10:25	active	Official Northumberland County Council data	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
46	2025-07-16	10:25	17:40	22:45	05:40	17:40	22:45	05:40	11:05	active	Official Northumberland County Council data	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
47	2025-07-17	11:05	18:30	23:10	06:25	18:30	23:10	06:25	11:45	active	Official Northumberland County Council data	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
48	2025-07-18	11:45	19:20	23:35	07:15	19:20	23:35	07:15	12:25	active	Official Northumberland County Council data	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
49	2025-07-19	00:00	08:00	12:25	20:10	08:00	12:25	20:10	00:15	active	Official Northumberland County Council data	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
50	2025-07-20	00:15	08:45	13:10	21:00	08:45	13:10	21:00	01:00	active	Official Northumberland County Council data	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
51	2025-07-21	01:00	09:35	14:00	21:50	09:35	14:00	21:50	01:50	active	Official Northumberland County Council data	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
52	2025-07-22	01:50	10:25	15:15	22:35	10:25	15:15	22:35	02:55	active	Official Northumberland County Council data	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
53	2025-07-23	02:55	11:25	16:15	23:55	11:25	16:15	23:55	04:55	active	Official Northumberland County Council data	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
54	2025-07-24	04:55	12:20	17:40	00:45	12:20	17:40	00:45	06:10	active	Official Northumberland County Council data	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
55	2025-07-25	06:10	13:10	18:50	01:25	13:10	18:50	01:25	07:15	active	Official Northumberland County Council data	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
1	2025-06-01	10:20	18:05	22:40	06:25	18:05	22:40	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:27:37.816
3	2025-06-03	11:45	20:20	\N	\N	20:20	00:00	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:27:38.086
4	2025-06-04	00:00	08:35	12:35	21:20	08:35	12:35	21:20	00:55	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:27:38.218
5	2025-06-05	00:55	09:35	13:30	22:20	09:35	13:30	22:20	02:00	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:27:38.354
6	2025-06-06	02:00	10:35	14:35	23:10	10:35	14:35	23:10	03:05	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:27:38.486
7	2025-06-07	03:05	11:25	15:35	23:50	11:25	15:35	23:50	04:00	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:27:38.618
8	2025-06-08	04:00	12:10	16:30	00:25	12:10	16:30	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:27:38.749
9	2025-06-09	04:55	12:45	17:25	01:00	12:45	17:25	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:27:38.88
10	2025-06-10	05:45	13:25	18:10	01:30	13:25	18:10	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:27:39.014
12	2025-06-12	07:15	14:35	19:35	02:40	14:35	19:35	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:27:39.277
13	2025-06-13	07:50	15:10	20:15	03:15	15:10	20:15	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:27:39.409
14	2025-06-14	08:25	15:50	20:50	04:00	15:50	20:50	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:27:39.54
15	2025-06-15	09:00	16:35	21:25	04:40	16:35	21:25	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:27:39.67
18	2025-06-18	11:00	19:10	23:30	07:15	19:10	23:30	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 12:38:31.864
21	2025-06-21	01:40	09:25	14:10	22:15	09:25	14:10	22:15	02:55	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 12:38:32.251
16	2025-06-16	09:35	17:20	22:05	05:25	17:20	22:05	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 12:38:31.606
17	2025-06-17	10:15	18:15	22:45	06:20	18:15	22:45	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 12:38:31.735
23	2025-06-23	04:10	11:20	16:45	00:00	11:20	16:45	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:27:40.722
24	2025-06-24	05:20	12:15	18:00	00:45	12:15	18:00	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:27:40.854
25	2025-06-25	06:25	13:05	19:05	01:30	13:05	19:05	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:27:40.986
26	2025-06-26	07:25	13:55	20:00	02:20	13:55	20:00	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:27:41.118
27	2025-06-27	08:15	14:50	20:45	03:10	14:50	20:45	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:27:41.248
28	2025-06-28	09:00	15:40	21:25	04:00	15:40	21:25	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:27:41.38
30	2025-06-30	10:15	17:30	22:20	05:45	17:30	22:20	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:27:41.643
19	2025-06-19	11:55	20:15	\N	\N	20:15	00:30	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 12:38:31.994
56	2025-07-26	07:15	13:50	19:45	02:10	13:50	19:45	02:10	08:10	active	Official Northumberland County Council data	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
57	2025-07-27	08:10	14:35	20:30	02:50	14:35	20:30	02:50	08:55	active	Official Northumberland County Council data	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
58	2025-07-28	08:55	15:20	21:05	03:35	15:20	21:05	03:35	09:30	active	Official Northumberland County Council data	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
59	2025-07-29	09:30	16:05	21:30	04:20	16:05	21:30	04:20	10:00	active	Official Northumberland County Council data	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
60	2025-07-30	10:00	16:50	21:50	05:05	16:50	21:50	05:05	10:30	active	Official Northumberland County Council data	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
61	2025-07-31	10:30	17:40	22:15	05:50	17:40	22:15	05:50	11:05	active	Official Northumberland County Council data	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
62	2025-08-01	11:05	19:15	23:00	07:45	19:15	23:00	07:45	11:30	active	Official Northumberland County Council data	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
63	2025-08-02	11:30	20:15	23:40	08:50	20:15	23:40	08:50	12:15	active	Official Northumberland County Council data	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
64	2025-08-03	12:15	21:15	00:35	10:00	21:15	00:35	10:00	13:15	active	Official Northumberland County Council data	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
65	2025-08-04	00:35	10:00	13:15	22:20	10:00	13:15	22:20	01:45	active	Official Northumberland County Council data	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
66	2025-08-05	01:45	11:15	14:40	23:25	11:15	14:40	23:25	03:10	active	Official Northumberland County Council data	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
67	2025-08-06	03:10	12:10	16:05	00:15	12:10	16:05	00:15	04:35	active	Official Northumberland County Council data	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
68	2025-08-07	04:35	12:45	17:20	00:55	12:45	17:20	00:55	05:50	active	Official Northumberland County Council data	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
69	2025-08-08	05:50	13:20	18:25	01:25	13:20	18:25	01:25	06:50	active	Official Northumberland County Council data	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
70	2025-08-09	06:50	13:45	19:25	01:55	13:45	19:25	01:55	07:45	active	Official Northumberland County Council data	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
71	2025-08-10	07:45	14:20	20:15	02:20	14:20	20:15	02:20	08:35	active	Official Northumberland County Council data	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
72	2025-08-11	08:35	14:50	21:00	02:55	14:50	21:00	02:55	09:20	active	Official Northumberland County Council data	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
73	2025-08-12	09:20	15:30	21:35	03:35	15:30	21:35	03:35	10:00	active	Official Northumberland County Council data	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
74	2025-08-13	10:00	16:15	22:10	04:20	16:15	22:10	04:20	10:30	active	Official Northumberland County Council data	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
75	2025-08-14	10:30	17:05	22:35	05:10	17:05	22:35	05:10	11:00	active	Official Northumberland County Council data	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
76	2025-08-15	11:00	18:00	23:00	06:15	18:00	23:00	06:15	11:25	active	Official Northumberland County Council data	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
77	2025-08-16	11:25	19:05	23:30	07:25	19:05	23:30	07:25	12:00	active	Official Northumberland County Council data	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
78	2025-08-17	12:00	20:25	00:20	08:55	20:25	00:20	08:55	13:05	active	Official Northumberland County Council data	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
79	2025-08-18	00:20	08:55	13:05	21:45	08:55	13:05	21:45	01:40	active	Official Northumberland County Council data	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
80	2025-08-19	01:40	10:25	14:35	23:00	10:25	14:35	23:00	03:15	active	Official Northumberland County Council data	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
81	2025-08-20	03:15	11:35	16:15	23:55	11:35	16:15	23:55	04:50	active	Official Northumberland County Council data	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
82	2025-08-21	04:50	12:25	17:35	00:40	12:25	17:35	00:40	06:10	active	Official Northumberland County Council data	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
83	2025-08-22	06:10	13:05	18:40	01:15	13:05	18:40	01:15	07:10	active	Official Northumberland County Council data	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
84	2025-08-23	07:10	13:40	19:30	01:45	13:40	19:30	01:45	08:00	active	Official Northumberland County Council data	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
85	2025-08-24	08:00	14:15	20:05	02:25	14:15	20:05	02:25	08:40	active	Official Northumberland County Council data	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
86	2025-08-25	08:40	14:55	20:35	03:15	14:55	20:35	03:15	09:15	active	Official Northumberland County Council data	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
87	2025-08-26	09:15	15:40	21:00	04:00	15:40	21:00	04:00	09:50	active	Official Northumberland County Council data	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
88	2025-08-27	09:50	16:20	21:25	04:45	16:20	21:25	04:45	10:20	active	Official Northumberland County Council data	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
89	2025-08-28	10:20	17:00	21:50	05:30	17:00	21:50	05:30	10:55	active	Official Northumberland County Council data	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
90	2025-08-29	10:55	17:45	22:10	06:15	17:45	22:10	06:15	11:25	active	Official Northumberland County Council data	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
91	2025-08-30	11:25	18:25	22:30	07:00	18:25	22:30	07:00	11:55	active	Official Northumberland County Council data	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
92	2025-08-31	11:55	19:05	22:50	07:40	19:05	22:50	07:40	12:25	active	Official Northumberland County Council data	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
93	2025-06-15	09:00	16:35	21:25	04:40	16:35	21:25	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:27:39.67
132	2025-09-01	11:20	20:30	23:45	09:20	20:30	23:45	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
133	2025-09-02	12:25	21:40	\N	\N	21:40	00:55	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
134	2025-09-03	00:55	10:40	13:55	22:50	10:40	13:55	22:50	02:30	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
135	2025-09-04	02:30	11:40	15:40	23:50	11:40	15:40	23:50	04:05	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
136	2025-09-05	04:05	12:20	17:00	00:25	12:20	17:00	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
137	2025-09-06	05:25	12:45	18:15	00:50	12:45	18:15	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
138	2025-09-07	06:35	13:15	19:15	01:15	13:15	19:15	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
139	2025-09-08	07:35	13:45	20:10	01:45	13:45	20:10	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
140	2025-09-09	08:30	14:15	20:50	02:20	14:15	20:50	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
141	2025-09-10	09:15	14:55	21:30	03:00	14:55	21:30	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
142	2025-09-11	09:55	15:45	21:55	03:50	15:45	21:55	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
143	2025-09-12	10:25	16:35	22:15	04:50	16:35	22:15	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
144	2025-09-13	10:45	17:35	22:35	06:00	17:35	22:35	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
145	2025-09-14	11:05	18:45	23:05	07:25	18:45	23:05	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
146	2025-09-15	11:40	20:10	\N	\N	20:10	00:00	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
147	2025-09-16	00:00	09:00	12:55	21:35	09:00	12:55	21:35	01:25	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
148	2025-09-17	01:25	10:30	14:35	22:50	10:30	14:35	22:50	03:10	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
149	2025-09-18	03:10	11:35	16:15	23:45	11:35	16:15	23:45	04:45	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
150	2025-09-19	04:45	12:15	17:30	00:20	12:15	17:30	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
151	2025-09-20	05:55	12:50	18:25	00:55	12:50	18:25	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
152	2025-09-21	06:55	13:20	19:05	01:25	13:20	19:05	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
153	2025-09-22	07:35	13:50	19:40	02:00	13:50	19:40	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
154	2025-09-23	08:10	14:20	20:05	02:35	14:20	20:05	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
155	2025-09-24	08:35	14:55	20:30	03:10	14:55	20:30	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
156	2025-09-25	08:55	15:30	20:50	03:50	15:30	20:50	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
157	2025-09-26	09:10	16:10	21:15	04:35	16:10	21:15	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
158	2025-09-27	09:30	16:55	21:30	05:25	16:55	21:30	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
159	2025-09-28	09:45	17:45	21:55	06:20	17:45	21:55	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
160	2025-09-29	10:10	18:40	22:20	07:25	18:40	22:20	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
161	2025-09-30	10:45	19:45	23:05	08:40	19:45	23:05	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
162	2026-02-01	05:25	12:05	17:55	00:25	12:05	17:55	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
163	2026-02-02	06:30	12:45	18:55	01:10	12:45	18:55	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
164	2026-02-03	07:20	13:20	19:50	01:50	13:20	19:50	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
165	2026-02-04	08:00	14:05	20:30	02:40	14:05	20:30	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
166	2026-02-05	08:25	14:50	21:00	03:25	14:50	21:00	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
167	2026-02-06	08:45	15:35	21:20	04:10	15:35	21:20	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
168	2026-02-07	09:00	16:25	21:35	05:00	16:25	21:35	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
169	2026-02-08	09:15	17:20	21:50	05:50	17:20	21:50	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
170	2026-02-09	09:35	18:20	22:10	06:50	18:20	22:10	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
171	2026-02-10	10:10	19:30	22:45	07:55	19:30	22:45	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
172	2026-02-11	10:55	20:45	23:40	09:05	20:45	23:40	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
173	2026-02-12	12:05	22:05	\N	\N	22:05	01:10	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
174	2026-02-13	01:10	10:25	13:45	23:10	10:25	13:45	23:10	02:50	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
175	2026-02-14	02:50	11:20	15:15	23:45	11:20	15:15	23:45	04:05	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
176	2026-02-15	04:05	11:55	16:30	00:15	11:55	16:30	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
177	2026-02-16	05:05	12:20	17:30	00:40	12:20	17:30	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
178	2026-02-17	06:00	12:45	18:25	01:10	12:45	18:25	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
179	2026-02-18	06:50	13:10	19:10	01:40	13:10	19:10	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
180	2026-02-19	07:30	13:40	19:55	02:10	13:40	19:55	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
181	2026-02-20	08:05	14:15	20:30	02:50	14:15	20:30	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
182	2026-02-21	08:40	14:50	21:05	03:35	14:50	21:05	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
183	2026-02-22	09:05	15:40	21:30	04:25	15:40	21:30	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
184	2026-02-23	09:25	16:35	21:55	05:25	16:35	21:55	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
185	2026-02-24	09:50	17:40	22:20	06:35	17:40	22:20	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
186	2026-02-25	10:25	19:05	23:05	08:00	19:05	23:05	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
187	2026-02-26	11:30	20:45	\N	\N	20:45	00:30	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
188	2026-02-27	00:30	09:25	13:10	22:10	09:25	13:10	22:10	02:20	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
189	2026-02-28	02:20	10:35	14:55	23:05	10:35	14:55	23:05	03:55	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
190	2025-11-01	00:20	09:10	13:25	21:15	09:10	13:25	21:15	01:50	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
191	2025-11-02	01:50	10:00	14:55	22:00	10:00	14:55	22:00	03:15	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
192	2025-11-03	03:15	10:35	16:15	22:35	10:35	16:15	22:35	04:35	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
193	2025-11-04	04:35	11:05	17:20	23:10	11:05	17:20	23:10	05:45	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
194	2025-11-05	05:45	11:40	18:15	23:45	11:40	18:15	23:45	06:45	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
195	2025-11-06	06:45	12:20	19:05	00:30	12:20	19:05	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
196	2025-11-07	07:40	13:10	19:45	01:25	13:10	19:45	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
197	2025-11-08	08:20	14:00	20:20	02:25	14:00	20:20	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
198	2025-11-09	08:50	14:55	20:45	03:30	14:55	20:45	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
199	2025-11-10	09:15	16:05	21:15	04:45	16:05	21:15	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
200	2025-11-11	09:45	17:15	22:00	06:05	17:15	22:00	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
201	2025-11-12	10:30	18:35	22:55	07:25	18:35	22:55	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
202	2025-11-13	11:30	19:45	\N	\N	19:45	00:05	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
203	2025-11-14	00:05	08:40	12:45	20:50	08:40	12:45	20:50	01:20	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
204	2025-11-15	01:20	09:40	14:00	21:45	09:40	14:00	21:45	02:30	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
205	2025-11-16	02:30	10:25	15:05	22:30	10:25	15:05	22:30	03:30	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
206	2025-11-17	03:30	11:00	16:00	23:10	11:00	16:00	23:10	04:25	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
207	2025-11-18	04:25	11:35	16:45	23:45	11:35	16:45	23:45	05:10	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
208	2025-11-19	05:10	12:00	17:25	00:20	12:00	17:25	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
209	2025-11-20	05:45	12:30	18:00	00:55	12:30	18:00	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
210	2025-11-21	06:20	13:00	18:30	01:30	13:00	18:30	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
211	2025-11-22	06:50	13:35	19:00	02:10	13:35	19:00	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
212	2025-11-23	07:20	14:15	19:30	02:50	14:15	19:30	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
213	2025-11-24	07:45	14:55	19:55	03:35	14:55	19:55	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
214	2025-11-25	08:15	15:40	20:25	04:25	15:40	20:25	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
215	2025-11-26	08:45	16:30	20:55	05:15	16:30	20:55	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
216	2025-11-27	09:20	17:25	21:35	06:15	17:25	21:35	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
217	2025-11-28	10:10	18:25	22:35	07:20	18:25	22:35	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
218	2025-11-29	11:20	19:30	23:45	08:25	19:30	23:45	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
219	2025-11-30	12:45	20:30	\N	\N	20:30	01:05	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
220	2025-12-01	01:05	09:20	14:05	21:20	09:20	14:05	21:20	02:30	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
221	2025-12-02	02:30	10:05	15:25	22:05	10:05	15:25	22:05	03:50	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
222	2025-12-03	03:50	10:45	16:35	22:55	10:45	16:35	22:55	05:05	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
223	2025-12-04	05:05	11:25	17:35	23:40	11:25	17:35	23:40	06:15	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
224	2025-12-05	06:15	12:10	18:30	00:25	12:10	18:30	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
225	2025-12-06	07:10	12:55	19:20	01:20	12:55	19:20	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
226	2025-12-07	07:55	13:50	20:05	02:20	13:50	20:05	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
227	2025-12-08	08:35	14:45	20:45	03:20	14:45	20:45	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
228	2025-12-09	09:05	15:45	21:20	04:25	15:45	21:20	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
229	2025-12-10	09:35	16:50	22:00	05:35	16:50	22:00	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
230	2025-12-11	10:10	17:55	22:40	06:45	17:55	22:40	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
231	2025-12-12	10:50	19:00	23:30	07:50	19:00	23:30	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
232	2025-12-13	11:40	20:05	\N	\N	20:05	00:20	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
233	2025-12-14	00:20	08:55	12:40	21:05	08:55	12:40	21:05	01:20	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
234	2025-12-15	01:20	09:50	13:45	22:05	09:50	13:45	22:05	02:20	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
235	2025-12-16	02:20	10:35	14:50	22:50	10:35	14:50	22:50	03:20	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
236	2025-12-17	03:20	11:10	15:50	23:35	11:10	15:50	23:35	04:15	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
237	2025-12-18	04:15	11:45	16:40	00:10	11:45	16:40	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
238	2025-12-19	05:05	12:15	17:25	00:45	12:15	17:25	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
239	2025-12-20	05:50	12:50	18:10	01:20	12:50	18:10	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
240	2025-12-21	06:30	13:25	18:45	01:55	13:25	18:45	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
241	2025-12-22	07:05	14:00	19:20	02:30	14:00	19:20	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
242	2025-12-23	07:40	14:35	19:55	03:10	14:35	19:55	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
243	2025-12-24	08:10	15:15	20:25	03:55	15:15	20:25	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
244	2025-12-25	08:45	15:55	21:00	04:45	15:55	21:00	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
245	2025-12-26	09:20	16:45	21:40	05:35	16:45	21:40	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
246	2025-12-27	10:00	17:35	22:20	06:35	17:35	22:20	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
247	2025-12-28	10:50	18:35	23:15	07:40	18:35	23:15	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
248	2025-12-29	11:55	19:45	\N	\N	19:45	00:20	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
249	2025-12-30	00:20	08:45	13:05	20:55	08:45	13:05	20:55	01:40	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
250	2026-01-01	03:05	10:35	15:45	22:50	10:35	15:45	22:50	04:25	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
251	2026-01-02	04:25	11:25	17:00	23:40	11:25	17:00	23:40	05:45	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
252	2026-01-03	05:45	12:05	18:05	00:30	12:05	18:05	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
253	2026-01-04	06:45	12:50	19:05	01:20	12:50	19:05	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
254	2026-01-05	07:40	13:40	20:00	02:10	13:40	20:00	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
255	2026-01-06	08:20	14:25	20:40	03:05	14:25	20:40	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
256	2026-01-07	08:50	15:20	21:15	04:00	15:20	21:15	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
257	2026-01-08	09:15	16:15	21:45	04:55	16:15	21:45	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
258	2026-01-09	09:35	17:10	22:15	05:50	17:10	22:15	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
259	2026-01-10	10:00	18:10	22:40	06:50	18:10	22:40	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
260	2026-01-11	10:30	19:10	23:15	07:50	19:10	23:15	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
261	2026-01-12	11:15	20:20	23:55	08:50	20:20	23:55	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
262	2026-01-13	12:15	21:25	\N	\N	21:25	01:00	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
263	2026-01-14	01:00	09:55	13:25	22:30	09:55	13:25	22:30	02:15	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
264	2026-01-15	02:15	10:50	14:50	23:25	10:50	14:50	23:25	03:30	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
265	2026-01-16	03:30	11:35	16:00	00:00	11:35	16:00	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
266	2026-01-17	04:30	12:10	17:00	00:35	12:10	17:00	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
267	2026-01-18	05:25	12:40	17:50	01:05	12:40	17:50	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
268	2026-01-19	06:15	13:10	18:35	01:35	13:10	18:35	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
269	2026-01-20	07:00	13:40	19:20	02:05	13:40	19:20	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
270	2026-01-21	07:35	14:10	19:55	02:45	14:10	19:55	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
271	2026-01-22	08:15	14:45	20:30	03:25	14:45	20:30	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
272	2026-01-23	08:45	15:25	21:05	04:10	15:25	21:05	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
273	2026-01-24	09:15	16:05	21:35	05:00	16:05	21:35	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
274	2026-01-25	09:45	17:00	22:10	05:55	17:00	22:10	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
275	2026-01-26	10:20	18:00	22:45	07:00	18:00	22:45	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
276	2026-01-27	11:05	19:15	23:40	08:15	19:15	23:40	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
277	2026-01-28	12:10	20:40	\N	\N	20:40	00:55	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
278	2026-01-29	00:55	09:30	13:35	22:00	09:30	13:35	22:00	02:30	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
279	2026-01-30	02:30	10:35	15:10	23:00	10:35	15:10	23:00	04:05	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
280	2026-01-31	04:05	11:25	16:40	23:45	11:25	16:40	23:45	05:25	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
281	2025-10-01	11:45	20:55	\N	\N	20:55	00:15	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
282	2025-10-02	00:15	10:00	13:20	22:10	10:00	13:20	22:10	01:50	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
283	2025-10-03	01:50	11:00	15:05	23:05	11:00	15:05	23:05	03:30	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
284	2025-10-04	03:30	11:40	16:35	23:45	11:40	16:35	23:45	04:55	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
285	2025-10-05	04:55	12:10	17:50	00:10	12:10	17:50	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
286	2025-10-06	06:10	12:40	18:55	00:40	12:40	18:55	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
287	2025-10-07	07:15	13:10	19:50	01:10	13:10	19:50	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
288	2025-10-08	08:15	13:45	20:35	01:50	13:45	20:35	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
289	2025-10-09	09:05	14:30	21:10	02:35	14:30	21:10	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
290	2025-10-10	09:40	15:20	21:40	03:35	15:20	21:40	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
291	2025-10-11	10:05	16:15	22:00	04:40	16:15	22:00	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
292	2025-10-12	10:30	17:15	22:20	05:55	17:15	22:20	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
293	2025-10-13	10:50	18:30	22:55	07:20	18:30	22:55	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
294	2025-10-14	11:35	19:55	\N	\N	19:55	00:00	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
295	2025-10-15	00:00	08:55	12:50	21:20	08:55	12:50	21:20	01:25	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
296	2025-10-16	01:25	10:15	14:25	22:30	10:15	14:25	22:30	03:00	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
297	2025-10-17	03:00	11:10	15:50	23:20	11:10	15:50	23:20	04:20	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
298	2025-10-18	04:20	11:55	17:00	00:00	11:55	17:00	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
299	2025-10-19	05:25	12:25	17:50	00:30	12:25	17:50	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
300	2025-10-20	06:15	12:55	18:30	01:05	12:55	18:30	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
301	2025-10-21	06:55	13:25	19:05	01:35	13:25	19:05	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
302	2025-10-22	07:30	13:55	19:35	02:10	13:55	19:35	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
303	2025-10-23	07:55	14:25	20:00	02:50	14:25	20:00	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
304	2025-10-24	08:20	15:00	20:25	03:30	15:00	20:25	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
305	2025-10-25	08:40	15:40	\N	\N	15:40	20:50	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
306	2025-10-26	08:00	15:20	20:10	04:00	15:20	20:10	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
307	2025-10-27	08:25	16:05	20:30	04:50	16:05	20:30	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
308	2025-10-28	08:50	17:00	21:00	05:50	17:00	21:00	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
309	2025-10-29	09:30	18:05	21:45	07:00	18:05	21:45	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
310	2025-10-30	10:25	19:15	22:50	08:10	19:15	22:50	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
311	2025-10-31	11:50	20:20	\N	\N	20:20	00:20	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:17:47.884401
2	2025-06-02	11:00	19:10	23:15	07:30	19:10	23:15	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:27:37.952
11	2025-06-11	06:30	14:00	18:55	02:05	14:00	18:55	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:27:39.145
333	2026-03-22	08:25	14:30	20:55	03:10	14:30	20:55	\N	\N	active	Official data from Northumberland County Council	2025-06-16 16:03:35.573055	2025-06-16 16:03:35.573055
29	2025-06-29	09:45	16:35	21:55	04:55	16:35	21:55	\N	\N	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 09:27:41.512
334	2026-03-23	08:50	15:20	21:20	04:05	15:20	21:20	\N	\N	active	Official data from Northumberland County Council	2025-06-16 16:03:35.633608	2025-06-16 16:03:35.633608
335	2026-03-24	09:10	16:25	21:40	05:05	16:25	21:40	\N	\N	active	Official data from Northumberland County Council	2025-06-16 16:03:35.694258	2025-06-16 16:03:35.694258
336	2026-03-25	09:30	17:40	22:05	06:20	17:40	22:05	\N	\N	active	Official data from Northumberland County Council	2025-06-16 16:03:35.756111	2025-06-16 16:03:35.756111
20	2025-06-20	00:30	08:20	12:55	21:20	08:20	12:55	21:20	01:40	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 12:38:32.123
22	2025-06-22	02:55	10:25	15:25	23:10	10:25	15:25	23:10	04:10	active	Official data from Northumberland County Council	2025-06-16 09:17:43.870369	2025-06-16 12:38:32.38
312	2026-03-01	03:55	11:20	16:30	23:45	11:20	16:30	23:45	05:10	active	Official data from Northumberland County Council	2025-06-16 16:03:34.226286	2025-06-16 16:03:34.226286
313	2026-03-02	05:10	11:55	17:40	00:20	11:55	17:40	\N	\N	active	Official data from Northumberland County Council	2025-06-16 16:03:34.3017	2025-06-16 16:03:34.3017
314	2026-03-03	06:05	12:25	18:40	00:55	12:25	18:40	\N	\N	active	Official data from Northumberland County Council	2025-06-16 16:03:34.362102	2025-06-16 16:03:34.362102
315	2026-03-04	06:50	13:00	19:25	01:30	13:00	19:25	\N	\N	active	Official data from Northumberland County Council	2025-06-16 16:03:34.428445	2025-06-16 16:03:34.428445
316	2026-03-05	07:25	13:40	20:00	02:10	13:40	20:00	\N	\N	active	Official data from Northumberland County Council	2025-06-16 16:03:34.497366	2025-06-16 16:03:34.497366
317	2026-03-06	07:50	14:25	20:25	02:50	14:25	20:25	\N	\N	active	Official data from Northumberland County Council	2025-06-16 16:03:34.558114	2025-06-16 16:03:34.558114
318	2026-03-07	08:10	15:05	20:45	03:30	15:05	20:45	\N	\N	active	Official data from Northumberland County Council	2025-06-16 16:03:34.62853	2025-06-16 16:03:34.62853
319	2026-03-08	08:30	15:50	20:55	04:15	15:50	20:55	\N	\N	active	Official data from Northumberland County Council	2025-06-16 16:03:34.694002	2025-06-16 16:03:34.694002
320	2026-03-09	08:40	16:40	21:10	05:05	16:40	21:10	\N	\N	active	Official data from Northumberland County Council	2025-06-16 16:03:34.755159	2025-06-16 16:03:34.755159
321	2026-03-10	09:00	17:40	21:25	06:00	17:40	21:25	\N	\N	active	Official data from Northumberland County Council	2025-06-16 16:03:34.824054	2025-06-16 16:03:34.824054
322	2026-03-11	09:25	18:45	21:55	07:05	18:45	21:55	\N	\N	active	Official data from Northumberland County Council	2025-06-16 16:03:34.885948	2025-06-16 16:03:34.885948
323	2026-03-12	10:05	20:10	22:45	08:25	20:10	22:45	\N	\N	active	Official data from Northumberland County Council	2025-06-16 16:03:34.94713	2025-06-16 16:03:34.94713
324	2026-03-13	11:05	21:30	\N	\N	21:30	00:15	\N	\N	active	Official data from Northumberland County Council	2025-06-16 16:03:35.016256	2025-06-16 16:03:35.016256
325	2026-03-14	00:15	09:35	12:40	22:35	09:35	12:40	22:35	02:00	active	Official data from Northumberland County Council	2025-06-16 16:03:35.081589	2025-06-16 16:03:35.081589
326	2026-03-15	02:00	10:45	14:25	23:15	10:45	14:25	23:15	03:25	active	Official data from Northumberland County Council	2025-06-16 16:03:35.14408	2025-06-16 16:03:35.14408
327	2026-03-16	03:25	11:25	15:50	23:45	11:25	15:50	23:45	04:35	active	Official data from Northumberland County Council	2025-06-16 16:03:35.206339	2025-06-16 16:03:35.206339
328	2026-03-17	04:35	11:50	16:55	00:10	11:50	16:55	\N	\N	active	Official data from Northumberland County Council	2025-06-16 16:03:35.268107	2025-06-16 16:03:35.268107
329	2026-03-18	05:35	12:15	17:55	00:35	12:15	17:55	\N	\N	active	Official data from Northumberland County Council	2025-06-16 16:03:35.329909	2025-06-16 16:03:35.329909
330	2026-03-19	06:30	12:40	18:50	01:05	12:40	18:50	\N	\N	active	Official data from Northumberland County Council	2025-06-16 16:03:35.390408	2025-06-16 16:03:35.390408
331	2026-03-20	07:15	13:10	19:40	01:40	13:10	19:40	\N	\N	active	Official data from Northumberland County Council	2025-06-16 16:03:35.451119	2025-06-16 16:03:35.451119
332	2026-03-21	07:55	13:45	20:20	02:20	13:45	20:20	\N	\N	active	Official data from Northumberland County Council	2025-06-16 16:03:35.511778	2025-06-16 16:03:35.511778
337	2026-03-26	10:10	19:10	22:55	07:50	19:10	22:55	\N	\N	active	Official data from Northumberland County Council	2025-06-16 16:03:35.817381	2025-06-16 16:03:35.817381
338	2026-03-27	11:20	20:45	\N	\N	20:45	00:30	\N	\N	active	Official data from Northumberland County Council	2025-06-16 16:03:35.878885	2025-06-16 16:03:35.878885
339	2026-03-28	00:30	09:15	13:05	22:05	09:15	13:05	\N	\N	active	Official data from Northumberland County Council	2025-06-16 16:03:35.940118	2025-06-16 16:03:35.940118
340	2026-03-29	\N	\N	15:45	23:55	11:20	15:45	23:55	04:40	active	Official data from Northumberland County Council	2025-06-16 16:03:36.001375	2025-06-16 16:03:36.001375
341	2026-03-30	04:40	12:05	17:10	00:30	12:05	17:10	\N	\N	active	Official data from Northumberland County Council	2025-06-16 16:03:36.062335	2025-06-16 16:03:36.062335
342	2026-03-31	05:45	12:35	18:15	01:00	12:35	18:15	\N	\N	active	Official data from Northumberland County Council	2025-06-16 16:03:36.122715	2025-06-16 16:03:36.122715
\.


--
-- Data for Name: tide_data; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.tide_data (id, date, high_tide_1_time, high_tide_1_height, low_tide_1_time, low_tide_1_height, high_tide_2_time, high_tide_2_height, low_tide_2_time, low_tide_2_height, created_at, updated_at) FROM stdin;
1	2025-06-08	00:41	4.071488	06:29	1.3456054	12:57	4.1406527	18:46	1.1245996	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
2	2025-06-09	01:20	4.216587	07:10	1.2093074	13:39	4.228235	19:24	1.0779684	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
17	2025-06-10	01:56	4.3376217	07:48	1.0916008	14:18	4.2969484	20:01	1.0497234	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
18	2025-06-11	02:30	4.426628	08:25	0.99673903	14:57	4.342666	20:36	1.0416696	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
19	2025-06-12	03:05	4.483977	09:03	0.9251522	15:34	4.3644185	21:13	1.0530246	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
20	2025-06-13	03:39	4.511834	09:40	0.87837785	16:12	4.359773	21:49	1.0851328	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
21	2025-06-14	04:15	4.511162	10:20	0.85941005	16:52	4.3254757	22:29	1.139692	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
22	2025-06-15	04:54	4.4841666	11:02	0.86812603	17:35	4.262878	23:10	1.21426	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
24	2025-06-15	04:54	4.4841666	11:02	0.86812603	17:35	4.262878	23:10	1.21426	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
46	2025-06-20	09:18	4.293824	02:49	1.4511176	22:19	4.09107	15:34	0.9914378	2025-06-16 12:34:47.944561	2025-06-19 02:16:44.896
29	2025-06-20	09:18	4.293824	02:49	1.4511176	22:19	4.09107	15:34	0.9914378	2025-06-16 09:17:51.93997	2025-06-19 02:16:44.896
53	2025-06-20	09:18	4.293824	02:49	1.4511176	22:19	4.09107	15:34	0.9914378	2025-06-16 12:36:42.22977	2025-06-19 02:16:44.896
47	2025-06-21	10:24	4.3438435	03:59	1.3834605	23:19	4.2109118	16:38	0.95892805	2025-06-16 12:34:48.009043	2025-06-19 02:16:47.896
30	2025-06-21	10:24	4.3438435	03:59	1.3834605	23:19	4.2109118	16:38	0.95892805	2025-06-16 09:17:51.93997	2025-06-19 02:16:47.896
54	2025-06-21	10:24	4.3438435	03:59	1.3834605	23:19	4.2109118	16:38	0.95892805	2025-06-16 12:36:42.294868	2025-06-19 02:16:47.896
41	2025-06-22	\N	\N	\N	\N	\N	\N	\N	\N	2025-06-16 12:19:54.880103	2025-06-19 02:16:51.097
48	2025-06-22	11:30	4.442456	05:04	1.2465082	\N	\N	17:39	0.91438156	2025-06-16 12:34:48.074247	2025-06-19 02:16:51.097
55	2025-06-22	11:30	4.442456	05:04	1.2465082	\N	\N	17:39	0.91438156	2025-06-16 12:36:42.3599	2025-06-19 02:16:51.097
56	2025-06-23	\N	\N	\N	\N	\N	\N	\N	\N	2025-06-17 05:52:48.118564	2025-06-19 02:16:53.496
57	2025-06-24	\N	\N	\N	\N	\N	\N	\N	\N	2025-06-18 11:56:45.268589	2025-06-19 02:16:54.996
58	2025-06-25	\N	\N	\N	\N	\N	\N	\N	\N	2025-06-19 02:16:39.113925	2025-06-19 02:16:39.113925
43	2025-06-17	06:24	4.3811216	12:35	0.9388296	19:16	4.098874	\N	\N	2025-06-16 12:34:47.74833	2025-06-17 05:52:48.217
26	2025-06-17	06:24	4.3811216	12:35	0.9388296	19:16	4.098874	\N	\N	2025-06-16 09:17:51.93997	2025-06-17 05:52:48.217
50	2025-06-17	06:24	4.3811216	12:35	0.9388296	19:16	4.098874	\N	\N	2025-06-16 12:36:42.034535	2025-06-17 05:52:48.217
44	2025-06-18	07:16	4.3274636	00:45	1.3840606	20:14	4.0409756	13:29	0.9769295	2025-06-16 12:34:47.813047	2025-06-18 23:03:54.255
27	2025-06-18	07:16	4.3274636	00:45	1.3840606	20:14	4.0409756	13:29	0.9769295	2025-06-16 09:17:51.93997	2025-06-18 23:03:54.255
51	2025-06-18	07:16	4.3274636	00:45	1.3840606	20:14	4.0409756	13:29	0.9769295	2025-06-16 12:36:42.099514	2025-06-18 23:03:54.255
42	2025-06-16	05:36	4.4374614	11:46	0.89825106	18:23	4.181302	23:55	1.3003713	2025-06-16 12:34:47.679639	2025-06-16 16:01:19.023
23	2025-06-16	05:36	4.4374614	11:46	0.89825106	18:23	4.181302	23:55	1.3003713	2025-06-16 09:17:51.93997	2025-06-16 16:01:19.023
25	2025-06-16	05:36	4.4374614	11:46	0.89825106	18:23	4.181302	23:55	1.3003713	2025-06-16 09:17:51.93997	2025-06-16 16:01:19.023
40	2025-06-16	05:36	4.44	11:46	0.9	18:23	4.18	23:55	1.3	2025-06-16 12:17:29.465519	2025-06-16 16:01:19.023
49	2025-06-16	05:36	4.4374614	11:46	0.89825106	18:23	4.181302	23:55	1.3003713	2025-06-16 12:36:41.965547	2025-06-16 16:01:19.023
45	2025-06-19	08:15	4.2928467	01:43	1.4436357	21:15	4.0332212	14:30	0.9982252	2025-06-16 12:34:47.879235	2025-06-19 02:16:42.097
28	2025-06-19	08:15	4.2928467	01:43	1.4436357	21:15	4.0332212	14:30	0.9982252	2025-06-16 09:17:51.93997	2025-06-19 02:16:42.097
52	2025-06-19	08:15	4.2928467	01:43	1.4436357	21:15	4.0332212	14:30	0.9982252	2025-06-16 12:36:42.164894	2025-06-19 02:16:42.097
\.


--
-- Data for Name: tide_data_backup_2025-06-16T10-01-22-509Z; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public."tide_data_backup_2025-06-16T10-01-22-509Z" (id, date, high_tide_1_time, high_tide_1_height, low_tide_1_time, low_tide_1_height, high_tide_2_time, high_tide_2_height, low_tide_2_time, low_tide_2_height, created_at, updated_at) FROM stdin;
1	2025-06-08	00:41	4.071488	06:29	1.3456054	12:57	4.1406527	18:46	1.1245996	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
2	2025-06-09	01:20	4.216587	07:10	1.2093074	13:39	4.228235	19:24	1.0779684	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
17	2025-06-10	01:56	4.3376217	07:48	1.0916008	14:18	4.2969484	20:01	1.0497234	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
18	2025-06-11	02:30	4.426628	08:25	0.99673903	14:57	4.342666	20:36	1.0416696	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
19	2025-06-12	03:05	4.483977	09:03	0.9251522	15:34	4.3644185	21:13	1.0530246	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
20	2025-06-13	03:39	4.511834	09:40	0.87837785	16:12	4.359773	21:49	1.0851328	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
21	2025-06-14	04:15	4.511162	10:20	0.85941005	16:52	4.3254757	22:29	1.139692	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
22	2025-06-15	04:54	4.4841666	11:02	0.86812603	17:35	4.262878	23:10	1.21426	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
23	2025-06-16	05:36	4.4374614	11:46	0.89825106	18:23	4.181302	23:55	1.3003713	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
24	2025-06-15	04:54	4.4841666	11:02	0.86812603	17:35	4.262878	23:10	1.21426	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
25	2025-06-16	05:36	4.4374614	11:46	0.89825106	18:23	4.181302	23:55	1.3003713	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
26	2025-06-17	06:24	4.3811216	12:35	0.9388296	19:16	4.098874	\N	\N	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
27	2025-06-18	07:16	4.3274636	00:45	1.3840606	20:14	4.0409756	13:29	0.9769295	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
28	2025-06-19	08:15	4.2928467	01:43	1.4436357	21:15	4.0332212	14:30	0.9982252	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
29	2025-06-20	09:18	4.293824	02:49	1.4511176	22:19	4.09107	15:34	0.9914378	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
30	2025-06-21	10:24	4.3438435	03:59	1.3834605	23:19	4.2109118	16:38	0.95892805	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
\.


--
-- Data for Name: tide_data_backup_2025-06-16T10-01-44-757Z; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public."tide_data_backup_2025-06-16T10-01-44-757Z" (id, date, high_tide_1_time, high_tide_1_height, low_tide_1_time, low_tide_1_height, high_tide_2_time, high_tide_2_height, low_tide_2_time, low_tide_2_height, created_at, updated_at) FROM stdin;
1	2025-06-08	00:41	4.071488	06:29	1.3456054	12:57	4.1406527	18:46	1.1245996	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
2	2025-06-09	01:20	4.216587	07:10	1.2093074	13:39	4.228235	19:24	1.0779684	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
17	2025-06-10	01:56	4.3376217	07:48	1.0916008	14:18	4.2969484	20:01	1.0497234	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
18	2025-06-11	02:30	4.426628	08:25	0.99673903	14:57	4.342666	20:36	1.0416696	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
19	2025-06-12	03:05	4.483977	09:03	0.9251522	15:34	4.3644185	21:13	1.0530246	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
20	2025-06-13	03:39	4.511834	09:40	0.87837785	16:12	4.359773	21:49	1.0851328	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
21	2025-06-14	04:15	4.511162	10:20	0.85941005	16:52	4.3254757	22:29	1.139692	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
22	2025-06-15	04:54	4.4841666	11:02	0.86812603	17:35	4.262878	23:10	1.21426	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
23	2025-06-16	05:36	4.4374614	11:46	0.89825106	18:23	4.181302	23:55	1.3003713	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
24	2025-06-15	04:54	4.4841666	11:02	0.86812603	17:35	4.262878	23:10	1.21426	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
25	2025-06-16	05:36	4.4374614	11:46	0.89825106	18:23	4.181302	23:55	1.3003713	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
26	2025-06-17	06:24	4.3811216	12:35	0.9388296	19:16	4.098874	\N	\N	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
27	2025-06-18	07:16	4.3274636	00:45	1.3840606	20:14	4.0409756	13:29	0.9769295	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
28	2025-06-19	08:15	4.2928467	01:43	1.4436357	21:15	4.0332212	14:30	0.9982252	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
29	2025-06-20	09:18	4.293824	02:49	1.4511176	22:19	4.09107	15:34	0.9914378	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
30	2025-06-21	10:24	4.3438435	03:59	1.3834605	23:19	4.2109118	16:38	0.95892805	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
\.


--
-- Data for Name: tide_data_backup_2025-06-16T10-04-09-926Z; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public."tide_data_backup_2025-06-16T10-04-09-926Z" (id, date, high_tide_1_time, high_tide_1_height, low_tide_1_time, low_tide_1_height, high_tide_2_time, high_tide_2_height, low_tide_2_time, low_tide_2_height, created_at, updated_at) FROM stdin;
1	2025-06-08	00:41	4.071488	06:29	1.3456054	12:57	4.1406527	18:46	1.1245996	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
2	2025-06-09	01:20	4.216587	07:10	1.2093074	13:39	4.228235	19:24	1.0779684	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
17	2025-06-10	01:56	4.3376217	07:48	1.0916008	14:18	4.2969484	20:01	1.0497234	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
18	2025-06-11	02:30	4.426628	08:25	0.99673903	14:57	4.342666	20:36	1.0416696	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
19	2025-06-12	03:05	4.483977	09:03	0.9251522	15:34	4.3644185	21:13	1.0530246	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
20	2025-06-13	03:39	4.511834	09:40	0.87837785	16:12	4.359773	21:49	1.0851328	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
21	2025-06-14	04:15	4.511162	10:20	0.85941005	16:52	4.3254757	22:29	1.139692	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
22	2025-06-15	04:54	4.4841666	11:02	0.86812603	17:35	4.262878	23:10	1.21426	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
23	2025-06-16	05:36	4.4374614	11:46	0.89825106	18:23	4.181302	23:55	1.3003713	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
24	2025-06-15	04:54	4.4841666	11:02	0.86812603	17:35	4.262878	23:10	1.21426	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
25	2025-06-16	05:36	4.4374614	11:46	0.89825106	18:23	4.181302	23:55	1.3003713	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
26	2025-06-17	06:24	4.3811216	12:35	0.9388296	19:16	4.098874	\N	\N	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
27	2025-06-18	07:16	4.3274636	00:45	1.3840606	20:14	4.0409756	13:29	0.9769295	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
28	2025-06-19	08:15	4.2928467	01:43	1.4436357	21:15	4.0332212	14:30	0.9982252	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
29	2025-06-20	09:18	4.293824	02:49	1.4511176	22:19	4.09107	15:34	0.9914378	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
30	2025-06-21	10:24	4.3438435	03:59	1.3834605	23:19	4.2109118	16:38	0.95892805	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
\.


--
-- Data for Name: tide_data_backup_2025-06-16T10-09-21-128Z; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public."tide_data_backup_2025-06-16T10-09-21-128Z" (id, date, high_tide_1_time, high_tide_1_height, low_tide_1_time, low_tide_1_height, high_tide_2_time, high_tide_2_height, low_tide_2_time, low_tide_2_height, created_at, updated_at) FROM stdin;
1	2025-06-08	00:41	4.071488	06:29	1.3456054	12:57	4.1406527	18:46	1.1245996	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
2	2025-06-09	01:20	4.216587	07:10	1.2093074	13:39	4.228235	19:24	1.0779684	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
17	2025-06-10	01:56	4.3376217	07:48	1.0916008	14:18	4.2969484	20:01	1.0497234	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
18	2025-06-11	02:30	4.426628	08:25	0.99673903	14:57	4.342666	20:36	1.0416696	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
19	2025-06-12	03:05	4.483977	09:03	0.9251522	15:34	4.3644185	21:13	1.0530246	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
20	2025-06-13	03:39	4.511834	09:40	0.87837785	16:12	4.359773	21:49	1.0851328	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
21	2025-06-14	04:15	4.511162	10:20	0.85941005	16:52	4.3254757	22:29	1.139692	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
22	2025-06-15	04:54	4.4841666	11:02	0.86812603	17:35	4.262878	23:10	1.21426	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
24	2025-06-15	04:54	4.4841666	11:02	0.86812603	17:35	4.262878	23:10	1.21426	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
23	2025-06-16	05:36	4.4374614	11:46	0.89825106	18:23	4.181302	23:55	1.3003713	2025-06-16 09:17:51.93997	2025-06-16 10:04:10.139
25	2025-06-16	05:36	4.4374614	11:46	0.89825106	18:23	4.181302	23:55	1.3003713	2025-06-16 09:17:51.93997	2025-06-16 10:04:10.139
26	2025-06-17	06:24	4.3811216	12:35	0.9388296	19:16	4.098874	\N	\N	2025-06-16 09:17:51.93997	2025-06-16 10:04:10.274
27	2025-06-18	07:16	4.3274636	00:45	1.3840606	20:14	4.0409756	13:29	0.9769295	2025-06-16 09:17:51.93997	2025-06-16 10:04:10.404
28	2025-06-19	08:15	4.2928467	01:43	1.4436357	21:15	4.0332212	14:30	0.9982252	2025-06-16 09:17:51.93997	2025-06-16 10:04:10.535
29	2025-06-20	09:18	4.293824	02:49	1.4511176	22:19	4.09107	15:34	0.9914378	2025-06-16 09:17:51.93997	2025-06-16 10:04:10.668
30	2025-06-21	10:24	4.3438435	03:59	1.3834605	23:19	4.2109118	16:38	0.95892805	2025-06-16 09:17:51.93997	2025-06-16 10:04:10.8
31	2025-06-22	\N	\N	\N	\N	\N	\N	\N	\N	2025-06-16 10:04:10.038146	2025-06-16 10:04:10.038146
\.


--
-- Data for Name: tide_data_backup_2025-06-16T11-43-26-751Z; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public."tide_data_backup_2025-06-16T11-43-26-751Z" (id, date, high_tide_1_time, high_tide_1_height, low_tide_1_time, low_tide_1_height, high_tide_2_time, high_tide_2_height, low_tide_2_time, low_tide_2_height, created_at, updated_at) FROM stdin;
1	2025-06-08	00:41	4.071488	06:29	1.3456054	12:57	4.1406527	18:46	1.1245996	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
2	2025-06-09	01:20	4.216587	07:10	1.2093074	13:39	4.228235	19:24	1.0779684	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
17	2025-06-10	01:56	4.3376217	07:48	1.0916008	14:18	4.2969484	20:01	1.0497234	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
18	2025-06-11	02:30	4.426628	08:25	0.99673903	14:57	4.342666	20:36	1.0416696	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
19	2025-06-12	03:05	4.483977	09:03	0.9251522	15:34	4.3644185	21:13	1.0530246	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
20	2025-06-13	03:39	4.511834	09:40	0.87837785	16:12	4.359773	21:49	1.0851328	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
21	2025-06-14	04:15	4.511162	10:20	0.85941005	16:52	4.3254757	22:29	1.139692	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
22	2025-06-15	04:54	4.4841666	11:02	0.86812603	17:35	4.262878	23:10	1.21426	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
24	2025-06-15	04:54	4.4841666	11:02	0.86812603	17:35	4.262878	23:10	1.21426	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
23	2025-06-16	05:36	4.4374614	11:46	0.89825106	18:23	4.181302	23:55	1.3003713	2025-06-16 09:17:51.93997	2025-06-16 10:09:21.373
25	2025-06-16	05:36	4.4374614	11:46	0.89825106	18:23	4.181302	23:55	1.3003713	2025-06-16 09:17:51.93997	2025-06-16 10:09:21.373
26	2025-06-17	06:24	4.3811216	12:35	0.9388296	19:16	4.098874	\N	\N	2025-06-16 09:17:51.93997	2025-06-16 10:09:21.51
27	2025-06-18	07:16	4.3274636	00:45	1.3840606	20:14	4.0409756	13:29	0.9769295	2025-06-16 09:17:51.93997	2025-06-16 10:09:21.639
28	2025-06-19	08:15	4.2928467	01:43	1.4436357	21:15	4.0332212	14:30	0.9982252	2025-06-16 09:17:51.93997	2025-06-16 10:09:21.768
29	2025-06-20	09:18	4.293824	02:49	1.4511176	22:19	4.09107	15:34	0.9914378	2025-06-16 09:17:51.93997	2025-06-16 10:09:21.898
30	2025-06-21	10:24	4.3438435	03:59	1.3834605	23:19	4.2109118	16:38	0.95892805	2025-06-16 09:17:51.93997	2025-06-16 10:09:22.025
31	2025-06-22	\N	\N	\N	\N	\N	\N	\N	\N	2025-06-16 10:04:10.038146	2025-06-16 10:09:22.154
\.


--
-- Data for Name: tide_data_backup_2025-06-16T12-19-54-764Z; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public."tide_data_backup_2025-06-16T12-19-54-764Z" (id, date, high_tide_1_time, high_tide_1_height, low_tide_1_time, low_tide_1_height, high_tide_2_time, high_tide_2_height, low_tide_2_time, low_tide_2_height, created_at, updated_at) FROM stdin;
1	2025-06-08	00:41	4.071488	06:29	1.3456054	12:57	4.1406527	18:46	1.1245996	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
2	2025-06-09	01:20	4.216587	07:10	1.2093074	13:39	4.228235	19:24	1.0779684	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
17	2025-06-10	01:56	4.3376217	07:48	1.0916008	14:18	4.2969484	20:01	1.0497234	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
18	2025-06-11	02:30	4.426628	08:25	0.99673903	14:57	4.342666	20:36	1.0416696	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
19	2025-06-12	03:05	4.483977	09:03	0.9251522	15:34	4.3644185	21:13	1.0530246	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
20	2025-06-13	03:39	4.511834	09:40	0.87837785	16:12	4.359773	21:49	1.0851328	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
21	2025-06-14	04:15	4.511162	10:20	0.85941005	16:52	4.3254757	22:29	1.139692	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
22	2025-06-15	04:54	4.4841666	11:02	0.86812603	17:35	4.262878	23:10	1.21426	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
24	2025-06-15	04:54	4.4841666	11:02	0.86812603	17:35	4.262878	23:10	1.21426	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
23	2025-06-16	05:36	4.4374614	11:46	0.89825106	18:23	4.181302	23:55	1.3003713	2025-06-16 09:17:51.93997	2025-06-16 11:43:26.962
25	2025-06-16	05:36	4.4374614	11:46	0.89825106	18:23	4.181302	23:55	1.3003713	2025-06-16 09:17:51.93997	2025-06-16 11:43:26.962
26	2025-06-17	06:24	4.3811216	12:35	0.9388296	19:16	4.098874	\N	\N	2025-06-16 09:17:51.93997	2025-06-16 11:43:27.095
27	2025-06-18	07:16	4.3274636	00:45	1.3840606	20:14	4.0409756	13:29	0.9769295	2025-06-16 09:17:51.93997	2025-06-16 11:43:27.227
28	2025-06-19	08:15	4.2928467	01:43	1.4436357	21:15	4.0332212	14:30	0.9982252	2025-06-16 09:17:51.93997	2025-06-16 11:43:27.359
29	2025-06-20	09:18	4.293824	02:49	1.4511176	22:19	4.09107	15:34	0.9914378	2025-06-16 09:17:51.93997	2025-06-16 11:43:27.49
30	2025-06-21	10:24	4.3438435	03:59	1.3834605	23:19	4.2109118	16:38	0.95892805	2025-06-16 09:17:51.93997	2025-06-16 11:43:27.622
40	2025-06-16	05:36	4.44	11:46	0.9	18:23	4.18	23:55	1.3	2025-06-16 12:17:29.465519	2025-06-16 12:17:29.465519
\.


--
-- Data for Name: tide_data_backup_2025-06-16T12-33-29-771Z; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public."tide_data_backup_2025-06-16T12-33-29-771Z" (id, date, high_tide_1_time, high_tide_1_height, low_tide_1_time, low_tide_1_height, high_tide_2_time, high_tide_2_height, low_tide_2_time, low_tide_2_height, created_at, updated_at) FROM stdin;
1	2025-06-08	00:41	4.071488	06:29	1.3456054	12:57	4.1406527	18:46	1.1245996	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
2	2025-06-09	01:20	4.216587	07:10	1.2093074	13:39	4.228235	19:24	1.0779684	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
17	2025-06-10	01:56	4.3376217	07:48	1.0916008	14:18	4.2969484	20:01	1.0497234	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
18	2025-06-11	02:30	4.426628	08:25	0.99673903	14:57	4.342666	20:36	1.0416696	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
19	2025-06-12	03:05	4.483977	09:03	0.9251522	15:34	4.3644185	21:13	1.0530246	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
20	2025-06-13	03:39	4.511834	09:40	0.87837785	16:12	4.359773	21:49	1.0851328	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
21	2025-06-14	04:15	4.511162	10:20	0.85941005	16:52	4.3254757	22:29	1.139692	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
22	2025-06-15	04:54	4.4841666	11:02	0.86812603	17:35	4.262878	23:10	1.21426	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
24	2025-06-15	04:54	4.4841666	11:02	0.86812603	17:35	4.262878	23:10	1.21426	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
23	2025-06-16	05:36	4.4374614	11:46	0.89825106	18:23	4.181302	23:55	1.3003713	2025-06-16 09:17:51.93997	2025-06-16 12:19:54.978
25	2025-06-16	05:36	4.4374614	11:46	0.89825106	18:23	4.181302	23:55	1.3003713	2025-06-16 09:17:51.93997	2025-06-16 12:19:54.978
40	2025-06-16	05:36	4.44	11:46	0.9	18:23	4.18	23:55	1.3	2025-06-16 12:17:29.465519	2025-06-16 12:19:54.978
26	2025-06-17	06:24	4.3811216	12:35	0.9388296	19:16	4.098874	\N	\N	2025-06-16 09:17:51.93997	2025-06-16 12:19:55.112
27	2025-06-18	07:16	4.3274636	00:45	1.3840606	20:14	4.0409756	13:29	0.9769295	2025-06-16 09:17:51.93997	2025-06-16 12:19:55.244
28	2025-06-19	08:15	4.2928467	01:43	1.4436357	21:15	4.0332212	14:30	0.9982252	2025-06-16 09:17:51.93997	2025-06-16 12:19:55.376
29	2025-06-20	09:18	4.293824	02:49	1.4511176	22:19	4.09107	15:34	0.9914378	2025-06-16 09:17:51.93997	2025-06-16 12:19:55.506
30	2025-06-21	10:24	4.3438435	03:59	1.3834605	23:19	4.2109118	16:38	0.95892805	2025-06-16 09:17:51.93997	2025-06-16 12:19:55.636
41	2025-06-22	\N	\N	\N	\N	\N	\N	\N	\N	2025-06-16 12:19:54.880103	2025-06-16 12:19:54.880103
\.


--
-- Data for Name: tide_data_backup_2025-06-16T12-35-27-682Z; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public."tide_data_backup_2025-06-16T12-35-27-682Z" (id, date, high_tide_1_time, high_tide_1_height, low_tide_1_time, low_tide_1_height, high_tide_2_time, high_tide_2_height, low_tide_2_time, low_tide_2_height, created_at, updated_at) FROM stdin;
1	2025-06-08	00:41	4.071488	06:29	1.3456054	12:57	4.1406527	18:46	1.1245996	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
2	2025-06-09	01:20	4.216587	07:10	1.2093074	13:39	4.228235	19:24	1.0779684	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
17	2025-06-10	01:56	4.3376217	07:48	1.0916008	14:18	4.2969484	20:01	1.0497234	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
18	2025-06-11	02:30	4.426628	08:25	0.99673903	14:57	4.342666	20:36	1.0416696	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
19	2025-06-12	03:05	4.483977	09:03	0.9251522	15:34	4.3644185	21:13	1.0530246	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
20	2025-06-13	03:39	4.511834	09:40	0.87837785	16:12	4.359773	21:49	1.0851328	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
21	2025-06-14	04:15	4.511162	10:20	0.85941005	16:52	4.3254757	22:29	1.139692	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
22	2025-06-15	04:54	4.4841666	11:02	0.86812603	17:35	4.262878	23:10	1.21426	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
24	2025-06-15	04:54	4.4841666	11:02	0.86812603	17:35	4.262878	23:10	1.21426	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
41	2025-06-22	\N	\N	\N	\N	\N	\N	\N	\N	2025-06-16 12:19:54.880103	2025-06-16 12:33:30.747
42	2025-06-16	05:36	4.4374614	11:46	0.89825106	18:23	4.181302	23:55	1.3003713	2025-06-16 12:34:47.679639	2025-06-16 12:34:47.679639
43	2025-06-17	06:24	4.3811216	12:35	0.9388296	19:16	4.098874	\N	\N	2025-06-16 12:34:47.74833	2025-06-16 12:34:47.74833
44	2025-06-18	07:16	4.3274636	00:45	1.3840606	20:14	4.0409756	13:29	0.9769295	2025-06-16 12:34:47.813047	2025-06-16 12:34:47.813047
45	2025-06-19	08:15	4.2928467	01:43	1.4436357	21:15	4.0332212	14:30	0.9982252	2025-06-16 12:34:47.879235	2025-06-16 12:34:47.879235
46	2025-06-20	09:18	4.293824	02:49	1.4511176	22:19	4.09107	15:34	0.9914378	2025-06-16 12:34:47.944561	2025-06-16 12:34:47.944561
47	2025-06-21	10:24	4.3438435	03:59	1.3834605	23:19	4.2109118	16:38	0.95892805	2025-06-16 12:34:48.009043	2025-06-16 12:34:48.009043
48	2025-06-22	11:30	4.442456	05:04	1.2465082	\N	\N	17:39	0.91438156	2025-06-16 12:34:48.074247	2025-06-16 12:34:48.074247
23	2025-06-16	05:36	4.4374614	11:46	0.89825106	18:23	4.181302	23:55	1.3003713	2025-06-16 09:17:51.93997	2025-06-16 12:33:29.976
25	2025-06-16	05:36	4.4374614	11:46	0.89825106	18:23	4.181302	23:55	1.3003713	2025-06-16 09:17:51.93997	2025-06-16 12:33:29.976
40	2025-06-16	05:36	4.44	11:46	0.9	18:23	4.18	23:55	1.3	2025-06-16 12:17:29.465519	2025-06-16 12:33:29.976
26	2025-06-17	06:24	4.3811216	12:35	0.9388296	19:16	4.098874	\N	\N	2025-06-16 09:17:51.93997	2025-06-16 12:33:30.105
27	2025-06-18	07:16	4.3274636	00:45	1.3840606	20:14	4.0409756	13:29	0.9769295	2025-06-16 09:17:51.93997	2025-06-16 12:33:30.234
28	2025-06-19	08:15	4.2928467	01:43	1.4436357	21:15	4.0332212	14:30	0.9982252	2025-06-16 09:17:51.93997	2025-06-16 12:33:30.363
29	2025-06-20	09:18	4.293824	02:49	1.4511176	22:19	4.09107	15:34	0.9914378	2025-06-16 09:17:51.93997	2025-06-16 12:33:30.49
30	2025-06-21	10:24	4.3438435	03:59	1.3834605	23:19	4.2109118	16:38	0.95892805	2025-06-16 09:17:51.93997	2025-06-16 12:33:30.619
\.


--
-- Data for Name: tide_data_backup_2025-06-16T16-01-18-918Z; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public."tide_data_backup_2025-06-16T16-01-18-918Z" (id, date, high_tide_1_time, high_tide_1_height, low_tide_1_time, low_tide_1_height, high_tide_2_time, high_tide_2_height, low_tide_2_time, low_tide_2_height, created_at, updated_at) FROM stdin;
1	2025-06-08	00:41	4.071488	06:29	1.3456054	12:57	4.1406527	18:46	1.1245996	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
2	2025-06-09	01:20	4.216587	07:10	1.2093074	13:39	4.228235	19:24	1.0779684	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
17	2025-06-10	01:56	4.3376217	07:48	1.0916008	14:18	4.2969484	20:01	1.0497234	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
18	2025-06-11	02:30	4.426628	08:25	0.99673903	14:57	4.342666	20:36	1.0416696	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
19	2025-06-12	03:05	4.483977	09:03	0.9251522	15:34	4.3644185	21:13	1.0530246	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
20	2025-06-13	03:39	4.511834	09:40	0.87837785	16:12	4.359773	21:49	1.0851328	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
21	2025-06-14	04:15	4.511162	10:20	0.85941005	16:52	4.3254757	22:29	1.139692	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
22	2025-06-15	04:54	4.4841666	11:02	0.86812603	17:35	4.262878	23:10	1.21426	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
24	2025-06-15	04:54	4.4841666	11:02	0.86812603	17:35	4.262878	23:10	1.21426	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
42	2025-06-16	05:36	4.4374614	11:46	0.89825106	18:23	4.181302	23:55	1.3003713	2025-06-16 12:34:47.679639	2025-06-16 12:35:27.89
23	2025-06-16	05:36	4.4374614	11:46	0.89825106	18:23	4.181302	23:55	1.3003713	2025-06-16 09:17:51.93997	2025-06-16 12:35:27.89
25	2025-06-16	05:36	4.4374614	11:46	0.89825106	18:23	4.181302	23:55	1.3003713	2025-06-16 09:17:51.93997	2025-06-16 12:35:27.89
40	2025-06-16	05:36	4.44	11:46	0.9	18:23	4.18	23:55	1.3	2025-06-16 12:17:29.465519	2025-06-16 12:35:27.89
43	2025-06-17	06:24	4.3811216	12:35	0.9388296	19:16	4.098874	\N	\N	2025-06-16 12:34:47.74833	2025-06-16 12:35:28.024
26	2025-06-17	06:24	4.3811216	12:35	0.9388296	19:16	4.098874	\N	\N	2025-06-16 09:17:51.93997	2025-06-16 12:35:28.024
44	2025-06-18	07:16	4.3274636	00:45	1.3840606	20:14	4.0409756	13:29	0.9769295	2025-06-16 12:34:47.813047	2025-06-16 12:35:28.155
27	2025-06-18	07:16	4.3274636	00:45	1.3840606	20:14	4.0409756	13:29	0.9769295	2025-06-16 09:17:51.93997	2025-06-16 12:35:28.155
45	2025-06-19	08:15	4.2928467	01:43	1.4436357	21:15	4.0332212	14:30	0.9982252	2025-06-16 12:34:47.879235	2025-06-16 12:35:28.286
28	2025-06-19	08:15	4.2928467	01:43	1.4436357	21:15	4.0332212	14:30	0.9982252	2025-06-16 09:17:51.93997	2025-06-16 12:35:28.286
46	2025-06-20	09:18	4.293824	02:49	1.4511176	22:19	4.09107	15:34	0.9914378	2025-06-16 12:34:47.944561	2025-06-16 12:35:28.417
29	2025-06-20	09:18	4.293824	02:49	1.4511176	22:19	4.09107	15:34	0.9914378	2025-06-16 09:17:51.93997	2025-06-16 12:35:28.417
47	2025-06-21	10:24	4.3438435	03:59	1.3834605	23:19	4.2109118	16:38	0.95892805	2025-06-16 12:34:48.009043	2025-06-16 12:35:28.548
30	2025-06-21	10:24	4.3438435	03:59	1.3834605	23:19	4.2109118	16:38	0.95892805	2025-06-16 09:17:51.93997	2025-06-16 12:35:28.548
41	2025-06-22	\N	\N	\N	\N	\N	\N	\N	\N	2025-06-16 12:19:54.880103	2025-06-16 12:35:28.681
48	2025-06-22	11:30	4.442456	05:04	1.2465082	\N	\N	17:39	0.91438156	2025-06-16 12:34:48.074247	2025-06-16 12:35:28.681
49	2025-06-16	05:36	4.4374614	11:46	0.89825106	18:23	4.181302	23:55	1.3003713	2025-06-16 12:36:41.965547	2025-06-16 12:36:41.965547
50	2025-06-17	06:24	4.3811216	12:35	0.9388296	19:16	4.098874	\N	\N	2025-06-16 12:36:42.034535	2025-06-16 12:36:42.034535
51	2025-06-18	07:16	4.3274636	00:45	1.3840606	20:14	4.0409756	13:29	0.9769295	2025-06-16 12:36:42.099514	2025-06-16 12:36:42.099514
52	2025-06-19	08:15	4.2928467	01:43	1.4436357	21:15	4.0332212	14:30	0.9982252	2025-06-16 12:36:42.164894	2025-06-16 12:36:42.164894
53	2025-06-20	09:18	4.293824	02:49	1.4511176	22:19	4.09107	15:34	0.9914378	2025-06-16 12:36:42.22977	2025-06-16 12:36:42.22977
54	2025-06-21	10:24	4.3438435	03:59	1.3834605	23:19	4.2109118	16:38	0.95892805	2025-06-16 12:36:42.294868	2025-06-16 12:36:42.294868
55	2025-06-22	11:30	4.442456	05:04	1.2465082	\N	\N	17:39	0.91438156	2025-06-16 12:36:42.3599	2025-06-16 12:36:42.3599
\.


--
-- Data for Name: tide_data_backup_2025-06-17T05-52-48-005Z; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public."tide_data_backup_2025-06-17T05-52-48-005Z" (id, date, high_tide_1_time, high_tide_1_height, low_tide_1_time, low_tide_1_height, high_tide_2_time, high_tide_2_height, low_tide_2_time, low_tide_2_height, created_at, updated_at) FROM stdin;
1	2025-06-08	00:41	4.071488	06:29	1.3456054	12:57	4.1406527	18:46	1.1245996	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
2	2025-06-09	01:20	4.216587	07:10	1.2093074	13:39	4.228235	19:24	1.0779684	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
17	2025-06-10	01:56	4.3376217	07:48	1.0916008	14:18	4.2969484	20:01	1.0497234	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
18	2025-06-11	02:30	4.426628	08:25	0.99673903	14:57	4.342666	20:36	1.0416696	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
19	2025-06-12	03:05	4.483977	09:03	0.9251522	15:34	4.3644185	21:13	1.0530246	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
20	2025-06-13	03:39	4.511834	09:40	0.87837785	16:12	4.359773	21:49	1.0851328	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
21	2025-06-14	04:15	4.511162	10:20	0.85941005	16:52	4.3254757	22:29	1.139692	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
22	2025-06-15	04:54	4.4841666	11:02	0.86812603	17:35	4.262878	23:10	1.21426	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
24	2025-06-15	04:54	4.4841666	11:02	0.86812603	17:35	4.262878	23:10	1.21426	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
46	2025-06-20	09:18	4.293824	02:49	1.4511176	22:19	4.09107	15:34	0.9914378	2025-06-16 12:34:47.944561	2025-06-16 16:01:19.279
29	2025-06-20	09:18	4.293824	02:49	1.4511176	22:19	4.09107	15:34	0.9914378	2025-06-16 09:17:51.93997	2025-06-16 16:01:19.279
53	2025-06-20	09:18	4.293824	02:49	1.4511176	22:19	4.09107	15:34	0.9914378	2025-06-16 12:36:42.22977	2025-06-16 16:01:19.279
47	2025-06-21	10:24	4.3438435	03:59	1.3834605	23:19	4.2109118	16:38	0.95892805	2025-06-16 12:34:48.009043	2025-06-16 16:01:19.343
30	2025-06-21	10:24	4.3438435	03:59	1.3834605	23:19	4.2109118	16:38	0.95892805	2025-06-16 09:17:51.93997	2025-06-16 16:01:19.343
54	2025-06-21	10:24	4.3438435	03:59	1.3834605	23:19	4.2109118	16:38	0.95892805	2025-06-16 12:36:42.294868	2025-06-16 16:01:19.343
41	2025-06-22	\N	\N	\N	\N	\N	\N	\N	\N	2025-06-16 12:19:54.880103	2025-06-16 16:01:19.404
48	2025-06-22	11:30	4.442456	05:04	1.2465082	\N	\N	17:39	0.91438156	2025-06-16 12:34:48.074247	2025-06-16 16:01:19.404
55	2025-06-22	11:30	4.442456	05:04	1.2465082	\N	\N	17:39	0.91438156	2025-06-16 12:36:42.3599	2025-06-16 16:01:19.404
42	2025-06-16	05:36	4.4374614	11:46	0.89825106	18:23	4.181302	23:55	1.3003713	2025-06-16 12:34:47.679639	2025-06-16 16:01:19.023
23	2025-06-16	05:36	4.4374614	11:46	0.89825106	18:23	4.181302	23:55	1.3003713	2025-06-16 09:17:51.93997	2025-06-16 16:01:19.023
25	2025-06-16	05:36	4.4374614	11:46	0.89825106	18:23	4.181302	23:55	1.3003713	2025-06-16 09:17:51.93997	2025-06-16 16:01:19.023
40	2025-06-16	05:36	4.44	11:46	0.9	18:23	4.18	23:55	1.3	2025-06-16 12:17:29.465519	2025-06-16 16:01:19.023
49	2025-06-16	05:36	4.4374614	11:46	0.89825106	18:23	4.181302	23:55	1.3003713	2025-06-16 12:36:41.965547	2025-06-16 16:01:19.023
43	2025-06-17	06:24	4.3811216	12:35	0.9388296	19:16	4.098874	\N	\N	2025-06-16 12:34:47.74833	2025-06-16 16:01:19.093
26	2025-06-17	06:24	4.3811216	12:35	0.9388296	19:16	4.098874	\N	\N	2025-06-16 09:17:51.93997	2025-06-16 16:01:19.093
50	2025-06-17	06:24	4.3811216	12:35	0.9388296	19:16	4.098874	\N	\N	2025-06-16 12:36:42.034535	2025-06-16 16:01:19.093
44	2025-06-18	07:16	4.3274636	00:45	1.3840606	20:14	4.0409756	13:29	0.9769295	2025-06-16 12:34:47.813047	2025-06-16 16:01:19.155
27	2025-06-18	07:16	4.3274636	00:45	1.3840606	20:14	4.0409756	13:29	0.9769295	2025-06-16 09:17:51.93997	2025-06-16 16:01:19.155
51	2025-06-18	07:16	4.3274636	00:45	1.3840606	20:14	4.0409756	13:29	0.9769295	2025-06-16 12:36:42.099514	2025-06-16 16:01:19.155
45	2025-06-19	08:15	4.2928467	01:43	1.4436357	21:15	4.0332212	14:30	0.9982252	2025-06-16 12:34:47.879235	2025-06-16 16:01:19.217
28	2025-06-19	08:15	4.2928467	01:43	1.4436357	21:15	4.0332212	14:30	0.9982252	2025-06-16 09:17:51.93997	2025-06-16 16:01:19.217
52	2025-06-19	08:15	4.2928467	01:43	1.4436357	21:15	4.0332212	14:30	0.9982252	2025-06-16 12:36:42.164894	2025-06-16 16:01:19.217
\.


--
-- Data for Name: tide_data_backup_2025-06-18T11-56-45-187Z; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public."tide_data_backup_2025-06-18T11-56-45-187Z" (id, date, high_tide_1_time, high_tide_1_height, low_tide_1_time, low_tide_1_height, high_tide_2_time, high_tide_2_height, low_tide_2_time, low_tide_2_height, created_at, updated_at) FROM stdin;
1	2025-06-08	00:41	4.071488	06:29	1.3456054	12:57	4.1406527	18:46	1.1245996	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
2	2025-06-09	01:20	4.216587	07:10	1.2093074	13:39	4.228235	19:24	1.0779684	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
17	2025-06-10	01:56	4.3376217	07:48	1.0916008	14:18	4.2969484	20:01	1.0497234	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
18	2025-06-11	02:30	4.426628	08:25	0.99673903	14:57	4.342666	20:36	1.0416696	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
19	2025-06-12	03:05	4.483977	09:03	0.9251522	15:34	4.3644185	21:13	1.0530246	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
20	2025-06-13	03:39	4.511834	09:40	0.87837785	16:12	4.359773	21:49	1.0851328	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
21	2025-06-14	04:15	4.511162	10:20	0.85941005	16:52	4.3254757	22:29	1.139692	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
22	2025-06-15	04:54	4.4841666	11:02	0.86812603	17:35	4.262878	23:10	1.21426	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
24	2025-06-15	04:54	4.4841666	11:02	0.86812603	17:35	4.262878	23:10	1.21426	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
41	2025-06-22	\N	\N	\N	\N	\N	\N	\N	\N	2025-06-16 12:19:54.880103	2025-06-17 05:52:48.876
48	2025-06-22	11:30	4.442456	05:04	1.2465082	\N	\N	17:39	0.91438156	2025-06-16 12:34:48.074247	2025-06-17 05:52:48.876
55	2025-06-22	11:30	4.442456	05:04	1.2465082	\N	\N	17:39	0.91438156	2025-06-16 12:36:42.3599	2025-06-17 05:52:48.876
56	2025-06-23	\N	\N	\N	\N	\N	\N	\N	\N	2025-06-17 05:52:48.118564	2025-06-17 05:52:48.118564
43	2025-06-17	06:24	4.3811216	12:35	0.9388296	19:16	4.098874	\N	\N	2025-06-16 12:34:47.74833	2025-06-17 05:52:48.217
26	2025-06-17	06:24	4.3811216	12:35	0.9388296	19:16	4.098874	\N	\N	2025-06-16 09:17:51.93997	2025-06-17 05:52:48.217
50	2025-06-17	06:24	4.3811216	12:35	0.9388296	19:16	4.098874	\N	\N	2025-06-16 12:36:42.034535	2025-06-17 05:52:48.217
44	2025-06-18	07:16	4.3274636	00:45	1.3840606	20:14	4.0409756	13:29	0.9769295	2025-06-16 12:34:47.813047	2025-06-17 05:52:48.35
27	2025-06-18	07:16	4.3274636	00:45	1.3840606	20:14	4.0409756	13:29	0.9769295	2025-06-16 09:17:51.93997	2025-06-17 05:52:48.35
51	2025-06-18	07:16	4.3274636	00:45	1.3840606	20:14	4.0409756	13:29	0.9769295	2025-06-16 12:36:42.099514	2025-06-17 05:52:48.35
45	2025-06-19	08:15	4.2928467	01:43	1.4436357	21:15	4.0332212	14:30	0.9982252	2025-06-16 12:34:47.879235	2025-06-17 05:52:48.482
28	2025-06-19	08:15	4.2928467	01:43	1.4436357	21:15	4.0332212	14:30	0.9982252	2025-06-16 09:17:51.93997	2025-06-17 05:52:48.482
42	2025-06-16	05:36	4.4374614	11:46	0.89825106	18:23	4.181302	23:55	1.3003713	2025-06-16 12:34:47.679639	2025-06-16 16:01:19.023
23	2025-06-16	05:36	4.4374614	11:46	0.89825106	18:23	4.181302	23:55	1.3003713	2025-06-16 09:17:51.93997	2025-06-16 16:01:19.023
25	2025-06-16	05:36	4.4374614	11:46	0.89825106	18:23	4.181302	23:55	1.3003713	2025-06-16 09:17:51.93997	2025-06-16 16:01:19.023
40	2025-06-16	05:36	4.44	11:46	0.9	18:23	4.18	23:55	1.3	2025-06-16 12:17:29.465519	2025-06-16 16:01:19.023
49	2025-06-16	05:36	4.4374614	11:46	0.89825106	18:23	4.181302	23:55	1.3003713	2025-06-16 12:36:41.965547	2025-06-16 16:01:19.023
52	2025-06-19	08:15	4.2928467	01:43	1.4436357	21:15	4.0332212	14:30	0.9982252	2025-06-16 12:36:42.164894	2025-06-17 05:52:48.482
46	2025-06-20	09:18	4.293824	02:49	1.4511176	22:19	4.09107	15:34	0.9914378	2025-06-16 12:34:47.944561	2025-06-17 05:52:48.614
29	2025-06-20	09:18	4.293824	02:49	1.4511176	22:19	4.09107	15:34	0.9914378	2025-06-16 09:17:51.93997	2025-06-17 05:52:48.614
53	2025-06-20	09:18	4.293824	02:49	1.4511176	22:19	4.09107	15:34	0.9914378	2025-06-16 12:36:42.22977	2025-06-17 05:52:48.614
47	2025-06-21	10:24	4.3438435	03:59	1.3834605	23:19	4.2109118	16:38	0.95892805	2025-06-16 12:34:48.009043	2025-06-17 05:52:48.746
30	2025-06-21	10:24	4.3438435	03:59	1.3834605	23:19	4.2109118	16:38	0.95892805	2025-06-16 09:17:51.93997	2025-06-17 05:52:48.746
54	2025-06-21	10:24	4.3438435	03:59	1.3834605	23:19	4.2109118	16:38	0.95892805	2025-06-16 12:36:42.294868	2025-06-17 05:52:48.746
\.


--
-- Data for Name: tide_data_backup_2025-06-18T15-17-24-035Z; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public."tide_data_backup_2025-06-18T15-17-24-035Z" (id, date, high_tide_1_time, high_tide_1_height, low_tide_1_time, low_tide_1_height, high_tide_2_time, high_tide_2_height, low_tide_2_time, low_tide_2_height, created_at, updated_at) FROM stdin;
1	2025-06-08	00:41	4.071488	06:29	1.3456054	12:57	4.1406527	18:46	1.1245996	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
2	2025-06-09	01:20	4.216587	07:10	1.2093074	13:39	4.228235	19:24	1.0779684	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
17	2025-06-10	01:56	4.3376217	07:48	1.0916008	14:18	4.2969484	20:01	1.0497234	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
18	2025-06-11	02:30	4.426628	08:25	0.99673903	14:57	4.342666	20:36	1.0416696	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
19	2025-06-12	03:05	4.483977	09:03	0.9251522	15:34	4.3644185	21:13	1.0530246	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
20	2025-06-13	03:39	4.511834	09:40	0.87837785	16:12	4.359773	21:49	1.0851328	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
21	2025-06-14	04:15	4.511162	10:20	0.85941005	16:52	4.3254757	22:29	1.139692	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
22	2025-06-15	04:54	4.4841666	11:02	0.86812603	17:35	4.262878	23:10	1.21426	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
24	2025-06-15	04:54	4.4841666	11:02	0.86812603	17:35	4.262878	23:10	1.21426	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
44	2025-06-18	07:16	4.3274636	00:45	1.3840606	20:14	4.0409756	13:29	0.9769295	2025-06-16 12:34:47.813047	2025-06-18 11:56:45.316
27	2025-06-18	07:16	4.3274636	00:45	1.3840606	20:14	4.0409756	13:29	0.9769295	2025-06-16 09:17:51.93997	2025-06-18 11:56:45.316
51	2025-06-18	07:16	4.3274636	00:45	1.3840606	20:14	4.0409756	13:29	0.9769295	2025-06-16 12:36:42.099514	2025-06-18 11:56:45.316
45	2025-06-19	08:15	4.2928467	01:43	1.4436357	21:15	4.0332212	14:30	0.9982252	2025-06-16 12:34:47.879235	2025-06-18 11:56:45.38
28	2025-06-19	08:15	4.2928467	01:43	1.4436357	21:15	4.0332212	14:30	0.9982252	2025-06-16 09:17:51.93997	2025-06-18 11:56:45.38
52	2025-06-19	08:15	4.2928467	01:43	1.4436357	21:15	4.0332212	14:30	0.9982252	2025-06-16 12:36:42.164894	2025-06-18 11:56:45.38
46	2025-06-20	09:18	4.293824	02:49	1.4511176	22:19	4.09107	15:34	0.9914378	2025-06-16 12:34:47.944561	2025-06-18 11:56:45.441
29	2025-06-20	09:18	4.293824	02:49	1.4511176	22:19	4.09107	15:34	0.9914378	2025-06-16 09:17:51.93997	2025-06-18 11:56:45.441
53	2025-06-20	09:18	4.293824	02:49	1.4511176	22:19	4.09107	15:34	0.9914378	2025-06-16 12:36:42.22977	2025-06-18 11:56:45.441
47	2025-06-21	10:24	4.3438435	03:59	1.3834605	23:19	4.2109118	16:38	0.95892805	2025-06-16 12:34:48.009043	2025-06-18 11:56:45.5
30	2025-06-21	10:24	4.3438435	03:59	1.3834605	23:19	4.2109118	16:38	0.95892805	2025-06-16 09:17:51.93997	2025-06-18 11:56:45.5
43	2025-06-17	06:24	4.3811216	12:35	0.9388296	19:16	4.098874	\N	\N	2025-06-16 12:34:47.74833	2025-06-17 05:52:48.217
26	2025-06-17	06:24	4.3811216	12:35	0.9388296	19:16	4.098874	\N	\N	2025-06-16 09:17:51.93997	2025-06-17 05:52:48.217
50	2025-06-17	06:24	4.3811216	12:35	0.9388296	19:16	4.098874	\N	\N	2025-06-16 12:36:42.034535	2025-06-17 05:52:48.217
54	2025-06-21	10:24	4.3438435	03:59	1.3834605	23:19	4.2109118	16:38	0.95892805	2025-06-16 12:36:42.294868	2025-06-18 11:56:45.5
42	2025-06-16	05:36	4.4374614	11:46	0.89825106	18:23	4.181302	23:55	1.3003713	2025-06-16 12:34:47.679639	2025-06-16 16:01:19.023
23	2025-06-16	05:36	4.4374614	11:46	0.89825106	18:23	4.181302	23:55	1.3003713	2025-06-16 09:17:51.93997	2025-06-16 16:01:19.023
25	2025-06-16	05:36	4.4374614	11:46	0.89825106	18:23	4.181302	23:55	1.3003713	2025-06-16 09:17:51.93997	2025-06-16 16:01:19.023
40	2025-06-16	05:36	4.44	11:46	0.9	18:23	4.18	23:55	1.3	2025-06-16 12:17:29.465519	2025-06-16 16:01:19.023
49	2025-06-16	05:36	4.4374614	11:46	0.89825106	18:23	4.181302	23:55	1.3003713	2025-06-16 12:36:41.965547	2025-06-16 16:01:19.023
41	2025-06-22	\N	\N	\N	\N	\N	\N	\N	\N	2025-06-16 12:19:54.880103	2025-06-18 11:56:45.56
48	2025-06-22	11:30	4.442456	05:04	1.2465082	\N	\N	17:39	0.91438156	2025-06-16 12:34:48.074247	2025-06-18 11:56:45.56
55	2025-06-22	11:30	4.442456	05:04	1.2465082	\N	\N	17:39	0.91438156	2025-06-16 12:36:42.3599	2025-06-18 11:56:45.56
56	2025-06-23	\N	\N	\N	\N	\N	\N	\N	\N	2025-06-17 05:52:48.118564	2025-06-18 11:56:45.621
57	2025-06-24	\N	\N	\N	\N	\N	\N	\N	\N	2025-06-18 11:56:45.268589	2025-06-18 11:56:45.268589
\.


--
-- Data for Name: tide_data_backup_2025-06-18T23-03-54-049Z; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public."tide_data_backup_2025-06-18T23-03-54-049Z" (id, date, high_tide_1_time, high_tide_1_height, low_tide_1_time, low_tide_1_height, high_tide_2_time, high_tide_2_height, low_tide_2_time, low_tide_2_height, created_at, updated_at) FROM stdin;
1	2025-06-08	00:41	4.071488	06:29	1.3456054	12:57	4.1406527	18:46	1.1245996	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
2	2025-06-09	01:20	4.216587	07:10	1.2093074	13:39	4.228235	19:24	1.0779684	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
17	2025-06-10	01:56	4.3376217	07:48	1.0916008	14:18	4.2969484	20:01	1.0497234	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
18	2025-06-11	02:30	4.426628	08:25	0.99673903	14:57	4.342666	20:36	1.0416696	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
19	2025-06-12	03:05	4.483977	09:03	0.9251522	15:34	4.3644185	21:13	1.0530246	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
20	2025-06-13	03:39	4.511834	09:40	0.87837785	16:12	4.359773	21:49	1.0851328	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
21	2025-06-14	04:15	4.511162	10:20	0.85941005	16:52	4.3254757	22:29	1.139692	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
22	2025-06-15	04:54	4.4841666	11:02	0.86812603	17:35	4.262878	23:10	1.21426	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
24	2025-06-15	04:54	4.4841666	11:02	0.86812603	17:35	4.262878	23:10	1.21426	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
45	2025-06-19	08:15	4.2928467	01:43	1.4436357	21:15	4.0332212	14:30	0.9982252	2025-06-16 12:34:47.879235	2025-06-18 15:17:24.257
28	2025-06-19	08:15	4.2928467	01:43	1.4436357	21:15	4.0332212	14:30	0.9982252	2025-06-16 09:17:51.93997	2025-06-18 15:17:24.257
52	2025-06-19	08:15	4.2928467	01:43	1.4436357	21:15	4.0332212	14:30	0.9982252	2025-06-16 12:36:42.164894	2025-06-18 15:17:24.257
46	2025-06-20	09:18	4.293824	02:49	1.4511176	22:19	4.09107	15:34	0.9914378	2025-06-16 12:34:47.944561	2025-06-18 15:17:24.323
29	2025-06-20	09:18	4.293824	02:49	1.4511176	22:19	4.09107	15:34	0.9914378	2025-06-16 09:17:51.93997	2025-06-18 15:17:24.323
53	2025-06-20	09:18	4.293824	02:49	1.4511176	22:19	4.09107	15:34	0.9914378	2025-06-16 12:36:42.22977	2025-06-18 15:17:24.323
47	2025-06-21	10:24	4.3438435	03:59	1.3834605	23:19	4.2109118	16:38	0.95892805	2025-06-16 12:34:48.009043	2025-06-18 15:17:24.388
30	2025-06-21	10:24	4.3438435	03:59	1.3834605	23:19	4.2109118	16:38	0.95892805	2025-06-16 09:17:51.93997	2025-06-18 15:17:24.388
54	2025-06-21	10:24	4.3438435	03:59	1.3834605	23:19	4.2109118	16:38	0.95892805	2025-06-16 12:36:42.294868	2025-06-18 15:17:24.388
41	2025-06-22	\N	\N	\N	\N	\N	\N	\N	\N	2025-06-16 12:19:54.880103	2025-06-18 15:17:24.452
48	2025-06-22	11:30	4.442456	05:04	1.2465082	\N	\N	17:39	0.91438156	2025-06-16 12:34:48.074247	2025-06-18 15:17:24.452
55	2025-06-22	11:30	4.442456	05:04	1.2465082	\N	\N	17:39	0.91438156	2025-06-16 12:36:42.3599	2025-06-18 15:17:24.452
43	2025-06-17	06:24	4.3811216	12:35	0.9388296	19:16	4.098874	\N	\N	2025-06-16 12:34:47.74833	2025-06-17 05:52:48.217
26	2025-06-17	06:24	4.3811216	12:35	0.9388296	19:16	4.098874	\N	\N	2025-06-16 09:17:51.93997	2025-06-17 05:52:48.217
50	2025-06-17	06:24	4.3811216	12:35	0.9388296	19:16	4.098874	\N	\N	2025-06-16 12:36:42.034535	2025-06-17 05:52:48.217
56	2025-06-23	\N	\N	\N	\N	\N	\N	\N	\N	2025-06-17 05:52:48.118564	2025-06-18 15:17:24.515
57	2025-06-24	\N	\N	\N	\N	\N	\N	\N	\N	2025-06-18 11:56:45.268589	2025-06-18 15:17:24.579
42	2025-06-16	05:36	4.4374614	11:46	0.89825106	18:23	4.181302	23:55	1.3003713	2025-06-16 12:34:47.679639	2025-06-16 16:01:19.023
23	2025-06-16	05:36	4.4374614	11:46	0.89825106	18:23	4.181302	23:55	1.3003713	2025-06-16 09:17:51.93997	2025-06-16 16:01:19.023
25	2025-06-16	05:36	4.4374614	11:46	0.89825106	18:23	4.181302	23:55	1.3003713	2025-06-16 09:17:51.93997	2025-06-16 16:01:19.023
40	2025-06-16	05:36	4.44	11:46	0.9	18:23	4.18	23:55	1.3	2025-06-16 12:17:29.465519	2025-06-16 16:01:19.023
49	2025-06-16	05:36	4.4374614	11:46	0.89825106	18:23	4.181302	23:55	1.3003713	2025-06-16 12:36:41.965547	2025-06-16 16:01:19.023
44	2025-06-18	07:16	4.3274636	00:45	1.3840606	20:14	4.0409756	13:29	0.9769295	2025-06-16 12:34:47.813047	2025-06-18 15:17:24.187
27	2025-06-18	07:16	4.3274636	00:45	1.3840606	20:14	4.0409756	13:29	0.9769295	2025-06-16 09:17:51.93997	2025-06-18 15:17:24.187
51	2025-06-18	07:16	4.3274636	00:45	1.3840606	20:14	4.0409756	13:29	0.9769295	2025-06-16 12:36:42.099514	2025-06-18 15:17:24.187
\.


--
-- Data for Name: tide_data_backup_2025-06-19T02-16-36-497Z; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public."tide_data_backup_2025-06-19T02-16-36-497Z" (id, date, high_tide_1_time, high_tide_1_height, low_tide_1_time, low_tide_1_height, high_tide_2_time, high_tide_2_height, low_tide_2_time, low_tide_2_height, created_at, updated_at) FROM stdin;
1	2025-06-08	00:41	4.071488	06:29	1.3456054	12:57	4.1406527	18:46	1.1245996	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
2	2025-06-09	01:20	4.216587	07:10	1.2093074	13:39	4.228235	19:24	1.0779684	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
17	2025-06-10	01:56	4.3376217	07:48	1.0916008	14:18	4.2969484	20:01	1.0497234	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
18	2025-06-11	02:30	4.426628	08:25	0.99673903	14:57	4.342666	20:36	1.0416696	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
19	2025-06-12	03:05	4.483977	09:03	0.9251522	15:34	4.3644185	21:13	1.0530246	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
20	2025-06-13	03:39	4.511834	09:40	0.87837785	16:12	4.359773	21:49	1.0851328	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
21	2025-06-14	04:15	4.511162	10:20	0.85941005	16:52	4.3254757	22:29	1.139692	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
22	2025-06-15	04:54	4.4841666	11:02	0.86812603	17:35	4.262878	23:10	1.21426	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
24	2025-06-15	04:54	4.4841666	11:02	0.86812603	17:35	4.262878	23:10	1.21426	2025-06-16 09:17:51.93997	2025-06-16 09:17:55.606126
43	2025-06-17	06:24	4.3811216	12:35	0.9388296	19:16	4.098874	\N	\N	2025-06-16 12:34:47.74833	2025-06-17 05:52:48.217
26	2025-06-17	06:24	4.3811216	12:35	0.9388296	19:16	4.098874	\N	\N	2025-06-16 09:17:51.93997	2025-06-17 05:52:48.217
50	2025-06-17	06:24	4.3811216	12:35	0.9388296	19:16	4.098874	\N	\N	2025-06-16 12:36:42.034535	2025-06-17 05:52:48.217
44	2025-06-18	07:16	4.3274636	00:45	1.3840606	20:14	4.0409756	13:29	0.9769295	2025-06-16 12:34:47.813047	2025-06-18 23:03:54.255
27	2025-06-18	07:16	4.3274636	00:45	1.3840606	20:14	4.0409756	13:29	0.9769295	2025-06-16 09:17:51.93997	2025-06-18 23:03:54.255
51	2025-06-18	07:16	4.3274636	00:45	1.3840606	20:14	4.0409756	13:29	0.9769295	2025-06-16 12:36:42.099514	2025-06-18 23:03:54.255
42	2025-06-16	05:36	4.4374614	11:46	0.89825106	18:23	4.181302	23:55	1.3003713	2025-06-16 12:34:47.679639	2025-06-16 16:01:19.023
23	2025-06-16	05:36	4.4374614	11:46	0.89825106	18:23	4.181302	23:55	1.3003713	2025-06-16 09:17:51.93997	2025-06-16 16:01:19.023
25	2025-06-16	05:36	4.4374614	11:46	0.89825106	18:23	4.181302	23:55	1.3003713	2025-06-16 09:17:51.93997	2025-06-16 16:01:19.023
40	2025-06-16	05:36	4.44	11:46	0.9	18:23	4.18	23:55	1.3	2025-06-16 12:17:29.465519	2025-06-16 16:01:19.023
49	2025-06-16	05:36	4.4374614	11:46	0.89825106	18:23	4.181302	23:55	1.3003713	2025-06-16 12:36:41.965547	2025-06-16 16:01:19.023
45	2025-06-19	08:15	4.2928467	01:43	1.4436357	21:15	4.0332212	14:30	0.9982252	2025-06-16 12:34:47.879235	2025-06-18 23:03:54.39
28	2025-06-19	08:15	4.2928467	01:43	1.4436357	21:15	4.0332212	14:30	0.9982252	2025-06-16 09:17:51.93997	2025-06-18 23:03:54.39
52	2025-06-19	08:15	4.2928467	01:43	1.4436357	21:15	4.0332212	14:30	0.9982252	2025-06-16 12:36:42.164894	2025-06-18 23:03:54.39
46	2025-06-20	09:18	4.293824	02:49	1.4511176	22:19	4.09107	15:34	0.9914378	2025-06-16 12:34:47.944561	2025-06-18 23:03:54.52
29	2025-06-20	09:18	4.293824	02:49	1.4511176	22:19	4.09107	15:34	0.9914378	2025-06-16 09:17:51.93997	2025-06-18 23:03:54.52
53	2025-06-20	09:18	4.293824	02:49	1.4511176	22:19	4.09107	15:34	0.9914378	2025-06-16 12:36:42.22977	2025-06-18 23:03:54.52
47	2025-06-21	10:24	4.3438435	03:59	1.3834605	23:19	4.2109118	16:38	0.95892805	2025-06-16 12:34:48.009043	2025-06-18 23:03:54.652
30	2025-06-21	10:24	4.3438435	03:59	1.3834605	23:19	4.2109118	16:38	0.95892805	2025-06-16 09:17:51.93997	2025-06-18 23:03:54.652
54	2025-06-21	10:24	4.3438435	03:59	1.3834605	23:19	4.2109118	16:38	0.95892805	2025-06-16 12:36:42.294868	2025-06-18 23:03:54.652
41	2025-06-22	\N	\N	\N	\N	\N	\N	\N	\N	2025-06-16 12:19:54.880103	2025-06-18 23:03:54.783
48	2025-06-22	11:30	4.442456	05:04	1.2465082	\N	\N	17:39	0.91438156	2025-06-16 12:34:48.074247	2025-06-18 23:03:54.783
55	2025-06-22	11:30	4.442456	05:04	1.2465082	\N	\N	17:39	0.91438156	2025-06-16 12:36:42.3599	2025-06-18 23:03:54.783
56	2025-06-23	\N	\N	\N	\N	\N	\N	\N	\N	2025-06-17 05:52:48.118564	2025-06-18 23:03:54.914
57	2025-06-24	\N	\N	\N	\N	\N	\N	\N	\N	2025-06-18 11:56:45.268589	2025-06-18 23:03:55.045
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.users (id, username, password) FROM stdin;
\.


--
-- Data for Name: weather_data; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.weather_data (id, date, temperature, condition, description, wind_speed, humidity, wind_direction, temperature_min, temperature_max, precipitation_sum, wind_speed_max, wind_direction_dominant, uv_index_max, source, cloudcover, created_at, updated_at) FROM stdin;
5	2025-06-10	\N	\N	\N	\N	\N	\N	11.6	14.5	0.6	35.3	311	5.85	Open-Meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
1	2025-01-01	4	cloudy	Grey skies over the North Sea	29	85	W	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
2	2025-01-02	5	rainy	Wet conditions along the causeway	32	86	S	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
3	2025-06-09	14	partly cloudy	Pleasant coastal conditions	18	72	SW	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
4	2025-06-10	15	sunny	Clear skies for crossing	15	68	W	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
8	2025-06-11	\N	\N	\N	\N	\N	\N	10.5	14.2	0	29.7	141	6.3	Open-Meteo	34	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
9	2025-06-12	\N	\N	\N	\N	\N	\N	11.9	13.7	0.2	43	140	5.75	Open-Meteo	76	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
10	2025-06-13	\N	\N	\N	\N	\N	\N	12.3	21	0.9	17.3	186	5.5	Open-Meteo	70	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
11	2025-06-14	\N	\N	\N	\N	\N	\N	11.8	18.3	11.2	14.1	273	4.5	Open-Meteo	79	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
29	2025-06-16	\N	\N	\N	\N	\N	\N	12.1	19.6	0	30.1	245	6.35	open-meteo	84	2025-06-16 12:32:27.268604	2025-06-16 17:15:01.481
7	2025-06-16	\N	\N	\N	\N	\N	\N	12.1	19.6	0	30.1	245	6.35	open-meteo	84	2025-06-16 09:17:59.462292	2025-06-16 17:15:01.481
13	2025-06-16	\N	\N	\N	\N	\N	\N	12.1	19.6	0	30.1	245	6.35	open-meteo	84	2025-06-16 09:17:59.462292	2025-06-16 17:15:01.481
31	2025-06-18	\N	\N	\N	\N	\N	\N	11.7	17	0	24.9	266	5.5	open-meteo	88	2025-06-16 12:32:27.418665	2025-06-18 22:18:47.941
15	2025-06-18	\N	\N	\N	\N	\N	\N	11.7	17	0	24.9	266	5.5	open-meteo	88	2025-06-16 09:17:59.462292	2025-06-18 22:18:47.941
6	2025-06-15	\N	\N	\N	\N	\N	\N	12.8	18	0	34.5	256	6.5	open-meteo	74	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
12	2025-06-15	\N	\N	\N	\N	\N	\N	12.8	18	0	34.5	256	6.5	open-meteo	74	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
30	2025-06-17	\N	\N	\N	\N	\N	\N	13.9	19.4	0	39.4	247	6.7	open-meteo	85	2025-06-16 12:32:27.35228	2025-06-17 17:15:44.678
14	2025-06-17	\N	\N	\N	\N	\N	\N	13.9	19.4	0	39.4	247	6.7	open-meteo	85	2025-06-16 09:17:59.462292	2025-06-17 17:15:44.678
32	2025-06-19	\N	\N	\N	\N	\N	\N	12.3	15.4	0	29.4	140	6.65	open-meteo	59	2025-06-16 12:32:27.484754	2025-06-19 07:29:40.221
16	2025-06-19	\N	\N	\N	\N	\N	\N	12.3	15.4	0	29.4	140	6.65	open-meteo	59	2025-06-16 09:17:59.462292	2025-06-19 07:29:40.221
33	2025-06-20	\N	\N	\N	\N	\N	\N	13.5	18.5	0	21	129	6.75	open-meteo	43	2025-06-16 12:32:27.550817	2025-06-19 07:29:40.356
17	2025-06-20	\N	\N	\N	\N	\N	\N	13.5	18.5	0	21	129	6.75	open-meteo	43	2025-06-16 09:17:59.462292	2025-06-19 07:29:40.356
18	2025-06-21	\N	\N	\N	\N	\N	\N	13.2	23.5	1.1	26.6	149	6.4	open-meteo	65	2025-06-16 09:17:59.462292	2025-06-19 07:29:40.491
34	2025-06-21	\N	\N	\N	\N	\N	\N	13.2	23.5	1.1	26.6	149	6.4	open-meteo	65	2025-06-16 12:32:27.617124	2025-06-19 07:29:40.491
19	2025-06-22	\N	\N	\N	\N	\N	\N	12.5	19.3	0.6	34.6	236	6.6	open-meteo	84	2025-06-16 09:17:59.462292	2025-06-19 07:29:40.622
35	2025-06-22	\N	\N	\N	\N	\N	\N	12.5	19.3	0.6	34.6	236	6.6	open-meteo	84	2025-06-16 12:32:27.683058	2025-06-19 07:29:40.622
20	2025-06-23	\N	\N	\N	\N	\N	\N	11.3	17.8	0.6	33.5	265	6.15	open-meteo	59	2025-06-16 09:17:59.462292	2025-06-19 07:29:40.757
36	2025-06-23	\N	\N	\N	\N	\N	\N	11.3	17.8	0.6	33.5	265	6.15	open-meteo	59	2025-06-16 12:32:27.74903	2025-06-19 07:29:40.757
21	2025-06-24	\N	\N	\N	\N	\N	\N	13.1	18.6	0.6	35.3	262	4.25	open-meteo	80	2025-06-16 09:17:59.462292	2025-06-19 07:29:40.887
37	2025-06-24	\N	\N	\N	\N	\N	\N	13.1	18.6	0.6	35.3	262	4.25	open-meteo	80	2025-06-16 12:32:27.816064	2025-06-19 07:29:40.887
22	2025-06-25	\N	\N	\N	\N	\N	\N	9.8	22.8	0.2	23.7	200	5.8	open-meteo	68	2025-06-16 09:17:59.462292	2025-06-19 07:29:41.017
38	2025-06-25	\N	\N	\N	\N	\N	\N	9.8	22.8	0.2	23.7	200	5.8	open-meteo	68	2025-06-16 12:32:27.882248	2025-06-19 07:29:41.017
23	2025-06-26	\N	\N	\N	\N	\N	\N	13.7	20.4	0.4	36.7	228	5.95	open-meteo	63	2025-06-16 09:17:59.462292	2025-06-19 07:29:41.148
39	2025-06-26	\N	\N	\N	\N	\N	\N	13.7	20.4	0.4	36.7	228	5.95	open-meteo	63	2025-06-16 12:32:27.948781	2025-06-19 07:29:41.148
24	2025-06-27	\N	\N	\N	\N	\N	\N	11.3	22.8	0	34.7	224	4.6	open-meteo	47	2025-06-16 09:17:59.462292	2025-06-19 07:29:41.279
40	2025-06-27	\N	\N	\N	\N	\N	\N	11.3	22.8	0	34.7	224	4.6	open-meteo	47	2025-06-16 12:32:28.015044	2025-06-19 07:29:41.279
25	2025-06-28	\N	\N	\N	\N	\N	\N	17.3	24.4	0	31.2	246	5.75	open-meteo	58	2025-06-16 09:17:59.462292	2025-06-19 07:29:41.41
41	2025-06-28	\N	\N	\N	\N	\N	\N	17.3	24.4	0	31.2	246	5.75	open-meteo	58	2025-06-16 12:32:28.081093	2025-06-19 07:29:41.41
26	2025-06-29	\N	\N	\N	\N	\N	\N	16.4	24.3	0	18.1	209	4.05	open-meteo	43	2025-06-16 09:17:59.462292	2025-06-19 07:29:41.541
42	2025-06-29	\N	\N	\N	\N	\N	\N	16.4	24.3	0	18.1	209	4.05	open-meteo	43	2025-06-16 12:32:28.148017	2025-06-19 07:29:41.541
27	2025-06-30	\N	\N	\N	\N	\N	\N	13.8	26.6	0.6	22.7	316	5.85	open-meteo	56	2025-06-16 09:17:59.462292	2025-06-19 07:29:41.67
28	2025-07-01	\N	\N	\N	\N	\N	\N	10.9	17.3	0	20.2	122	6.45	open-meteo	22	2025-06-16 09:31:12.503567	2025-06-19 07:29:41.801
43	2025-07-02	\N	\N	\N	\N	\N	\N	10.4	24.4	0	17.2	133	6.45	open-meteo	3	2025-06-17 05:52:25.032257	2025-06-19 07:29:41.93
44	2025-07-03	\N	\N	\N	\N	\N	\N	13.7	19	2.4	21.3	169	1.5	open-meteo	88	2025-06-18 05:16:19.879837	2025-06-19 07:29:42.066
45	2025-07-04	\N	\N	\N	\N	\N	\N	12.4	20.8	0	27.6	\N	6.35	open-meteo	77	2025-06-19 05:40:51.312919	2025-06-19 07:29:42.197
\.


--
-- Data for Name: weather_data_backup_2025-06-15T14-19-00-898Z; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public."weather_data_backup_2025-06-15T14-19-00-898Z" (id, date, temperature, condition, description, wind_speed, humidity, wind_direction, temperature_min, temperature_max, precipitation_sum, wind_speed_max, wind_direction_dominant, uv_index_max, source, cloudcover) FROM stdin;
5	2025-06-10	\N	\N	\N	\N	\N	\N	11.6	14.5	0.6	35.3	311	5.85	Open-Meteo	\N
1	2025-01-01	4	cloudy	Grey skies over the North Sea	29	85	W	\N	\N	\N	\N	\N	\N	open-meteo	\N
2	2025-01-02	5	rainy	Wet conditions along the causeway	32	86	S	\N	\N	\N	\N	\N	\N	open-meteo	\N
3	2025-06-09	14	partly cloudy	Pleasant coastal conditions	18	72	SW	\N	\N	\N	\N	\N	\N	open-meteo	\N
4	2025-06-10	15	sunny	Clear skies for crossing	15	68	W	\N	\N	\N	\N	\N	\N	open-meteo	\N
6	2025-06-15	\N	\N	\N	\N	\N	\N	12.3	17.5	0	23	269	6.7	Open-Meteo	76
7	2025-06-16	\N	\N	\N	\N	\N	\N	12.6	18.3	0.6	23	248	5.7	Open-Meteo	99
8	2025-06-11	\N	\N	\N	\N	\N	\N	10.5	14.2	0	29.7	141	6.3	Open-Meteo	34
9	2025-06-12	\N	\N	\N	\N	\N	\N	11.9	13.7	0.2	43	140	5.75	Open-Meteo	76
10	2025-06-13	\N	\N	\N	\N	\N	\N	12.3	21	0.9	17.3	186	5.5	Open-Meteo	70
11	2025-06-14	\N	\N	\N	\N	\N	\N	11.8	18.3	11.2	14.1	273	4.5	Open-Meteo	79
12	2025-06-15	\N	\N	\N	\N	\N	\N	12.3	17.5	0	23	269	6.7	Open-Meteo	76
13	2025-06-16	\N	\N	\N	\N	\N	\N	12.6	18.3	0.6	23	248	5.7	Open-Meteo	99
14	2025-06-17	\N	\N	\N	\N	\N	\N	11.8	18.7	0	24.9	263	5.6	Open-Meteo	92
\.


--
-- Data for Name: weather_data_backup_2025-06-15T14-32-41-487Z; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public."weather_data_backup_2025-06-15T14-32-41-487Z" (id, date, temperature, condition, description, wind_speed, humidity, wind_direction, temperature_min, temperature_max, precipitation_sum, wind_speed_max, wind_direction_dominant, uv_index_max, source, cloudcover) FROM stdin;
5	2025-06-10	\N	\N	\N	\N	\N	\N	11.6	14.5	0.6	35.3	311	5.85	Open-Meteo	\N
1	2025-01-01	4	cloudy	Grey skies over the North Sea	29	85	W	\N	\N	\N	\N	\N	\N	open-meteo	\N
2	2025-01-02	5	rainy	Wet conditions along the causeway	32	86	S	\N	\N	\N	\N	\N	\N	open-meteo	\N
3	2025-06-09	14	partly cloudy	Pleasant coastal conditions	18	72	SW	\N	\N	\N	\N	\N	\N	open-meteo	\N
4	2025-06-10	15	sunny	Clear skies for crossing	15	68	W	\N	\N	\N	\N	\N	\N	open-meteo	\N
6	2025-06-15	\N	\N	\N	\N	\N	\N	12.3	17.5	0	23	269	6.7	Open-Meteo	76
7	2025-06-16	\N	\N	\N	\N	\N	\N	12.6	18.3	0.6	23	248	5.7	Open-Meteo	99
8	2025-06-11	\N	\N	\N	\N	\N	\N	10.5	14.2	0	29.7	141	6.3	Open-Meteo	34
9	2025-06-12	\N	\N	\N	\N	\N	\N	11.9	13.7	0.2	43	140	5.75	Open-Meteo	76
10	2025-06-13	\N	\N	\N	\N	\N	\N	12.3	21	0.9	17.3	186	5.5	Open-Meteo	70
11	2025-06-14	\N	\N	\N	\N	\N	\N	11.8	18.3	11.2	14.1	273	4.5	Open-Meteo	79
12	2025-06-15	\N	\N	\N	\N	\N	\N	12.3	17.5	0	23	269	6.7	Open-Meteo	76
13	2025-06-16	\N	\N	\N	\N	\N	\N	12.6	18.3	0.6	23	248	5.7	Open-Meteo	99
14	2025-06-17	\N	\N	\N	\N	\N	\N	11.8	18.7	0	24.9	263	5.6	Open-Meteo	92
\.


--
-- Data for Name: weather_data_backup_2025-06-15T20-42-37-793Z; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public."weather_data_backup_2025-06-15T20-42-37-793Z" (id, date, temperature, condition, description, wind_speed, humidity, wind_direction, temperature_min, temperature_max, precipitation_sum, wind_speed_max, wind_direction_dominant, uv_index_max, source, cloudcover) FROM stdin;
5	2025-06-10	\N	\N	\N	\N	\N	\N	11.6	14.5	0.6	35.3	311	5.85	Open-Meteo	\N
1	2025-01-01	4	cloudy	Grey skies over the North Sea	29	85	W	\N	\N	\N	\N	\N	\N	open-meteo	\N
2	2025-01-02	5	rainy	Wet conditions along the causeway	32	86	S	\N	\N	\N	\N	\N	\N	open-meteo	\N
3	2025-06-09	14	partly cloudy	Pleasant coastal conditions	18	72	SW	\N	\N	\N	\N	\N	\N	open-meteo	\N
4	2025-06-10	15	sunny	Clear skies for crossing	15	68	W	\N	\N	\N	\N	\N	\N	open-meteo	\N
6	2025-06-15	\N	\N	\N	\N	\N	\N	12.3	17.5	0	23	269	6.7	Open-Meteo	76
7	2025-06-16	\N	\N	\N	\N	\N	\N	12.6	18.3	0.6	23	248	5.7	Open-Meteo	99
8	2025-06-11	\N	\N	\N	\N	\N	\N	10.5	14.2	0	29.7	141	6.3	Open-Meteo	34
9	2025-06-12	\N	\N	\N	\N	\N	\N	11.9	13.7	0.2	43	140	5.75	Open-Meteo	76
10	2025-06-13	\N	\N	\N	\N	\N	\N	12.3	21	0.9	17.3	186	5.5	Open-Meteo	70
11	2025-06-14	\N	\N	\N	\N	\N	\N	11.8	18.3	11.2	14.1	273	4.5	Open-Meteo	79
12	2025-06-15	\N	\N	\N	\N	\N	\N	12.3	17.5	0	23	269	6.7	Open-Meteo	76
13	2025-06-16	\N	\N	\N	\N	\N	\N	12.6	18.3	0.6	23	248	5.7	Open-Meteo	99
14	2025-06-17	\N	\N	\N	\N	\N	\N	11.8	18.7	0	24.9	263	5.6	Open-Meteo	92
\.


--
-- Data for Name: weather_data_backup_2025-06-15T21-37-00-411Z; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public."weather_data_backup_2025-06-15T21-37-00-411Z" (id, date, temperature, condition, description, wind_speed, humidity, wind_direction, temperature_min, temperature_max, precipitation_sum, wind_speed_max, wind_direction_dominant, uv_index_max, source, cloudcover) FROM stdin;
5	2025-06-10	\N	\N	\N	\N	\N	\N	11.6	14.5	0.6	35.3	311	5.85	Open-Meteo	\N
1	2025-01-01	4	cloudy	Grey skies over the North Sea	29	85	W	\N	\N	\N	\N	\N	\N	open-meteo	\N
2	2025-01-02	5	rainy	Wet conditions along the causeway	32	86	S	\N	\N	\N	\N	\N	\N	open-meteo	\N
3	2025-06-09	14	partly cloudy	Pleasant coastal conditions	18	72	SW	\N	\N	\N	\N	\N	\N	open-meteo	\N
4	2025-06-10	15	sunny	Clear skies for crossing	15	68	W	\N	\N	\N	\N	\N	\N	open-meteo	\N
8	2025-06-11	\N	\N	\N	\N	\N	\N	10.5	14.2	0	29.7	141	6.3	Open-Meteo	34
9	2025-06-12	\N	\N	\N	\N	\N	\N	11.9	13.7	0.2	43	140	5.75	Open-Meteo	76
10	2025-06-13	\N	\N	\N	\N	\N	\N	12.3	21	0.9	17.3	186	5.5	Open-Meteo	70
11	2025-06-14	\N	\N	\N	\N	\N	\N	11.8	18.3	11.2	14.1	273	4.5	Open-Meteo	79
6	2025-06-15	\N	\N	\N	\N	\N	\N	12.8	18	0	34.5	256	6.5	open-meteo	74
12	2025-06-15	\N	\N	\N	\N	\N	\N	12.8	18	0	34.5	256	6.5	open-meteo	74
7	2025-06-16	\N	\N	\N	\N	\N	\N	12	19	0	28.1	246	6.5	open-meteo	75
13	2025-06-16	\N	\N	\N	\N	\N	\N	12	19	0	28.1	246	6.5	open-meteo	75
14	2025-06-17	\N	\N	\N	\N	\N	\N	13.7	17.6	0	34.2	243	6.5	open-meteo	98
15	2025-06-18	\N	\N	\N	\N	\N	\N	11	16.5	0	28.3	276	6.65	open-meteo	67
16	2025-06-19	\N	\N	\N	\N	\N	\N	9.9	14.8	0	16.9	143	6.75	open-meteo	20
17	2025-06-20	\N	\N	\N	\N	\N	\N	12	22.8	0	13.7	142	6.8	open-meteo	87
18	2025-06-21	\N	\N	\N	\N	\N	\N	13	24.8	0	17.6	146	6.35	open-meteo	19
\.


--
-- Data for Name: weather_data_backup_2025-06-16T09-31-12-359Z; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public."weather_data_backup_2025-06-16T09-31-12-359Z" (id, date, temperature, condition, description, wind_speed, humidity, wind_direction, temperature_min, temperature_max, precipitation_sum, wind_speed_max, wind_direction_dominant, uv_index_max, source, cloudcover, created_at, updated_at) FROM stdin;
5	2025-06-10	\N	\N	\N	\N	\N	\N	11.6	14.5	0.6	35.3	311	5.85	Open-Meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
1	2025-01-01	4	cloudy	Grey skies over the North Sea	29	85	W	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
2	2025-01-02	5	rainy	Wet conditions along the causeway	32	86	S	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
3	2025-06-09	14	partly cloudy	Pleasant coastal conditions	18	72	SW	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
4	2025-06-10	15	sunny	Clear skies for crossing	15	68	W	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
8	2025-06-11	\N	\N	\N	\N	\N	\N	10.5	14.2	0	29.7	141	6.3	Open-Meteo	34	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
9	2025-06-12	\N	\N	\N	\N	\N	\N	11.9	13.7	0.2	43	140	5.75	Open-Meteo	76	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
10	2025-06-13	\N	\N	\N	\N	\N	\N	12.3	21	0.9	17.3	186	5.5	Open-Meteo	70	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
11	2025-06-14	\N	\N	\N	\N	\N	\N	11.8	18.3	11.2	14.1	273	4.5	Open-Meteo	79	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
6	2025-06-15	\N	\N	\N	\N	\N	\N	12.8	18	0	34.5	256	6.5	open-meteo	74	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
12	2025-06-15	\N	\N	\N	\N	\N	\N	12.8	18	0	34.5	256	6.5	open-meteo	74	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
7	2025-06-16	\N	\N	\N	\N	\N	\N	12	19	0	28.1	246	6.5	open-meteo	75	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
13	2025-06-16	\N	\N	\N	\N	\N	\N	12	19	0	28.1	246	6.5	open-meteo	75	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
14	2025-06-17	\N	\N	\N	\N	\N	\N	13.7	17.6	0	34.2	243	6.5	open-meteo	98	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
15	2025-06-18	\N	\N	\N	\N	\N	\N	11	16.5	0	28.3	276	6.65	open-meteo	67	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
16	2025-06-19	\N	\N	\N	\N	\N	\N	9.9	14.8	0	16.9	143	6.75	open-meteo	20	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
17	2025-06-20	\N	\N	\N	\N	\N	\N	12	25.7	0	15.3	182	6.8	open-meteo	86	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
18	2025-06-21	\N	\N	\N	\N	\N	\N	13	24.8	0	17.6	146	6.35	open-meteo	19	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
19	2025-06-22	\N	\N	\N	\N	\N	\N	11.4	28.2	0	12.7	228	6.25	open-meteo	35	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
20	2025-06-23	\N	\N	\N	\N	\N	\N	11.4	17.1	5.2	20.9	138	1.75	open-meteo	99	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
21	2025-06-24	\N	\N	\N	\N	\N	\N	10.8	16.7	0.2	14	25	4.5	open-meteo	92	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
22	2025-06-25	\N	\N	\N	\N	\N	\N	10.9	20.4	0	23.9	156	5.2	open-meteo	80	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
23	2025-06-26	\N	\N	\N	\N	\N	\N	12.2	20.5	0	18	205	3.3	open-meteo	87	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
24	2025-06-27	\N	\N	\N	\N	\N	\N	10.3	19.2	0	24.6	259	5.65	open-meteo	66	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
25	2025-06-28	\N	\N	\N	\N	\N	\N	10.1	18.2	0	25.8	254	5.15	open-meteo	90	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
26	2025-06-29	\N	\N	\N	\N	\N	\N	12.4	22.4	0	21.8	241	6.2	open-meteo	76	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
27	2025-06-30	\N	\N	\N	\N	\N	\N	11.6	18	0.9	26.5	250	3.2	open-meteo	75	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
\.


--
-- Data for Name: weather_data_backup_2025-06-16T09-34-48-021Z; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public."weather_data_backup_2025-06-16T09-34-48-021Z" (id, date, temperature, condition, description, wind_speed, humidity, wind_direction, temperature_min, temperature_max, precipitation_sum, wind_speed_max, wind_direction_dominant, uv_index_max, source, cloudcover, created_at, updated_at) FROM stdin;
5	2025-06-10	\N	\N	\N	\N	\N	\N	11.6	14.5	0.6	35.3	311	5.85	Open-Meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
1	2025-01-01	4	cloudy	Grey skies over the North Sea	29	85	W	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
2	2025-01-02	5	rainy	Wet conditions along the causeway	32	86	S	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
3	2025-06-09	14	partly cloudy	Pleasant coastal conditions	18	72	SW	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
4	2025-06-10	15	sunny	Clear skies for crossing	15	68	W	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
8	2025-06-11	\N	\N	\N	\N	\N	\N	10.5	14.2	0	29.7	141	6.3	Open-Meteo	34	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
9	2025-06-12	\N	\N	\N	\N	\N	\N	11.9	13.7	0.2	43	140	5.75	Open-Meteo	76	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
10	2025-06-13	\N	\N	\N	\N	\N	\N	12.3	21	0.9	17.3	186	5.5	Open-Meteo	70	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
11	2025-06-14	\N	\N	\N	\N	\N	\N	11.8	18.3	11.2	14.1	273	4.5	Open-Meteo	79	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
6	2025-06-15	\N	\N	\N	\N	\N	\N	12.8	18	0	34.5	256	6.5	open-meteo	74	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
12	2025-06-15	\N	\N	\N	\N	\N	\N	12.8	18	0	34.5	256	6.5	open-meteo	74	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
7	2025-06-16	\N	\N	\N	\N	\N	\N	12.1	19.1	0	26.7	244	6.4	open-meteo	80	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
13	2025-06-16	\N	\N	\N	\N	\N	\N	12.1	19.1	0	26.7	244	6.4	open-meteo	80	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
14	2025-06-17	\N	\N	\N	\N	\N	\N	13.4	18.4	0	33.2	241	6.25	open-meteo	89	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
15	2025-06-18	\N	\N	\N	\N	\N	\N	11.6	17	0	27.5	277	6.7	open-meteo	67	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
16	2025-06-19	\N	\N	\N	\N	\N	\N	9.6	15.8	0	19.2	148	5.8	open-meteo	27	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
17	2025-06-20	\N	\N	\N	\N	\N	\N	12.7	23.8	0	20.1	222	6.65	open-meteo	75	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
18	2025-06-21	\N	\N	\N	\N	\N	\N	15.5	21.4	0.6	13.4	88	6.55	open-meteo	69	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
19	2025-06-22	\N	\N	\N	\N	\N	\N	14.2	23.2	0.6	17.7	322	3.05	open-meteo	93	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
20	2025-06-23	\N	\N	\N	\N	\N	\N	12.8	20.3	0.3	29	267	1.75	open-meteo	62	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
21	2025-06-24	\N	\N	\N	\N	\N	\N	11.7	18.6	0.6	37.4	305	3.85	open-meteo	61	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
22	2025-06-25	\N	\N	\N	\N	\N	\N	9	21.9	0	20.1	274	6.25	open-meteo	65	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
23	2025-06-26	\N	\N	\N	\N	\N	\N	13.3	21.4	0	15.2	294	5.4	open-meteo	96	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
24	2025-06-27	\N	\N	\N	\N	\N	\N	15.7	22.1	2.6	11.5	153	3.8	open-meteo	92	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
25	2025-06-28	\N	\N	\N	\N	\N	\N	16.2	25.8	0.4	8.1	196	5.75	open-meteo	94	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
26	2025-06-29	\N	\N	\N	\N	\N	\N	17	30.2	0	23.3	217	6.5	open-meteo	46	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
27	2025-06-30	\N	\N	\N	\N	\N	\N	10.5	16.9	0	20.2	341	3.5	open-meteo	63	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
28	2025-07-01	\N	\N	\N	\N	\N	\N	10.3	17.4	0	11.4	123	3.8	open-meteo	98	2025-06-16 09:31:12.503567	2025-06-16 09:31:12.503567
\.


--
-- Data for Name: weather_data_backup_2025-06-16T09-41-59-262Z; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public."weather_data_backup_2025-06-16T09-41-59-262Z" (id, date, temperature, condition, description, wind_speed, humidity, wind_direction, temperature_min, temperature_max, precipitation_sum, wind_speed_max, wind_direction_dominant, uv_index_max, source, cloudcover, created_at, updated_at) FROM stdin;
5	2025-06-10	\N	\N	\N	\N	\N	\N	11.6	14.5	0.6	35.3	311	5.85	Open-Meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
1	2025-01-01	4	cloudy	Grey skies over the North Sea	29	85	W	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
2	2025-01-02	5	rainy	Wet conditions along the causeway	32	86	S	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
3	2025-06-09	14	partly cloudy	Pleasant coastal conditions	18	72	SW	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
4	2025-06-10	15	sunny	Clear skies for crossing	15	68	W	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
8	2025-06-11	\N	\N	\N	\N	\N	\N	10.5	14.2	0	29.7	141	6.3	Open-Meteo	34	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
9	2025-06-12	\N	\N	\N	\N	\N	\N	11.9	13.7	0.2	43	140	5.75	Open-Meteo	76	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
10	2025-06-13	\N	\N	\N	\N	\N	\N	12.3	21	0.9	17.3	186	5.5	Open-Meteo	70	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
11	2025-06-14	\N	\N	\N	\N	\N	\N	11.8	18.3	11.2	14.1	273	4.5	Open-Meteo	79	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
24	2025-06-27	\N	\N	\N	\N	\N	\N	15.7	22.1	2.6	11.5	153	3.8	open-meteo	92	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
25	2025-06-28	\N	\N	\N	\N	\N	\N	16.2	25.8	0.4	8.1	196	5.75	open-meteo	94	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
26	2025-06-29	\N	\N	\N	\N	\N	\N	17	30.2	0	23.3	217	6.5	open-meteo	46	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
27	2025-06-30	\N	\N	\N	\N	\N	\N	10.5	16.9	0	20.2	341	3.5	open-meteo	63	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
28	2025-07-01	\N	\N	\N	\N	\N	\N	10.3	17.4	0	11.4	123	3.8	open-meteo	98	2025-06-16 09:31:12.503567	2025-06-16 09:31:12.503567
6	2025-06-15	\N	\N	\N	\N	\N	\N	12.8	18	0	34.5	256	6.5	open-meteo	74	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
12	2025-06-15	\N	\N	\N	\N	\N	\N	12.8	18	0	34.5	256	6.5	open-meteo	74	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
7	2025-06-16	\N	\N	\N	\N	\N	\N	12.1	19.1	0	26.7	244	6.4	open-meteo	80	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
13	2025-06-16	\N	\N	\N	\N	\N	\N	12.1	19.1	0	26.7	244	6.4	open-meteo	80	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
14	2025-06-17	\N	\N	\N	\N	\N	\N	13.4	18.4	0	33.2	241	6.25	open-meteo	89	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
15	2025-06-18	\N	\N	\N	\N	\N	\N	11.6	17	0	27.5	277	6.7	open-meteo	67	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
16	2025-06-19	\N	\N	\N	\N	\N	\N	9.6	15.8	0	19.2	148	5.8	open-meteo	27	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
17	2025-06-20	\N	\N	\N	\N	\N	\N	12.7	23.8	0	20.1	222	6.65	open-meteo	75	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
18	2025-06-21	\N	\N	\N	\N	\N	\N	15.5	21.4	0.6	13.4	88	6.55	open-meteo	69	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
19	2025-06-22	\N	\N	\N	\N	\N	\N	14.2	23.2	0.6	17.7	322	3.05	open-meteo	93	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
20	2025-06-23	\N	\N	\N	\N	\N	\N	12.8	20.3	0.3	29	267	1.75	open-meteo	62	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
21	2025-06-24	\N	\N	\N	\N	\N	\N	11.7	18.6	0.6	37.4	305	3.85	open-meteo	61	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
22	2025-06-25	\N	\N	\N	\N	\N	\N	9	21.9	0	20.1	274	6.25	open-meteo	65	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
23	2025-06-26	\N	\N	\N	\N	\N	\N	13.3	21.4	0	15.2	294	5.4	open-meteo	96	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
\.


--
-- Data for Name: weather_data_backup_2025-06-16T09-48-22-840Z; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public."weather_data_backup_2025-06-16T09-48-22-840Z" (id, date, temperature, condition, description, wind_speed, humidity, wind_direction, temperature_min, temperature_max, precipitation_sum, wind_speed_max, wind_direction_dominant, uv_index_max, source, cloudcover, created_at, updated_at) FROM stdin;
5	2025-06-10	\N	\N	\N	\N	\N	\N	11.6	14.5	0.6	35.3	311	5.85	Open-Meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
1	2025-01-01	4	cloudy	Grey skies over the North Sea	29	85	W	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
2	2025-01-02	5	rainy	Wet conditions along the causeway	32	86	S	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
3	2025-06-09	14	partly cloudy	Pleasant coastal conditions	18	72	SW	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
4	2025-06-10	15	sunny	Clear skies for crossing	15	68	W	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
8	2025-06-11	\N	\N	\N	\N	\N	\N	10.5	14.2	0	29.7	141	6.3	Open-Meteo	34	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
9	2025-06-12	\N	\N	\N	\N	\N	\N	11.9	13.7	0.2	43	140	5.75	Open-Meteo	76	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
10	2025-06-13	\N	\N	\N	\N	\N	\N	12.3	21	0.9	17.3	186	5.5	Open-Meteo	70	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
11	2025-06-14	\N	\N	\N	\N	\N	\N	11.8	18.3	11.2	14.1	273	4.5	Open-Meteo	79	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
6	2025-06-15	\N	\N	\N	\N	\N	\N	12.8	18	0	34.5	256	6.5	open-meteo	74	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
12	2025-06-15	\N	\N	\N	\N	\N	\N	12.8	18	0	34.5	256	6.5	open-meteo	74	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
7	2025-06-16	\N	\N	\N	\N	\N	\N	12.1	19.1	0	26.7	244	6.4	open-meteo	80	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
13	2025-06-16	\N	\N	\N	\N	\N	\N	12.1	19.1	0	26.7	244	6.4	open-meteo	80	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
14	2025-06-17	\N	\N	\N	\N	\N	\N	13.4	18.4	0	33.2	241	6.25	open-meteo	89	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
15	2025-06-18	\N	\N	\N	\N	\N	\N	11.6	17	0	28.1	276	6.7	open-meteo	59	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
16	2025-06-19	\N	\N	\N	\N	\N	\N	9.6	15.8	0	21.9	153	5.8	open-meteo	32	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
17	2025-06-20	\N	\N	\N	\N	\N	\N	12.7	23.8	0	15.3	155	6.65	open-meteo	68	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
18	2025-06-21	\N	\N	\N	\N	\N	\N	15.5	21.4	0.6	13.4	89	6.55	open-meteo	71	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
19	2025-06-22	\N	\N	\N	\N	\N	\N	14.2	23.2	0.6	17.7	322	3.05	open-meteo	93	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
20	2025-06-23	\N	\N	\N	\N	\N	\N	12.8	20.3	0.3	29	267	1.75	open-meteo	62	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
21	2025-06-24	\N	\N	\N	\N	\N	\N	11.7	18.6	0.6	37.4	305	3.85	open-meteo	61	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
22	2025-06-25	\N	\N	\N	\N	\N	\N	9	21.9	0	20.1	274	6.25	open-meteo	65	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
23	2025-06-26	\N	\N	\N	\N	\N	\N	13.3	21.4	0	15.2	294	5.4	open-meteo	96	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
24	2025-06-27	\N	\N	\N	\N	\N	\N	15.7	22.1	2.6	11.5	153	3.8	open-meteo	92	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
25	2025-06-28	\N	\N	\N	\N	\N	\N	16.2	25.8	0.4	8.1	196	5.75	open-meteo	94	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
26	2025-06-29	\N	\N	\N	\N	\N	\N	17	30.2	0	23.3	217	6.5	open-meteo	46	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
27	2025-06-30	\N	\N	\N	\N	\N	\N	10.5	16.9	0	20.2	341	3.5	open-meteo	63	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
28	2025-07-01	\N	\N	\N	\N	\N	\N	10.3	17.4	0	11.4	123	3.8	open-meteo	98	2025-06-16 09:31:12.503567	2025-06-16 09:31:12.503567
\.


--
-- Data for Name: weather_data_backup_2025-06-16T09-52-11-991Z; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public."weather_data_backup_2025-06-16T09-52-11-991Z" (id, date, temperature, condition, description, wind_speed, humidity, wind_direction, temperature_min, temperature_max, precipitation_sum, wind_speed_max, wind_direction_dominant, uv_index_max, source, cloudcover, created_at, updated_at) FROM stdin;
5	2025-06-10	\N	\N	\N	\N	\N	\N	11.6	14.5	0.6	35.3	311	5.85	Open-Meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
1	2025-01-01	4	cloudy	Grey skies over the North Sea	29	85	W	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
2	2025-01-02	5	rainy	Wet conditions along the causeway	32	86	S	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
3	2025-06-09	14	partly cloudy	Pleasant coastal conditions	18	72	SW	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
4	2025-06-10	15	sunny	Clear skies for crossing	15	68	W	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
8	2025-06-11	\N	\N	\N	\N	\N	\N	10.5	14.2	0	29.7	141	6.3	Open-Meteo	34	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
9	2025-06-12	\N	\N	\N	\N	\N	\N	11.9	13.7	0.2	43	140	5.75	Open-Meteo	76	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
10	2025-06-13	\N	\N	\N	\N	\N	\N	12.3	21	0.9	17.3	186	5.5	Open-Meteo	70	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
11	2025-06-14	\N	\N	\N	\N	\N	\N	11.8	18.3	11.2	14.1	273	4.5	Open-Meteo	79	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
18	2025-06-21	\N	\N	\N	\N	\N	\N	15.5	21.4	0.6	13.4	89	6.55	open-meteo	71	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
19	2025-06-22	\N	\N	\N	\N	\N	\N	14.2	23.2	0.6	17.7	322	3.05	open-meteo	93	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
20	2025-06-23	\N	\N	\N	\N	\N	\N	12.8	20.3	0.3	29	267	1.75	open-meteo	62	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
21	2025-06-24	\N	\N	\N	\N	\N	\N	11.7	18.6	0.6	37.4	305	3.85	open-meteo	61	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
22	2025-06-25	\N	\N	\N	\N	\N	\N	9	21.9	0	20.1	274	6.25	open-meteo	65	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
6	2025-06-15	\N	\N	\N	\N	\N	\N	12.8	18	0	34.5	256	6.5	open-meteo	74	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
12	2025-06-15	\N	\N	\N	\N	\N	\N	12.8	18	0	34.5	256	6.5	open-meteo	74	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
23	2025-06-26	\N	\N	\N	\N	\N	\N	13.3	21.4	0	15.2	294	5.4	open-meteo	96	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
24	2025-06-27	\N	\N	\N	\N	\N	\N	15.7	22.1	2.6	11.5	153	3.8	open-meteo	92	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
25	2025-06-28	\N	\N	\N	\N	\N	\N	16.2	25.8	0.4	8.1	196	5.75	open-meteo	94	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
26	2025-06-29	\N	\N	\N	\N	\N	\N	17	30.2	0	23.3	217	6.5	open-meteo	46	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
27	2025-06-30	\N	\N	\N	\N	\N	\N	10.5	16.9	0	20.2	341	3.5	open-meteo	63	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
28	2025-07-01	\N	\N	\N	\N	\N	\N	10.3	17.4	0	11.4	123	3.8	open-meteo	98	2025-06-16 09:31:12.503567	2025-06-16 09:31:12.503567
7	2025-06-16	\N	\N	\N	\N	\N	\N	12.1	19.1	0	26.7	244	6.4	open-meteo	80	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
13	2025-06-16	\N	\N	\N	\N	\N	\N	12.1	19.1	0	26.7	244	6.4	open-meteo	80	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
14	2025-06-17	\N	\N	\N	\N	\N	\N	13.4	18.4	0	33.2	241	6.25	open-meteo	89	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
15	2025-06-18	\N	\N	\N	\N	\N	\N	11.6	17.6	0	28.1	276	6.7	open-meteo	59	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
16	2025-06-19	\N	\N	\N	\N	\N	\N	9.7	16	0	21.9	153	5.8	open-meteo	32	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
17	2025-06-20	\N	\N	\N	\N	\N	\N	13.4	23.9	0	15.3	155	6.65	open-meteo	68	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
\.


--
-- Data for Name: weather_data_backup_2025-06-16T09-54-23-427Z; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public."weather_data_backup_2025-06-16T09-54-23-427Z" (id, date, temperature, condition, description, wind_speed, humidity, wind_direction, temperature_min, temperature_max, precipitation_sum, wind_speed_max, wind_direction_dominant, uv_index_max, source, cloudcover, created_at, updated_at) FROM stdin;
5	2025-06-10	\N	\N	\N	\N	\N	\N	11.6	14.5	0.6	35.3	311	5.85	Open-Meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
1	2025-01-01	4	cloudy	Grey skies over the North Sea	29	85	W	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
2	2025-01-02	5	rainy	Wet conditions along the causeway	32	86	S	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
3	2025-06-09	14	partly cloudy	Pleasant coastal conditions	18	72	SW	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
4	2025-06-10	15	sunny	Clear skies for crossing	15	68	W	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
8	2025-06-11	\N	\N	\N	\N	\N	\N	10.5	14.2	0	29.7	141	6.3	Open-Meteo	34	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
9	2025-06-12	\N	\N	\N	\N	\N	\N	11.9	13.7	0.2	43	140	5.75	Open-Meteo	76	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
10	2025-06-13	\N	\N	\N	\N	\N	\N	12.3	21	0.9	17.3	186	5.5	Open-Meteo	70	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
11	2025-06-14	\N	\N	\N	\N	\N	\N	11.8	18.3	11.2	14.1	273	4.5	Open-Meteo	79	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
6	2025-06-15	\N	\N	\N	\N	\N	\N	12.8	18	0	34.5	256	6.5	open-meteo	74	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
12	2025-06-15	\N	\N	\N	\N	\N	\N	12.8	18	0	34.5	256	6.5	open-meteo	74	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
7	2025-06-16	\N	\N	\N	\N	\N	\N	12.1	19.1	0	26.7	244	6.4	open-meteo	80	2025-06-16 09:17:59.462292	2025-06-16 09:52:12.2
13	2025-06-16	\N	\N	\N	\N	\N	\N	12.1	19.1	0	26.7	244	6.4	open-meteo	80	2025-06-16 09:17:59.462292	2025-06-16 09:52:12.2
14	2025-06-17	\N	\N	\N	\N	\N	\N	13.4	18.4	0	33.2	241	6.25	open-meteo	89	2025-06-16 09:17:59.462292	2025-06-16 09:52:12.332
15	2025-06-18	\N	\N	\N	\N	\N	\N	11.6	17.6	0	28.1	276	6.7	open-meteo	59	2025-06-16 09:17:59.462292	2025-06-16 09:52:12.465
16	2025-06-19	\N	\N	\N	\N	\N	\N	9.7	16	0	21.9	153	5.8	open-meteo	32	2025-06-16 09:17:59.462292	2025-06-16 09:52:12.597
17	2025-06-20	\N	\N	\N	\N	\N	\N	13.4	23.9	0	15.3	155	6.65	open-meteo	68	2025-06-16 09:17:59.462292	2025-06-16 09:52:12.729
18	2025-06-21	\N	\N	\N	\N	\N	\N	15.5	21.4	0.6	13.4	89	6.55	open-meteo	71	2025-06-16 09:17:59.462292	2025-06-16 09:52:12.861
19	2025-06-22	\N	\N	\N	\N	\N	\N	14.2	23.2	0.6	17.7	322	3.05	open-meteo	93	2025-06-16 09:17:59.462292	2025-06-16 09:52:12.994
20	2025-06-23	\N	\N	\N	\N	\N	\N	12.8	20.3	0.3	29	267	1.75	open-meteo	62	2025-06-16 09:17:59.462292	2025-06-16 09:52:13.131
21	2025-06-24	\N	\N	\N	\N	\N	\N	11.7	18.6	0.6	37.4	305	3.85	open-meteo	61	2025-06-16 09:17:59.462292	2025-06-16 09:52:13.266
22	2025-06-25	\N	\N	\N	\N	\N	\N	9	21.9	0	20.1	274	6.25	open-meteo	65	2025-06-16 09:17:59.462292	2025-06-16 09:52:13.397
23	2025-06-26	\N	\N	\N	\N	\N	\N	13.3	21.4	0	15.2	294	5.4	open-meteo	96	2025-06-16 09:17:59.462292	2025-06-16 09:52:13.529
24	2025-06-27	\N	\N	\N	\N	\N	\N	15.7	22.1	2.6	11.5	153	3.8	open-meteo	92	2025-06-16 09:17:59.462292	2025-06-16 09:52:13.663
25	2025-06-28	\N	\N	\N	\N	\N	\N	16.2	25.8	0.4	8.1	196	5.75	open-meteo	94	2025-06-16 09:17:59.462292	2025-06-16 09:52:13.793
26	2025-06-29	\N	\N	\N	\N	\N	\N	17	30.2	0	23.3	217	6.5	open-meteo	46	2025-06-16 09:17:59.462292	2025-06-16 09:52:13.924
27	2025-06-30	\N	\N	\N	\N	\N	\N	10.5	16.9	0	20.2	341	3.5	open-meteo	63	2025-06-16 09:17:59.462292	2025-06-16 09:52:14.056
28	2025-07-01	\N	\N	\N	\N	\N	\N	10.3	17.4	0	11.4	123	3.8	open-meteo	98	2025-06-16 09:31:12.503567	2025-06-16 09:52:14.186
\.


--
-- Data for Name: weather_data_backup_2025-06-16T11-43-14-408Z; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public."weather_data_backup_2025-06-16T11-43-14-408Z" (id, date, temperature, condition, description, wind_speed, humidity, wind_direction, temperature_min, temperature_max, precipitation_sum, wind_speed_max, wind_direction_dominant, uv_index_max, source, cloudcover, created_at, updated_at) FROM stdin;
5	2025-06-10	\N	\N	\N	\N	\N	\N	11.6	14.5	0.6	35.3	311	5.85	Open-Meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
1	2025-01-01	4	cloudy	Grey skies over the North Sea	29	85	W	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
2	2025-01-02	5	rainy	Wet conditions along the causeway	32	86	S	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
3	2025-06-09	14	partly cloudy	Pleasant coastal conditions	18	72	SW	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
4	2025-06-10	15	sunny	Clear skies for crossing	15	68	W	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
8	2025-06-11	\N	\N	\N	\N	\N	\N	10.5	14.2	0	29.7	141	6.3	Open-Meteo	34	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
9	2025-06-12	\N	\N	\N	\N	\N	\N	11.9	13.7	0.2	43	140	5.75	Open-Meteo	76	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
10	2025-06-13	\N	\N	\N	\N	\N	\N	12.3	21	0.9	17.3	186	5.5	Open-Meteo	70	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
11	2025-06-14	\N	\N	\N	\N	\N	\N	11.8	18.3	11.2	14.1	273	4.5	Open-Meteo	79	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
18	2025-06-21	\N	\N	\N	\N	\N	\N	15.5	21.4	0.6	13.4	89	6.55	open-meteo	71	2025-06-16 09:17:59.462292	2025-06-16 09:54:24.287
19	2025-06-22	\N	\N	\N	\N	\N	\N	14.2	23.2	0.6	17.7	322	3.05	open-meteo	93	2025-06-16 09:17:59.462292	2025-06-16 09:54:24.417
20	2025-06-23	\N	\N	\N	\N	\N	\N	12.8	20.3	0.3	29	267	1.75	open-meteo	62	2025-06-16 09:17:59.462292	2025-06-16 09:54:24.547
21	2025-06-24	\N	\N	\N	\N	\N	\N	11.7	18.6	0.6	37.4	305	3.85	open-meteo	61	2025-06-16 09:17:59.462292	2025-06-16 09:54:24.678
22	2025-06-25	\N	\N	\N	\N	\N	\N	9	21.9	0	20.1	274	6.25	open-meteo	65	2025-06-16 09:17:59.462292	2025-06-16 09:54:24.807
6	2025-06-15	\N	\N	\N	\N	\N	\N	12.8	18	0	34.5	256	6.5	open-meteo	74	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
12	2025-06-15	\N	\N	\N	\N	\N	\N	12.8	18	0	34.5	256	6.5	open-meteo	74	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
23	2025-06-26	\N	\N	\N	\N	\N	\N	13.3	21.4	0	15.2	294	5.4	open-meteo	96	2025-06-16 09:17:59.462292	2025-06-16 09:54:24.937
24	2025-06-27	\N	\N	\N	\N	\N	\N	15.7	22.1	2.6	11.5	153	3.8	open-meteo	92	2025-06-16 09:17:59.462292	2025-06-16 09:54:25.066
25	2025-06-28	\N	\N	\N	\N	\N	\N	16.2	25.8	0.4	8.1	196	5.75	open-meteo	94	2025-06-16 09:17:59.462292	2025-06-16 09:54:25.195
26	2025-06-29	\N	\N	\N	\N	\N	\N	17	30.2	0	23.3	217	6.5	open-meteo	46	2025-06-16 09:17:59.462292	2025-06-16 09:54:25.323
27	2025-06-30	\N	\N	\N	\N	\N	\N	10.5	16.9	0	20.2	341	3.5	open-meteo	63	2025-06-16 09:17:59.462292	2025-06-16 09:54:25.452
28	2025-07-01	\N	\N	\N	\N	\N	\N	10.3	17.4	0	11.4	123	3.8	open-meteo	98	2025-06-16 09:31:12.503567	2025-06-16 09:54:25.581
7	2025-06-16	\N	\N	\N	\N	\N	\N	12.1	19.1	0	26.7	244	6.4	open-meteo	80	2025-06-16 09:17:59.462292	2025-06-16 09:54:23.636
13	2025-06-16	\N	\N	\N	\N	\N	\N	12.1	19.1	0	26.7	244	6.4	open-meteo	80	2025-06-16 09:17:59.462292	2025-06-16 09:54:23.636
14	2025-06-17	\N	\N	\N	\N	\N	\N	13.4	18.4	0	33.2	241	6.25	open-meteo	89	2025-06-16 09:17:59.462292	2025-06-16 09:54:23.766
15	2025-06-18	\N	\N	\N	\N	\N	\N	11.6	17.6	0	28.1	276	6.7	open-meteo	59	2025-06-16 09:17:59.462292	2025-06-16 09:54:23.898
16	2025-06-19	\N	\N	\N	\N	\N	\N	9.7	16	0	21.9	153	5.8	open-meteo	32	2025-06-16 09:17:59.462292	2025-06-16 09:54:24.027
17	2025-06-20	\N	\N	\N	\N	\N	\N	13.4	23.9	0	15.3	155	6.65	open-meteo	68	2025-06-16 09:17:59.462292	2025-06-16 09:54:24.157
\.


--
-- Data for Name: weather_data_backup_2025-06-16T12-19-30-393Z; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public."weather_data_backup_2025-06-16T12-19-30-393Z" (id, date, temperature, condition, description, wind_speed, humidity, wind_direction, temperature_min, temperature_max, precipitation_sum, wind_speed_max, wind_direction_dominant, uv_index_max, source, cloudcover, created_at, updated_at) FROM stdin;
5	2025-06-10	\N	\N	\N	\N	\N	\N	11.6	14.5	0.6	35.3	311	5.85	Open-Meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
1	2025-01-01	4	cloudy	Grey skies over the North Sea	29	85	W	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
2	2025-01-02	5	rainy	Wet conditions along the causeway	32	86	S	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
3	2025-06-09	14	partly cloudy	Pleasant coastal conditions	18	72	SW	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
4	2025-06-10	15	sunny	Clear skies for crossing	15	68	W	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
8	2025-06-11	\N	\N	\N	\N	\N	\N	10.5	14.2	0	29.7	141	6.3	Open-Meteo	34	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
9	2025-06-12	\N	\N	\N	\N	\N	\N	11.9	13.7	0.2	43	140	5.75	Open-Meteo	76	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
10	2025-06-13	\N	\N	\N	\N	\N	\N	12.3	21	0.9	17.3	186	5.5	Open-Meteo	70	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
11	2025-06-14	\N	\N	\N	\N	\N	\N	11.8	18.3	11.2	14.1	273	4.5	Open-Meteo	79	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
6	2025-06-15	\N	\N	\N	\N	\N	\N	12.8	18	0	34.5	256	6.5	open-meteo	74	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
12	2025-06-15	\N	\N	\N	\N	\N	\N	12.8	18	0	34.5	256	6.5	open-meteo	74	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
7	2025-06-16	\N	\N	\N	\N	\N	\N	12.1	19.2	0	28.2	244	6.4	open-meteo	82	2025-06-16 09:17:59.462292	2025-06-16 11:43:14.652
13	2025-06-16	\N	\N	\N	\N	\N	\N	12.1	19.2	0	28.2	244	6.4	open-meteo	82	2025-06-16 09:17:59.462292	2025-06-16 11:43:14.652
14	2025-06-17	\N	\N	\N	\N	\N	\N	13.6	18.3	0	34.6	242	6.25	open-meteo	89	2025-06-16 09:17:59.462292	2025-06-16 11:43:14.786
15	2025-06-18	\N	\N	\N	\N	\N	\N	11.7	17.6	0	28.1	275	6.7	open-meteo	63	2025-06-16 09:17:59.462292	2025-06-16 11:43:14.917
16	2025-06-19	\N	\N	\N	\N	\N	\N	9.7	16	0	21.9	153	5.8	open-meteo	32	2025-06-16 09:17:59.462292	2025-06-16 11:43:15.047
17	2025-06-20	\N	\N	\N	\N	\N	\N	13.4	23.9	0	15.3	155	6.65	open-meteo	68	2025-06-16 09:17:59.462292	2025-06-16 11:43:15.178
18	2025-06-21	\N	\N	\N	\N	\N	\N	15.5	21.4	0.6	13.4	89	6.55	open-meteo	71	2025-06-16 09:17:59.462292	2025-06-16 11:43:15.308
19	2025-06-22	\N	\N	\N	\N	\N	\N	14.2	23.2	0.6	17.7	322	3.05	open-meteo	93	2025-06-16 09:17:59.462292	2025-06-16 11:43:15.44
20	2025-06-23	\N	\N	\N	\N	\N	\N	12.8	20.3	0.3	29	267	1.75	open-meteo	69	2025-06-16 09:17:59.462292	2025-06-16 11:43:15.57
21	2025-06-24	\N	\N	\N	\N	\N	\N	11.7	18.6	0.6	37.4	305	3.85	open-meteo	90	2025-06-16 09:17:59.462292	2025-06-16 11:43:15.701
22	2025-06-25	\N	\N	\N	\N	\N	\N	9	21.9	0	20.1	274	6.25	open-meteo	15	2025-06-16 09:17:59.462292	2025-06-16 11:43:15.83
23	2025-06-26	\N	\N	\N	\N	\N	\N	13.3	21.4	0	15.2	294	5.4	open-meteo	18	2025-06-16 09:17:59.462292	2025-06-16 11:43:15.961
24	2025-06-27	\N	\N	\N	\N	\N	\N	15.7	22.1	2.6	11.5	153	3.8	open-meteo	74	2025-06-16 09:17:59.462292	2025-06-16 11:43:16.092
25	2025-06-28	\N	\N	\N	\N	\N	\N	16.2	25.8	0.4	8.1	196	5.75	open-meteo	53	2025-06-16 09:17:59.462292	2025-06-16 11:43:16.222
26	2025-06-29	\N	\N	\N	\N	\N	\N	17	30.2	0	23.3	217	6.5	open-meteo	74	2025-06-16 09:17:59.462292	2025-06-16 11:43:16.353
27	2025-06-30	\N	\N	\N	\N	\N	\N	10.5	16.9	0	20.2	341	3.5	open-meteo	29	2025-06-16 09:17:59.462292	2025-06-16 11:43:16.485
28	2025-07-01	\N	\N	\N	\N	\N	\N	10.3	17.4	0	11.4	123	3.8	open-meteo	13	2025-06-16 09:31:12.503567	2025-06-16 11:43:16.615
\.


--
-- Data for Name: weather_data_backup_2025-06-16T12-22-29-449Z; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public."weather_data_backup_2025-06-16T12-22-29-449Z" (id, date, temperature, condition, description, wind_speed, humidity, wind_direction, temperature_min, temperature_max, precipitation_sum, wind_speed_max, wind_direction_dominant, uv_index_max, source, cloudcover, created_at, updated_at) FROM stdin;
5	2025-06-10	\N	\N	\N	\N	\N	\N	11.6	14.5	0.6	35.3	311	5.85	Open-Meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
1	2025-01-01	4	cloudy	Grey skies over the North Sea	29	85	W	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
2	2025-01-02	5	rainy	Wet conditions along the causeway	32	86	S	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
3	2025-06-09	14	partly cloudy	Pleasant coastal conditions	18	72	SW	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
4	2025-06-10	15	sunny	Clear skies for crossing	15	68	W	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
8	2025-06-11	\N	\N	\N	\N	\N	\N	10.5	14.2	0	29.7	141	6.3	Open-Meteo	34	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
9	2025-06-12	\N	\N	\N	\N	\N	\N	11.9	13.7	0.2	43	140	5.75	Open-Meteo	76	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
10	2025-06-13	\N	\N	\N	\N	\N	\N	12.3	21	0.9	17.3	186	5.5	Open-Meteo	70	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
11	2025-06-14	\N	\N	\N	\N	\N	\N	11.8	18.3	11.2	14.1	273	4.5	Open-Meteo	79	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
18	2025-06-21	\N	\N	\N	\N	\N	\N	15.5	21.4	0.6	13.4	89	6.1	open-meteo	71	2025-06-16 09:17:59.462292	2025-06-16 12:19:31.304
19	2025-06-22	\N	\N	\N	\N	\N	\N	14.2	23.2	0.6	17.7	322	6.35	open-meteo	93	2025-06-16 09:17:59.462292	2025-06-16 12:19:31.435
20	2025-06-23	\N	\N	\N	\N	\N	\N	13.3	20.3	0	23.8	286	4	open-meteo	69	2025-06-16 09:17:59.462292	2025-06-16 12:19:31.567
21	2025-06-24	\N	\N	\N	\N	\N	\N	11	16.1	0	12.6	45	3.35	open-meteo	90	2025-06-16 09:17:59.462292	2025-06-16 12:19:31.698
22	2025-06-25	\N	\N	\N	\N	\N	\N	10.8	21.1	0	20.9	135	6.5	open-meteo	15	2025-06-16 09:17:59.462292	2025-06-16 12:19:31.83
6	2025-06-15	\N	\N	\N	\N	\N	\N	12.8	18	0	34.5	256	6.5	open-meteo	74	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
12	2025-06-15	\N	\N	\N	\N	\N	\N	12.8	18	0	34.5	256	6.5	open-meteo	74	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
23	2025-06-26	\N	\N	\N	\N	\N	\N	10.2	18.4	0	26.1	131	6.6	open-meteo	18	2025-06-16 09:17:59.462292	2025-06-16 12:19:31.96
24	2025-06-27	\N	\N	\N	\N	\N	\N	11.9	25.4	0.3	16.6	155	5.7	open-meteo	74	2025-06-16 09:17:59.462292	2025-06-16 12:19:32.091
25	2025-06-28	\N	\N	\N	\N	\N	\N	16	25.6	0.3	8.3	265	6.1	open-meteo	53	2025-06-16 09:17:59.462292	2025-06-16 12:19:32.223
26	2025-06-29	\N	\N	\N	\N	\N	\N	13.4	20.7	0	14.8	64	5.55	open-meteo	74	2025-06-16 09:17:59.462292	2025-06-16 12:19:32.354
27	2025-06-30	\N	\N	\N	\N	\N	\N	14.2	28.5	0	24.2	151	6.5	open-meteo	29	2025-06-16 09:17:59.462292	2025-06-16 12:19:32.484
28	2025-07-01	\N	\N	\N	\N	\N	\N	17.4	28.8	0	26.2	155	6.5	open-meteo	13	2025-06-16 09:31:12.503567	2025-06-16 12:19:32.615
7	2025-06-16	\N	\N	\N	\N	\N	\N	12.1	19.2	0	28.2	244	6.35	open-meteo	82	2025-06-16 09:17:59.462292	2025-06-16 12:19:30.643
13	2025-06-16	\N	\N	\N	\N	\N	\N	12.1	19.2	0	28.2	244	6.35	open-meteo	82	2025-06-16 09:17:59.462292	2025-06-16 12:19:30.643
14	2025-06-17	\N	\N	\N	\N	\N	\N	13.6	18.3	0	34.6	242	6.3	open-meteo	89	2025-06-16 09:17:59.462292	2025-06-16 12:19:30.776
15	2025-06-18	\N	\N	\N	\N	\N	\N	11.7	17.6	0	28.1	275	6.7	open-meteo	63	2025-06-16 09:17:59.462292	2025-06-16 12:19:30.908
16	2025-06-19	\N	\N	\N	\N	\N	\N	9.7	16	0	21.9	153	5.25	open-meteo	32	2025-06-16 09:17:59.462292	2025-06-16 12:19:31.04
17	2025-06-20	\N	\N	\N	\N	\N	\N	13.4	23.9	0	15.3	155	6.7	open-meteo	68	2025-06-16 09:17:59.462292	2025-06-16 12:19:31.173
\.


--
-- Data for Name: weather_data_backup_2025-06-16T12-29-12-248Z; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public."weather_data_backup_2025-06-16T12-29-12-248Z" (id, date, temperature, condition, description, wind_speed, humidity, wind_direction, temperature_min, temperature_max, precipitation_sum, wind_speed_max, wind_direction_dominant, uv_index_max, source, cloudcover, created_at, updated_at) FROM stdin;
5	2025-06-10	\N	\N	\N	\N	\N	\N	11.6	14.5	0.6	35.3	311	5.85	Open-Meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
1	2025-01-01	4	cloudy	Grey skies over the North Sea	29	85	W	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
2	2025-01-02	5	rainy	Wet conditions along the causeway	32	86	S	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
3	2025-06-09	14	partly cloudy	Pleasant coastal conditions	18	72	SW	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
4	2025-06-10	15	sunny	Clear skies for crossing	15	68	W	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
8	2025-06-11	\N	\N	\N	\N	\N	\N	10.5	14.2	0	29.7	141	6.3	Open-Meteo	34	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
9	2025-06-12	\N	\N	\N	\N	\N	\N	11.9	13.7	0.2	43	140	5.75	Open-Meteo	76	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
10	2025-06-13	\N	\N	\N	\N	\N	\N	12.3	21	0.9	17.3	186	5.5	Open-Meteo	70	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
11	2025-06-14	\N	\N	\N	\N	\N	\N	11.8	18.3	11.2	14.1	273	4.5	Open-Meteo	79	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
6	2025-06-15	\N	\N	\N	\N	\N	\N	12.8	18	0	34.5	256	6.5	open-meteo	74	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
12	2025-06-15	\N	\N	\N	\N	\N	\N	12.8	18	0	34.5	256	6.5	open-meteo	74	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
7	2025-06-16	\N	\N	\N	\N	\N	\N	12.1	19.2	0	28.2	244	6.35	open-meteo	82	2025-06-16 09:17:59.462292	2025-06-16 12:22:29.658
13	2025-06-16	\N	\N	\N	\N	\N	\N	12.1	19.2	0	28.2	244	6.35	open-meteo	82	2025-06-16 09:17:59.462292	2025-06-16 12:22:29.658
14	2025-06-17	\N	\N	\N	\N	\N	\N	13.6	18.3	0	34.6	242	6.3	open-meteo	89	2025-06-16 09:17:59.462292	2025-06-16 12:22:29.788
15	2025-06-18	\N	\N	\N	\N	\N	\N	11.7	17.6	0	28.1	275	6.7	open-meteo	63	2025-06-16 09:17:59.462292	2025-06-16 12:22:29.92
16	2025-06-19	\N	\N	\N	\N	\N	\N	9.7	16	0	21.9	153	5.25	open-meteo	32	2025-06-16 09:17:59.462292	2025-06-16 12:22:30.05
17	2025-06-20	\N	\N	\N	\N	\N	\N	13.4	23.9	0	15.3	155	6.7	open-meteo	68	2025-06-16 09:17:59.462292	2025-06-16 12:22:30.181
18	2025-06-21	\N	\N	\N	\N	\N	\N	15.5	21.4	0.6	13.4	89	6.1	open-meteo	71	2025-06-16 09:17:59.462292	2025-06-16 12:22:30.312
19	2025-06-22	\N	\N	\N	\N	\N	\N	14.2	23.2	0.6	17.7	322	6.35	open-meteo	93	2025-06-16 09:17:59.462292	2025-06-16 12:22:30.442
20	2025-06-23	\N	\N	\N	\N	\N	\N	13.3	20.3	0	23.8	286	4	open-meteo	69	2025-06-16 09:17:59.462292	2025-06-16 12:22:30.572
21	2025-06-24	\N	\N	\N	\N	\N	\N	11	16.1	0	12.6	45	3.35	open-meteo	90	2025-06-16 09:17:59.462292	2025-06-16 12:22:30.702
22	2025-06-25	\N	\N	\N	\N	\N	\N	10.8	21.1	0	20.9	135	6.5	open-meteo	15	2025-06-16 09:17:59.462292	2025-06-16 12:22:30.833
23	2025-06-26	\N	\N	\N	\N	\N	\N	10.2	18.4	0	26.1	131	6.6	open-meteo	18	2025-06-16 09:17:59.462292	2025-06-16 12:22:30.964
24	2025-06-27	\N	\N	\N	\N	\N	\N	11.9	25.4	0.3	16.6	155	5.7	open-meteo	74	2025-06-16 09:17:59.462292	2025-06-16 12:22:31.094
25	2025-06-28	\N	\N	\N	\N	\N	\N	16	25.6	0.3	8.3	265	6.1	open-meteo	53	2025-06-16 09:17:59.462292	2025-06-16 12:22:31.225
26	2025-06-29	\N	\N	\N	\N	\N	\N	13.4	20.7	0	14.8	64	5.55	open-meteo	74	2025-06-16 09:17:59.462292	2025-06-16 12:22:31.356
27	2025-06-30	\N	\N	\N	\N	\N	\N	14.2	28.5	0	24.2	151	6.5	open-meteo	29	2025-06-16 09:17:59.462292	2025-06-16 12:22:31.487
28	2025-07-01	\N	\N	\N	\N	\N	\N	17.4	28.8	0	26.2	155	6.5	open-meteo	13	2025-06-16 09:31:12.503567	2025-06-16 12:22:31.618
\.


--
-- Data for Name: weather_data_backup_2025-06-16T16-00-07-866Z; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public."weather_data_backup_2025-06-16T16-00-07-866Z" (id, date, temperature, condition, description, wind_speed, humidity, wind_direction, temperature_min, temperature_max, precipitation_sum, wind_speed_max, wind_direction_dominant, uv_index_max, source, cloudcover, created_at, updated_at) FROM stdin;
5	2025-06-10	\N	\N	\N	\N	\N	\N	11.6	14.5	0.6	35.3	311	5.85	Open-Meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
1	2025-01-01	4	cloudy	Grey skies over the North Sea	29	85	W	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
2	2025-01-02	5	rainy	Wet conditions along the causeway	32	86	S	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
3	2025-06-09	14	partly cloudy	Pleasant coastal conditions	18	72	SW	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
4	2025-06-10	15	sunny	Clear skies for crossing	15	68	W	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
8	2025-06-11	\N	\N	\N	\N	\N	\N	10.5	14.2	0	29.7	141	6.3	Open-Meteo	34	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
9	2025-06-12	\N	\N	\N	\N	\N	\N	11.9	13.7	0.2	43	140	5.75	Open-Meteo	76	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
10	2025-06-13	\N	\N	\N	\N	\N	\N	12.3	21	0.9	17.3	186	5.5	Open-Meteo	70	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
11	2025-06-14	\N	\N	\N	\N	\N	\N	11.8	18.3	11.2	14.1	273	4.5	Open-Meteo	79	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
18	2025-06-21	\N	\N	\N	\N	\N	\N	15.5	21.4	0.6	13.4	89	6.1	open-meteo	71	2025-06-16 09:17:59.462292	2025-06-16 12:29:13.119
19	2025-06-22	\N	\N	\N	\N	\N	\N	14.2	23.2	0.6	17.7	322	6.35	open-meteo	93	2025-06-16 09:17:59.462292	2025-06-16 12:29:13.251
20	2025-06-23	\N	\N	\N	\N	\N	\N	13.3	20.3	0	23.8	286	4	open-meteo	69	2025-06-16 09:17:59.462292	2025-06-16 12:29:13.382
21	2025-06-24	\N	\N	\N	\N	\N	\N	11	16.1	0	12.6	45	3.35	open-meteo	90	2025-06-16 09:17:59.462292	2025-06-16 12:29:13.514
22	2025-06-25	\N	\N	\N	\N	\N	\N	10.8	21.1	0	20.9	135	6.5	open-meteo	15	2025-06-16 09:17:59.462292	2025-06-16 12:29:13.645
6	2025-06-15	\N	\N	\N	\N	\N	\N	12.8	18	0	34.5	256	6.5	open-meteo	74	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
12	2025-06-15	\N	\N	\N	\N	\N	\N	12.8	18	0	34.5	256	6.5	open-meteo	74	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
23	2025-06-26	\N	\N	\N	\N	\N	\N	10.2	18.4	0	26.1	131	6.6	open-meteo	18	2025-06-16 09:17:59.462292	2025-06-16 12:29:13.776
24	2025-06-27	\N	\N	\N	\N	\N	\N	11.9	25.4	0.3	16.6	155	5.7	open-meteo	74	2025-06-16 09:17:59.462292	2025-06-16 12:29:13.907
25	2025-06-28	\N	\N	\N	\N	\N	\N	16	25.6	0.3	8.3	265	6.1	open-meteo	53	2025-06-16 09:17:59.462292	2025-06-16 12:29:14.039
26	2025-06-29	\N	\N	\N	\N	\N	\N	13.4	20.7	0	14.8	64	5.55	open-meteo	74	2025-06-16 09:17:59.462292	2025-06-16 12:29:14.17
27	2025-06-30	\N	\N	\N	\N	\N	\N	14.2	28.5	0	24.2	151	6.5	open-meteo	29	2025-06-16 09:17:59.462292	2025-06-16 12:29:14.302
28	2025-07-01	\N	\N	\N	\N	\N	\N	17.4	28.8	0	26.2	155	6.5	open-meteo	13	2025-06-16 09:31:12.503567	2025-06-16 12:29:14.434
29	2025-06-16	\N	\N	\N	\N	\N	\N	12.1	19.2	0	28.2	244	6.35	Open-Meteo	82	2025-06-16 12:32:27.268604	2025-06-16 12:32:27.268604
30	2025-06-17	\N	\N	\N	\N	\N	\N	13.6	18.3	0	34.6	242	6.3	Open-Meteo	89	2025-06-16 12:32:27.35228	2025-06-16 12:32:27.35228
31	2025-06-18	\N	\N	\N	\N	\N	\N	11.7	17.6	0	28.1	275	6.7	Open-Meteo	63	2025-06-16 12:32:27.418665	2025-06-16 12:32:27.418665
32	2025-06-19	\N	\N	\N	\N	\N	\N	9.7	16	0	21.9	153	5.25	Open-Meteo	32	2025-06-16 12:32:27.484754	2025-06-16 12:32:27.484754
33	2025-06-20	\N	\N	\N	\N	\N	\N	13.4	23.9	0	15.3	155	6.7	Open-Meteo	68	2025-06-16 12:32:27.550817	2025-06-16 12:32:27.550817
34	2025-06-21	\N	\N	\N	\N	\N	\N	15.5	21.4	0.6	13.4	89	6.1	Open-Meteo	71	2025-06-16 12:32:27.617124	2025-06-16 12:32:27.617124
35	2025-06-22	\N	\N	\N	\N	\N	\N	14.2	23.2	0.6	17.7	322	6.35	Open-Meteo	93	2025-06-16 12:32:27.683058	2025-06-16 12:32:27.683058
7	2025-06-16	\N	\N	\N	\N	\N	\N	12.1	19.2	0	28.2	244	6.35	open-meteo	82	2025-06-16 09:17:59.462292	2025-06-16 12:29:12.46
13	2025-06-16	\N	\N	\N	\N	\N	\N	12.1	19.2	0	28.2	244	6.35	open-meteo	82	2025-06-16 09:17:59.462292	2025-06-16 12:29:12.46
14	2025-06-17	\N	\N	\N	\N	\N	\N	13.6	18.3	0	34.6	242	6.3	open-meteo	89	2025-06-16 09:17:59.462292	2025-06-16 12:29:12.592
15	2025-06-18	\N	\N	\N	\N	\N	\N	11.7	17.6	0	28.1	275	6.7	open-meteo	63	2025-06-16 09:17:59.462292	2025-06-16 12:29:12.724
16	2025-06-19	\N	\N	\N	\N	\N	\N	9.7	16	0	21.9	153	5.25	open-meteo	32	2025-06-16 09:17:59.462292	2025-06-16 12:29:12.856
36	2025-06-23	\N	\N	\N	\N	\N	\N	13.3	20.3	0	23.8	286	4	Open-Meteo	69	2025-06-16 12:32:27.74903	2025-06-16 12:32:27.74903
37	2025-06-24	\N	\N	\N	\N	\N	\N	11	16.1	0	12.6	45	3.35	Open-Meteo	90	2025-06-16 12:32:27.816064	2025-06-16 12:32:27.816064
38	2025-06-25	\N	\N	\N	\N	\N	\N	10.8	21.1	0	20.9	135	6.5	Open-Meteo	15	2025-06-16 12:32:27.882248	2025-06-16 12:32:27.882248
39	2025-06-26	\N	\N	\N	\N	\N	\N	10.2	18.4	0	26.1	131	6.6	Open-Meteo	18	2025-06-16 12:32:27.948781	2025-06-16 12:32:27.948781
40	2025-06-27	\N	\N	\N	\N	\N	\N	11.9	25.4	0.3	16.6	155	5.7	Open-Meteo	74	2025-06-16 12:32:28.015044	2025-06-16 12:32:28.015044
41	2025-06-28	\N	\N	\N	\N	\N	\N	16	25.6	0.3	8.3	265	6.1	Open-Meteo	53	2025-06-16 12:32:28.081093	2025-06-16 12:32:28.081093
42	2025-06-29	\N	\N	\N	\N	\N	\N	13.4	20.7	0	14.8	64	5.55	Open-Meteo	74	2025-06-16 12:32:28.148017	2025-06-16 12:32:28.148017
17	2025-06-20	\N	\N	\N	\N	\N	\N	13.4	23.9	0	15.3	155	6.7	open-meteo	68	2025-06-16 09:17:59.462292	2025-06-16 12:29:12.987
\.


--
-- Data for Name: weather_data_backup_2025-06-16T17-15-01-227Z; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public."weather_data_backup_2025-06-16T17-15-01-227Z" (id, date, temperature, condition, description, wind_speed, humidity, wind_direction, temperature_min, temperature_max, precipitation_sum, wind_speed_max, wind_direction_dominant, uv_index_max, source, cloudcover, created_at, updated_at) FROM stdin;
5	2025-06-10	\N	\N	\N	\N	\N	\N	11.6	14.5	0.6	35.3	311	5.85	Open-Meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
1	2025-01-01	4	cloudy	Grey skies over the North Sea	29	85	W	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
2	2025-01-02	5	rainy	Wet conditions along the causeway	32	86	S	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
3	2025-06-09	14	partly cloudy	Pleasant coastal conditions	18	72	SW	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
4	2025-06-10	15	sunny	Clear skies for crossing	15	68	W	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
8	2025-06-11	\N	\N	\N	\N	\N	\N	10.5	14.2	0	29.7	141	6.3	Open-Meteo	34	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
9	2025-06-12	\N	\N	\N	\N	\N	\N	11.9	13.7	0.2	43	140	5.75	Open-Meteo	76	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
10	2025-06-13	\N	\N	\N	\N	\N	\N	12.3	21	0.9	17.3	186	5.5	Open-Meteo	70	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
11	2025-06-14	\N	\N	\N	\N	\N	\N	11.8	18.3	11.2	14.1	273	4.5	Open-Meteo	79	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
6	2025-06-15	\N	\N	\N	\N	\N	\N	12.8	18	0	34.5	256	6.5	open-meteo	74	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
12	2025-06-15	\N	\N	\N	\N	\N	\N	12.8	18	0	34.5	256	6.5	open-meteo	74	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
33	2025-06-20	\N	\N	\N	\N	\N	\N	13.7	23.6	0	21.9	150	6.7	open-meteo	77	2025-06-16 12:32:27.550817	2025-06-16 16:00:08.273
17	2025-06-20	\N	\N	\N	\N	\N	\N	13.7	23.6	0	21.9	150	6.7	open-meteo	77	2025-06-16 09:17:59.462292	2025-06-16 16:00:08.273
18	2025-06-21	\N	\N	\N	\N	\N	\N	15.7	23.8	0	27.6	147	6.1	open-meteo	23	2025-06-16 09:17:59.462292	2025-06-16 16:00:08.334
34	2025-06-21	\N	\N	\N	\N	\N	\N	15.7	23.8	0	27.6	147	6.1	open-meteo	23	2025-06-16 12:32:27.617124	2025-06-16 16:00:08.334
19	2025-06-22	\N	\N	\N	\N	\N	\N	15.6	25.7	0.6	22.9	194	6.35	open-meteo	72	2025-06-16 09:17:59.462292	2025-06-16 16:00:08.395
35	2025-06-22	\N	\N	\N	\N	\N	\N	15.6	25.7	0.6	22.9	194	6.35	open-meteo	72	2025-06-16 12:32:27.683058	2025-06-16 16:00:08.395
20	2025-06-23	\N	\N	\N	\N	\N	\N	14.7	20.9	0	16.7	296	4	open-meteo	82	2025-06-16 09:17:59.462292	2025-06-16 16:00:08.455
36	2025-06-23	\N	\N	\N	\N	\N	\N	14.7	20.9	0	16.7	296	4	open-meteo	82	2025-06-16 12:32:27.74903	2025-06-16 16:00:08.455
21	2025-06-24	\N	\N	\N	\N	\N	\N	11	16.1	0	12.6	38	3.35	open-meteo	90	2025-06-16 09:17:59.462292	2025-06-16 16:00:08.515
37	2025-06-24	\N	\N	\N	\N	\N	\N	11	16.1	0	12.6	38	3.35	open-meteo	90	2025-06-16 12:32:27.816064	2025-06-16 16:00:08.515
22	2025-06-25	\N	\N	\N	\N	\N	\N	10.8	21.1	0	20.9	135	6.5	open-meteo	15	2025-06-16 09:17:59.462292	2025-06-16 16:00:08.576
38	2025-06-25	\N	\N	\N	\N	\N	\N	10.8	21.1	0	20.9	135	6.5	open-meteo	15	2025-06-16 12:32:27.882248	2025-06-16 16:00:08.576
23	2025-06-26	\N	\N	\N	\N	\N	\N	10.2	18.4	0	26.1	131	6.6	open-meteo	18	2025-06-16 09:17:59.462292	2025-06-16 16:00:08.635
39	2025-06-26	\N	\N	\N	\N	\N	\N	10.2	18.4	0	26.1	131	6.6	open-meteo	18	2025-06-16 12:32:27.948781	2025-06-16 16:00:08.635
24	2025-06-27	\N	\N	\N	\N	\N	\N	11.9	25.4	0.3	16.6	155	5.7	open-meteo	74	2025-06-16 09:17:59.462292	2025-06-16 16:00:08.696
40	2025-06-27	\N	\N	\N	\N	\N	\N	11.9	25.4	0.3	16.6	155	5.7	open-meteo	74	2025-06-16 12:32:28.015044	2025-06-16 16:00:08.696
25	2025-06-28	\N	\N	\N	\N	\N	\N	16	25.6	0.3	8.3	265	6.1	open-meteo	53	2025-06-16 09:17:59.462292	2025-06-16 16:00:08.756
29	2025-06-16	\N	\N	\N	\N	\N	\N	12.1	19.6	0	29.8	244	6.35	open-meteo	84	2025-06-16 12:32:27.268604	2025-06-16 16:00:08.02
7	2025-06-16	\N	\N	\N	\N	\N	\N	12.1	19.6	0	29.8	244	6.35	open-meteo	84	2025-06-16 09:17:59.462292	2025-06-16 16:00:08.02
13	2025-06-16	\N	\N	\N	\N	\N	\N	12.1	19.6	0	29.8	244	6.35	open-meteo	84	2025-06-16 09:17:59.462292	2025-06-16 16:00:08.02
30	2025-06-17	\N	\N	\N	\N	\N	\N	13.8	18.4	0	36.3	243	6.3	open-meteo	89	2025-06-16 12:32:27.35228	2025-06-16 16:00:08.085
14	2025-06-17	\N	\N	\N	\N	\N	\N	13.8	18.4	0	36.3	243	6.3	open-meteo	89	2025-06-16 09:17:59.462292	2025-06-16 16:00:08.085
31	2025-06-18	\N	\N	\N	\N	\N	\N	11.2	17.1	0	30	273	6.7	open-meteo	74	2025-06-16 12:32:27.418665	2025-06-16 16:00:08.152
15	2025-06-18	\N	\N	\N	\N	\N	\N	11.2	17.1	0	30	273	6.7	open-meteo	74	2025-06-16 09:17:59.462292	2025-06-16 16:00:08.152
32	2025-06-19	\N	\N	\N	\N	\N	\N	10.5	16.3	0	21.8	140	5.25	open-meteo	54	2025-06-16 12:32:27.484754	2025-06-16 16:00:08.214
16	2025-06-19	\N	\N	\N	\N	\N	\N	10.5	16.3	0	21.8	140	5.25	open-meteo	54	2025-06-16 09:17:59.462292	2025-06-16 16:00:08.214
41	2025-06-28	\N	\N	\N	\N	\N	\N	16	25.6	0.3	8.3	265	6.1	open-meteo	53	2025-06-16 12:32:28.081093	2025-06-16 16:00:08.756
26	2025-06-29	\N	\N	\N	\N	\N	\N	13.4	20.7	0	14.8	64	5.55	open-meteo	74	2025-06-16 09:17:59.462292	2025-06-16 16:00:08.816
42	2025-06-29	\N	\N	\N	\N	\N	\N	13.4	20.7	0	14.8	64	5.55	open-meteo	74	2025-06-16 12:32:28.148017	2025-06-16 16:00:08.816
27	2025-06-30	\N	\N	\N	\N	\N	\N	14.2	28.5	0	24.2	151	6.5	open-meteo	29	2025-06-16 09:17:59.462292	2025-06-16 16:00:08.877
28	2025-07-01	\N	\N	\N	\N	\N	\N	17.4	28.8	0	26.2	155	6.5	open-meteo	13	2025-06-16 09:31:12.503567	2025-06-16 16:00:08.937
\.


--
-- Data for Name: weather_data_backup_2025-06-17T05-52-24-877Z; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public."weather_data_backup_2025-06-17T05-52-24-877Z" (id, date, temperature, condition, description, wind_speed, humidity, wind_direction, temperature_min, temperature_max, precipitation_sum, wind_speed_max, wind_direction_dominant, uv_index_max, source, cloudcover, created_at, updated_at) FROM stdin;
5	2025-06-10	\N	\N	\N	\N	\N	\N	11.6	14.5	0.6	35.3	311	5.85	Open-Meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
1	2025-01-01	4	cloudy	Grey skies over the North Sea	29	85	W	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
2	2025-01-02	5	rainy	Wet conditions along the causeway	32	86	S	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
3	2025-06-09	14	partly cloudy	Pleasant coastal conditions	18	72	SW	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
4	2025-06-10	15	sunny	Clear skies for crossing	15	68	W	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
8	2025-06-11	\N	\N	\N	\N	\N	\N	10.5	14.2	0	29.7	141	6.3	Open-Meteo	34	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
9	2025-06-12	\N	\N	\N	\N	\N	\N	11.9	13.7	0.2	43	140	5.75	Open-Meteo	76	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
10	2025-06-13	\N	\N	\N	\N	\N	\N	12.3	21	0.9	17.3	186	5.5	Open-Meteo	70	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
11	2025-06-14	\N	\N	\N	\N	\N	\N	11.8	18.3	11.2	14.1	273	4.5	Open-Meteo	79	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
29	2025-06-16	\N	\N	\N	\N	\N	\N	12.1	19.6	0	30.1	245	6.35	open-meteo	84	2025-06-16 12:32:27.268604	2025-06-16 17:15:01.481
7	2025-06-16	\N	\N	\N	\N	\N	\N	12.1	19.6	0	30.1	245	6.35	open-meteo	84	2025-06-16 09:17:59.462292	2025-06-16 17:15:01.481
13	2025-06-16	\N	\N	\N	\N	\N	\N	12.1	19.6	0	30.1	245	6.35	open-meteo	84	2025-06-16 09:17:59.462292	2025-06-16 17:15:01.481
30	2025-06-17	\N	\N	\N	\N	\N	\N	13.7	19.3	0	41.8	251	6.3	open-meteo	82	2025-06-16 12:32:27.35228	2025-06-16 17:15:01.614
14	2025-06-17	\N	\N	\N	\N	\N	\N	13.7	19.3	0	41.8	251	6.3	open-meteo	82	2025-06-16 09:17:59.462292	2025-06-16 17:15:01.614
6	2025-06-15	\N	\N	\N	\N	\N	\N	12.8	18	0	34.5	256	6.5	open-meteo	74	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
12	2025-06-15	\N	\N	\N	\N	\N	\N	12.8	18	0	34.5	256	6.5	open-meteo	74	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
31	2025-06-18	\N	\N	\N	\N	\N	\N	11.6	17.1	0	24.5	272	6.7	open-meteo	68	2025-06-16 12:32:27.418665	2025-06-16 17:15:01.743
15	2025-06-18	\N	\N	\N	\N	\N	\N	11.6	17.1	0	24.5	272	6.7	open-meteo	68	2025-06-16 09:17:59.462292	2025-06-16 17:15:01.743
32	2025-06-19	\N	\N	\N	\N	\N	\N	10.5	16.3	0	21.8	140	5.25	open-meteo	54	2025-06-16 12:32:27.484754	2025-06-16 17:15:01.872
16	2025-06-19	\N	\N	\N	\N	\N	\N	10.5	16.3	0	21.8	140	5.25	open-meteo	54	2025-06-16 09:17:59.462292	2025-06-16 17:15:01.872
33	2025-06-20	\N	\N	\N	\N	\N	\N	13.7	23.6	0	21.9	150	6.7	open-meteo	77	2025-06-16 12:32:27.550817	2025-06-16 17:15:02.001
17	2025-06-20	\N	\N	\N	\N	\N	\N	13.7	23.6	0	21.9	150	6.7	open-meteo	77	2025-06-16 09:17:59.462292	2025-06-16 17:15:02.001
18	2025-06-21	\N	\N	\N	\N	\N	\N	15.7	23.8	0	27.6	147	6.1	open-meteo	23	2025-06-16 09:17:59.462292	2025-06-16 17:15:02.129
34	2025-06-21	\N	\N	\N	\N	\N	\N	15.7	23.8	0	27.6	147	6.1	open-meteo	23	2025-06-16 12:32:27.617124	2025-06-16 17:15:02.129
19	2025-06-22	\N	\N	\N	\N	\N	\N	15.6	25.7	0.6	22.9	194	6.35	open-meteo	72	2025-06-16 09:17:59.462292	2025-06-16 17:15:02.258
35	2025-06-22	\N	\N	\N	\N	\N	\N	15.6	25.7	0.6	22.9	194	6.35	open-meteo	72	2025-06-16 12:32:27.683058	2025-06-16 17:15:02.258
20	2025-06-23	\N	\N	\N	\N	\N	\N	14.7	20.9	0	16.7	296	4	open-meteo	82	2025-06-16 09:17:59.462292	2025-06-16 17:15:02.386
36	2025-06-23	\N	\N	\N	\N	\N	\N	14.7	20.9	0	16.7	296	4	open-meteo	82	2025-06-16 12:32:27.74903	2025-06-16 17:15:02.386
21	2025-06-24	\N	\N	\N	\N	\N	\N	11	16.1	0	12.6	38	3.35	open-meteo	90	2025-06-16 09:17:59.462292	2025-06-16 17:15:02.515
37	2025-06-24	\N	\N	\N	\N	\N	\N	11	16.1	0	12.6	38	3.35	open-meteo	90	2025-06-16 12:32:27.816064	2025-06-16 17:15:02.515
22	2025-06-25	\N	\N	\N	\N	\N	\N	10.8	21.1	0	20.9	135	6.5	open-meteo	15	2025-06-16 09:17:59.462292	2025-06-16 17:15:02.643
38	2025-06-25	\N	\N	\N	\N	\N	\N	10.8	21.1	0	20.9	135	6.5	open-meteo	15	2025-06-16 12:32:27.882248	2025-06-16 17:15:02.643
23	2025-06-26	\N	\N	\N	\N	\N	\N	10.2	18.4	0	26.1	131	6.6	open-meteo	18	2025-06-16 09:17:59.462292	2025-06-16 17:15:02.773
39	2025-06-26	\N	\N	\N	\N	\N	\N	10.2	18.4	0	26.1	131	6.6	open-meteo	18	2025-06-16 12:32:27.948781	2025-06-16 17:15:02.773
24	2025-06-27	\N	\N	\N	\N	\N	\N	11.9	25.4	0.3	16.6	155	5.7	open-meteo	74	2025-06-16 09:17:59.462292	2025-06-16 17:15:02.902
40	2025-06-27	\N	\N	\N	\N	\N	\N	11.9	25.4	0.3	16.6	155	5.7	open-meteo	74	2025-06-16 12:32:28.015044	2025-06-16 17:15:02.902
25	2025-06-28	\N	\N	\N	\N	\N	\N	16	25.6	0.3	8.3	265	6.1	open-meteo	53	2025-06-16 09:17:59.462292	2025-06-16 17:15:03.031
41	2025-06-28	\N	\N	\N	\N	\N	\N	16	25.6	0.3	8.3	265	6.1	open-meteo	53	2025-06-16 12:32:28.081093	2025-06-16 17:15:03.031
26	2025-06-29	\N	\N	\N	\N	\N	\N	13.4	20.7	0	14.8	64	5.55	open-meteo	74	2025-06-16 09:17:59.462292	2025-06-16 17:15:03.16
42	2025-06-29	\N	\N	\N	\N	\N	\N	13.4	20.7	0	14.8	64	5.55	open-meteo	74	2025-06-16 12:32:28.148017	2025-06-16 17:15:03.16
27	2025-06-30	\N	\N	\N	\N	\N	\N	14.2	28.5	0	24.2	151	6.5	open-meteo	29	2025-06-16 09:17:59.462292	2025-06-16 17:15:03.292
28	2025-07-01	\N	\N	\N	\N	\N	\N	17.4	28.8	0	26.2	155	6.5	open-meteo	13	2025-06-16 09:31:12.503567	2025-06-16 17:15:03.421
\.


--
-- Data for Name: weather_data_backup_2025-06-17T11-16-24-980Z; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public."weather_data_backup_2025-06-17T11-16-24-980Z" (id, date, temperature, condition, description, wind_speed, humidity, wind_direction, temperature_min, temperature_max, precipitation_sum, wind_speed_max, wind_direction_dominant, uv_index_max, source, cloudcover, created_at, updated_at) FROM stdin;
5	2025-06-10	\N	\N	\N	\N	\N	\N	11.6	14.5	0.6	35.3	311	5.85	Open-Meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
1	2025-01-01	4	cloudy	Grey skies over the North Sea	29	85	W	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
2	2025-01-02	5	rainy	Wet conditions along the causeway	32	86	S	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
3	2025-06-09	14	partly cloudy	Pleasant coastal conditions	18	72	SW	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
4	2025-06-10	15	sunny	Clear skies for crossing	15	68	W	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
8	2025-06-11	\N	\N	\N	\N	\N	\N	10.5	14.2	0	29.7	141	6.3	Open-Meteo	34	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
9	2025-06-12	\N	\N	\N	\N	\N	\N	11.9	13.7	0.2	43	140	5.75	Open-Meteo	76	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
10	2025-06-13	\N	\N	\N	\N	\N	\N	12.3	21	0.9	17.3	186	5.5	Open-Meteo	70	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
11	2025-06-14	\N	\N	\N	\N	\N	\N	11.8	18.3	11.2	14.1	273	4.5	Open-Meteo	79	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
29	2025-06-16	\N	\N	\N	\N	\N	\N	12.1	19.6	0	30.1	245	6.35	open-meteo	84	2025-06-16 12:32:27.268604	2025-06-16 17:15:01.481
7	2025-06-16	\N	\N	\N	\N	\N	\N	12.1	19.6	0	30.1	245	6.35	open-meteo	84	2025-06-16 09:17:59.462292	2025-06-16 17:15:01.481
13	2025-06-16	\N	\N	\N	\N	\N	\N	12.1	19.6	0	30.1	245	6.35	open-meteo	84	2025-06-16 09:17:59.462292	2025-06-16 17:15:01.481
6	2025-06-15	\N	\N	\N	\N	\N	\N	12.8	18	0	34.5	256	6.5	open-meteo	74	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
12	2025-06-15	\N	\N	\N	\N	\N	\N	12.8	18	0	34.5	256	6.5	open-meteo	74	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
30	2025-06-17	\N	\N	\N	\N	\N	\N	13.9	18.3	0	40.7	246	6.05	open-meteo	87	2025-06-16 12:32:27.35228	2025-06-17 05:52:25.131
14	2025-06-17	\N	\N	\N	\N	\N	\N	13.9	18.3	0	40.7	246	6.05	open-meteo	87	2025-06-16 09:17:59.462292	2025-06-17 05:52:25.131
31	2025-06-18	\N	\N	\N	\N	\N	\N	10.7	16.7	0	34.7	269	6.65	open-meteo	75	2025-06-16 12:32:27.418665	2025-06-17 05:52:25.264
15	2025-06-18	\N	\N	\N	\N	\N	\N	10.7	16.7	0	34.7	269	6.65	open-meteo	75	2025-06-16 09:17:59.462292	2025-06-17 05:52:25.264
32	2025-06-19	\N	\N	\N	\N	\N	\N	12.6	17.3	0	21.5	139	4.35	open-meteo	70	2025-06-16 12:32:27.484754	2025-06-17 05:52:25.393
16	2025-06-19	\N	\N	\N	\N	\N	\N	12.6	17.3	0	21.5	139	4.35	open-meteo	70	2025-06-16 09:17:59.462292	2025-06-17 05:52:25.393
33	2025-06-20	\N	\N	\N	\N	\N	\N	14.4	22	0	27.5	149	6.5	open-meteo	64	2025-06-16 12:32:27.550817	2025-06-17 05:52:25.529
17	2025-06-20	\N	\N	\N	\N	\N	\N	14.4	22	0	27.5	149	6.5	open-meteo	64	2025-06-16 09:17:59.462292	2025-06-17 05:52:25.529
18	2025-06-21	\N	\N	\N	\N	\N	\N	15.7	23.5	2.1	27.2	149	6.8	open-meteo	66	2025-06-16 09:17:59.462292	2025-06-17 05:52:25.659
34	2025-06-21	\N	\N	\N	\N	\N	\N	15.7	23.5	2.1	27.2	149	6.8	open-meteo	66	2025-06-16 12:32:27.617124	2025-06-17 05:52:25.659
19	2025-06-22	\N	\N	\N	\N	\N	\N	14.3	21.8	3.6	20.5	301	5.8	open-meteo	73	2025-06-16 09:17:59.462292	2025-06-17 05:52:25.789
35	2025-06-22	\N	\N	\N	\N	\N	\N	14.3	21.8	3.6	20.5	301	5.8	open-meteo	73	2025-06-16 12:32:27.683058	2025-06-17 05:52:25.789
20	2025-06-23	\N	\N	\N	\N	\N	\N	12.5	22.3	0	20.6	256	5.4	open-meteo	49	2025-06-16 09:17:59.462292	2025-06-17 05:52:25.92
36	2025-06-23	\N	\N	\N	\N	\N	\N	12.5	22.3	0	20.6	256	5.4	open-meteo	49	2025-06-16 12:32:27.74903	2025-06-17 05:52:25.92
21	2025-06-24	\N	\N	\N	\N	\N	\N	11.4	19.4	0.6	31.6	260	4.8	open-meteo	61	2025-06-16 09:17:59.462292	2025-06-17 05:52:26.051
37	2025-06-24	\N	\N	\N	\N	\N	\N	11.4	19.4	0.6	31.6	260	4.8	open-meteo	61	2025-06-16 12:32:27.816064	2025-06-17 05:52:26.051
22	2025-06-25	\N	\N	\N	\N	\N	\N	8.5	19.7	0	24.9	245	5.85	open-meteo	79	2025-06-16 09:17:59.462292	2025-06-17 05:52:26.18
38	2025-06-25	\N	\N	\N	\N	\N	\N	8.5	19.7	0	24.9	245	5.85	open-meteo	79	2025-06-16 12:32:27.882248	2025-06-17 05:52:26.18
23	2025-06-26	\N	\N	\N	\N	\N	\N	13.8	20.8	0	29.1	224	3.6	open-meteo	100	2025-06-16 09:17:59.462292	2025-06-17 05:52:26.31
39	2025-06-26	\N	\N	\N	\N	\N	\N	13.8	20.8	0	29.1	224	3.6	open-meteo	100	2025-06-16 12:32:27.948781	2025-06-17 05:52:26.31
24	2025-06-27	\N	\N	\N	\N	\N	\N	14.3	22.3	0	38	236	6.55	open-meteo	60	2025-06-16 09:17:59.462292	2025-06-17 05:52:26.444
40	2025-06-27	\N	\N	\N	\N	\N	\N	14.3	22.3	0	38	236	6.55	open-meteo	60	2025-06-16 12:32:28.015044	2025-06-17 05:52:26.444
25	2025-06-28	\N	\N	\N	\N	\N	\N	10.2	19.2	0	32.3	251	6	open-meteo	46	2025-06-16 09:17:59.462292	2025-06-17 05:52:26.574
41	2025-06-28	\N	\N	\N	\N	\N	\N	10.2	19.2	0	32.3	251	6	open-meteo	46	2025-06-16 12:32:28.081093	2025-06-17 05:52:26.574
26	2025-06-29	\N	\N	\N	\N	\N	\N	10.2	23.8	0	31.8	232	5.8	open-meteo	87	2025-06-16 09:17:59.462292	2025-06-17 05:52:26.701
42	2025-06-29	\N	\N	\N	\N	\N	\N	10.2	23.8	0	31.8	232	5.8	open-meteo	87	2025-06-16 12:32:28.148017	2025-06-17 05:52:26.701
27	2025-06-30	\N	\N	\N	\N	\N	\N	12.4	25.4	0	28.8	245	6.3	open-meteo	93	2025-06-16 09:17:59.462292	2025-06-17 05:52:26.831
28	2025-07-01	\N	\N	\N	\N	\N	\N	12.1	20.1	0.7	18.1	98	5.6	open-meteo	98	2025-06-16 09:31:12.503567	2025-06-17 05:52:26.961
43	2025-07-02	\N	\N	\N	\N	\N	\N	15.3	24.2	\N	24	\N	4.85	open-meteo	0	2025-06-17 05:52:25.032257	2025-06-17 05:52:25.032257
\.


--
-- Data for Name: weather_data_backup_2025-06-17T17-15-36-079Z; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public."weather_data_backup_2025-06-17T17-15-36-079Z" (id, date, temperature, condition, description, wind_speed, humidity, wind_direction, temperature_min, temperature_max, precipitation_sum, wind_speed_max, wind_direction_dominant, uv_index_max, source, cloudcover, created_at, updated_at) FROM stdin;
5	2025-06-10	\N	\N	\N	\N	\N	\N	11.6	14.5	0.6	35.3	311	5.85	Open-Meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
1	2025-01-01	4	cloudy	Grey skies over the North Sea	29	85	W	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
2	2025-01-02	5	rainy	Wet conditions along the causeway	32	86	S	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
3	2025-06-09	14	partly cloudy	Pleasant coastal conditions	18	72	SW	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
4	2025-06-10	15	sunny	Clear skies for crossing	15	68	W	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
8	2025-06-11	\N	\N	\N	\N	\N	\N	10.5	14.2	0	29.7	141	6.3	Open-Meteo	34	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
9	2025-06-12	\N	\N	\N	\N	\N	\N	11.9	13.7	0.2	43	140	5.75	Open-Meteo	76	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
10	2025-06-13	\N	\N	\N	\N	\N	\N	12.3	21	0.9	17.3	186	5.5	Open-Meteo	70	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
11	2025-06-14	\N	\N	\N	\N	\N	\N	11.8	18.3	11.2	14.1	273	4.5	Open-Meteo	79	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
29	2025-06-16	\N	\N	\N	\N	\N	\N	12.1	19.6	0	30.1	245	6.35	open-meteo	84	2025-06-16 12:32:27.268604	2025-06-16 17:15:01.481
7	2025-06-16	\N	\N	\N	\N	\N	\N	12.1	19.6	0	30.1	245	6.35	open-meteo	84	2025-06-16 09:17:59.462292	2025-06-16 17:15:01.481
13	2025-06-16	\N	\N	\N	\N	\N	\N	12.1	19.6	0	30.1	245	6.35	open-meteo	84	2025-06-16 09:17:59.462292	2025-06-16 17:15:01.481
30	2025-06-17	\N	\N	\N	\N	\N	\N	13.9	18.4	0	34.2	241	6.35	open-meteo	86	2025-06-16 12:32:27.35228	2025-06-17 11:16:27.681
14	2025-06-17	\N	\N	\N	\N	\N	\N	13.9	18.4	0	34.2	241	6.35	open-meteo	86	2025-06-16 09:17:59.462292	2025-06-17 11:16:27.681
6	2025-06-15	\N	\N	\N	\N	\N	\N	12.8	18	0	34.5	256	6.5	open-meteo	74	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
12	2025-06-15	\N	\N	\N	\N	\N	\N	12.8	18	0	34.5	256	6.5	open-meteo	74	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
31	2025-06-18	\N	\N	\N	\N	\N	\N	10.6	16.7	0	33.5	272	6.65	open-meteo	70	2025-06-16 12:32:27.418665	2025-06-17 11:16:28.98
15	2025-06-18	\N	\N	\N	\N	\N	\N	10.6	16.7	0	33.5	272	6.65	open-meteo	70	2025-06-16 09:17:59.462292	2025-06-17 11:16:28.98
32	2025-06-19	\N	\N	\N	\N	\N	\N	12.6	16.8	0	21.7	139	6.15	open-meteo	76	2025-06-16 12:32:27.484754	2025-06-17 11:16:30.48
16	2025-06-19	\N	\N	\N	\N	\N	\N	12.6	16.8	0	21.7	139	6.15	open-meteo	76	2025-06-16 09:17:59.462292	2025-06-17 11:16:30.48
33	2025-06-20	\N	\N	\N	\N	\N	\N	14.4	20.6	0.1	29	150	6.75	open-meteo	79	2025-06-16 12:32:27.550817	2025-06-17 11:16:32.68
17	2025-06-20	\N	\N	\N	\N	\N	\N	14.4	20.6	0.1	29	150	6.75	open-meteo	79	2025-06-16 09:17:59.462292	2025-06-17 11:16:32.68
18	2025-06-21	\N	\N	\N	\N	\N	\N	16.4	20.6	9.3	24.7	160	6.8	open-meteo	95	2025-06-16 09:17:59.462292	2025-06-17 11:16:33.58
34	2025-06-21	\N	\N	\N	\N	\N	\N	16.4	20.6	9.3	24.7	160	6.8	open-meteo	95	2025-06-16 12:32:27.617124	2025-06-17 11:16:33.58
19	2025-06-22	\N	\N	\N	\N	\N	\N	14.3	21.8	0.6	20.5	295	6.4	open-meteo	60	2025-06-16 09:17:59.462292	2025-06-17 11:16:34.68
35	2025-06-22	\N	\N	\N	\N	\N	\N	14.3	21.8	0.6	20.5	295	6.4	open-meteo	60	2025-06-16 12:32:27.683058	2025-06-17 11:16:34.68
20	2025-06-23	\N	\N	\N	\N	\N	\N	12.5	22.3	0	20.6	256	6.45	open-meteo	49	2025-06-16 09:17:59.462292	2025-06-17 11:16:36.081
36	2025-06-23	\N	\N	\N	\N	\N	\N	12.5	22.3	0	20.6	256	6.45	open-meteo	49	2025-06-16 12:32:27.74903	2025-06-17 11:16:36.081
21	2025-06-24	\N	\N	\N	\N	\N	\N	12.4	19.4	0.6	42.9	259	6.05	open-meteo	62	2025-06-16 09:17:59.462292	2025-06-17 11:16:37.081
37	2025-06-24	\N	\N	\N	\N	\N	\N	12.4	19.4	0.6	42.9	259	6.05	open-meteo	62	2025-06-16 12:32:27.816064	2025-06-17 11:16:37.081
22	2025-06-25	\N	\N	\N	\N	\N	\N	10.9	21.8	0	31.4	277	6.4	open-meteo	67	2025-06-16 09:17:59.462292	2025-06-17 11:16:38.68
38	2025-06-25	\N	\N	\N	\N	\N	\N	10.9	21.8	0	31.4	277	6.4	open-meteo	67	2025-06-16 12:32:27.882248	2025-06-17 11:16:38.68
23	2025-06-26	\N	\N	\N	\N	\N	\N	11.9	24	0	30.2	253	6.5	open-meteo	48	2025-06-16 09:17:59.462292	2025-06-17 11:16:39.68
39	2025-06-26	\N	\N	\N	\N	\N	\N	11.9	24	0	30.2	253	6.5	open-meteo	48	2025-06-16 12:32:27.948781	2025-06-17 11:16:39.68
24	2025-06-27	\N	\N	\N	\N	\N	\N	14.4	25.5	2.1	11.9	194	5.6	open-meteo	29	2025-06-16 09:17:59.462292	2025-06-17 11:16:40.88
40	2025-06-27	\N	\N	\N	\N	\N	\N	14.4	25.5	2.1	11.9	194	5.6	open-meteo	29	2025-06-16 12:32:28.015044	2025-06-17 11:16:40.88
25	2025-06-28	\N	\N	\N	\N	\N	\N	13.6	19.7	0	16	55	5.5	open-meteo	54	2025-06-16 09:17:59.462292	2025-06-17 11:16:41.68
41	2025-06-28	\N	\N	\N	\N	\N	\N	13.6	19.7	0	16	55	5.5	open-meteo	54	2025-06-16 12:32:28.081093	2025-06-17 11:16:41.68
26	2025-06-29	\N	\N	\N	\N	\N	\N	13.8	21.4	0	30.7	228	5.7	open-meteo	93	2025-06-16 09:17:59.462292	2025-06-17 11:16:42.38
42	2025-06-29	\N	\N	\N	\N	\N	\N	13.8	21.4	0	30.7	228	5.7	open-meteo	93	2025-06-16 12:32:28.148017	2025-06-17 11:16:42.38
27	2025-06-30	\N	\N	\N	\N	\N	\N	12.7	15.9	3.9	25.9	324	0.5	open-meteo	100	2025-06-16 09:17:59.462292	2025-06-17 11:16:43.38
28	2025-07-01	\N	\N	\N	\N	\N	\N	10.9	20.7	0	24.8	23	6.35	open-meteo	26	2025-06-16 09:31:12.503567	2025-06-17 11:16:44.58
43	2025-07-02	\N	\N	\N	\N	\N	\N	11.7	24.1	0	16.4	242	5.9	open-meteo	53	2025-06-17 05:52:25.032257	2025-06-17 11:16:46.38
\.


--
-- Data for Name: weather_data_backup_2025-06-18T05-16-18-465Z; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public."weather_data_backup_2025-06-18T05-16-18-465Z" (id, date, temperature, condition, description, wind_speed, humidity, wind_direction, temperature_min, temperature_max, precipitation_sum, wind_speed_max, wind_direction_dominant, uv_index_max, source, cloudcover, created_at, updated_at) FROM stdin;
5	2025-06-10	\N	\N	\N	\N	\N	\N	11.6	14.5	0.6	35.3	311	5.85	Open-Meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
1	2025-01-01	4	cloudy	Grey skies over the North Sea	29	85	W	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
2	2025-01-02	5	rainy	Wet conditions along the causeway	32	86	S	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
3	2025-06-09	14	partly cloudy	Pleasant coastal conditions	18	72	SW	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
4	2025-06-10	15	sunny	Clear skies for crossing	15	68	W	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
8	2025-06-11	\N	\N	\N	\N	\N	\N	10.5	14.2	0	29.7	141	6.3	Open-Meteo	34	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
9	2025-06-12	\N	\N	\N	\N	\N	\N	11.9	13.7	0.2	43	140	5.75	Open-Meteo	76	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
10	2025-06-13	\N	\N	\N	\N	\N	\N	12.3	21	0.9	17.3	186	5.5	Open-Meteo	70	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
11	2025-06-14	\N	\N	\N	\N	\N	\N	11.8	18.3	11.2	14.1	273	4.5	Open-Meteo	79	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
29	2025-06-16	\N	\N	\N	\N	\N	\N	12.1	19.6	0	30.1	245	6.35	open-meteo	84	2025-06-16 12:32:27.268604	2025-06-16 17:15:01.481
7	2025-06-16	\N	\N	\N	\N	\N	\N	12.1	19.6	0	30.1	245	6.35	open-meteo	84	2025-06-16 09:17:59.462292	2025-06-16 17:15:01.481
13	2025-06-16	\N	\N	\N	\N	\N	\N	12.1	19.6	0	30.1	245	6.35	open-meteo	84	2025-06-16 09:17:59.462292	2025-06-16 17:15:01.481
6	2025-06-15	\N	\N	\N	\N	\N	\N	12.8	18	0	34.5	256	6.5	open-meteo	74	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
12	2025-06-15	\N	\N	\N	\N	\N	\N	12.8	18	0	34.5	256	6.5	open-meteo	74	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
30	2025-06-17	\N	\N	\N	\N	\N	\N	13.9	19.4	0	39.4	247	6.7	open-meteo	85	2025-06-16 12:32:27.35228	2025-06-17 17:15:44.678
14	2025-06-17	\N	\N	\N	\N	\N	\N	13.9	19.4	0	39.4	247	6.7	open-meteo	85	2025-06-16 09:17:59.462292	2025-06-17 17:15:44.678
31	2025-06-18	\N	\N	\N	\N	\N	\N	10.6	17.4	0	26.7	265	6.55	open-meteo	71	2025-06-16 12:32:27.418665	2025-06-17 17:15:45.978
15	2025-06-18	\N	\N	\N	\N	\N	\N	10.6	17.4	0	26.7	265	6.55	open-meteo	71	2025-06-16 09:17:59.462292	2025-06-17 17:15:45.978
32	2025-06-19	\N	\N	\N	\N	\N	\N	12.8	17.7	0	26.6	140	4.7	open-meteo	72	2025-06-16 12:32:27.484754	2025-06-17 17:15:48.078
16	2025-06-19	\N	\N	\N	\N	\N	\N	12.8	17.7	0	26.6	140	4.7	open-meteo	72	2025-06-16 09:17:59.462292	2025-06-17 17:15:48.078
33	2025-06-20	\N	\N	\N	\N	\N	\N	15.2	23.5	0	22.9	156	6.75	open-meteo	80	2025-06-16 12:32:27.550817	2025-06-17 17:15:49.478
17	2025-06-20	\N	\N	\N	\N	\N	\N	15.2	23.5	0	22.9	156	6.75	open-meteo	80	2025-06-16 09:17:59.462292	2025-06-17 17:15:49.478
18	2025-06-21	\N	\N	\N	\N	\N	\N	17.4	23.9	2.1	17.7	170	6.55	open-meteo	81	2025-06-16 09:17:59.462292	2025-06-17 17:15:50.578
34	2025-06-21	\N	\N	\N	\N	\N	\N	17.4	23.9	2.1	17.7	170	6.55	open-meteo	81	2025-06-16 12:32:27.617124	2025-06-17 17:15:50.578
19	2025-06-22	\N	\N	\N	\N	\N	\N	14.7	21.4	7.8	20.5	283	6.45	open-meteo	79	2025-06-16 09:17:59.462292	2025-06-17 17:15:51.706
35	2025-06-22	\N	\N	\N	\N	\N	\N	14.7	21.4	7.8	20.5	283	6.45	open-meteo	79	2025-06-16 12:32:27.683058	2025-06-17 17:15:51.706
20	2025-06-23	\N	\N	\N	\N	\N	\N	11.5	19.5	0.7	24.3	264	4.95	open-meteo	59	2025-06-16 09:17:59.462292	2025-06-17 17:15:53.278
36	2025-06-23	\N	\N	\N	\N	\N	\N	11.5	19.5	0.7	24.3	264	4.95	open-meteo	59	2025-06-16 12:32:27.74903	2025-06-17 17:15:53.278
21	2025-06-24	\N	\N	\N	\N	\N	\N	13.1	16.5	2.3	25.8	312	3.5	open-meteo	93	2025-06-16 09:17:59.462292	2025-06-17 17:15:54.478
37	2025-06-24	\N	\N	\N	\N	\N	\N	13.1	16.5	2.3	25.8	312	3.5	open-meteo	93	2025-06-16 12:32:27.816064	2025-06-17 17:15:54.478
22	2025-06-25	\N	\N	\N	\N	\N	\N	11.7	20	0	35.6	278	5.45	open-meteo	75	2025-06-16 09:17:59.462292	2025-06-17 17:15:54.614
38	2025-06-25	\N	\N	\N	\N	\N	\N	11.7	20	0	35.6	278	5.45	open-meteo	75	2025-06-16 12:32:27.882248	2025-06-17 17:15:54.614
23	2025-06-26	\N	\N	\N	\N	\N	\N	12	25	0	24.9	263	6.45	open-meteo	43	2025-06-16 09:17:59.462292	2025-06-17 17:15:54.674
39	2025-06-26	\N	\N	\N	\N	\N	\N	12	25	0	24.9	263	6.45	open-meteo	43	2025-06-16 12:32:27.948781	2025-06-17 17:15:54.674
24	2025-06-27	\N	\N	\N	\N	\N	\N	14.4	27.7	0	15.4	175	6.5	open-meteo	39	2025-06-16 09:17:59.462292	2025-06-17 17:15:54.737
40	2025-06-27	\N	\N	\N	\N	\N	\N	14.4	27.7	0	15.4	175	6.5	open-meteo	39	2025-06-16 12:32:28.015044	2025-06-17 17:15:54.737
25	2025-06-28	\N	\N	\N	\N	\N	\N	14.4	26.2	0	26.2	244	5.95	open-meteo	64	2025-06-16 09:17:59.462292	2025-06-17 17:15:54.796
41	2025-06-28	\N	\N	\N	\N	\N	\N	14.4	26.2	0	26.2	244	5.95	open-meteo	64	2025-06-16 12:32:28.081093	2025-06-17 17:15:54.796
26	2025-06-29	\N	\N	\N	\N	\N	\N	12	16.1	0	18.1	86	3.35	open-meteo	100	2025-06-16 09:17:59.462292	2025-06-17 17:15:54.853
42	2025-06-29	\N	\N	\N	\N	\N	\N	12	16.1	0	18.1	86	3.35	open-meteo	100	2025-06-16 12:32:28.148017	2025-06-17 17:15:54.853
27	2025-06-30	\N	\N	\N	\N	\N	\N	12.7	19.9	0	42.3	249	6.15	open-meteo	74	2025-06-16 09:17:59.462292	2025-06-17 17:15:54.911
28	2025-07-01	\N	\N	\N	\N	\N	\N	11.2	22	0.6	34.5	199	5.05	open-meteo	91	2025-06-16 09:31:12.503567	2025-06-17 17:15:55.078
43	2025-07-02	\N	\N	\N	\N	\N	\N	9.4	19.7	0	27.3	239	4.55	open-meteo	62	2025-06-17 05:52:25.032257	2025-06-17 17:15:56.279
\.


--
-- Data for Name: weather_data_backup_2025-06-18T11-16-22-169Z; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public."weather_data_backup_2025-06-18T11-16-22-169Z" (id, date, temperature, condition, description, wind_speed, humidity, wind_direction, temperature_min, temperature_max, precipitation_sum, wind_speed_max, wind_direction_dominant, uv_index_max, source, cloudcover, created_at, updated_at) FROM stdin;
5	2025-06-10	\N	\N	\N	\N	\N	\N	11.6	14.5	0.6	35.3	311	5.85	Open-Meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
1	2025-01-01	4	cloudy	Grey skies over the North Sea	29	85	W	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
2	2025-01-02	5	rainy	Wet conditions along the causeway	32	86	S	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
3	2025-06-09	14	partly cloudy	Pleasant coastal conditions	18	72	SW	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
4	2025-06-10	15	sunny	Clear skies for crossing	15	68	W	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
8	2025-06-11	\N	\N	\N	\N	\N	\N	10.5	14.2	0	29.7	141	6.3	Open-Meteo	34	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
9	2025-06-12	\N	\N	\N	\N	\N	\N	11.9	13.7	0.2	43	140	5.75	Open-Meteo	76	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
10	2025-06-13	\N	\N	\N	\N	\N	\N	12.3	21	0.9	17.3	186	5.5	Open-Meteo	70	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
11	2025-06-14	\N	\N	\N	\N	\N	\N	11.8	18.3	11.2	14.1	273	4.5	Open-Meteo	79	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
29	2025-06-16	\N	\N	\N	\N	\N	\N	12.1	19.6	0	30.1	245	6.35	open-meteo	84	2025-06-16 12:32:27.268604	2025-06-16 17:15:01.481
7	2025-06-16	\N	\N	\N	\N	\N	\N	12.1	19.6	0	30.1	245	6.35	open-meteo	84	2025-06-16 09:17:59.462292	2025-06-16 17:15:01.481
13	2025-06-16	\N	\N	\N	\N	\N	\N	12.1	19.6	0	30.1	245	6.35	open-meteo	84	2025-06-16 09:17:59.462292	2025-06-16 17:15:01.481
31	2025-06-18	\N	\N	\N	\N	\N	\N	11.7	17.3	0	24.9	269	6.55	open-meteo	84	2025-06-16 12:32:27.418665	2025-06-18 05:16:21.565
15	2025-06-18	\N	\N	\N	\N	\N	\N	11.7	17.3	0	24.9	269	6.55	open-meteo	84	2025-06-16 09:17:59.462292	2025-06-18 05:16:21.565
6	2025-06-15	\N	\N	\N	\N	\N	\N	12.8	18	0	34.5	256	6.5	open-meteo	74	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
12	2025-06-15	\N	\N	\N	\N	\N	\N	12.8	18	0	34.5	256	6.5	open-meteo	74	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
32	2025-06-19	\N	\N	\N	\N	\N	\N	12.7	14.9	0	28	132	6.5	open-meteo	69	2025-06-16 12:32:27.484754	2025-06-18 05:16:23.764
16	2025-06-19	\N	\N	\N	\N	\N	\N	12.7	14.9	0	28	132	6.5	open-meteo	69	2025-06-16 09:17:59.462292	2025-06-18 05:16:23.764
33	2025-06-20	\N	\N	\N	\N	\N	\N	13.7	25.1	0	24.4	154	6.75	open-meteo	63	2025-06-16 12:32:27.550817	2025-06-18 05:16:25.064
17	2025-06-20	\N	\N	\N	\N	\N	\N	13.7	25.1	0	24.4	154	6.75	open-meteo	63	2025-06-16 09:17:59.462292	2025-06-18 05:16:25.064
18	2025-06-21	\N	\N	\N	\N	\N	\N	17.4	23.9	0	18	191	6.8	open-meteo	67	2025-06-16 09:17:59.462292	2025-06-18 05:16:26.164
34	2025-06-21	\N	\N	\N	\N	\N	\N	17.4	23.9	0	18	191	6.8	open-meteo	67	2025-06-16 12:32:27.617124	2025-06-18 05:16:26.164
30	2025-06-17	\N	\N	\N	\N	\N	\N	13.9	19.4	0	39.4	247	6.7	open-meteo	85	2025-06-16 12:32:27.35228	2025-06-17 17:15:44.678
14	2025-06-17	\N	\N	\N	\N	\N	\N	13.9	19.4	0	39.4	247	6.7	open-meteo	85	2025-06-16 09:17:59.462292	2025-06-17 17:15:44.678
19	2025-06-22	\N	\N	\N	\N	\N	\N	14.2	19.3	3.9	25.4	249	6.15	open-meteo	64	2025-06-16 09:17:59.462292	2025-06-18 05:16:27.264
35	2025-06-22	\N	\N	\N	\N	\N	\N	14.2	19.3	3.9	25.4	249	6.15	open-meteo	64	2025-06-16 12:32:27.683058	2025-06-18 05:16:27.264
20	2025-06-23	\N	\N	\N	\N	\N	\N	13.4	18.1	0	22.7	262	3.85	open-meteo	80	2025-06-16 09:17:59.462292	2025-06-18 05:16:28.893
36	2025-06-23	\N	\N	\N	\N	\N	\N	13.4	18.1	0	22.7	262	3.85	open-meteo	80	2025-06-16 12:32:27.74903	2025-06-18 05:16:28.893
21	2025-06-24	\N	\N	\N	\N	\N	\N	12	17.8	4.5	28.5	287	5.9	open-meteo	74	2025-06-16 09:17:59.462292	2025-06-18 05:16:30.564
37	2025-06-24	\N	\N	\N	\N	\N	\N	12	17.8	4.5	28.5	287	5.9	open-meteo	74	2025-06-16 12:32:27.816064	2025-06-18 05:16:30.564
22	2025-06-25	\N	\N	\N	\N	\N	\N	9.5	20.5	0	27.9	248	6.45	open-meteo	45	2025-06-16 09:17:59.462292	2025-06-18 05:16:32.465
38	2025-06-25	\N	\N	\N	\N	\N	\N	9.5	20.5	0	27.9	248	6.45	open-meteo	45	2025-06-16 12:32:27.882248	2025-06-18 05:16:32.465
23	2025-06-26	\N	\N	\N	\N	\N	\N	13.9	23.2	0	31.9	244	5.75	open-meteo	62	2025-06-16 09:17:59.462292	2025-06-18 05:16:34.064
39	2025-06-26	\N	\N	\N	\N	\N	\N	13.9	23.2	0	31.9	244	5.75	open-meteo	62	2025-06-16 12:32:27.948781	2025-06-18 05:16:34.064
24	2025-06-27	\N	\N	\N	\N	\N	\N	16.7	25.7	0	25.2	268	6.4	open-meteo	20	2025-06-16 09:17:59.462292	2025-06-18 05:16:35.964
40	2025-06-27	\N	\N	\N	\N	\N	\N	16.7	25.7	0	25.2	268	6.4	open-meteo	20	2025-06-16 12:32:28.015044	2025-06-18 05:16:35.964
25	2025-06-28	\N	\N	\N	\N	\N	\N	15.1	25	0	19.6	157	6	open-meteo	57	2025-06-16 09:17:59.462292	2025-06-18 05:16:39.064
41	2025-06-28	\N	\N	\N	\N	\N	\N	15.1	25	0	19.6	157	6	open-meteo	57	2025-06-16 12:32:28.081093	2025-06-18 05:16:39.064
26	2025-06-29	\N	\N	\N	\N	\N	\N	16	26.7	0.3	23.5	240	6.2	open-meteo	48	2025-06-16 09:17:59.462292	2025-06-18 05:16:40.564
42	2025-06-29	\N	\N	\N	\N	\N	\N	16	26.7	0.3	23.5	240	6.2	open-meteo	48	2025-06-16 12:32:28.148017	2025-06-18 05:16:40.564
27	2025-06-30	\N	\N	\N	\N	\N	\N	13.3	20.8	0.3	30.8	251	3.35	open-meteo	78	2025-06-16 09:17:59.462292	2025-06-18 05:16:41.564
28	2025-07-01	\N	\N	\N	\N	\N	\N	9.5	20	0	30.5	250	5.8	open-meteo	71	2025-06-16 09:31:12.503567	2025-06-18 05:16:42.164
43	2025-07-02	\N	\N	\N	\N	\N	\N	11.5	18.9	1.5	23.8	263	4.8	open-meteo	78	2025-06-17 05:52:25.032257	2025-06-18 05:16:42.764
44	2025-07-03	\N	\N	\N	\N	\N	\N	11.4	14.1	\N	14.1	\N	2.6	open-meteo	0	2025-06-18 05:16:19.879837	2025-06-18 05:16:19.879837
\.


--
-- Data for Name: weather_data_backup_2025-06-18T15-17-46-590Z; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public."weather_data_backup_2025-06-18T15-17-46-590Z" (id, date, temperature, condition, description, wind_speed, humidity, wind_direction, temperature_min, temperature_max, precipitation_sum, wind_speed_max, wind_direction_dominant, uv_index_max, source, cloudcover, created_at, updated_at) FROM stdin;
5	2025-06-10	\N	\N	\N	\N	\N	\N	11.6	14.5	0.6	35.3	311	5.85	Open-Meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
1	2025-01-01	4	cloudy	Grey skies over the North Sea	29	85	W	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
2	2025-01-02	5	rainy	Wet conditions along the causeway	32	86	S	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
3	2025-06-09	14	partly cloudy	Pleasant coastal conditions	18	72	SW	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
4	2025-06-10	15	sunny	Clear skies for crossing	15	68	W	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
8	2025-06-11	\N	\N	\N	\N	\N	\N	10.5	14.2	0	29.7	141	6.3	Open-Meteo	34	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
9	2025-06-12	\N	\N	\N	\N	\N	\N	11.9	13.7	0.2	43	140	5.75	Open-Meteo	76	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
10	2025-06-13	\N	\N	\N	\N	\N	\N	12.3	21	0.9	17.3	186	5.5	Open-Meteo	70	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
11	2025-06-14	\N	\N	\N	\N	\N	\N	11.8	18.3	11.2	14.1	273	4.5	Open-Meteo	79	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
29	2025-06-16	\N	\N	\N	\N	\N	\N	12.1	19.6	0	30.1	245	6.35	open-meteo	84	2025-06-16 12:32:27.268604	2025-06-16 17:15:01.481
7	2025-06-16	\N	\N	\N	\N	\N	\N	12.1	19.6	0	30.1	245	6.35	open-meteo	84	2025-06-16 09:17:59.462292	2025-06-16 17:15:01.481
13	2025-06-16	\N	\N	\N	\N	\N	\N	12.1	19.6	0	30.1	245	6.35	open-meteo	84	2025-06-16 09:17:59.462292	2025-06-16 17:15:01.481
6	2025-06-15	\N	\N	\N	\N	\N	\N	12.8	18	0	34.5	256	6.5	open-meteo	74	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
12	2025-06-15	\N	\N	\N	\N	\N	\N	12.8	18	0	34.5	256	6.5	open-meteo	74	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
30	2025-06-17	\N	\N	\N	\N	\N	\N	13.9	19.4	0	39.4	247	6.7	open-meteo	85	2025-06-16 12:32:27.35228	2025-06-17 17:15:44.678
14	2025-06-17	\N	\N	\N	\N	\N	\N	13.9	19.4	0	39.4	247	6.7	open-meteo	85	2025-06-16 09:17:59.462292	2025-06-17 17:15:44.678
31	2025-06-18	\N	\N	\N	\N	\N	\N	11.7	17.2	0	24.9	267	5.75	open-meteo	91	2025-06-16 12:32:27.418665	2025-06-18 11:16:26.07
15	2025-06-18	\N	\N	\N	\N	\N	\N	11.7	17.2	0	24.9	267	5.75	open-meteo	91	2025-06-16 09:17:59.462292	2025-06-18 11:16:26.07
32	2025-06-19	\N	\N	\N	\N	\N	\N	12.9	15.3	0	28.3	137	6	open-meteo	66	2025-06-16 12:32:27.484754	2025-06-18 11:16:27.569
16	2025-06-19	\N	\N	\N	\N	\N	\N	12.9	15.3	0	28.3	137	6	open-meteo	66	2025-06-16 09:17:59.462292	2025-06-18 11:16:27.569
33	2025-06-20	\N	\N	\N	\N	\N	\N	13.8	23.3	0.5	20.2	143	6.55	open-meteo	72	2025-06-16 12:32:27.550817	2025-06-18 11:16:29.268
17	2025-06-20	\N	\N	\N	\N	\N	\N	13.8	23.3	0.5	20.2	143	6.55	open-meteo	72	2025-06-16 09:17:59.462292	2025-06-18 11:16:29.268
18	2025-06-21	\N	\N	\N	\N	\N	\N	17.2	23.3	0	22.8	212	6.3	open-meteo	67	2025-06-16 09:17:59.462292	2025-06-18 11:16:30.768
34	2025-06-21	\N	\N	\N	\N	\N	\N	17.2	23.3	0	22.8	212	6.3	open-meteo	67	2025-06-16 12:32:27.617124	2025-06-18 11:16:30.768
19	2025-06-22	\N	\N	\N	\N	\N	\N	14.5	20.3	1.5	29.5	243	6.65	open-meteo	80	2025-06-16 09:17:59.462292	2025-06-18 11:16:32.468
35	2025-06-22	\N	\N	\N	\N	\N	\N	14.5	20.3	1.5	29.5	243	6.65	open-meteo	80	2025-06-16 12:32:27.683058	2025-06-18 11:16:32.468
20	2025-06-23	\N	\N	\N	\N	\N	\N	12.9	18.1	0	29.4	264	4.6	open-meteo	83	2025-06-16 09:17:59.462292	2025-06-18 11:16:33.468
36	2025-06-23	\N	\N	\N	\N	\N	\N	12.9	18.1	0	29.4	264	4.6	open-meteo	83	2025-06-16 12:32:27.74903	2025-06-18 11:16:33.468
21	2025-06-24	\N	\N	\N	\N	\N	\N	12	17.8	4.5	28.5	287	4.7	open-meteo	74	2025-06-16 09:17:59.462292	2025-06-18 11:16:34.668
37	2025-06-24	\N	\N	\N	\N	\N	\N	12	17.8	4.5	28.5	287	4.7	open-meteo	74	2025-06-16 12:32:27.816064	2025-06-18 11:16:34.668
22	2025-06-25	\N	\N	\N	\N	\N	\N	9.5	20.2	0	28.6	247	3.05	open-meteo	65	2025-06-16 09:17:59.462292	2025-06-18 11:16:36.169
38	2025-06-25	\N	\N	\N	\N	\N	\N	9.5	20.2	0	28.6	247	3.05	open-meteo	65	2025-06-16 12:32:27.882248	2025-06-18 11:16:36.169
23	2025-06-26	\N	\N	\N	\N	\N	\N	11.9	17.2	0	35.8	242	3.4	open-meteo	75	2025-06-16 09:17:59.462292	2025-06-18 11:16:37.768
39	2025-06-26	\N	\N	\N	\N	\N	\N	11.9	17.2	0	35.8	242	3.4	open-meteo	75	2025-06-16 12:32:27.948781	2025-06-18 11:16:37.768
24	2025-06-27	\N	\N	\N	\N	\N	\N	10.6	19.3	0	35.9	259	6.45	open-meteo	25	2025-06-16 09:17:59.462292	2025-06-18 11:16:38.669
40	2025-06-27	\N	\N	\N	\N	\N	\N	10.6	19.3	0	35.9	259	6.45	open-meteo	25	2025-06-16 12:32:28.015044	2025-06-18 11:16:38.669
25	2025-06-28	\N	\N	\N	\N	\N	\N	12.4	23.6	0	29.1	248	5.5	open-meteo	59	2025-06-16 09:17:59.462292	2025-06-18 11:16:40.268
41	2025-06-28	\N	\N	\N	\N	\N	\N	12.4	23.6	0	29.1	248	5.5	open-meteo	59	2025-06-16 12:32:28.081093	2025-06-18 11:16:40.268
26	2025-06-29	\N	\N	\N	\N	\N	\N	15.3	28.3	0	14.5	193	6.55	open-meteo	13	2025-06-16 09:17:59.462292	2025-06-18 11:16:41.168
42	2025-06-29	\N	\N	\N	\N	\N	\N	15.3	28.3	0	14.5	193	6.55	open-meteo	13	2025-06-16 12:32:28.148017	2025-06-18 11:16:41.168
27	2025-06-30	\N	\N	\N	\N	\N	\N	15.5	28.4	0	20.9	144	6.55	open-meteo	18	2025-06-16 09:17:59.462292	2025-06-18 11:16:41.868
28	2025-07-01	\N	\N	\N	\N	\N	\N	17.9	29.1	0	12.7	236	6.55	open-meteo	80	2025-06-16 09:31:12.503567	2025-06-18 11:16:43.069
43	2025-07-02	\N	\N	\N	\N	\N	\N	14.6	23.7	0	24.5	260	5.4	open-meteo	70	2025-06-17 05:52:25.032257	2025-06-18 11:16:44.168
44	2025-07-03	\N	\N	\N	\N	\N	\N	11.4	20.1	0.6	17.7	218	2.1	open-meteo	57	2025-06-18 05:16:19.879837	2025-06-18 11:16:46.368
\.


--
-- Data for Name: weather_data_backup_2025-06-18T17-16-17-302Z; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public."weather_data_backup_2025-06-18T17-16-17-302Z" (id, date, temperature, condition, description, wind_speed, humidity, wind_direction, temperature_min, temperature_max, precipitation_sum, wind_speed_max, wind_direction_dominant, uv_index_max, source, cloudcover, created_at, updated_at) FROM stdin;
5	2025-06-10	\N	\N	\N	\N	\N	\N	11.6	14.5	0.6	35.3	311	5.85	Open-Meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
1	2025-01-01	4	cloudy	Grey skies over the North Sea	29	85	W	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
2	2025-01-02	5	rainy	Wet conditions along the causeway	32	86	S	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
3	2025-06-09	14	partly cloudy	Pleasant coastal conditions	18	72	SW	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
4	2025-06-10	15	sunny	Clear skies for crossing	15	68	W	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
8	2025-06-11	\N	\N	\N	\N	\N	\N	10.5	14.2	0	29.7	141	6.3	Open-Meteo	34	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
9	2025-06-12	\N	\N	\N	\N	\N	\N	11.9	13.7	0.2	43	140	5.75	Open-Meteo	76	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
10	2025-06-13	\N	\N	\N	\N	\N	\N	12.3	21	0.9	17.3	186	5.5	Open-Meteo	70	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
11	2025-06-14	\N	\N	\N	\N	\N	\N	11.8	18.3	11.2	14.1	273	4.5	Open-Meteo	79	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
29	2025-06-16	\N	\N	\N	\N	\N	\N	12.1	19.6	0	30.1	245	6.35	open-meteo	84	2025-06-16 12:32:27.268604	2025-06-16 17:15:01.481
7	2025-06-16	\N	\N	\N	\N	\N	\N	12.1	19.6	0	30.1	245	6.35	open-meteo	84	2025-06-16 09:17:59.462292	2025-06-16 17:15:01.481
13	2025-06-16	\N	\N	\N	\N	\N	\N	12.1	19.6	0	30.1	245	6.35	open-meteo	84	2025-06-16 09:17:59.462292	2025-06-16 17:15:01.481
31	2025-06-18	\N	\N	\N	\N	\N	\N	11.7	17.2	0	24.9	266	5.5	open-meteo	89	2025-06-16 12:32:27.418665	2025-06-18 15:17:46.708
15	2025-06-18	\N	\N	\N	\N	\N	\N	11.7	17.2	0	24.9	266	5.5	open-meteo	89	2025-06-16 09:17:59.462292	2025-06-18 15:17:46.708
6	2025-06-15	\N	\N	\N	\N	\N	\N	12.8	18	0	34.5	256	6.5	open-meteo	74	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
12	2025-06-15	\N	\N	\N	\N	\N	\N	12.8	18	0	34.5	256	6.5	open-meteo	74	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
32	2025-06-19	\N	\N	\N	\N	\N	\N	12.7	15.3	0	26.6	132	4.75	open-meteo	72	2025-06-16 12:32:27.484754	2025-06-18 15:17:46.776
16	2025-06-19	\N	\N	\N	\N	\N	\N	12.7	15.3	0	26.6	132	4.75	open-meteo	72	2025-06-16 09:17:59.462292	2025-06-18 15:17:46.776
33	2025-06-20	\N	\N	\N	\N	\N	\N	14.2	23.3	0	18.7	139	6.6	open-meteo	69	2025-06-16 12:32:27.550817	2025-06-18 15:17:46.844
17	2025-06-20	\N	\N	\N	\N	\N	\N	14.2	23.3	0	18.7	139	6.6	open-meteo	69	2025-06-16 09:17:59.462292	2025-06-18 15:17:46.844
18	2025-06-21	\N	\N	\N	\N	\N	\N	17.2	23.3	0	22.8	212	6.75	open-meteo	67	2025-06-16 09:17:59.462292	2025-06-18 15:17:46.91
34	2025-06-21	\N	\N	\N	\N	\N	\N	17.2	23.3	0	22.8	212	6.75	open-meteo	67	2025-06-16 12:32:27.617124	2025-06-18 15:17:46.91
30	2025-06-17	\N	\N	\N	\N	\N	\N	13.9	19.4	0	39.4	247	6.7	open-meteo	85	2025-06-16 12:32:27.35228	2025-06-17 17:15:44.678
14	2025-06-17	\N	\N	\N	\N	\N	\N	13.9	19.4	0	39.4	247	6.7	open-meteo	85	2025-06-16 09:17:59.462292	2025-06-17 17:15:44.678
19	2025-06-22	\N	\N	\N	\N	\N	\N	14.5	20.3	1.5	29.5	243	5.75	open-meteo	80	2025-06-16 09:17:59.462292	2025-06-18 15:17:46.975
35	2025-06-22	\N	\N	\N	\N	\N	\N	14.5	20.3	1.5	29.5	243	5.75	open-meteo	80	2025-06-16 12:32:27.683058	2025-06-18 15:17:46.975
20	2025-06-23	\N	\N	\N	\N	\N	\N	12.9	18.1	0	29.4	264	5.05	open-meteo	83	2025-06-16 09:17:59.462292	2025-06-18 15:17:47.042
36	2025-06-23	\N	\N	\N	\N	\N	\N	12.9	18.1	0	29.4	264	5.05	open-meteo	83	2025-06-16 12:32:27.74903	2025-06-18 15:17:47.042
21	2025-06-24	\N	\N	\N	\N	\N	\N	12	17.8	4.5	28.5	287	4.95	open-meteo	74	2025-06-16 09:17:59.462292	2025-06-18 15:17:47.107
37	2025-06-24	\N	\N	\N	\N	\N	\N	12	17.8	4.5	28.5	287	4.95	open-meteo	74	2025-06-16 12:32:27.816064	2025-06-18 15:17:47.107
22	2025-06-25	\N	\N	\N	\N	\N	\N	9.5	22.6	0	26.3	239	6.2	open-meteo	37	2025-06-16 09:17:59.462292	2025-06-18 15:17:47.173
38	2025-06-25	\N	\N	\N	\N	\N	\N	9.5	22.6	0	26.3	239	6.2	open-meteo	37	2025-06-16 12:32:27.882248	2025-06-18 15:17:47.173
23	2025-06-26	\N	\N	\N	\N	\N	\N	14.5	22.5	0	32.7	229	6.15	open-meteo	56	2025-06-16 09:17:59.462292	2025-06-18 15:17:47.238
39	2025-06-26	\N	\N	\N	\N	\N	\N	14.5	22.5	0	32.7	229	6.15	open-meteo	56	2025-06-16 12:32:27.948781	2025-06-18 15:17:47.238
24	2025-06-27	\N	\N	\N	\N	\N	\N	14	26	0	42.1	215	6.55	open-meteo	31	2025-06-16 09:17:59.462292	2025-06-18 15:17:47.303
40	2025-06-27	\N	\N	\N	\N	\N	\N	14	26	0	42.1	215	6.55	open-meteo	31	2025-06-16 12:32:28.015044	2025-06-18 15:17:47.303
25	2025-06-28	\N	\N	\N	\N	\N	\N	11	24.9	0.3	27.6	235	5.65	open-meteo	80	2025-06-16 09:17:59.462292	2025-06-18 15:17:47.369
41	2025-06-28	\N	\N	\N	\N	\N	\N	11	24.9	0.3	27.6	235	5.65	open-meteo	80	2025-06-16 12:32:28.081093	2025-06-18 15:17:47.369
26	2025-06-29	\N	\N	\N	\N	\N	\N	9.6	19.1	0	29.2	265	5.8	open-meteo	38	2025-06-16 09:17:59.462292	2025-06-18 15:17:47.436
42	2025-06-29	\N	\N	\N	\N	\N	\N	9.6	19.1	0	29.2	265	5.8	open-meteo	38	2025-06-16 12:32:28.148017	2025-06-18 15:17:47.436
27	2025-06-30	\N	\N	\N	\N	\N	\N	9.5	20	0	27.6	264	5.85	open-meteo	35	2025-06-16 09:17:59.462292	2025-06-18 15:17:47.5
28	2025-07-01	\N	\N	\N	\N	\N	\N	11.8	22.7	0	29.5	238	6.3	open-meteo	71	2025-06-16 09:31:12.503567	2025-06-18 15:17:47.566
43	2025-07-02	\N	\N	\N	\N	\N	\N	12.6	25	0	34.8	149	6.2	open-meteo	74	2025-06-17 05:52:25.032257	2025-06-18 15:17:47.632
44	2025-07-03	\N	\N	\N	\N	\N	\N	11.8	18.6	0.3	39.6	249	6	open-meteo	67	2025-06-18 05:16:19.879837	2025-06-18 15:17:47.697
\.


--
-- Data for Name: weather_data_backup_2025-06-18T18-24-22-136Z; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public."weather_data_backup_2025-06-18T18-24-22-136Z" (id, date, temperature, condition, description, wind_speed, humidity, wind_direction, temperature_min, temperature_max, precipitation_sum, wind_speed_max, wind_direction_dominant, uv_index_max, source, cloudcover, created_at, updated_at) FROM stdin;
5	2025-06-10	\N	\N	\N	\N	\N	\N	11.6	14.5	0.6	35.3	311	5.85	Open-Meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
1	2025-01-01	4	cloudy	Grey skies over the North Sea	29	85	W	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
2	2025-01-02	5	rainy	Wet conditions along the causeway	32	86	S	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
3	2025-06-09	14	partly cloudy	Pleasant coastal conditions	18	72	SW	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
4	2025-06-10	15	sunny	Clear skies for crossing	15	68	W	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
8	2025-06-11	\N	\N	\N	\N	\N	\N	10.5	14.2	0	29.7	141	6.3	Open-Meteo	34	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
9	2025-06-12	\N	\N	\N	\N	\N	\N	11.9	13.7	0.2	43	140	5.75	Open-Meteo	76	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
10	2025-06-13	\N	\N	\N	\N	\N	\N	12.3	21	0.9	17.3	186	5.5	Open-Meteo	70	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
11	2025-06-14	\N	\N	\N	\N	\N	\N	11.8	18.3	11.2	14.1	273	4.5	Open-Meteo	79	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
29	2025-06-16	\N	\N	\N	\N	\N	\N	12.1	19.6	0	30.1	245	6.35	open-meteo	84	2025-06-16 12:32:27.268604	2025-06-16 17:15:01.481
7	2025-06-16	\N	\N	\N	\N	\N	\N	12.1	19.6	0	30.1	245	6.35	open-meteo	84	2025-06-16 09:17:59.462292	2025-06-16 17:15:01.481
13	2025-06-16	\N	\N	\N	\N	\N	\N	12.1	19.6	0	30.1	245	6.35	open-meteo	84	2025-06-16 09:17:59.462292	2025-06-16 17:15:01.481
6	2025-06-15	\N	\N	\N	\N	\N	\N	12.8	18	0	34.5	256	6.5	open-meteo	74	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
12	2025-06-15	\N	\N	\N	\N	\N	\N	12.8	18	0	34.5	256	6.5	open-meteo	74	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
30	2025-06-17	\N	\N	\N	\N	\N	\N	13.9	19.4	0	39.4	247	6.7	open-meteo	85	2025-06-16 12:32:27.35228	2025-06-17 17:15:44.678
14	2025-06-17	\N	\N	\N	\N	\N	\N	13.9	19.4	0	39.4	247	6.7	open-meteo	85	2025-06-16 09:17:59.462292	2025-06-17 17:15:44.678
31	2025-06-18	\N	\N	\N	\N	\N	\N	11.7	17	0	24.9	265	5.5	open-meteo	88	2025-06-16 12:32:27.418665	2025-06-18 17:16:20.303
15	2025-06-18	\N	\N	\N	\N	\N	\N	11.7	17	0	24.9	265	5.5	open-meteo	88	2025-06-16 09:17:59.462292	2025-06-18 17:16:20.303
32	2025-06-19	\N	\N	\N	\N	\N	\N	12.4	14.7	0	26.4	134	4.75	open-meteo	63	2025-06-16 12:32:27.484754	2025-06-18 17:16:22.502
16	2025-06-19	\N	\N	\N	\N	\N	\N	12.4	14.7	0	26.4	134	4.75	open-meteo	63	2025-06-16 09:17:59.462292	2025-06-18 17:16:22.502
33	2025-06-20	\N	\N	\N	\N	\N	\N	13.7	22.1	0	23.3	115	6.6	open-meteo	61	2025-06-16 12:32:27.550817	2025-06-18 17:16:24.202
17	2025-06-20	\N	\N	\N	\N	\N	\N	13.7	22.1	0	23.3	115	6.6	open-meteo	61	2025-06-16 09:17:59.462292	2025-06-18 17:16:24.202
18	2025-06-21	\N	\N	\N	\N	\N	\N	13.1	22.4	0	23.9	244	6.75	open-meteo	50	2025-06-16 09:17:59.462292	2025-06-18 17:16:26.202
34	2025-06-21	\N	\N	\N	\N	\N	\N	13.1	22.4	0	23.9	244	6.75	open-meteo	50	2025-06-16 12:32:27.617124	2025-06-18 17:16:26.202
19	2025-06-22	\N	\N	\N	\N	\N	\N	12.4	17.9	0.9	25.6	241	5.75	open-meteo	92	2025-06-16 09:17:59.462292	2025-06-18 17:16:27.702
35	2025-06-22	\N	\N	\N	\N	\N	\N	12.4	17.9	0.9	25.6	241	5.75	open-meteo	92	2025-06-16 12:32:27.683058	2025-06-18 17:16:27.702
20	2025-06-23	\N	\N	\N	\N	\N	\N	10.5	19	0	27.7	271	5.05	open-meteo	58	2025-06-16 09:17:59.462292	2025-06-18 17:16:29.902
36	2025-06-23	\N	\N	\N	\N	\N	\N	10.5	19	0	27.7	271	5.05	open-meteo	58	2025-06-16 12:32:27.74903	2025-06-18 17:16:29.902
21	2025-06-24	\N	\N	\N	\N	\N	\N	13.1	18	2.7	19.1	271	4.95	open-meteo	95	2025-06-16 09:17:59.462292	2025-06-18 17:16:32.616
37	2025-06-24	\N	\N	\N	\N	\N	\N	13.1	18	2.7	19.1	271	4.95	open-meteo	95	2025-06-16 12:32:27.816064	2025-06-18 17:16:32.616
22	2025-06-25	\N	\N	\N	\N	\N	\N	13	20	0.2	28.7	232	6.2	open-meteo	86	2025-06-16 09:17:59.462292	2025-06-18 17:16:33.803
38	2025-06-25	\N	\N	\N	\N	\N	\N	13	20	0.2	28.7	232	6.2	open-meteo	86	2025-06-16 12:32:27.882248	2025-06-18 17:16:33.803
23	2025-06-26	\N	\N	\N	\N	\N	\N	14.5	22.5	0.4	32.7	229	6.15	open-meteo	60	2025-06-16 09:17:59.462292	2025-06-18 17:16:34.532
39	2025-06-26	\N	\N	\N	\N	\N	\N	14.5	22.5	0.4	32.7	229	6.15	open-meteo	60	2025-06-16 12:32:27.948781	2025-06-18 17:16:34.532
24	2025-06-27	\N	\N	\N	\N	\N	\N	14	26	0	42.1	215	6.55	open-meteo	31	2025-06-16 09:17:59.462292	2025-06-18 17:16:35.102
40	2025-06-27	\N	\N	\N	\N	\N	\N	14	26	0	42.1	215	6.55	open-meteo	31	2025-06-16 12:32:28.015044	2025-06-18 17:16:35.102
25	2025-06-28	\N	\N	\N	\N	\N	\N	11	24.9	0.3	27.6	235	5.65	open-meteo	80	2025-06-16 09:17:59.462292	2025-06-18 17:16:35.632
41	2025-06-28	\N	\N	\N	\N	\N	\N	11	24.9	0.3	27.6	235	5.65	open-meteo	80	2025-06-16 12:32:28.081093	2025-06-18 17:16:35.632
26	2025-06-29	\N	\N	\N	\N	\N	\N	9.6	19.1	0	29.2	265	5.8	open-meteo	38	2025-06-16 09:17:59.462292	2025-06-18 17:16:36.032
42	2025-06-29	\N	\N	\N	\N	\N	\N	9.6	19.1	0	29.2	265	5.8	open-meteo	38	2025-06-16 12:32:28.148017	2025-06-18 17:16:36.032
27	2025-06-30	\N	\N	\N	\N	\N	\N	9.5	20	0	27.6	264	5.85	open-meteo	35	2025-06-16 09:17:59.462292	2025-06-18 17:16:36.432
28	2025-07-01	\N	\N	\N	\N	\N	\N	11.8	22.7	0	29.5	238	6.3	open-meteo	71	2025-06-16 09:31:12.503567	2025-06-18 17:16:36.902
43	2025-07-02	\N	\N	\N	\N	\N	\N	12.6	25	0	34.8	149	6.2	open-meteo	74	2025-06-17 05:52:25.032257	2025-06-18 17:16:38.002
44	2025-07-03	\N	\N	\N	\N	\N	\N	11.8	18.6	0.3	39.6	249	6	open-meteo	67	2025-06-18 05:16:19.879837	2025-06-18 17:16:38.902
\.


--
-- Data for Name: weather_data_backup_2025-06-18T19-14-04-295Z; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public."weather_data_backup_2025-06-18T19-14-04-295Z" (id, date, temperature, condition, description, wind_speed, humidity, wind_direction, temperature_min, temperature_max, precipitation_sum, wind_speed_max, wind_direction_dominant, uv_index_max, source, cloudcover, created_at, updated_at) FROM stdin;
5	2025-06-10	\N	\N	\N	\N	\N	\N	11.6	14.5	0.6	35.3	311	5.85	Open-Meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
1	2025-01-01	4	cloudy	Grey skies over the North Sea	29	85	W	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
2	2025-01-02	5	rainy	Wet conditions along the causeway	32	86	S	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
3	2025-06-09	14	partly cloudy	Pleasant coastal conditions	18	72	SW	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
4	2025-06-10	15	sunny	Clear skies for crossing	15	68	W	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
8	2025-06-11	\N	\N	\N	\N	\N	\N	10.5	14.2	0	29.7	141	6.3	Open-Meteo	34	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
9	2025-06-12	\N	\N	\N	\N	\N	\N	11.9	13.7	0.2	43	140	5.75	Open-Meteo	76	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
10	2025-06-13	\N	\N	\N	\N	\N	\N	12.3	21	0.9	17.3	186	5.5	Open-Meteo	70	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
11	2025-06-14	\N	\N	\N	\N	\N	\N	11.8	18.3	11.2	14.1	273	4.5	Open-Meteo	79	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
29	2025-06-16	\N	\N	\N	\N	\N	\N	12.1	19.6	0	30.1	245	6.35	open-meteo	84	2025-06-16 12:32:27.268604	2025-06-16 17:15:01.481
7	2025-06-16	\N	\N	\N	\N	\N	\N	12.1	19.6	0	30.1	245	6.35	open-meteo	84	2025-06-16 09:17:59.462292	2025-06-16 17:15:01.481
13	2025-06-16	\N	\N	\N	\N	\N	\N	12.1	19.6	0	30.1	245	6.35	open-meteo	84	2025-06-16 09:17:59.462292	2025-06-16 17:15:01.481
31	2025-06-18	\N	\N	\N	\N	\N	\N	11.7	17	0	24.9	265	5.5	open-meteo	88	2025-06-16 12:32:27.418665	2025-06-18 18:24:22.394
15	2025-06-18	\N	\N	\N	\N	\N	\N	11.7	17	0	24.9	265	5.5	open-meteo	88	2025-06-16 09:17:59.462292	2025-06-18 18:24:22.394
6	2025-06-15	\N	\N	\N	\N	\N	\N	12.8	18	0	34.5	256	6.5	open-meteo	74	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
12	2025-06-15	\N	\N	\N	\N	\N	\N	12.8	18	0	34.5	256	6.5	open-meteo	74	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
32	2025-06-19	\N	\N	\N	\N	\N	\N	12.4	14.7	0	26.4	134	4.75	open-meteo	63	2025-06-16 12:32:27.484754	2025-06-18 18:24:22.537
16	2025-06-19	\N	\N	\N	\N	\N	\N	12.4	14.7	0	26.4	134	4.75	open-meteo	63	2025-06-16 09:17:59.462292	2025-06-18 18:24:22.537
33	2025-06-20	\N	\N	\N	\N	\N	\N	13.7	22.1	0	23.3	115	6.6	open-meteo	61	2025-06-16 12:32:27.550817	2025-06-18 18:24:22.672
17	2025-06-20	\N	\N	\N	\N	\N	\N	13.7	22.1	0	23.3	115	6.6	open-meteo	61	2025-06-16 09:17:59.462292	2025-06-18 18:24:22.672
18	2025-06-21	\N	\N	\N	\N	\N	\N	13.1	22.4	0	23.9	244	6.75	open-meteo	50	2025-06-16 09:17:59.462292	2025-06-18 18:24:22.802
34	2025-06-21	\N	\N	\N	\N	\N	\N	13.1	22.4	0	23.9	244	6.75	open-meteo	50	2025-06-16 12:32:27.617124	2025-06-18 18:24:22.802
30	2025-06-17	\N	\N	\N	\N	\N	\N	13.9	19.4	0	39.4	247	6.7	open-meteo	85	2025-06-16 12:32:27.35228	2025-06-17 17:15:44.678
14	2025-06-17	\N	\N	\N	\N	\N	\N	13.9	19.4	0	39.4	247	6.7	open-meteo	85	2025-06-16 09:17:59.462292	2025-06-17 17:15:44.678
19	2025-06-22	\N	\N	\N	\N	\N	\N	12.4	17.9	0.9	25.6	241	5.75	open-meteo	92	2025-06-16 09:17:59.462292	2025-06-18 18:24:22.933
35	2025-06-22	\N	\N	\N	\N	\N	\N	12.4	17.9	0.9	25.6	241	5.75	open-meteo	92	2025-06-16 12:32:27.683058	2025-06-18 18:24:22.933
20	2025-06-23	\N	\N	\N	\N	\N	\N	10.5	19	0	27.7	271	5.05	open-meteo	58	2025-06-16 09:17:59.462292	2025-06-18 18:24:23.063
36	2025-06-23	\N	\N	\N	\N	\N	\N	10.5	19	0	27.7	271	5.05	open-meteo	58	2025-06-16 12:32:27.74903	2025-06-18 18:24:23.063
21	2025-06-24	\N	\N	\N	\N	\N	\N	13.1	18	2.7	19.1	271	4.95	open-meteo	95	2025-06-16 09:17:59.462292	2025-06-18 18:24:23.193
37	2025-06-24	\N	\N	\N	\N	\N	\N	13.1	18	2.7	19.1	271	4.95	open-meteo	95	2025-06-16 12:32:27.816064	2025-06-18 18:24:23.193
22	2025-06-25	\N	\N	\N	\N	\N	\N	13	20	0.2	28.7	232	6.2	open-meteo	86	2025-06-16 09:17:59.462292	2025-06-18 18:24:23.324
38	2025-06-25	\N	\N	\N	\N	\N	\N	13	20	0.2	28.7	232	6.2	open-meteo	86	2025-06-16 12:32:27.882248	2025-06-18 18:24:23.324
23	2025-06-26	\N	\N	\N	\N	\N	\N	14.5	22.5	0.4	32.7	229	6.15	open-meteo	60	2025-06-16 09:17:59.462292	2025-06-18 18:24:23.457
39	2025-06-26	\N	\N	\N	\N	\N	\N	14.5	22.5	0.4	32.7	229	6.15	open-meteo	60	2025-06-16 12:32:27.948781	2025-06-18 18:24:23.457
24	2025-06-27	\N	\N	\N	\N	\N	\N	14	26	0	42.1	215	6.55	open-meteo	31	2025-06-16 09:17:59.462292	2025-06-18 18:24:23.586
40	2025-06-27	\N	\N	\N	\N	\N	\N	14	26	0	42.1	215	6.55	open-meteo	31	2025-06-16 12:32:28.015044	2025-06-18 18:24:23.586
25	2025-06-28	\N	\N	\N	\N	\N	\N	11	24.9	0.3	27.6	235	5.65	open-meteo	80	2025-06-16 09:17:59.462292	2025-06-18 18:24:23.716
41	2025-06-28	\N	\N	\N	\N	\N	\N	11	24.9	0.3	27.6	235	5.65	open-meteo	80	2025-06-16 12:32:28.081093	2025-06-18 18:24:23.716
26	2025-06-29	\N	\N	\N	\N	\N	\N	9.6	19.1	0	29.2	265	5.8	open-meteo	38	2025-06-16 09:17:59.462292	2025-06-18 18:24:23.846
42	2025-06-29	\N	\N	\N	\N	\N	\N	9.6	19.1	0	29.2	265	5.8	open-meteo	38	2025-06-16 12:32:28.148017	2025-06-18 18:24:23.846
27	2025-06-30	\N	\N	\N	\N	\N	\N	9.5	20	0	27.6	264	5.85	open-meteo	35	2025-06-16 09:17:59.462292	2025-06-18 18:24:23.977
28	2025-07-01	\N	\N	\N	\N	\N	\N	11.8	22.7	0	29.5	238	6.3	open-meteo	71	2025-06-16 09:31:12.503567	2025-06-18 18:24:24.107
43	2025-07-02	\N	\N	\N	\N	\N	\N	12.6	25	0	34.8	149	6.2	open-meteo	74	2025-06-17 05:52:25.032257	2025-06-18 18:24:24.238
44	2025-07-03	\N	\N	\N	\N	\N	\N	11.8	18.6	0.3	39.6	249	6	open-meteo	67	2025-06-18 05:16:19.879837	2025-06-18 18:24:24.368
\.


--
-- Data for Name: weather_data_backup_2025-06-18T19-36-52-480Z; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public."weather_data_backup_2025-06-18T19-36-52-480Z" (id, date, temperature, condition, description, wind_speed, humidity, wind_direction, temperature_min, temperature_max, precipitation_sum, wind_speed_max, wind_direction_dominant, uv_index_max, source, cloudcover, created_at, updated_at) FROM stdin;
5	2025-06-10	\N	\N	\N	\N	\N	\N	11.6	14.5	0.6	35.3	311	5.85	Open-Meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
1	2025-01-01	4	cloudy	Grey skies over the North Sea	29	85	W	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
2	2025-01-02	5	rainy	Wet conditions along the causeway	32	86	S	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
3	2025-06-09	14	partly cloudy	Pleasant coastal conditions	18	72	SW	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
4	2025-06-10	15	sunny	Clear skies for crossing	15	68	W	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
8	2025-06-11	\N	\N	\N	\N	\N	\N	10.5	14.2	0	29.7	141	6.3	Open-Meteo	34	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
9	2025-06-12	\N	\N	\N	\N	\N	\N	11.9	13.7	0.2	43	140	5.75	Open-Meteo	76	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
10	2025-06-13	\N	\N	\N	\N	\N	\N	12.3	21	0.9	17.3	186	5.5	Open-Meteo	70	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
11	2025-06-14	\N	\N	\N	\N	\N	\N	11.8	18.3	11.2	14.1	273	4.5	Open-Meteo	79	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
29	2025-06-16	\N	\N	\N	\N	\N	\N	12.1	19.6	0	30.1	245	6.35	open-meteo	84	2025-06-16 12:32:27.268604	2025-06-16 17:15:01.481
7	2025-06-16	\N	\N	\N	\N	\N	\N	12.1	19.6	0	30.1	245	6.35	open-meteo	84	2025-06-16 09:17:59.462292	2025-06-16 17:15:01.481
13	2025-06-16	\N	\N	\N	\N	\N	\N	12.1	19.6	0	30.1	245	6.35	open-meteo	84	2025-06-16 09:17:59.462292	2025-06-16 17:15:01.481
6	2025-06-15	\N	\N	\N	\N	\N	\N	12.8	18	0	34.5	256	6.5	open-meteo	74	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
12	2025-06-15	\N	\N	\N	\N	\N	\N	12.8	18	0	34.5	256	6.5	open-meteo	74	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
30	2025-06-17	\N	\N	\N	\N	\N	\N	13.9	19.4	0	39.4	247	6.7	open-meteo	85	2025-06-16 12:32:27.35228	2025-06-17 17:15:44.678
14	2025-06-17	\N	\N	\N	\N	\N	\N	13.9	19.4	0	39.4	247	6.7	open-meteo	85	2025-06-16 09:17:59.462292	2025-06-17 17:15:44.678
31	2025-06-18	\N	\N	\N	\N	\N	\N	11.7	17	0	24.9	265	5.5	open-meteo	88	2025-06-16 12:32:27.418665	2025-06-18 19:14:04.543
15	2025-06-18	\N	\N	\N	\N	\N	\N	11.7	17	0	24.9	265	5.5	open-meteo	88	2025-06-16 09:17:59.462292	2025-06-18 19:14:04.543
32	2025-06-19	\N	\N	\N	\N	\N	\N	12.4	14.7	0	26.4	134	4.75	open-meteo	63	2025-06-16 12:32:27.484754	2025-06-18 19:14:04.679
16	2025-06-19	\N	\N	\N	\N	\N	\N	12.4	14.7	0	26.4	134	4.75	open-meteo	63	2025-06-16 09:17:59.462292	2025-06-18 19:14:04.679
33	2025-06-20	\N	\N	\N	\N	\N	\N	13.7	22.1	0	23.3	115	6.6	open-meteo	61	2025-06-16 12:32:27.550817	2025-06-18 19:14:04.811
17	2025-06-20	\N	\N	\N	\N	\N	\N	13.7	22.1	0	23.3	115	6.6	open-meteo	61	2025-06-16 09:17:59.462292	2025-06-18 19:14:04.811
18	2025-06-21	\N	\N	\N	\N	\N	\N	13.1	22.4	0	23.9	244	6.75	open-meteo	50	2025-06-16 09:17:59.462292	2025-06-18 19:14:04.943
34	2025-06-21	\N	\N	\N	\N	\N	\N	13.1	22.4	0	23.9	244	6.75	open-meteo	50	2025-06-16 12:32:27.617124	2025-06-18 19:14:04.943
19	2025-06-22	\N	\N	\N	\N	\N	\N	12.4	17.9	0.9	25.6	241	5.75	open-meteo	92	2025-06-16 09:17:59.462292	2025-06-18 19:14:05.077
35	2025-06-22	\N	\N	\N	\N	\N	\N	12.4	17.9	0.9	25.6	241	5.75	open-meteo	92	2025-06-16 12:32:27.683058	2025-06-18 19:14:05.077
20	2025-06-23	\N	\N	\N	\N	\N	\N	10.5	19	0	27.7	271	5.05	open-meteo	58	2025-06-16 09:17:59.462292	2025-06-18 19:14:05.207
36	2025-06-23	\N	\N	\N	\N	\N	\N	10.5	19	0	27.7	271	5.05	open-meteo	58	2025-06-16 12:32:27.74903	2025-06-18 19:14:05.207
21	2025-06-24	\N	\N	\N	\N	\N	\N	13.1	18	2.7	19.1	271	4.95	open-meteo	95	2025-06-16 09:17:59.462292	2025-06-18 19:14:05.338
37	2025-06-24	\N	\N	\N	\N	\N	\N	13.1	18	2.7	19.1	271	4.95	open-meteo	95	2025-06-16 12:32:27.816064	2025-06-18 19:14:05.338
22	2025-06-25	\N	\N	\N	\N	\N	\N	13	20	0.2	28.7	232	6.2	open-meteo	86	2025-06-16 09:17:59.462292	2025-06-18 19:14:05.469
38	2025-06-25	\N	\N	\N	\N	\N	\N	13	20	0.2	28.7	232	6.2	open-meteo	86	2025-06-16 12:32:27.882248	2025-06-18 19:14:05.469
23	2025-06-26	\N	\N	\N	\N	\N	\N	14.5	22.5	0.4	32.7	229	6.15	open-meteo	60	2025-06-16 09:17:59.462292	2025-06-18 19:14:05.601
39	2025-06-26	\N	\N	\N	\N	\N	\N	14.5	22.5	0.4	32.7	229	6.15	open-meteo	60	2025-06-16 12:32:27.948781	2025-06-18 19:14:05.601
24	2025-06-27	\N	\N	\N	\N	\N	\N	14	26	0	42.1	215	6.55	open-meteo	31	2025-06-16 09:17:59.462292	2025-06-18 19:14:05.731
40	2025-06-27	\N	\N	\N	\N	\N	\N	14	26	0	42.1	215	6.55	open-meteo	31	2025-06-16 12:32:28.015044	2025-06-18 19:14:05.731
25	2025-06-28	\N	\N	\N	\N	\N	\N	11	24.9	0.3	27.6	235	5.65	open-meteo	80	2025-06-16 09:17:59.462292	2025-06-18 19:14:05.865
41	2025-06-28	\N	\N	\N	\N	\N	\N	11	24.9	0.3	27.6	235	5.65	open-meteo	80	2025-06-16 12:32:28.081093	2025-06-18 19:14:05.865
26	2025-06-29	\N	\N	\N	\N	\N	\N	9.6	19.1	0	29.2	265	5.8	open-meteo	38	2025-06-16 09:17:59.462292	2025-06-18 19:14:05.994
42	2025-06-29	\N	\N	\N	\N	\N	\N	9.6	19.1	0	29.2	265	5.8	open-meteo	38	2025-06-16 12:32:28.148017	2025-06-18 19:14:05.994
27	2025-06-30	\N	\N	\N	\N	\N	\N	9.5	20	0	27.6	264	5.85	open-meteo	35	2025-06-16 09:17:59.462292	2025-06-18 19:14:06.125
28	2025-07-01	\N	\N	\N	\N	\N	\N	11.8	22.7	0	29.5	238	6.3	open-meteo	71	2025-06-16 09:31:12.503567	2025-06-18 19:14:06.255
43	2025-07-02	\N	\N	\N	\N	\N	\N	12.6	25	0	34.8	149	6.2	open-meteo	74	2025-06-17 05:52:25.032257	2025-06-18 19:14:06.385
44	2025-07-03	\N	\N	\N	\N	\N	\N	11.8	18.6	0.3	39.6	249	6	open-meteo	67	2025-06-18 05:16:19.879837	2025-06-18 19:14:06.519
\.


--
-- Data for Name: weather_data_backup_2025-06-18T19-44-03-926Z; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public."weather_data_backup_2025-06-18T19-44-03-926Z" (id, date, temperature, condition, description, wind_speed, humidity, wind_direction, temperature_min, temperature_max, precipitation_sum, wind_speed_max, wind_direction_dominant, uv_index_max, source, cloudcover, created_at, updated_at) FROM stdin;
5	2025-06-10	\N	\N	\N	\N	\N	\N	11.6	14.5	0.6	35.3	311	5.85	Open-Meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
1	2025-01-01	4	cloudy	Grey skies over the North Sea	29	85	W	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
2	2025-01-02	5	rainy	Wet conditions along the causeway	32	86	S	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
3	2025-06-09	14	partly cloudy	Pleasant coastal conditions	18	72	SW	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
4	2025-06-10	15	sunny	Clear skies for crossing	15	68	W	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
8	2025-06-11	\N	\N	\N	\N	\N	\N	10.5	14.2	0	29.7	141	6.3	Open-Meteo	34	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
9	2025-06-12	\N	\N	\N	\N	\N	\N	11.9	13.7	0.2	43	140	5.75	Open-Meteo	76	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
10	2025-06-13	\N	\N	\N	\N	\N	\N	12.3	21	0.9	17.3	186	5.5	Open-Meteo	70	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
11	2025-06-14	\N	\N	\N	\N	\N	\N	11.8	18.3	11.2	14.1	273	4.5	Open-Meteo	79	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
29	2025-06-16	\N	\N	\N	\N	\N	\N	12.1	19.6	0	30.1	245	6.35	open-meteo	84	2025-06-16 12:32:27.268604	2025-06-16 17:15:01.481
7	2025-06-16	\N	\N	\N	\N	\N	\N	12.1	19.6	0	30.1	245	6.35	open-meteo	84	2025-06-16 09:17:59.462292	2025-06-16 17:15:01.481
13	2025-06-16	\N	\N	\N	\N	\N	\N	12.1	19.6	0	30.1	245	6.35	open-meteo	84	2025-06-16 09:17:59.462292	2025-06-16 17:15:01.481
31	2025-06-18	\N	\N	\N	\N	\N	\N	11.7	17	0	24.9	266	5.5	open-meteo	88	2025-06-16 12:32:27.418665	2025-06-18 19:36:52.727
15	2025-06-18	\N	\N	\N	\N	\N	\N	11.7	17	0	24.9	266	5.5	open-meteo	88	2025-06-16 09:17:59.462292	2025-06-18 19:36:52.727
6	2025-06-15	\N	\N	\N	\N	\N	\N	12.8	18	0	34.5	256	6.5	open-meteo	74	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
12	2025-06-15	\N	\N	\N	\N	\N	\N	12.8	18	0	34.5	256	6.5	open-meteo	74	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
32	2025-06-19	\N	\N	\N	\N	\N	\N	12	14.4	0	27.1	136	4.75	open-meteo	52	2025-06-16 12:32:27.484754	2025-06-18 19:36:52.861
16	2025-06-19	\N	\N	\N	\N	\N	\N	12	14.4	0	27.1	136	4.75	open-meteo	52	2025-06-16 09:17:59.462292	2025-06-18 19:36:52.861
33	2025-06-20	\N	\N	\N	\N	\N	\N	13.3	20.7	0	22.5	125	6.6	open-meteo	60	2025-06-16 12:32:27.550817	2025-06-18 19:36:52.991
17	2025-06-20	\N	\N	\N	\N	\N	\N	13.3	20.7	0	22.5	125	6.6	open-meteo	60	2025-06-16 09:17:59.462292	2025-06-18 19:36:52.991
18	2025-06-21	\N	\N	\N	\N	\N	\N	13.1	22.4	0	23.9	244	6.75	open-meteo	50	2025-06-16 09:17:59.462292	2025-06-18 19:36:53.125
34	2025-06-21	\N	\N	\N	\N	\N	\N	13.1	22.4	0	23.9	244	6.75	open-meteo	50	2025-06-16 12:32:27.617124	2025-06-18 19:36:53.125
30	2025-06-17	\N	\N	\N	\N	\N	\N	13.9	19.4	0	39.4	247	6.7	open-meteo	85	2025-06-16 12:32:27.35228	2025-06-17 17:15:44.678
14	2025-06-17	\N	\N	\N	\N	\N	\N	13.9	19.4	0	39.4	247	6.7	open-meteo	85	2025-06-16 09:17:59.462292	2025-06-17 17:15:44.678
19	2025-06-22	\N	\N	\N	\N	\N	\N	12.4	17.9	0.9	25.6	241	5.75	open-meteo	92	2025-06-16 09:17:59.462292	2025-06-18 19:36:53.255
35	2025-06-22	\N	\N	\N	\N	\N	\N	12.4	17.9	0.9	25.6	241	5.75	open-meteo	92	2025-06-16 12:32:27.683058	2025-06-18 19:36:53.255
20	2025-06-23	\N	\N	\N	\N	\N	\N	10.5	19	0	27.7	271	5.05	open-meteo	58	2025-06-16 09:17:59.462292	2025-06-18 19:36:53.386
36	2025-06-23	\N	\N	\N	\N	\N	\N	10.5	19	0	27.7	271	5.05	open-meteo	58	2025-06-16 12:32:27.74903	2025-06-18 19:36:53.386
21	2025-06-24	\N	\N	\N	\N	\N	\N	13.1	18	2.7	19.1	271	4.95	open-meteo	95	2025-06-16 09:17:59.462292	2025-06-18 19:36:53.518
37	2025-06-24	\N	\N	\N	\N	\N	\N	13.1	18	2.7	19.1	271	4.95	open-meteo	95	2025-06-16 12:32:27.816064	2025-06-18 19:36:53.518
22	2025-06-25	\N	\N	\N	\N	\N	\N	13	20	0.2	28.7	232	6.2	open-meteo	86	2025-06-16 09:17:59.462292	2025-06-18 19:36:53.655
38	2025-06-25	\N	\N	\N	\N	\N	\N	13	20	0.2	28.7	232	6.2	open-meteo	86	2025-06-16 12:32:27.882248	2025-06-18 19:36:53.655
23	2025-06-26	\N	\N	\N	\N	\N	\N	14.5	22.5	0.4	32.7	229	6.15	open-meteo	60	2025-06-16 09:17:59.462292	2025-06-18 19:36:53.786
39	2025-06-26	\N	\N	\N	\N	\N	\N	14.5	22.5	0.4	32.7	229	6.15	open-meteo	60	2025-06-16 12:32:27.948781	2025-06-18 19:36:53.786
24	2025-06-27	\N	\N	\N	\N	\N	\N	14	26	0	42.1	215	6.55	open-meteo	31	2025-06-16 09:17:59.462292	2025-06-18 19:36:53.917
40	2025-06-27	\N	\N	\N	\N	\N	\N	14	26	0	42.1	215	6.55	open-meteo	31	2025-06-16 12:32:28.015044	2025-06-18 19:36:53.917
25	2025-06-28	\N	\N	\N	\N	\N	\N	11	24.9	0.3	27.6	235	5.65	open-meteo	80	2025-06-16 09:17:59.462292	2025-06-18 19:36:54.048
41	2025-06-28	\N	\N	\N	\N	\N	\N	11	24.9	0.3	27.6	235	5.65	open-meteo	80	2025-06-16 12:32:28.081093	2025-06-18 19:36:54.048
26	2025-06-29	\N	\N	\N	\N	\N	\N	9.6	19.1	0	29.2	265	5.8	open-meteo	38	2025-06-16 09:17:59.462292	2025-06-18 19:36:54.179
42	2025-06-29	\N	\N	\N	\N	\N	\N	9.6	19.1	0	29.2	265	5.8	open-meteo	38	2025-06-16 12:32:28.148017	2025-06-18 19:36:54.179
27	2025-06-30	\N	\N	\N	\N	\N	\N	9.5	20	0	27.6	264	5.85	open-meteo	35	2025-06-16 09:17:59.462292	2025-06-18 19:36:54.311
28	2025-07-01	\N	\N	\N	\N	\N	\N	11.8	22.7	0	29.5	238	6.3	open-meteo	71	2025-06-16 09:31:12.503567	2025-06-18 19:36:54.441
43	2025-07-02	\N	\N	\N	\N	\N	\N	12.6	25	0	34.8	149	6.2	open-meteo	74	2025-06-17 05:52:25.032257	2025-06-18 19:36:54.571
44	2025-07-03	\N	\N	\N	\N	\N	\N	11.8	18.6	0.3	39.6	249	6	open-meteo	67	2025-06-18 05:16:19.879837	2025-06-18 19:36:54.701
\.


--
-- Data for Name: weather_data_backup_2025-06-18T22-18-47-673Z; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public."weather_data_backup_2025-06-18T22-18-47-673Z" (id, date, temperature, condition, description, wind_speed, humidity, wind_direction, temperature_min, temperature_max, precipitation_sum, wind_speed_max, wind_direction_dominant, uv_index_max, source, cloudcover, created_at, updated_at) FROM stdin;
5	2025-06-10	\N	\N	\N	\N	\N	\N	11.6	14.5	0.6	35.3	311	5.85	Open-Meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
1	2025-01-01	4	cloudy	Grey skies over the North Sea	29	85	W	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
2	2025-01-02	5	rainy	Wet conditions along the causeway	32	86	S	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
3	2025-06-09	14	partly cloudy	Pleasant coastal conditions	18	72	SW	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
4	2025-06-10	15	sunny	Clear skies for crossing	15	68	W	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
8	2025-06-11	\N	\N	\N	\N	\N	\N	10.5	14.2	0	29.7	141	6.3	Open-Meteo	34	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
9	2025-06-12	\N	\N	\N	\N	\N	\N	11.9	13.7	0.2	43	140	5.75	Open-Meteo	76	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
10	2025-06-13	\N	\N	\N	\N	\N	\N	12.3	21	0.9	17.3	186	5.5	Open-Meteo	70	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
11	2025-06-14	\N	\N	\N	\N	\N	\N	11.8	18.3	11.2	14.1	273	4.5	Open-Meteo	79	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
29	2025-06-16	\N	\N	\N	\N	\N	\N	12.1	19.6	0	30.1	245	6.35	open-meteo	84	2025-06-16 12:32:27.268604	2025-06-16 17:15:01.481
7	2025-06-16	\N	\N	\N	\N	\N	\N	12.1	19.6	0	30.1	245	6.35	open-meteo	84	2025-06-16 09:17:59.462292	2025-06-16 17:15:01.481
13	2025-06-16	\N	\N	\N	\N	\N	\N	12.1	19.6	0	30.1	245	6.35	open-meteo	84	2025-06-16 09:17:59.462292	2025-06-16 17:15:01.481
6	2025-06-15	\N	\N	\N	\N	\N	\N	12.8	18	0	34.5	256	6.5	open-meteo	74	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
12	2025-06-15	\N	\N	\N	\N	\N	\N	12.8	18	0	34.5	256	6.5	open-meteo	74	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
30	2025-06-17	\N	\N	\N	\N	\N	\N	13.9	19.4	0	39.4	247	6.7	open-meteo	85	2025-06-16 12:32:27.35228	2025-06-17 17:15:44.678
14	2025-06-17	\N	\N	\N	\N	\N	\N	13.9	19.4	0	39.4	247	6.7	open-meteo	85	2025-06-16 09:17:59.462292	2025-06-17 17:15:44.678
31	2025-06-18	\N	\N	\N	\N	\N	\N	11.7	17	0	24.9	266	5.5	open-meteo	88	2025-06-16 12:32:27.418665	2025-06-18 19:44:04.172
15	2025-06-18	\N	\N	\N	\N	\N	\N	11.7	17	0	24.9	266	5.5	open-meteo	88	2025-06-16 09:17:59.462292	2025-06-18 19:44:04.172
32	2025-06-19	\N	\N	\N	\N	\N	\N	12	14.4	0	27.1	136	4.75	open-meteo	52	2025-06-16 12:32:27.484754	2025-06-18 19:44:04.304
16	2025-06-19	\N	\N	\N	\N	\N	\N	12	14.4	0	27.1	136	4.75	open-meteo	52	2025-06-16 09:17:59.462292	2025-06-18 19:44:04.304
33	2025-06-20	\N	\N	\N	\N	\N	\N	13.3	20.7	0	22.5	125	6.6	open-meteo	60	2025-06-16 12:32:27.550817	2025-06-18 19:44:04.433
17	2025-06-20	\N	\N	\N	\N	\N	\N	13.3	20.7	0	22.5	125	6.6	open-meteo	60	2025-06-16 09:17:59.462292	2025-06-18 19:44:04.433
18	2025-06-21	\N	\N	\N	\N	\N	\N	13.1	22.4	0	23.9	244	6.75	open-meteo	50	2025-06-16 09:17:59.462292	2025-06-18 19:44:04.562
34	2025-06-21	\N	\N	\N	\N	\N	\N	13.1	22.4	0	23.9	244	6.75	open-meteo	50	2025-06-16 12:32:27.617124	2025-06-18 19:44:04.562
19	2025-06-22	\N	\N	\N	\N	\N	\N	12.4	17.9	0.9	25.6	241	5.75	open-meteo	92	2025-06-16 09:17:59.462292	2025-06-18 19:44:04.708
35	2025-06-22	\N	\N	\N	\N	\N	\N	12.4	17.9	0.9	25.6	241	5.75	open-meteo	92	2025-06-16 12:32:27.683058	2025-06-18 19:44:04.708
20	2025-06-23	\N	\N	\N	\N	\N	\N	10.5	19	0	27.7	271	5.05	open-meteo	58	2025-06-16 09:17:59.462292	2025-06-18 19:44:04.855
36	2025-06-23	\N	\N	\N	\N	\N	\N	10.5	19	0	27.7	271	5.05	open-meteo	58	2025-06-16 12:32:27.74903	2025-06-18 19:44:04.855
21	2025-06-24	\N	\N	\N	\N	\N	\N	13.1	18	2.7	19.1	271	4.95	open-meteo	95	2025-06-16 09:17:59.462292	2025-06-18 19:44:04.982
37	2025-06-24	\N	\N	\N	\N	\N	\N	13.1	18	2.7	19.1	271	4.95	open-meteo	95	2025-06-16 12:32:27.816064	2025-06-18 19:44:04.982
22	2025-06-25	\N	\N	\N	\N	\N	\N	13	20	0.2	28.7	232	6.2	open-meteo	86	2025-06-16 09:17:59.462292	2025-06-18 19:44:05.112
38	2025-06-25	\N	\N	\N	\N	\N	\N	13	20	0.2	28.7	232	6.2	open-meteo	86	2025-06-16 12:32:27.882248	2025-06-18 19:44:05.112
23	2025-06-26	\N	\N	\N	\N	\N	\N	14.5	22.5	0.4	32.7	229	6.15	open-meteo	60	2025-06-16 09:17:59.462292	2025-06-18 19:44:05.239
39	2025-06-26	\N	\N	\N	\N	\N	\N	14.5	22.5	0.4	32.7	229	6.15	open-meteo	60	2025-06-16 12:32:27.948781	2025-06-18 19:44:05.239
24	2025-06-27	\N	\N	\N	\N	\N	\N	14	26	0	42.1	215	6.55	open-meteo	31	2025-06-16 09:17:59.462292	2025-06-18 19:44:05.366
40	2025-06-27	\N	\N	\N	\N	\N	\N	14	26	0	42.1	215	6.55	open-meteo	31	2025-06-16 12:32:28.015044	2025-06-18 19:44:05.366
25	2025-06-28	\N	\N	\N	\N	\N	\N	11	24.9	0.3	27.6	235	5.65	open-meteo	80	2025-06-16 09:17:59.462292	2025-06-18 19:44:05.494
41	2025-06-28	\N	\N	\N	\N	\N	\N	11	24.9	0.3	27.6	235	5.65	open-meteo	80	2025-06-16 12:32:28.081093	2025-06-18 19:44:05.494
26	2025-06-29	\N	\N	\N	\N	\N	\N	9.6	19.1	0	29.2	265	5.8	open-meteo	38	2025-06-16 09:17:59.462292	2025-06-18 19:44:05.623
42	2025-06-29	\N	\N	\N	\N	\N	\N	9.6	19.1	0	29.2	265	5.8	open-meteo	38	2025-06-16 12:32:28.148017	2025-06-18 19:44:05.623
27	2025-06-30	\N	\N	\N	\N	\N	\N	9.5	20	0	27.6	264	5.85	open-meteo	35	2025-06-16 09:17:59.462292	2025-06-18 19:44:05.751
28	2025-07-01	\N	\N	\N	\N	\N	\N	11.8	22.7	0	29.5	238	6.3	open-meteo	71	2025-06-16 09:31:12.503567	2025-06-18 19:44:05.878
43	2025-07-02	\N	\N	\N	\N	\N	\N	12.6	25	0	34.8	149	6.2	open-meteo	74	2025-06-17 05:52:25.032257	2025-06-18 19:44:06.007
44	2025-07-03	\N	\N	\N	\N	\N	\N	11.8	18.6	0.3	39.6	249	6	open-meteo	67	2025-06-18 05:16:19.879837	2025-06-18 19:44:06.14
\.


--
-- Data for Name: weather_data_backup_2025-06-18T23-03-29-447Z; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public."weather_data_backup_2025-06-18T23-03-29-447Z" (id, date, temperature, condition, description, wind_speed, humidity, wind_direction, temperature_min, temperature_max, precipitation_sum, wind_speed_max, wind_direction_dominant, uv_index_max, source, cloudcover, created_at, updated_at) FROM stdin;
5	2025-06-10	\N	\N	\N	\N	\N	\N	11.6	14.5	0.6	35.3	311	5.85	Open-Meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
1	2025-01-01	4	cloudy	Grey skies over the North Sea	29	85	W	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
2	2025-01-02	5	rainy	Wet conditions along the causeway	32	86	S	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
3	2025-06-09	14	partly cloudy	Pleasant coastal conditions	18	72	SW	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
4	2025-06-10	15	sunny	Clear skies for crossing	15	68	W	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
8	2025-06-11	\N	\N	\N	\N	\N	\N	10.5	14.2	0	29.7	141	6.3	Open-Meteo	34	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
9	2025-06-12	\N	\N	\N	\N	\N	\N	11.9	13.7	0.2	43	140	5.75	Open-Meteo	76	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
10	2025-06-13	\N	\N	\N	\N	\N	\N	12.3	21	0.9	17.3	186	5.5	Open-Meteo	70	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
11	2025-06-14	\N	\N	\N	\N	\N	\N	11.8	18.3	11.2	14.1	273	4.5	Open-Meteo	79	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
29	2025-06-16	\N	\N	\N	\N	\N	\N	12.1	19.6	0	30.1	245	6.35	open-meteo	84	2025-06-16 12:32:27.268604	2025-06-16 17:15:01.481
7	2025-06-16	\N	\N	\N	\N	\N	\N	12.1	19.6	0	30.1	245	6.35	open-meteo	84	2025-06-16 09:17:59.462292	2025-06-16 17:15:01.481
13	2025-06-16	\N	\N	\N	\N	\N	\N	12.1	19.6	0	30.1	245	6.35	open-meteo	84	2025-06-16 09:17:59.462292	2025-06-16 17:15:01.481
31	2025-06-18	\N	\N	\N	\N	\N	\N	11.7	17	0	24.9	266	5.5	open-meteo	88	2025-06-16 12:32:27.418665	2025-06-18 22:18:47.941
15	2025-06-18	\N	\N	\N	\N	\N	\N	11.7	17	0	24.9	266	5.5	open-meteo	88	2025-06-16 09:17:59.462292	2025-06-18 22:18:47.941
6	2025-06-15	\N	\N	\N	\N	\N	\N	12.8	18	0	34.5	256	6.5	open-meteo	74	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
12	2025-06-15	\N	\N	\N	\N	\N	\N	12.8	18	0	34.5	256	6.5	open-meteo	74	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
32	2025-06-19	\N	\N	\N	\N	\N	\N	12	14.4	0	27.1	136	5.95	open-meteo	52	2025-06-16 12:32:27.484754	2025-06-18 22:18:48.072
16	2025-06-19	\N	\N	\N	\N	\N	\N	12	14.4	0	27.1	136	5.95	open-meteo	52	2025-06-16 09:17:59.462292	2025-06-18 22:18:48.072
33	2025-06-20	\N	\N	\N	\N	\N	\N	13.3	19.3	0	22.5	127	6.35	open-meteo	64	2025-06-16 12:32:27.550817	2025-06-18 22:18:48.202
17	2025-06-20	\N	\N	\N	\N	\N	\N	13.3	19.3	0	22.5	127	6.35	open-meteo	64	2025-06-16 09:17:59.462292	2025-06-18 22:18:48.202
18	2025-06-21	\N	\N	\N	\N	\N	\N	13.4	23.7	0	26.2	157	6.7	open-meteo	50	2025-06-16 09:17:59.462292	2025-06-18 22:18:48.332
34	2025-06-21	\N	\N	\N	\N	\N	\N	13.4	23.7	0	26.2	157	6.7	open-meteo	50	2025-06-16 12:32:27.617124	2025-06-18 22:18:48.332
30	2025-06-17	\N	\N	\N	\N	\N	\N	13.9	19.4	0	39.4	247	6.7	open-meteo	85	2025-06-16 12:32:27.35228	2025-06-17 17:15:44.678
14	2025-06-17	\N	\N	\N	\N	\N	\N	13.9	19.4	0	39.4	247	6.7	open-meteo	85	2025-06-16 09:17:59.462292	2025-06-17 17:15:44.678
19	2025-06-22	\N	\N	\N	\N	\N	\N	12.8	18.4	2.1	31.5	234	6.45	open-meteo	82	2025-06-16 09:17:59.462292	2025-06-18 22:18:48.462
35	2025-06-22	\N	\N	\N	\N	\N	\N	12.8	18.4	2.1	31.5	234	6.45	open-meteo	82	2025-06-16 12:32:27.683058	2025-06-18 22:18:48.462
20	2025-06-23	\N	\N	\N	\N	\N	\N	10.7	17.3	0.3	36.2	267	6	open-meteo	59	2025-06-16 09:17:59.462292	2025-06-18 22:18:48.592
36	2025-06-23	\N	\N	\N	\N	\N	\N	10.7	17.3	0.3	36.2	267	6	open-meteo	59	2025-06-16 12:32:27.74903	2025-06-18 22:18:48.592
21	2025-06-24	\N	\N	\N	\N	\N	\N	13.1	18	2.7	19.1	271	5.65	open-meteo	95	2025-06-16 09:17:59.462292	2025-06-18 22:18:48.72
37	2025-06-24	\N	\N	\N	\N	\N	\N	13.1	18	2.7	19.1	271	5.65	open-meteo	95	2025-06-16 12:32:27.816064	2025-06-18 22:18:48.72
22	2025-06-25	\N	\N	\N	\N	\N	\N	13	20	0.2	28.7	232	4.55	open-meteo	86	2025-06-16 09:17:59.462292	2025-06-18 22:18:48.848
38	2025-06-25	\N	\N	\N	\N	\N	\N	13	20	0.2	28.7	232	4.55	open-meteo	86	2025-06-16 12:32:27.882248	2025-06-18 22:18:48.848
23	2025-06-26	\N	\N	\N	\N	\N	\N	14.9	22.8	2.5	28	208	5.05	open-meteo	83	2025-06-16 09:17:59.462292	2025-06-18 22:18:48.976
39	2025-06-26	\N	\N	\N	\N	\N	\N	14.9	22.8	2.5	28	208	5.05	open-meteo	83	2025-06-16 12:32:27.948781	2025-06-18 22:18:48.976
24	2025-06-27	\N	\N	\N	\N	\N	\N	14.1	18.8	0	34.9	216	1.95	open-meteo	94	2025-06-16 09:17:59.462292	2025-06-18 22:18:49.105
40	2025-06-27	\N	\N	\N	\N	\N	\N	14.1	18.8	0	34.9	216	1.95	open-meteo	94	2025-06-16 12:32:28.015044	2025-06-18 22:18:49.105
25	2025-06-28	\N	\N	\N	\N	\N	\N	10.9	18.9	0	27.4	247	5.2	open-meteo	70	2025-06-16 09:17:59.462292	2025-06-18 22:18:49.236
41	2025-06-28	\N	\N	\N	\N	\N	\N	10.9	18.9	0	27.4	247	5.2	open-meteo	70	2025-06-16 12:32:28.081093	2025-06-18 22:18:49.236
26	2025-06-29	\N	\N	\N	\N	\N	\N	10.5	19.2	0	29.5	253	5.8	open-meteo	61	2025-06-16 09:17:59.462292	2025-06-18 22:18:49.364
42	2025-06-29	\N	\N	\N	\N	\N	\N	10.5	19.2	0	29.5	253	5.8	open-meteo	61	2025-06-16 12:32:28.148017	2025-06-18 22:18:49.364
27	2025-06-30	\N	\N	\N	\N	\N	\N	8.4	19.3	0	32.4	251	6.05	open-meteo	17	2025-06-16 09:17:59.462292	2025-06-18 22:18:49.493
28	2025-07-01	\N	\N	\N	\N	\N	\N	7.9	20.8	0	22.5	244	5.15	open-meteo	85	2025-06-16 09:31:12.503567	2025-06-18 22:18:49.622
43	2025-07-02	\N	\N	\N	\N	\N	\N	12	19.2	0	34.9	229	5.6	open-meteo	92	2025-06-17 05:52:25.032257	2025-06-18 22:18:49.751
44	2025-07-03	\N	\N	\N	\N	\N	\N	10.6	16.5	0.6	35.4	266	3.05	open-meteo	52	2025-06-18 05:16:19.879837	2025-06-18 22:18:49.879
\.


--
-- Data for Name: weather_data_backup_2025-06-18T23-06-26-245Z; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public."weather_data_backup_2025-06-18T23-06-26-245Z" (id, date, temperature, condition, description, wind_speed, humidity, wind_direction, temperature_min, temperature_max, precipitation_sum, wind_speed_max, wind_direction_dominant, uv_index_max, source, cloudcover, created_at, updated_at) FROM stdin;
5	2025-06-10	\N	\N	\N	\N	\N	\N	11.6	14.5	0.6	35.3	311	5.85	Open-Meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
1	2025-01-01	4	cloudy	Grey skies over the North Sea	29	85	W	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
2	2025-01-02	5	rainy	Wet conditions along the causeway	32	86	S	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
3	2025-06-09	14	partly cloudy	Pleasant coastal conditions	18	72	SW	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
4	2025-06-10	15	sunny	Clear skies for crossing	15	68	W	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
8	2025-06-11	\N	\N	\N	\N	\N	\N	10.5	14.2	0	29.7	141	6.3	Open-Meteo	34	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
9	2025-06-12	\N	\N	\N	\N	\N	\N	11.9	13.7	0.2	43	140	5.75	Open-Meteo	76	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
10	2025-06-13	\N	\N	\N	\N	\N	\N	12.3	21	0.9	17.3	186	5.5	Open-Meteo	70	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
11	2025-06-14	\N	\N	\N	\N	\N	\N	11.8	18.3	11.2	14.1	273	4.5	Open-Meteo	79	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
29	2025-06-16	\N	\N	\N	\N	\N	\N	12.1	19.6	0	30.1	245	6.35	open-meteo	84	2025-06-16 12:32:27.268604	2025-06-16 17:15:01.481
7	2025-06-16	\N	\N	\N	\N	\N	\N	12.1	19.6	0	30.1	245	6.35	open-meteo	84	2025-06-16 09:17:59.462292	2025-06-16 17:15:01.481
13	2025-06-16	\N	\N	\N	\N	\N	\N	12.1	19.6	0	30.1	245	6.35	open-meteo	84	2025-06-16 09:17:59.462292	2025-06-16 17:15:01.481
31	2025-06-18	\N	\N	\N	\N	\N	\N	11.7	17	0	24.9	266	5.5	open-meteo	88	2025-06-16 12:32:27.418665	2025-06-18 22:18:47.941
15	2025-06-18	\N	\N	\N	\N	\N	\N	11.7	17	0	24.9	266	5.5	open-meteo	88	2025-06-16 09:17:59.462292	2025-06-18 22:18:47.941
6	2025-06-15	\N	\N	\N	\N	\N	\N	12.8	18	0	34.5	256	6.5	open-meteo	74	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
12	2025-06-15	\N	\N	\N	\N	\N	\N	12.8	18	0	34.5	256	6.5	open-meteo	74	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
30	2025-06-17	\N	\N	\N	\N	\N	\N	13.9	19.4	0	39.4	247	6.7	open-meteo	85	2025-06-16 12:32:27.35228	2025-06-17 17:15:44.678
14	2025-06-17	\N	\N	\N	\N	\N	\N	13.9	19.4	0	39.4	247	6.7	open-meteo	85	2025-06-16 09:17:59.462292	2025-06-17 17:15:44.678
32	2025-06-19	\N	\N	\N	\N	\N	\N	12.2	14.8	0	29	139	5.95	open-meteo	64	2025-06-16 12:32:27.484754	2025-06-18 23:03:29.703
16	2025-06-19	\N	\N	\N	\N	\N	\N	12.2	14.8	0	29	139	5.95	open-meteo	64	2025-06-16 09:17:59.462292	2025-06-18 23:03:29.703
33	2025-06-20	\N	\N	\N	\N	\N	\N	13.4	18.4	0	23.3	133	6.35	open-meteo	70	2025-06-16 12:32:27.550817	2025-06-18 23:03:29.837
17	2025-06-20	\N	\N	\N	\N	\N	\N	13.4	18.4	0	23.3	133	6.35	open-meteo	70	2025-06-16 09:17:59.462292	2025-06-18 23:03:29.837
18	2025-06-21	\N	\N	\N	\N	\N	\N	13.4	23.7	0	26.2	157	6.7	open-meteo	50	2025-06-16 09:17:59.462292	2025-06-18 23:03:29.971
34	2025-06-21	\N	\N	\N	\N	\N	\N	13.4	23.7	0	26.2	157	6.7	open-meteo	50	2025-06-16 12:32:27.617124	2025-06-18 23:03:29.971
19	2025-06-22	\N	\N	\N	\N	\N	\N	12.8	18.4	2.1	31.5	234	6.45	open-meteo	82	2025-06-16 09:17:59.462292	2025-06-18 23:03:30.103
35	2025-06-22	\N	\N	\N	\N	\N	\N	12.8	18.4	2.1	31.5	234	6.45	open-meteo	82	2025-06-16 12:32:27.683058	2025-06-18 23:03:30.103
20	2025-06-23	\N	\N	\N	\N	\N	\N	10.7	17.3	0.3	36.2	267	6	open-meteo	59	2025-06-16 09:17:59.462292	2025-06-18 23:03:30.237
36	2025-06-23	\N	\N	\N	\N	\N	\N	10.7	17.3	0.3	36.2	267	6	open-meteo	59	2025-06-16 12:32:27.74903	2025-06-18 23:03:30.237
21	2025-06-24	\N	\N	\N	\N	\N	\N	13.1	18	2.7	19.1	271	5.65	open-meteo	95	2025-06-16 09:17:59.462292	2025-06-18 23:03:30.366
37	2025-06-24	\N	\N	\N	\N	\N	\N	13.1	18	2.7	19.1	271	5.65	open-meteo	95	2025-06-16 12:32:27.816064	2025-06-18 23:03:30.366
22	2025-06-25	\N	\N	\N	\N	\N	\N	13	20	0.2	28.7	232	4.55	open-meteo	86	2025-06-16 09:17:59.462292	2025-06-18 23:03:30.497
38	2025-06-25	\N	\N	\N	\N	\N	\N	13	20	0.2	28.7	232	4.55	open-meteo	86	2025-06-16 12:32:27.882248	2025-06-18 23:03:30.497
23	2025-06-26	\N	\N	\N	\N	\N	\N	14.9	22.8	2.5	28	208	5.05	open-meteo	83	2025-06-16 09:17:59.462292	2025-06-18 23:03:30.629
39	2025-06-26	\N	\N	\N	\N	\N	\N	14.9	22.8	2.5	28	208	5.05	open-meteo	83	2025-06-16 12:32:27.948781	2025-06-18 23:03:30.629
24	2025-06-27	\N	\N	\N	\N	\N	\N	14.1	18.8	0	34.9	216	1.95	open-meteo	94	2025-06-16 09:17:59.462292	2025-06-18 23:03:30.76
40	2025-06-27	\N	\N	\N	\N	\N	\N	14.1	18.8	0	34.9	216	1.95	open-meteo	94	2025-06-16 12:32:28.015044	2025-06-18 23:03:30.76
25	2025-06-28	\N	\N	\N	\N	\N	\N	10.9	18.9	0	27.4	247	5.2	open-meteo	70	2025-06-16 09:17:59.462292	2025-06-18 23:03:30.891
41	2025-06-28	\N	\N	\N	\N	\N	\N	10.9	18.9	0	27.4	247	5.2	open-meteo	70	2025-06-16 12:32:28.081093	2025-06-18 23:03:30.891
26	2025-06-29	\N	\N	\N	\N	\N	\N	10.5	19.2	0	29.5	253	5.8	open-meteo	61	2025-06-16 09:17:59.462292	2025-06-18 23:03:31.022
42	2025-06-29	\N	\N	\N	\N	\N	\N	10.5	19.2	0	29.5	253	5.8	open-meteo	61	2025-06-16 12:32:28.148017	2025-06-18 23:03:31.022
27	2025-06-30	\N	\N	\N	\N	\N	\N	8.4	19.3	0	32.4	251	6.05	open-meteo	17	2025-06-16 09:17:59.462292	2025-06-18 23:03:31.154
28	2025-07-01	\N	\N	\N	\N	\N	\N	7.9	20.8	0	22.5	244	5.15	open-meteo	85	2025-06-16 09:31:12.503567	2025-06-18 23:03:31.284
43	2025-07-02	\N	\N	\N	\N	\N	\N	12	19.2	0	34.9	229	5.6	open-meteo	92	2025-06-17 05:52:25.032257	2025-06-18 23:03:31.419
44	2025-07-03	\N	\N	\N	\N	\N	\N	10.6	16.5	0.6	35.4	266	3.05	open-meteo	52	2025-06-18 05:16:19.879837	2025-06-18 23:03:31.558
\.


--
-- Data for Name: weather_data_backup_2025-06-18T23-15-39-214Z; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public."weather_data_backup_2025-06-18T23-15-39-214Z" (id, date, temperature, condition, description, wind_speed, humidity, wind_direction, temperature_min, temperature_max, precipitation_sum, wind_speed_max, wind_direction_dominant, uv_index_max, source, cloudcover, created_at, updated_at) FROM stdin;
5	2025-06-10	\N	\N	\N	\N	\N	\N	11.6	14.5	0.6	35.3	311	5.85	Open-Meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
1	2025-01-01	4	cloudy	Grey skies over the North Sea	29	85	W	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
2	2025-01-02	5	rainy	Wet conditions along the causeway	32	86	S	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
3	2025-06-09	14	partly cloudy	Pleasant coastal conditions	18	72	SW	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
4	2025-06-10	15	sunny	Clear skies for crossing	15	68	W	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
8	2025-06-11	\N	\N	\N	\N	\N	\N	10.5	14.2	0	29.7	141	6.3	Open-Meteo	34	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
9	2025-06-12	\N	\N	\N	\N	\N	\N	11.9	13.7	0.2	43	140	5.75	Open-Meteo	76	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
10	2025-06-13	\N	\N	\N	\N	\N	\N	12.3	21	0.9	17.3	186	5.5	Open-Meteo	70	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
11	2025-06-14	\N	\N	\N	\N	\N	\N	11.8	18.3	11.2	14.1	273	4.5	Open-Meteo	79	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
29	2025-06-16	\N	\N	\N	\N	\N	\N	12.1	19.6	0	30.1	245	6.35	open-meteo	84	2025-06-16 12:32:27.268604	2025-06-16 17:15:01.481
7	2025-06-16	\N	\N	\N	\N	\N	\N	12.1	19.6	0	30.1	245	6.35	open-meteo	84	2025-06-16 09:17:59.462292	2025-06-16 17:15:01.481
13	2025-06-16	\N	\N	\N	\N	\N	\N	12.1	19.6	0	30.1	245	6.35	open-meteo	84	2025-06-16 09:17:59.462292	2025-06-16 17:15:01.481
31	2025-06-18	\N	\N	\N	\N	\N	\N	11.7	17	0	24.9	266	5.5	open-meteo	88	2025-06-16 12:32:27.418665	2025-06-18 22:18:47.941
15	2025-06-18	\N	\N	\N	\N	\N	\N	11.7	17	0	24.9	266	5.5	open-meteo	88	2025-06-16 09:17:59.462292	2025-06-18 22:18:47.941
6	2025-06-15	\N	\N	\N	\N	\N	\N	12.8	18	0	34.5	256	6.5	open-meteo	74	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
12	2025-06-15	\N	\N	\N	\N	\N	\N	12.8	18	0	34.5	256	6.5	open-meteo	74	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
32	2025-06-19	\N	\N	\N	\N	\N	\N	12.2	14.8	0	29	139	5.95	open-meteo	64	2025-06-16 12:32:27.484754	2025-06-18 23:06:26.464
16	2025-06-19	\N	\N	\N	\N	\N	\N	12.2	14.8	0	29	139	5.95	open-meteo	64	2025-06-16 09:17:59.462292	2025-06-18 23:06:26.464
33	2025-06-20	\N	\N	\N	\N	\N	\N	13.4	18.4	0	23.3	133	6.35	open-meteo	70	2025-06-16 12:32:27.550817	2025-06-18 23:06:26.594
17	2025-06-20	\N	\N	\N	\N	\N	\N	13.4	18.4	0	23.3	133	6.35	open-meteo	70	2025-06-16 09:17:59.462292	2025-06-18 23:06:26.594
18	2025-06-21	\N	\N	\N	\N	\N	\N	13.4	23.7	0	26.2	157	6.7	open-meteo	50	2025-06-16 09:17:59.462292	2025-06-18 23:06:26.724
34	2025-06-21	\N	\N	\N	\N	\N	\N	13.4	23.7	0	26.2	157	6.7	open-meteo	50	2025-06-16 12:32:27.617124	2025-06-18 23:06:26.724
30	2025-06-17	\N	\N	\N	\N	\N	\N	13.9	19.4	0	39.4	247	6.7	open-meteo	85	2025-06-16 12:32:27.35228	2025-06-17 17:15:44.678
14	2025-06-17	\N	\N	\N	\N	\N	\N	13.9	19.4	0	39.4	247	6.7	open-meteo	85	2025-06-16 09:17:59.462292	2025-06-17 17:15:44.678
19	2025-06-22	\N	\N	\N	\N	\N	\N	12.8	18.4	2.1	31.5	234	6.45	open-meteo	82	2025-06-16 09:17:59.462292	2025-06-18 23:06:26.854
35	2025-06-22	\N	\N	\N	\N	\N	\N	12.8	18.4	2.1	31.5	234	6.45	open-meteo	82	2025-06-16 12:32:27.683058	2025-06-18 23:06:26.854
20	2025-06-23	\N	\N	\N	\N	\N	\N	10.7	17.3	0.3	36.2	267	6	open-meteo	59	2025-06-16 09:17:59.462292	2025-06-18 23:06:26.984
36	2025-06-23	\N	\N	\N	\N	\N	\N	10.7	17.3	0.3	36.2	267	6	open-meteo	59	2025-06-16 12:32:27.74903	2025-06-18 23:06:26.984
21	2025-06-24	\N	\N	\N	\N	\N	\N	13.1	18	2.7	19.1	271	5.65	open-meteo	95	2025-06-16 09:17:59.462292	2025-06-18 23:06:27.114
37	2025-06-24	\N	\N	\N	\N	\N	\N	13.1	18	2.7	19.1	271	5.65	open-meteo	95	2025-06-16 12:32:27.816064	2025-06-18 23:06:27.114
22	2025-06-25	\N	\N	\N	\N	\N	\N	13	20	0.2	28.7	232	4.55	open-meteo	86	2025-06-16 09:17:59.462292	2025-06-18 23:06:27.244
38	2025-06-25	\N	\N	\N	\N	\N	\N	13	20	0.2	28.7	232	4.55	open-meteo	86	2025-06-16 12:32:27.882248	2025-06-18 23:06:27.244
23	2025-06-26	\N	\N	\N	\N	\N	\N	14.9	22.8	2.5	28	208	5.05	open-meteo	83	2025-06-16 09:17:59.462292	2025-06-18 23:06:27.373
39	2025-06-26	\N	\N	\N	\N	\N	\N	14.9	22.8	2.5	28	208	5.05	open-meteo	83	2025-06-16 12:32:27.948781	2025-06-18 23:06:27.373
24	2025-06-27	\N	\N	\N	\N	\N	\N	14.1	18.8	0	34.9	216	1.95	open-meteo	94	2025-06-16 09:17:59.462292	2025-06-18 23:06:27.501
40	2025-06-27	\N	\N	\N	\N	\N	\N	14.1	18.8	0	34.9	216	1.95	open-meteo	94	2025-06-16 12:32:28.015044	2025-06-18 23:06:27.501
25	2025-06-28	\N	\N	\N	\N	\N	\N	10.9	18.9	0	27.4	247	5.2	open-meteo	70	2025-06-16 09:17:59.462292	2025-06-18 23:06:27.631
41	2025-06-28	\N	\N	\N	\N	\N	\N	10.9	18.9	0	27.4	247	5.2	open-meteo	70	2025-06-16 12:32:28.081093	2025-06-18 23:06:27.631
26	2025-06-29	\N	\N	\N	\N	\N	\N	10.5	19.2	0	29.5	253	5.8	open-meteo	61	2025-06-16 09:17:59.462292	2025-06-18 23:06:27.761
42	2025-06-29	\N	\N	\N	\N	\N	\N	10.5	19.2	0	29.5	253	5.8	open-meteo	61	2025-06-16 12:32:28.148017	2025-06-18 23:06:27.761
27	2025-06-30	\N	\N	\N	\N	\N	\N	8.4	19.3	0	32.4	251	6.05	open-meteo	17	2025-06-16 09:17:59.462292	2025-06-18 23:06:27.89
28	2025-07-01	\N	\N	\N	\N	\N	\N	7.9	20.8	0	22.5	244	5.15	open-meteo	85	2025-06-16 09:31:12.503567	2025-06-18 23:06:28.019
43	2025-07-02	\N	\N	\N	\N	\N	\N	12	19.2	0	34.9	229	5.6	open-meteo	92	2025-06-17 05:52:25.032257	2025-06-18 23:06:28.148
44	2025-07-03	\N	\N	\N	\N	\N	\N	10.6	16.5	0.6	35.4	266	3.05	open-meteo	52	2025-06-18 05:16:19.879837	2025-06-18 23:06:28.276
\.


--
-- Data for Name: weather_data_backup_2025-06-18T23-26-47-639Z; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public."weather_data_backup_2025-06-18T23-26-47-639Z" (id, date, temperature, condition, description, wind_speed, humidity, wind_direction, temperature_min, temperature_max, precipitation_sum, wind_speed_max, wind_direction_dominant, uv_index_max, source, cloudcover, created_at, updated_at) FROM stdin;
5	2025-06-10	\N	\N	\N	\N	\N	\N	11.6	14.5	0.6	35.3	311	5.85	Open-Meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
1	2025-01-01	4	cloudy	Grey skies over the North Sea	29	85	W	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
2	2025-01-02	5	rainy	Wet conditions along the causeway	32	86	S	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
3	2025-06-09	14	partly cloudy	Pleasant coastal conditions	18	72	SW	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
4	2025-06-10	15	sunny	Clear skies for crossing	15	68	W	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
8	2025-06-11	\N	\N	\N	\N	\N	\N	10.5	14.2	0	29.7	141	6.3	Open-Meteo	34	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
9	2025-06-12	\N	\N	\N	\N	\N	\N	11.9	13.7	0.2	43	140	5.75	Open-Meteo	76	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
10	2025-06-13	\N	\N	\N	\N	\N	\N	12.3	21	0.9	17.3	186	5.5	Open-Meteo	70	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
11	2025-06-14	\N	\N	\N	\N	\N	\N	11.8	18.3	11.2	14.1	273	4.5	Open-Meteo	79	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
29	2025-06-16	\N	\N	\N	\N	\N	\N	12.1	19.6	0	30.1	245	6.35	open-meteo	84	2025-06-16 12:32:27.268604	2025-06-16 17:15:01.481
7	2025-06-16	\N	\N	\N	\N	\N	\N	12.1	19.6	0	30.1	245	6.35	open-meteo	84	2025-06-16 09:17:59.462292	2025-06-16 17:15:01.481
13	2025-06-16	\N	\N	\N	\N	\N	\N	12.1	19.6	0	30.1	245	6.35	open-meteo	84	2025-06-16 09:17:59.462292	2025-06-16 17:15:01.481
31	2025-06-18	\N	\N	\N	\N	\N	\N	11.7	17	0	24.9	266	5.5	open-meteo	88	2025-06-16 12:32:27.418665	2025-06-18 22:18:47.941
15	2025-06-18	\N	\N	\N	\N	\N	\N	11.7	17	0	24.9	266	5.5	open-meteo	88	2025-06-16 09:17:59.462292	2025-06-18 22:18:47.941
6	2025-06-15	\N	\N	\N	\N	\N	\N	12.8	18	0	34.5	256	6.5	open-meteo	74	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
12	2025-06-15	\N	\N	\N	\N	\N	\N	12.8	18	0	34.5	256	6.5	open-meteo	74	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
30	2025-06-17	\N	\N	\N	\N	\N	\N	13.9	19.4	0	39.4	247	6.7	open-meteo	85	2025-06-16 12:32:27.35228	2025-06-17 17:15:44.678
14	2025-06-17	\N	\N	\N	\N	\N	\N	13.9	19.4	0	39.4	247	6.7	open-meteo	85	2025-06-16 09:17:59.462292	2025-06-17 17:15:44.678
32	2025-06-19	\N	\N	\N	\N	\N	\N	12.2	14.8	0	29	139	5.95	open-meteo	64	2025-06-16 12:32:27.484754	2025-06-18 23:15:39.427
16	2025-06-19	\N	\N	\N	\N	\N	\N	12.2	14.8	0	29	139	5.95	open-meteo	64	2025-06-16 09:17:59.462292	2025-06-18 23:15:39.427
33	2025-06-20	\N	\N	\N	\N	\N	\N	13.4	18.4	0	23.3	133	6.35	open-meteo	70	2025-06-16 12:32:27.550817	2025-06-18 23:15:39.561
17	2025-06-20	\N	\N	\N	\N	\N	\N	13.4	18.4	0	23.3	133	6.35	open-meteo	70	2025-06-16 09:17:59.462292	2025-06-18 23:15:39.561
18	2025-06-21	\N	\N	\N	\N	\N	\N	13.4	23.7	0	26.2	157	6.7	open-meteo	50	2025-06-16 09:17:59.462292	2025-06-18 23:15:39.692
34	2025-06-21	\N	\N	\N	\N	\N	\N	13.4	23.7	0	26.2	157	6.7	open-meteo	50	2025-06-16 12:32:27.617124	2025-06-18 23:15:39.692
19	2025-06-22	\N	\N	\N	\N	\N	\N	12.8	18.4	2.1	31.5	234	6.45	open-meteo	82	2025-06-16 09:17:59.462292	2025-06-18 23:15:39.824
35	2025-06-22	\N	\N	\N	\N	\N	\N	12.8	18.4	2.1	31.5	234	6.45	open-meteo	82	2025-06-16 12:32:27.683058	2025-06-18 23:15:39.824
20	2025-06-23	\N	\N	\N	\N	\N	\N	10.7	17.3	0.3	36.2	267	6	open-meteo	59	2025-06-16 09:17:59.462292	2025-06-18 23:15:39.955
36	2025-06-23	\N	\N	\N	\N	\N	\N	10.7	17.3	0.3	36.2	267	6	open-meteo	59	2025-06-16 12:32:27.74903	2025-06-18 23:15:39.955
21	2025-06-24	\N	\N	\N	\N	\N	\N	13.1	18	2.7	19.1	271	5.65	open-meteo	95	2025-06-16 09:17:59.462292	2025-06-18 23:15:40.087
37	2025-06-24	\N	\N	\N	\N	\N	\N	13.1	18	2.7	19.1	271	5.65	open-meteo	95	2025-06-16 12:32:27.816064	2025-06-18 23:15:40.087
22	2025-06-25	\N	\N	\N	\N	\N	\N	13	20	0.2	28.7	232	4.55	open-meteo	86	2025-06-16 09:17:59.462292	2025-06-18 23:15:40.217
38	2025-06-25	\N	\N	\N	\N	\N	\N	13	20	0.2	28.7	232	4.55	open-meteo	86	2025-06-16 12:32:27.882248	2025-06-18 23:15:40.217
23	2025-06-26	\N	\N	\N	\N	\N	\N	14.9	22.8	2.5	28	208	5.05	open-meteo	83	2025-06-16 09:17:59.462292	2025-06-18 23:15:40.348
39	2025-06-26	\N	\N	\N	\N	\N	\N	14.9	22.8	2.5	28	208	5.05	open-meteo	83	2025-06-16 12:32:27.948781	2025-06-18 23:15:40.348
24	2025-06-27	\N	\N	\N	\N	\N	\N	14.1	18.8	0	34.9	216	1.95	open-meteo	94	2025-06-16 09:17:59.462292	2025-06-18 23:15:40.478
40	2025-06-27	\N	\N	\N	\N	\N	\N	14.1	18.8	0	34.9	216	1.95	open-meteo	94	2025-06-16 12:32:28.015044	2025-06-18 23:15:40.478
25	2025-06-28	\N	\N	\N	\N	\N	\N	10.9	18.9	0	27.4	247	5.2	open-meteo	70	2025-06-16 09:17:59.462292	2025-06-18 23:15:40.609
41	2025-06-28	\N	\N	\N	\N	\N	\N	10.9	18.9	0	27.4	247	5.2	open-meteo	70	2025-06-16 12:32:28.081093	2025-06-18 23:15:40.609
26	2025-06-29	\N	\N	\N	\N	\N	\N	10.5	19.2	0	29.5	253	5.8	open-meteo	61	2025-06-16 09:17:59.462292	2025-06-18 23:15:40.74
42	2025-06-29	\N	\N	\N	\N	\N	\N	10.5	19.2	0	29.5	253	5.8	open-meteo	61	2025-06-16 12:32:28.148017	2025-06-18 23:15:40.74
27	2025-06-30	\N	\N	\N	\N	\N	\N	8.4	19.3	0	32.4	251	6.05	open-meteo	17	2025-06-16 09:17:59.462292	2025-06-18 23:15:40.872
28	2025-07-01	\N	\N	\N	\N	\N	\N	7.9	20.8	0	22.5	244	5.15	open-meteo	85	2025-06-16 09:31:12.503567	2025-06-18 23:15:41.001
43	2025-07-02	\N	\N	\N	\N	\N	\N	12	19.2	0	34.9	229	5.6	open-meteo	92	2025-06-17 05:52:25.032257	2025-06-18 23:15:41.131
44	2025-07-03	\N	\N	\N	\N	\N	\N	10.6	16.5	0.6	35.4	266	3.05	open-meteo	52	2025-06-18 05:16:19.879837	2025-06-18 23:15:41.278
\.


--
-- Data for Name: weather_data_backup_2025-06-18T23-58-08-507Z; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public."weather_data_backup_2025-06-18T23-58-08-507Z" (id, date, temperature, condition, description, wind_speed, humidity, wind_direction, temperature_min, temperature_max, precipitation_sum, wind_speed_max, wind_direction_dominant, uv_index_max, source, cloudcover, created_at, updated_at) FROM stdin;
5	2025-06-10	\N	\N	\N	\N	\N	\N	11.6	14.5	0.6	35.3	311	5.85	Open-Meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
1	2025-01-01	4	cloudy	Grey skies over the North Sea	29	85	W	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
2	2025-01-02	5	rainy	Wet conditions along the causeway	32	86	S	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
3	2025-06-09	14	partly cloudy	Pleasant coastal conditions	18	72	SW	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
4	2025-06-10	15	sunny	Clear skies for crossing	15	68	W	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
8	2025-06-11	\N	\N	\N	\N	\N	\N	10.5	14.2	0	29.7	141	6.3	Open-Meteo	34	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
9	2025-06-12	\N	\N	\N	\N	\N	\N	11.9	13.7	0.2	43	140	5.75	Open-Meteo	76	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
10	2025-06-13	\N	\N	\N	\N	\N	\N	12.3	21	0.9	17.3	186	5.5	Open-Meteo	70	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
11	2025-06-14	\N	\N	\N	\N	\N	\N	11.8	18.3	11.2	14.1	273	4.5	Open-Meteo	79	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
29	2025-06-16	\N	\N	\N	\N	\N	\N	12.1	19.6	0	30.1	245	6.35	open-meteo	84	2025-06-16 12:32:27.268604	2025-06-16 17:15:01.481
7	2025-06-16	\N	\N	\N	\N	\N	\N	12.1	19.6	0	30.1	245	6.35	open-meteo	84	2025-06-16 09:17:59.462292	2025-06-16 17:15:01.481
13	2025-06-16	\N	\N	\N	\N	\N	\N	12.1	19.6	0	30.1	245	6.35	open-meteo	84	2025-06-16 09:17:59.462292	2025-06-16 17:15:01.481
31	2025-06-18	\N	\N	\N	\N	\N	\N	11.7	17	0	24.9	266	5.5	open-meteo	88	2025-06-16 12:32:27.418665	2025-06-18 22:18:47.941
15	2025-06-18	\N	\N	\N	\N	\N	\N	11.7	17	0	24.9	266	5.5	open-meteo	88	2025-06-16 09:17:59.462292	2025-06-18 22:18:47.941
6	2025-06-15	\N	\N	\N	\N	\N	\N	12.8	18	0	34.5	256	6.5	open-meteo	74	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
12	2025-06-15	\N	\N	\N	\N	\N	\N	12.8	18	0	34.5	256	6.5	open-meteo	74	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
32	2025-06-19	\N	\N	\N	\N	\N	\N	12.2	14.8	0	29	139	5.95	open-meteo	64	2025-06-16 12:32:27.484754	2025-06-18 23:26:47.885
16	2025-06-19	\N	\N	\N	\N	\N	\N	12.2	14.8	0	29	139	5.95	open-meteo	64	2025-06-16 09:17:59.462292	2025-06-18 23:26:47.885
33	2025-06-20	\N	\N	\N	\N	\N	\N	13.4	18.4	0	23.3	133	6.35	open-meteo	70	2025-06-16 12:32:27.550817	2025-06-18 23:26:48.02
17	2025-06-20	\N	\N	\N	\N	\N	\N	13.4	18.4	0	23.3	133	6.35	open-meteo	70	2025-06-16 09:17:59.462292	2025-06-18 23:26:48.02
18	2025-06-21	\N	\N	\N	\N	\N	\N	13.4	23.7	0	26.2	157	6.7	open-meteo	50	2025-06-16 09:17:59.462292	2025-06-18 23:26:48.15
34	2025-06-21	\N	\N	\N	\N	\N	\N	13.4	23.7	0	26.2	157	6.7	open-meteo	50	2025-06-16 12:32:27.617124	2025-06-18 23:26:48.15
30	2025-06-17	\N	\N	\N	\N	\N	\N	13.9	19.4	0	39.4	247	6.7	open-meteo	85	2025-06-16 12:32:27.35228	2025-06-17 17:15:44.678
14	2025-06-17	\N	\N	\N	\N	\N	\N	13.9	19.4	0	39.4	247	6.7	open-meteo	85	2025-06-16 09:17:59.462292	2025-06-17 17:15:44.678
19	2025-06-22	\N	\N	\N	\N	\N	\N	12.8	18.4	2.1	31.5	234	6.45	open-meteo	82	2025-06-16 09:17:59.462292	2025-06-18 23:26:48.28
35	2025-06-22	\N	\N	\N	\N	\N	\N	12.8	18.4	2.1	31.5	234	6.45	open-meteo	82	2025-06-16 12:32:27.683058	2025-06-18 23:26:48.28
20	2025-06-23	\N	\N	\N	\N	\N	\N	10.7	17.3	0.3	36.2	267	6	open-meteo	59	2025-06-16 09:17:59.462292	2025-06-18 23:26:48.41
36	2025-06-23	\N	\N	\N	\N	\N	\N	10.7	17.3	0.3	36.2	267	6	open-meteo	59	2025-06-16 12:32:27.74903	2025-06-18 23:26:48.41
21	2025-06-24	\N	\N	\N	\N	\N	\N	13.1	18	2.7	19.1	271	5.65	open-meteo	95	2025-06-16 09:17:59.462292	2025-06-18 23:26:48.54
37	2025-06-24	\N	\N	\N	\N	\N	\N	13.1	18	2.7	19.1	271	5.65	open-meteo	95	2025-06-16 12:32:27.816064	2025-06-18 23:26:48.54
22	2025-06-25	\N	\N	\N	\N	\N	\N	13	20	0.2	28.7	232	4.55	open-meteo	86	2025-06-16 09:17:59.462292	2025-06-18 23:26:48.671
38	2025-06-25	\N	\N	\N	\N	\N	\N	13	20	0.2	28.7	232	4.55	open-meteo	86	2025-06-16 12:32:27.882248	2025-06-18 23:26:48.671
23	2025-06-26	\N	\N	\N	\N	\N	\N	14.9	22.8	2.5	28	208	5.05	open-meteo	83	2025-06-16 09:17:59.462292	2025-06-18 23:26:48.801
39	2025-06-26	\N	\N	\N	\N	\N	\N	14.9	22.8	2.5	28	208	5.05	open-meteo	83	2025-06-16 12:32:27.948781	2025-06-18 23:26:48.801
24	2025-06-27	\N	\N	\N	\N	\N	\N	14.1	18.8	0	34.9	216	1.95	open-meteo	94	2025-06-16 09:17:59.462292	2025-06-18 23:26:48.93
40	2025-06-27	\N	\N	\N	\N	\N	\N	14.1	18.8	0	34.9	216	1.95	open-meteo	94	2025-06-16 12:32:28.015044	2025-06-18 23:26:48.93
25	2025-06-28	\N	\N	\N	\N	\N	\N	10.9	18.9	0	27.4	247	5.2	open-meteo	70	2025-06-16 09:17:59.462292	2025-06-18 23:26:49.06
41	2025-06-28	\N	\N	\N	\N	\N	\N	10.9	18.9	0	27.4	247	5.2	open-meteo	70	2025-06-16 12:32:28.081093	2025-06-18 23:26:49.06
26	2025-06-29	\N	\N	\N	\N	\N	\N	10.5	19.2	0	29.5	253	5.8	open-meteo	61	2025-06-16 09:17:59.462292	2025-06-18 23:26:49.19
42	2025-06-29	\N	\N	\N	\N	\N	\N	10.5	19.2	0	29.5	253	5.8	open-meteo	61	2025-06-16 12:32:28.148017	2025-06-18 23:26:49.19
27	2025-06-30	\N	\N	\N	\N	\N	\N	8.4	19.3	0	32.4	251	6.05	open-meteo	17	2025-06-16 09:17:59.462292	2025-06-18 23:26:49.32
28	2025-07-01	\N	\N	\N	\N	\N	\N	7.9	20.8	0	22.5	244	5.15	open-meteo	85	2025-06-16 09:31:12.503567	2025-06-18 23:26:49.452
43	2025-07-02	\N	\N	\N	\N	\N	\N	12	19.2	0	34.9	229	5.6	open-meteo	92	2025-06-17 05:52:25.032257	2025-06-18 23:26:49.582
44	2025-07-03	\N	\N	\N	\N	\N	\N	10.6	16.5	0.6	35.4	266	3.05	open-meteo	52	2025-06-18 05:16:19.879837	2025-06-18 23:26:49.713
\.


--
-- Data for Name: weather_data_backup_2025-06-19T05-40-51-184Z; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public."weather_data_backup_2025-06-19T05-40-51-184Z" (id, date, temperature, condition, description, wind_speed, humidity, wind_direction, temperature_min, temperature_max, precipitation_sum, wind_speed_max, wind_direction_dominant, uv_index_max, source, cloudcover, created_at, updated_at) FROM stdin;
5	2025-06-10	\N	\N	\N	\N	\N	\N	11.6	14.5	0.6	35.3	311	5.85	Open-Meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
1	2025-01-01	4	cloudy	Grey skies over the North Sea	29	85	W	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
2	2025-01-02	5	rainy	Wet conditions along the causeway	32	86	S	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
3	2025-06-09	14	partly cloudy	Pleasant coastal conditions	18	72	SW	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
4	2025-06-10	15	sunny	Clear skies for crossing	15	68	W	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
8	2025-06-11	\N	\N	\N	\N	\N	\N	10.5	14.2	0	29.7	141	6.3	Open-Meteo	34	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
9	2025-06-12	\N	\N	\N	\N	\N	\N	11.9	13.7	0.2	43	140	5.75	Open-Meteo	76	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
10	2025-06-13	\N	\N	\N	\N	\N	\N	12.3	21	0.9	17.3	186	5.5	Open-Meteo	70	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
11	2025-06-14	\N	\N	\N	\N	\N	\N	11.8	18.3	11.2	14.1	273	4.5	Open-Meteo	79	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
29	2025-06-16	\N	\N	\N	\N	\N	\N	12.1	19.6	0	30.1	245	6.35	open-meteo	84	2025-06-16 12:32:27.268604	2025-06-16 17:15:01.481
7	2025-06-16	\N	\N	\N	\N	\N	\N	12.1	19.6	0	30.1	245	6.35	open-meteo	84	2025-06-16 09:17:59.462292	2025-06-16 17:15:01.481
13	2025-06-16	\N	\N	\N	\N	\N	\N	12.1	19.6	0	30.1	245	6.35	open-meteo	84	2025-06-16 09:17:59.462292	2025-06-16 17:15:01.481
31	2025-06-18	\N	\N	\N	\N	\N	\N	11.7	17	0	24.9	266	5.5	open-meteo	88	2025-06-16 12:32:27.418665	2025-06-18 22:18:47.941
15	2025-06-18	\N	\N	\N	\N	\N	\N	11.7	17	0	24.9	266	5.5	open-meteo	88	2025-06-16 09:17:59.462292	2025-06-18 22:18:47.941
6	2025-06-15	\N	\N	\N	\N	\N	\N	12.8	18	0	34.5	256	6.5	open-meteo	74	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
12	2025-06-15	\N	\N	\N	\N	\N	\N	12.8	18	0	34.5	256	6.5	open-meteo	74	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
30	2025-06-17	\N	\N	\N	\N	\N	\N	13.9	19.4	0	39.4	247	6.7	open-meteo	85	2025-06-16 12:32:27.35228	2025-06-17 17:15:44.678
14	2025-06-17	\N	\N	\N	\N	\N	\N	13.9	19.4	0	39.4	247	6.7	open-meteo	85	2025-06-16 09:17:59.462292	2025-06-17 17:15:44.678
32	2025-06-19	\N	\N	\N	\N	\N	\N	12.2	14.8	0	29	139	5.95	open-meteo	64	2025-06-16 12:32:27.484754	2025-06-18 23:58:08.743
16	2025-06-19	\N	\N	\N	\N	\N	\N	12.2	14.8	0	29	139	5.95	open-meteo	64	2025-06-16 09:17:59.462292	2025-06-18 23:58:08.743
33	2025-06-20	\N	\N	\N	\N	\N	\N	13.4	18.4	0	23.3	133	6.35	open-meteo	70	2025-06-16 12:32:27.550817	2025-06-18 23:58:08.877
17	2025-06-20	\N	\N	\N	\N	\N	\N	13.4	18.4	0	23.3	133	6.35	open-meteo	70	2025-06-16 09:17:59.462292	2025-06-18 23:58:08.877
18	2025-06-21	\N	\N	\N	\N	\N	\N	13.4	23.7	0	26.2	157	6.7	open-meteo	50	2025-06-16 09:17:59.462292	2025-06-18 23:58:09.009
34	2025-06-21	\N	\N	\N	\N	\N	\N	13.4	23.7	0	26.2	157	6.7	open-meteo	50	2025-06-16 12:32:27.617124	2025-06-18 23:58:09.009
19	2025-06-22	\N	\N	\N	\N	\N	\N	12.8	18.4	2.1	31.5	234	6.45	open-meteo	82	2025-06-16 09:17:59.462292	2025-06-18 23:58:09.14
35	2025-06-22	\N	\N	\N	\N	\N	\N	12.8	18.4	2.1	31.5	234	6.45	open-meteo	82	2025-06-16 12:32:27.683058	2025-06-18 23:58:09.14
20	2025-06-23	\N	\N	\N	\N	\N	\N	10.7	17.3	0.3	36.2	267	6	open-meteo	59	2025-06-16 09:17:59.462292	2025-06-18 23:58:09.272
36	2025-06-23	\N	\N	\N	\N	\N	\N	10.7	17.3	0.3	36.2	267	6	open-meteo	59	2025-06-16 12:32:27.74903	2025-06-18 23:58:09.272
21	2025-06-24	\N	\N	\N	\N	\N	\N	13.1	18	2.7	19.1	271	5.65	open-meteo	95	2025-06-16 09:17:59.462292	2025-06-18 23:58:09.404
37	2025-06-24	\N	\N	\N	\N	\N	\N	13.1	18	2.7	19.1	271	5.65	open-meteo	95	2025-06-16 12:32:27.816064	2025-06-18 23:58:09.404
22	2025-06-25	\N	\N	\N	\N	\N	\N	13	20	0.2	28.7	232	4.55	open-meteo	86	2025-06-16 09:17:59.462292	2025-06-18 23:58:09.535
38	2025-06-25	\N	\N	\N	\N	\N	\N	13	20	0.2	28.7	232	4.55	open-meteo	86	2025-06-16 12:32:27.882248	2025-06-18 23:58:09.535
23	2025-06-26	\N	\N	\N	\N	\N	\N	14.9	22.8	2.5	28	208	5.05	open-meteo	83	2025-06-16 09:17:59.462292	2025-06-18 23:58:09.667
39	2025-06-26	\N	\N	\N	\N	\N	\N	14.9	22.8	2.5	28	208	5.05	open-meteo	83	2025-06-16 12:32:27.948781	2025-06-18 23:58:09.667
24	2025-06-27	\N	\N	\N	\N	\N	\N	14.1	18.8	0	34.9	216	1.95	open-meteo	94	2025-06-16 09:17:59.462292	2025-06-18 23:58:09.799
40	2025-06-27	\N	\N	\N	\N	\N	\N	14.1	18.8	0	34.9	216	1.95	open-meteo	94	2025-06-16 12:32:28.015044	2025-06-18 23:58:09.799
25	2025-06-28	\N	\N	\N	\N	\N	\N	10.9	18.9	0	27.4	247	5.2	open-meteo	70	2025-06-16 09:17:59.462292	2025-06-18 23:58:09.931
41	2025-06-28	\N	\N	\N	\N	\N	\N	10.9	18.9	0	27.4	247	5.2	open-meteo	70	2025-06-16 12:32:28.081093	2025-06-18 23:58:09.931
26	2025-06-29	\N	\N	\N	\N	\N	\N	10.5	19.2	0	29.5	253	5.8	open-meteo	61	2025-06-16 09:17:59.462292	2025-06-18 23:58:10.06
42	2025-06-29	\N	\N	\N	\N	\N	\N	10.5	19.2	0	29.5	253	5.8	open-meteo	61	2025-06-16 12:32:28.148017	2025-06-18 23:58:10.06
27	2025-06-30	\N	\N	\N	\N	\N	\N	8.4	19.3	0	32.4	251	6.05	open-meteo	17	2025-06-16 09:17:59.462292	2025-06-18 23:58:10.191
28	2025-07-01	\N	\N	\N	\N	\N	\N	7.9	20.8	0	22.5	244	5.15	open-meteo	85	2025-06-16 09:31:12.503567	2025-06-18 23:58:10.322
43	2025-07-02	\N	\N	\N	\N	\N	\N	12	19.2	0	34.9	229	5.6	open-meteo	92	2025-06-17 05:52:25.032257	2025-06-18 23:58:10.452
44	2025-07-03	\N	\N	\N	\N	\N	\N	10.6	16.5	0.6	35.4	266	3.05	open-meteo	52	2025-06-18 05:16:19.879837	2025-06-18 23:58:10.582
\.


--
-- Data for Name: weather_data_backup_2025-06-19T07-29-39-984Z; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public."weather_data_backup_2025-06-19T07-29-39-984Z" (id, date, temperature, condition, description, wind_speed, humidity, wind_direction, temperature_min, temperature_max, precipitation_sum, wind_speed_max, wind_direction_dominant, uv_index_max, source, cloudcover, created_at, updated_at) FROM stdin;
5	2025-06-10	\N	\N	\N	\N	\N	\N	11.6	14.5	0.6	35.3	311	5.85	Open-Meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
1	2025-01-01	4	cloudy	Grey skies over the North Sea	29	85	W	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
2	2025-01-02	5	rainy	Wet conditions along the causeway	32	86	S	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
3	2025-06-09	14	partly cloudy	Pleasant coastal conditions	18	72	SW	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
4	2025-06-10	15	sunny	Clear skies for crossing	15	68	W	\N	\N	\N	\N	\N	\N	open-meteo	\N	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
8	2025-06-11	\N	\N	\N	\N	\N	\N	10.5	14.2	0	29.7	141	6.3	Open-Meteo	34	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
9	2025-06-12	\N	\N	\N	\N	\N	\N	11.9	13.7	0.2	43	140	5.75	Open-Meteo	76	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
10	2025-06-13	\N	\N	\N	\N	\N	\N	12.3	21	0.9	17.3	186	5.5	Open-Meteo	70	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
11	2025-06-14	\N	\N	\N	\N	\N	\N	11.8	18.3	11.2	14.1	273	4.5	Open-Meteo	79	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
29	2025-06-16	\N	\N	\N	\N	\N	\N	12.1	19.6	0	30.1	245	6.35	open-meteo	84	2025-06-16 12:32:27.268604	2025-06-16 17:15:01.481
7	2025-06-16	\N	\N	\N	\N	\N	\N	12.1	19.6	0	30.1	245	6.35	open-meteo	84	2025-06-16 09:17:59.462292	2025-06-16 17:15:01.481
13	2025-06-16	\N	\N	\N	\N	\N	\N	12.1	19.6	0	30.1	245	6.35	open-meteo	84	2025-06-16 09:17:59.462292	2025-06-16 17:15:01.481
31	2025-06-18	\N	\N	\N	\N	\N	\N	11.7	17	0	24.9	266	5.5	open-meteo	88	2025-06-16 12:32:27.418665	2025-06-18 22:18:47.941
15	2025-06-18	\N	\N	\N	\N	\N	\N	11.7	17	0	24.9	266	5.5	open-meteo	88	2025-06-16 09:17:59.462292	2025-06-18 22:18:47.941
6	2025-06-15	\N	\N	\N	\N	\N	\N	12.8	18	0	34.5	256	6.5	open-meteo	74	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
12	2025-06-15	\N	\N	\N	\N	\N	\N	12.8	18	0	34.5	256	6.5	open-meteo	74	2025-06-16 09:17:59.462292	2025-06-16 09:18:03.459827
32	2025-06-19	\N	\N	\N	\N	\N	\N	12.3	15.1	0	28.3	138	6.5	open-meteo	48	2025-06-16 12:32:27.484754	2025-06-19 05:40:51.43
16	2025-06-19	\N	\N	\N	\N	\N	\N	12.3	15.1	0	28.3	138	6.5	open-meteo	48	2025-06-16 09:17:59.462292	2025-06-19 05:40:51.43
33	2025-06-20	\N	\N	\N	\N	\N	\N	13.4	19	0	22.8	131	6.7	open-meteo	55	2025-06-16 12:32:27.550817	2025-06-19 05:40:51.565
17	2025-06-20	\N	\N	\N	\N	\N	\N	13.4	19	0	22.8	131	6.7	open-meteo	55	2025-06-16 09:17:59.462292	2025-06-19 05:40:51.565
18	2025-06-21	\N	\N	\N	\N	\N	\N	13.6	23.5	1.1	26.6	148	5.95	open-meteo	64	2025-06-16 09:17:59.462292	2025-06-19 05:40:51.696
34	2025-06-21	\N	\N	\N	\N	\N	\N	13.6	23.5	1.1	26.6	148	5.95	open-meteo	64	2025-06-16 12:32:27.617124	2025-06-19 05:40:51.696
30	2025-06-17	\N	\N	\N	\N	\N	\N	13.9	19.4	0	39.4	247	6.7	open-meteo	85	2025-06-16 12:32:27.35228	2025-06-17 17:15:44.678
14	2025-06-17	\N	\N	\N	\N	\N	\N	13.9	19.4	0	39.4	247	6.7	open-meteo	85	2025-06-16 09:17:59.462292	2025-06-17 17:15:44.678
19	2025-06-22	\N	\N	\N	\N	\N	\N	12.5	19.3	0.6	34.6	236	5.7	open-meteo	84	2025-06-16 09:17:59.462292	2025-06-19 05:40:51.827
35	2025-06-22	\N	\N	\N	\N	\N	\N	12.5	19.3	0.6	34.6	236	5.7	open-meteo	84	2025-06-16 12:32:27.683058	2025-06-19 05:40:51.827
20	2025-06-23	\N	\N	\N	\N	\N	\N	11.3	17.8	0.6	33.5	265	6.25	open-meteo	59	2025-06-16 09:17:59.462292	2025-06-19 05:40:51.957
36	2025-06-23	\N	\N	\N	\N	\N	\N	11.3	17.8	0.6	33.5	265	6.25	open-meteo	59	2025-06-16 12:32:27.74903	2025-06-19 05:40:51.957
21	2025-06-24	\N	\N	\N	\N	\N	\N	13.1	18.6	0.6	35.3	262	4.7	open-meteo	80	2025-06-16 09:17:59.462292	2025-06-19 05:40:52.088
37	2025-06-24	\N	\N	\N	\N	\N	\N	13.1	18.6	0.6	35.3	262	4.7	open-meteo	80	2025-06-16 12:32:27.816064	2025-06-19 05:40:52.088
22	2025-06-25	\N	\N	\N	\N	\N	\N	9.8	22.8	0.2	23.7	200	3.15	open-meteo	68	2025-06-16 09:17:59.462292	2025-06-19 05:40:52.218
38	2025-06-25	\N	\N	\N	\N	\N	\N	9.8	22.8	0.2	23.7	200	3.15	open-meteo	68	2025-06-16 12:32:27.882248	2025-06-19 05:40:52.218
23	2025-06-26	\N	\N	\N	\N	\N	\N	13.7	22.3	0.4	37.7	226	5.2	open-meteo	85	2025-06-16 09:17:59.462292	2025-06-19 05:40:52.35
39	2025-06-26	\N	\N	\N	\N	\N	\N	13.7	22.3	0.4	37.7	226	5.2	open-meteo	85	2025-06-16 12:32:27.948781	2025-06-19 05:40:52.35
24	2025-06-27	\N	\N	\N	\N	\N	\N	11.1	18.6	0	42.9	237	5.8	open-meteo	87	2025-06-16 09:17:59.462292	2025-06-19 05:40:52.48
40	2025-06-27	\N	\N	\N	\N	\N	\N	11.1	18.6	0	42.9	237	5.8	open-meteo	87	2025-06-16 12:32:28.015044	2025-06-19 05:40:52.48
25	2025-06-28	\N	\N	\N	\N	\N	\N	9.9	16.7	0	46.9	257	5.65	open-meteo	49	2025-06-16 09:17:59.462292	2025-06-19 05:40:52.61
41	2025-06-28	\N	\N	\N	\N	\N	\N	9.9	16.7	0	46.9	257	5.65	open-meteo	49	2025-06-16 12:32:28.081093	2025-06-19 05:40:52.61
26	2025-06-29	\N	\N	\N	\N	\N	\N	10.6	17.3	0	33.8	261	4.3	open-meteo	81	2025-06-16 09:17:59.462292	2025-06-19 05:40:52.74
42	2025-06-29	\N	\N	\N	\N	\N	\N	10.6	17.3	0	33.8	261	4.3	open-meteo	81	2025-06-16 12:32:28.148017	2025-06-19 05:40:52.74
27	2025-06-30	\N	\N	\N	\N	\N	\N	9.7	20.3	0	33.5	289	6.25	open-meteo	10	2025-06-16 09:17:59.462292	2025-06-19 05:40:52.87
28	2025-07-01	\N	\N	\N	\N	\N	\N	8.8	22.1	0	28.5	244	5.55	open-meteo	68	2025-06-16 09:31:12.503567	2025-06-19 05:40:53.001
43	2025-07-02	\N	\N	\N	\N	\N	\N	12.3	20.5	0.1	27.2	246	3.7	open-meteo	96	2025-06-17 05:52:25.032257	2025-06-19 05:40:53.132
44	2025-07-03	\N	\N	\N	\N	\N	\N	13.5	25.2	0.2	32.2	216	6.1	open-meteo	90	2025-06-18 05:16:19.879837	2025-06-19 05:40:53.262
45	2025-07-04	\N	\N	\N	\N	\N	\N	14.2	18.1	\N	24.7	\N	3.25	open-meteo	0	2025-06-19 05:40:51.312919	2025-06-19 05:40:51.312919
\.


--
-- Name: __drizzle_migrations_id_seq; Type: SEQUENCE SET; Schema: drizzle; Owner: neondb_owner
--

SELECT pg_catalog.setval('drizzle.__drizzle_migrations_id_seq', 1, false);


--
-- Name: api_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.api_settings_id_seq', 9, true);


--
-- Name: crossing_times_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.crossing_times_id_seq', 342, true);


--
-- Name: tide_data_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.tide_data_id_seq', 58, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- Name: weather_data_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.weather_data_id_seq', 45, true);


--
-- Name: __drizzle_migrations __drizzle_migrations_pkey; Type: CONSTRAINT; Schema: drizzle; Owner: neondb_owner
--

ALTER TABLE ONLY drizzle.__drizzle_migrations
    ADD CONSTRAINT __drizzle_migrations_pkey PRIMARY KEY (id);


--
-- Name: api_settings api_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.api_settings
    ADD CONSTRAINT api_settings_pkey PRIMARY KEY (id);


--
-- Name: crossing_times crossing_times_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.crossing_times
    ADD CONSTRAINT crossing_times_pkey PRIMARY KEY (id);


--
-- Name: tide_data tide_data_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.tide_data
    ADD CONSTRAINT tide_data_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_username_unique; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_unique UNIQUE (username);


--
-- Name: weather_data weather_data_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.weather_data
    ADD CONSTRAINT weather_data_pkey PRIMARY KEY (id);


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: cloud_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE cloud_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO neon_superuser WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: cloud_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE cloud_admin IN SCHEMA public GRANT ALL ON TABLES TO neon_superuser WITH GRANT OPTION;


--
-- PostgreSQL database dump complete
--

