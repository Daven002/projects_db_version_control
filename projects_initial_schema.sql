--
-- PostgreSQL database dump
--

-- Dumped from database version 14.11 (Postgres.app)
-- Dumped by pg_dump version 14.8 (Homebrew)

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
-- Name: basic_projects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.basic_projects (
    index integer NOT NULL,
    name character varying(50) NOT NULL,
    description character varying(255) NOT NULL,
    data_index integer,
    category_index integer,
    difficulty integer
);


ALTER TABLE public.basic_projects OWNER TO postgres;

--
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    index integer NOT NULL,
    category character varying(255) NOT NULL
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- Name: categories_index_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_index_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_index_seq OWNER TO postgres;

--
-- Name: categories_index_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_index_seq OWNED BY public.categories.index;


--
-- Name: complex_project_categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.complex_project_categories (
    complex_project_index integer NOT NULL,
    category_index integer NOT NULL
);


ALTER TABLE public.complex_project_categories OWNER TO postgres;

--
-- Name: complex_projects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.complex_projects (
    index integer NOT NULL,
    name character varying(50) NOT NULL,
    description character varying(255) NOT NULL,
    data_index integer,
    difficulty integer
);


ALTER TABLE public.complex_projects OWNER TO postgres;

--
-- Name: complex_project_index_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.complex_project_index_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.complex_project_index_seq OWNER TO postgres;

--
-- Name: complex_project_index_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.complex_project_index_seq OWNED BY public.complex_projects.index;


--
-- Name: data; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.data (
    index integer NOT NULL,
    source character varying(50) NOT NULL,
    dataset character varying(255) NOT NULL
);


ALTER TABLE public.data OWNER TO postgres;

--
-- Name: data_index_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.data_index_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.data_index_seq OWNER TO postgres;

--
-- Name: data_index_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.data_index_seq OWNED BY public.data.index;


--
-- Name: simple_project_index_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.simple_project_index_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.simple_project_index_seq OWNER TO postgres;

--
-- Name: simple_project_index_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.simple_project_index_seq OWNED BY public.basic_projects.index;


--
-- Name: tools_id_seq; Type: SEQUENCE; Schema: public; Owner: daven
--

CREATE SEQUENCE public.tools_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tools_id_seq OWNER TO daven;

--
-- Name: tools; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tools (
    index integer DEFAULT nextval('public.tools_id_seq'::regclass) NOT NULL,
    tool character varying(50) NOT NULL,
    category_index integer
);


ALTER TABLE public.tools OWNER TO postgres;

--
-- Name: tools_index_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tools_index_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tools_index_seq OWNER TO postgres;

--
-- Name: tools_index_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tools_index_seq OWNED BY public.tools.index;


--
-- Name: basic_projects index; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basic_projects ALTER COLUMN index SET DEFAULT nextval('public.simple_project_index_seq'::regclass);


--
-- Name: categories index; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN index SET DEFAULT nextval('public.categories_index_seq'::regclass);


--
-- Name: complex_projects index; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.complex_projects ALTER COLUMN index SET DEFAULT nextval('public.complex_project_index_seq'::regclass);


--
-- Name: data index; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data ALTER COLUMN index SET DEFAULT nextval('public.data_index_seq'::regclass);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (index);


--
-- Name: complex_project_categories complex_project_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.complex_project_categories
    ADD CONSTRAINT complex_project_categories_pkey PRIMARY KEY (complex_project_index, category_index);


--
-- Name: complex_projects complex_project_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.complex_projects
    ADD CONSTRAINT complex_project_pkey PRIMARY KEY (index);


--
-- Name: data data_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data
    ADD CONSTRAINT data_pkey PRIMARY KEY (index);


--
-- Name: basic_projects simple_project_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basic_projects
    ADD CONSTRAINT simple_project_pkey PRIMARY KEY (index);


--
-- Name: tools tools_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tools
    ADD CONSTRAINT tools_pkey PRIMARY KEY (index);


--
-- Name: idx_sort_order; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_sort_order ON public.data USING btree (index);

ALTER TABLE public.data CLUSTER ON idx_sort_order;


--
-- Name: complex_project_categories complex_project_categories_category_index_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.complex_project_categories
    ADD CONSTRAINT complex_project_categories_category_index_fkey FOREIGN KEY (category_index) REFERENCES public.categories(index);


--
-- Name: complex_project_categories complex_project_categories_complex_project_index_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.complex_project_categories
    ADD CONSTRAINT complex_project_categories_complex_project_index_fkey FOREIGN KEY (complex_project_index) REFERENCES public.complex_projects(index);


--
-- Name: complex_projects complex_project_data_index_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.complex_projects
    ADD CONSTRAINT complex_project_data_index_fkey FOREIGN KEY (data_index) REFERENCES public.data(index);


--
-- Name: basic_projects simple_project_category_index_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basic_projects
    ADD CONSTRAINT simple_project_category_index_fkey FOREIGN KEY (category_index) REFERENCES public.categories(index);


--
-- Name: basic_projects simple_project_data_index_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basic_projects
    ADD CONSTRAINT simple_project_data_index_fkey FOREIGN KEY (data_index) REFERENCES public.data(index);


--
-- Name: tools tools_category_index_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tools
    ADD CONSTRAINT tools_category_index_fkey FOREIGN KEY (category_index) REFERENCES public.categories(index);


--
-- PostgreSQL database dump complete
--

