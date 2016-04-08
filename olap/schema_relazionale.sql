--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.1
-- Dumped by pg_dump version 9.5.1

-- Started on 2016-04-02 17:16:42

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 8 (class 2615 OID 16394)
-- Name: AVA; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA "AVA";


ALTER SCHEMA "AVA" OWNER TO postgres;

--
-- TOC entry 1 (class 3079 OID 12355)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2167 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = "AVA", pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 183 (class 1259 OID 16475)
-- Name: anno_accademico; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE anno_accademico (
    aa_key integer NOT NULL,
    codice_anno character varying(20),
    nome_anno_x character varying(20),
    nome_anno_x_1 character varying(20),
    nome_anno_x_1_x character varying(20)
);


ALTER TABLE anno_accademico OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 16473)
-- Name: anno_accademico_aa_key_seq; Type: SEQUENCE; Schema: AVA; Owner: postgres
--

CREATE SEQUENCE anno_accademico_aa_key_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE anno_accademico_aa_key_seq OWNER TO postgres;

--
-- TOC entry 2168 (class 0 OID 0)
-- Dependencies: 182
-- Name: anno_accademico_aa_key_seq; Type: SEQUENCE OWNED BY; Schema: AVA; Owner: postgres
--

ALTER SEQUENCE anno_accademico_aa_key_seq OWNED BY anno_accademico.aa_key;


--
-- TOC entry 189 (class 1259 OID 16623)
-- Name: corso; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE corso (
    nome text,
    "Numero CFU" bigint,
    ssd text,
    "Codice Corso" character varying(15),
    id integer NOT NULL
);


ALTER TABLE corso OWNER TO postgres;

--
-- TOC entry 191 (class 1259 OID 16635)
-- Name: corso di studi; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE "corso di studi" (
    id integer NOT NULL,
    "Data inizio validità" date,
    "Data fine validità" date,
    "Nome CdS" character varying(90),
    "Tipo CdS" character varying(67),
    "Nome dipartimento" text,
    "Codice dipartimento" double precision,
    "Codice corso di studi" bigint,
    "Durata legale" double precision,
    "Codice Ateneo" text
);


ALTER TABLE "corso di studi" OWNER TO postgres;

--
-- TOC entry 190 (class 1259 OID 16633)
-- Name: corso di studi_id_seq; Type: SEQUENCE; Schema: AVA; Owner: postgres
--

CREATE SEQUENCE "corso di studi_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "corso di studi_id_seq" OWNER TO postgres;

--
-- TOC entry 2169 (class 0 OID 0)
-- Dependencies: 190
-- Name: corso di studi_id_seq; Type: SEQUENCE OWNED BY; Schema: AVA; Owner: postgres
--

ALTER SEQUENCE "corso di studi_id_seq" OWNED BY "corso di studi".id;


--
-- TOC entry 188 (class 1259 OID 16621)
-- Name: corso_id_seq; Type: SEQUENCE; Schema: AVA; Owner: postgres
--

CREATE SEQUENCE corso_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE corso_id_seq OWNER TO postgres;

--
-- TOC entry 2170 (class 0 OID 0)
-- Dependencies: 188
-- Name: corso_id_seq; Type: SEQUENCE OWNED BY; Schema: AVA; Owner: postgres
--

ALTER SEQUENCE corso_id_seq OWNED BY corso.id;


--
-- TOC entry 194 (class 1259 OID 17030)
-- Name: esami; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE esami (
    tempo integer,
    studente integer,
    corso_di_studi integer,
    corso integer,
    voto_esame bigint,
    cfu_esame bigint
);


ALTER TABLE esami OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 17038)
-- Name: ingressi; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE ingressi (
    tempo integer,
    studente integer,
    corso_di_studi integer,
    anno_accademico integer,
    "Punteggio test ammissione" bigint,
    tipo_immatricolazione integer
);


ALTER TABLE ingressi OWNER TO postgres;

--
-- TOC entry 195 (class 1259 OID 17035)
-- Name: lauree; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE lauree (
    studente integer,
    anno_accademico integer,
    corso_di_studi integer,
    tempo integer,
    voto_laurea smallint
);


ALTER TABLE lauree OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 16601)
-- Name: studente; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE studente (
    id integer NOT NULL,
    "Data di nascita" timestamp without time zone,
    coorte bigint,
    "Titolo di studio" character varying(69),
    sesso character varying(11),
    "Regione residenza" character varying(60),
    "Provincia residenza" character varying(62),
    "Comune residenza" character varying(66),
    "Stato residenza" character varying(66),
    cittadinanza character varying(66),
    "Codice fiscale" character varying(38),
    "Voto scuola media superiore" text,
    "Nazione diploma" character varying(44),
    "Tipo scuola media superiore" text,
    "Istituto scuola media superiore" text,
    "Anno solare conseguimento titolo scuola media superiore" bigint
);


ALTER TABLE studente OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 16599)
-- Name: studente_id_seq; Type: SEQUENCE; Schema: AVA; Owner: postgres
--

CREATE SEQUENCE studente_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE studente_id_seq OWNER TO postgres;

--
-- TOC entry 2171 (class 0 OID 0)
-- Dependencies: 186
-- Name: studente_id_seq; Type: SEQUENCE OWNED BY; Schema: AVA; Owner: postgres
--

ALTER SEQUENCE studente_id_seq OWNED BY studente.id;


--
-- TOC entry 192 (class 1259 OID 16993)
-- Name: tempo; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE tempo (
    date date,
    year double precision,
    month double precision,
    monthname text,
    day double precision,
    dayofyear double precision,
    weekdayname text,
    calendarweek double precision,
    formatteddate text,
    quartal text,
    yearquartal text,
    yearmonth text,
    yearcalendarweek text,
    weekend text,
    americanholiday text,
    austrianholiday text,
    canadianholiday text,
    period text,
    cwstart date,
    cwend date,
    monthstart date,
    monthend timestamp without time zone,
    tempo_key integer NOT NULL
);


ALTER TABLE tempo OWNER TO postgres;

--
-- TOC entry 193 (class 1259 OID 16999)
-- Name: tempo_tempo_key_seq; Type: SEQUENCE; Schema: AVA; Owner: postgres
--

CREATE SEQUENCE tempo_tempo_key_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tempo_tempo_key_seq OWNER TO postgres;

--
-- TOC entry 2172 (class 0 OID 0)
-- Dependencies: 193
-- Name: tempo_tempo_key_seq; Type: SEQUENCE OWNED BY; Schema: AVA; Owner: postgres
--

ALTER SEQUENCE tempo_tempo_key_seq OWNED BY tempo.tempo_key;


--
-- TOC entry 185 (class 1259 OID 16531)
-- Name: tipo immatricolazione; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE "tipo immatricolazione" (
    "Tipo Immatricolazione" character varying(61),
    id integer NOT NULL
);


ALTER TABLE "tipo immatricolazione" OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 16529)
-- Name: tipo immatricolazione_id_seq; Type: SEQUENCE; Schema: AVA; Owner: postgres
--

CREATE SEQUENCE "tipo immatricolazione_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "tipo immatricolazione_id_seq" OWNER TO postgres;

--
-- TOC entry 2173 (class 0 OID 0)
-- Dependencies: 184
-- Name: tipo immatricolazione_id_seq; Type: SEQUENCE OWNED BY; Schema: AVA; Owner: postgres
--

ALTER SEQUENCE "tipo immatricolazione_id_seq" OWNED BY "tipo immatricolazione".id;


--
-- TOC entry 2028 (class 2604 OID 16478)
-- Name: aa_key; Type: DEFAULT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY anno_accademico ALTER COLUMN aa_key SET DEFAULT nextval('anno_accademico_aa_key_seq'::regclass);


--
-- TOC entry 2031 (class 2604 OID 16626)
-- Name: id; Type: DEFAULT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY corso ALTER COLUMN id SET DEFAULT nextval('corso_id_seq'::regclass);


--
-- TOC entry 2032 (class 2604 OID 16638)
-- Name: id; Type: DEFAULT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "corso di studi" ALTER COLUMN id SET DEFAULT nextval('"corso di studi_id_seq"'::regclass);


--
-- TOC entry 2030 (class 2604 OID 16604)
-- Name: id; Type: DEFAULT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY studente ALTER COLUMN id SET DEFAULT nextval('studente_id_seq'::regclass);


--
-- TOC entry 2033 (class 2604 OID 17001)
-- Name: tempo_key; Type: DEFAULT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY tempo ALTER COLUMN tempo_key SET DEFAULT nextval('tempo_tempo_key_seq'::regclass);


--
-- TOC entry 2029 (class 2604 OID 16534)
-- Name: id; Type: DEFAULT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "tipo immatricolazione" ALTER COLUMN id SET DEFAULT nextval('"tipo immatricolazione_id_seq"'::regclass);


--
-- TOC entry 2035 (class 2606 OID 16480)
-- Name: anno_accademico_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY anno_accademico
    ADD CONSTRAINT anno_accademico_pkey PRIMARY KEY (aa_key);


--
-- TOC entry 2043 (class 2606 OID 16643)
-- Name: corso di studi_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "corso di studi"
    ADD CONSTRAINT "corso di studi_pkey" PRIMARY KEY (id);


--
-- TOC entry 2041 (class 2606 OID 16631)
-- Name: corso_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY corso
    ADD CONSTRAINT corso_pkey PRIMARY KEY (id);


--
-- TOC entry 2039 (class 2606 OID 16609)
-- Name: studente_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY studente
    ADD CONSTRAINT studente_pkey PRIMARY KEY (id);


--
-- TOC entry 2045 (class 2606 OID 17009)
-- Name: tempo_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY tempo
    ADD CONSTRAINT tempo_pkey PRIMARY KEY (tempo_key);


--
-- TOC entry 2037 (class 2606 OID 16536)
-- Name: tipo immatricolazione_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "tipo immatricolazione"
    ADD CONSTRAINT "tipo immatricolazione_pkey" PRIMARY KEY (id);


--
-- TOC entry 2166 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2016-04-02 17:16:44

--
-- PostgreSQL database dump complete
--

