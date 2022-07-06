START TRANSACTION;


-- Started on 2022-06-08 15:53:44

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

--
-- TOC entry 196 (class 1259 OID 81787)
-- Name: atendente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.atendente (
    id_atendente bigint NOT NULL,
    nome text NOT NULL,
    cpf text NOT NULL,
    matricula text NOT NULL
);


ALTER TABLE public.atendente OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 81793)
-- Name: atendente_id_atendente_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.atendente_id_atendente_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.atendente_id_atendente_seq OWNER TO postgres;

--
-- TOC entry 2921 (class 0 OID 0)
-- Dependencies: 197
-- Name: atendente_id_atendente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.atendente_id_atendente_seq OWNED BY public.atendente.id_atendente;


--
-- TOC entry 198 (class 1259 OID 81795)
-- Name: autor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.autor (
    id_autor integer NOT NULL,
    nome character varying(255)
);


ALTER TABLE public.autor OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 81798)
-- Name: autor_id_autor_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.autor_id_autor_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.autor_id_autor_seq OWNER TO postgres;

--
-- TOC entry 2922 (class 0 OID 0)
-- Dependencies: 199
-- Name: autor_id_autor_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.autor_id_autor_seq OWNED BY public.autor.id_autor;


--
-- TOC entry 200 (class 1259 OID 81800)
-- Name: devolucao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.devolucao (
    id_emprestimo integer NOT NULL,
    data_devolucao timestamp without time zone NOT NULL,
    id_atendente integer
);


ALTER TABLE public.devolucao OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 81803)
-- Name: editora; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.editora (
    id_editora integer NOT NULL,
    nome character varying(255),
    cidade character varying(200)
);


ALTER TABLE public.editora OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 81806)
-- Name: editora_id_editora_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.editora_id_editora_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.editora_id_editora_seq OWNER TO postgres;

--
-- TOC entry 2923 (class 0 OID 0)
-- Dependencies: 202
-- Name: editora_id_editora_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.editora_id_editora_seq OWNED BY public.editora.id_editora;


--
-- TOC entry 203 (class 1259 OID 81808)
-- Name: emprestimo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.emprestimo (
    id_emprestimo integer NOT NULL,
    id_usuario integer,
    id_filial integer,
    id_obra integer,
    numero_exemplar integer,
    data_emprestimo timestamp without time zone,
    data_prevista_retorno date,
    id_atendente integer
);


ALTER TABLE public.emprestimo OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 81811)
-- Name: emprestimo_id_emprestimo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.emprestimo_id_emprestimo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.emprestimo_id_emprestimo_seq OWNER TO postgres;

--
-- TOC entry 2924 (class 0 OID 0)
-- Dependencies: 204
-- Name: emprestimo_id_emprestimo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.emprestimo_id_emprestimo_seq OWNED BY public.emprestimo.id_emprestimo;


--
-- TOC entry 205 (class 1259 OID 81813)
-- Name: exemplar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.exemplar (
    id_obra integer NOT NULL,
    numero_exemplar integer NOT NULL,
    id_filial integer,
    data_aquisicao date,
    situacao character varying(20)
);


ALTER TABLE public.exemplar OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 81816)
-- Name: filial; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.filial (
    id_filial integer NOT NULL,
    nome_fantasia character varying(200),
    razao_social character varying(200),
    cnpj character varying(20)
);


ALTER TABLE public.filial OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 81819)
-- Name: filial_id_filial_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.filial_id_filial_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.filial_id_filial_seq OWNER TO postgres;

--
-- TOC entry 2925 (class 0 OID 0)
-- Dependencies: 207
-- Name: filial_id_filial_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.filial_id_filial_seq OWNED BY public.filial.id_filial;


--
-- TOC entry 208 (class 1259 OID 81821)
-- Name: genero; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.genero (
    id_genero integer NOT NULL,
    descricao character varying(100)
);


ALTER TABLE public.genero OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 81824)
-- Name: genero_id_genero_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.genero_id_genero_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.genero_id_genero_seq OWNER TO postgres;

--
-- TOC entry 2926 (class 0 OID 0)
-- Dependencies: 209
-- Name: genero_id_genero_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.genero_id_genero_seq OWNED BY public.genero.id_genero;


--
-- TOC entry 210 (class 1259 OID 81826)
-- Name: obra; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.obra (
    id_obra integer NOT NULL,
    id_editora integer,
    titulo character varying(200),
    subtitulo character varying(200),
    codigo_isbn character varying(200)
);


ALTER TABLE public.obra OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 81832)
-- Name: obra_autor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.obra_autor (
    id_obra integer NOT NULL,
    id_autor integer NOT NULL
);


ALTER TABLE public.obra_autor OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 81835)
-- Name: obra_genero; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.obra_genero (
    id_obra integer NOT NULL,
    id_genero integer NOT NULL
);


ALTER TABLE public.obra_genero OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 81838)
-- Name: obra_id_obra_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.obra_id_obra_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.obra_id_obra_seq OWNER TO postgres;

--
-- TOC entry 2927 (class 0 OID 0)
-- Dependencies: 213
-- Name: obra_id_obra_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.obra_id_obra_seq OWNED BY public.obra.id_obra;


--
-- TOC entry 214 (class 1259 OID 81840)
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario (
    id_usuario integer NOT NULL,
    nome character varying(255),
    cpf character varying(20) NOT NULL,
    data_nascimento date,
    genero character(1),
    email character varying(100),
    telefone character varying(50)
);


ALTER TABLE public.usuario OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 81843)
-- Name: usuario_id_usuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuario_id_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuario_id_usuario_seq OWNER TO postgres;

--
-- TOC entry 2928 (class 0 OID 0)
-- Dependencies: 215
-- Name: usuario_id_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuario_id_usuario_seq OWNED BY public.usuario.id_usuario;


--
-- TOC entry 2730 (class 2604 OID 81845)
-- Name: atendente id_atendente; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.atendente ALTER COLUMN id_atendente SET DEFAULT nextval('public.atendente_id_atendente_seq'::regclass);


--
-- TOC entry 2731 (class 2604 OID 81846)
-- Name: autor id_autor; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autor ALTER COLUMN id_autor SET DEFAULT nextval('public.autor_id_autor_seq'::regclass);


--
-- TOC entry 2732 (class 2604 OID 81847)
-- Name: editora id_editora; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.editora ALTER COLUMN id_editora SET DEFAULT nextval('public.editora_id_editora_seq'::regclass);


--
-- TOC entry 2733 (class 2604 OID 81848)
-- Name: emprestimo id_emprestimo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emprestimo ALTER COLUMN id_emprestimo SET DEFAULT nextval('public.emprestimo_id_emprestimo_seq'::regclass);


--
-- TOC entry 2734 (class 2604 OID 81849)
-- Name: filial id_filial; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.filial ALTER COLUMN id_filial SET DEFAULT nextval('public.filial_id_filial_seq'::regclass);


--
-- TOC entry 2735 (class 2604 OID 81850)
-- Name: genero id_genero; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genero ALTER COLUMN id_genero SET DEFAULT nextval('public.genero_id_genero_seq'::regclass);


--
-- TOC entry 2736 (class 2604 OID 81851)
-- Name: obra id_obra; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.obra ALTER COLUMN id_obra SET DEFAULT nextval('public.obra_id_obra_seq'::regclass);


--
-- TOC entry 2737 (class 2604 OID 81852)
-- Name: usuario id_usuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario ALTER COLUMN id_usuario SET DEFAULT nextval('public.usuario_id_usuario_seq'::regclass);


--
-- TOC entry 2896 (class 0 OID 81787)
-- Dependencies: 196
-- Data for Name: atendente; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.atendente VALUES (2, 'Isis Valverde', '09955539966', '78910');
INSERT INTO public.atendente VALUES (4, 'Rebeca Ferguson', '01155649966', '232345');
INSERT INTO public.atendente VALUES (3, 'Charlize Theron', '09955539966', '363638');
INSERT INTO public.atendente VALUES (1, 'Magaly Lima', '02155539945', '123456');


--
-- TOC entry 2898 (class 0 OID 81795)
-- Dependencies: 198
-- Data for Name: autor; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.autor VALUES (1, 'Stephen King');
INSERT INTO public.autor VALUES (2, 'Sidney Sheldon');
INSERT INTO public.autor VALUES (3, 'J. R. R. Tolkien');


--
-- TOC entry 2900 (class 0 OID 81800)
-- Dependencies: 200
-- Data for Name: devolucao; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.devolucao VALUES (1, '2018-07-08 00:00:00', 1);
INSERT INTO public.devolucao VALUES (2, '2021-05-31 00:00:00', 2);
INSERT INTO public.devolucao VALUES (3, '2021-06-06 00:00:00', 3);
INSERT INTO public.devolucao VALUES (4, '2021-06-11 00:00:00', 4);
INSERT INTO public.devolucao VALUES (6, '2021-06-29 00:00:00', 2);
INSERT INTO public.devolucao VALUES (7, '2021-07-05 00:00:00', 4);
INSERT INTO public.devolucao VALUES (8, '2021-07-11 00:00:00', 1);
INSERT INTO public.devolucao VALUES (9, '2021-07-26 00:00:00', 3);
INSERT INTO public.devolucao VALUES (10, '2021-07-31 00:00:00', 4);
INSERT INTO public.devolucao VALUES (12, '2021-08-10 00:00:00', 3);
INSERT INTO public.devolucao VALUES (13, '2021-08-26 00:00:00', 2);
INSERT INTO public.devolucao VALUES (14, '2021-09-08 00:00:00', 1);
INSERT INTO public.devolucao VALUES (15, '2021-09-08 00:00:00', 4);
INSERT INTO public.devolucao VALUES (16, '2021-10-04 00:00:00', 1);
INSERT INTO public.devolucao VALUES (18, '2021-10-28 00:00:00', 3);
INSERT INTO public.devolucao VALUES (19, '2021-11-02 00:00:00', 2);


--
-- TOC entry 2901 (class 0 OID 81803)
-- Dependencies: 201
-- Data for Name: editora; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.editora VALUES (1, 'Novo século', 'São Paulo');
INSERT INTO public.editora VALUES (2, 'Imago', 'São Paulo');
INSERT INTO public.editora VALUES (3, 'FTD', 'São Paulo');


--
-- TOC entry 2903 (class 0 OID 81808)
-- Dependencies: 203
-- Data for Name: emprestimo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.emprestimo VALUES (1, 2, 1, 3, 1, '2017-07-01 00:00:00', '2017-08-08', 1);
INSERT INTO public.emprestimo VALUES (2, 1, 2, 1, 2, '2021-05-24 00:00:00', '2021-05-31', 2);
INSERT INTO public.emprestimo VALUES (3, 3, 3, 4, 2, '2021-05-30 00:00:00', '2021-06-06', 3);
INSERT INTO public.emprestimo VALUES (4, 4, 4, 5, 3, '2021-06-04 00:00:00', '2021-06-11', 4);
INSERT INTO public.emprestimo VALUES (5, 5, 1, 6, 4, '2021-06-17 00:00:00', '2021-06-24', 1);
INSERT INTO public.emprestimo VALUES (6, 2, 1, 6, 2, '2021-06-22 00:00:00', '2021-06-29', 2);
INSERT INTO public.emprestimo VALUES (7, 3, 3, 7, 1, '2021-06-28 00:00:00', '2021-07-05', 3);
INSERT INTO public.emprestimo VALUES (8, 3, 3, 8, 1, '2021-07-04 00:00:00', '2021-07-11', 4);
INSERT INTO public.emprestimo VALUES (9, 4, 4, 3, 2, '2021-07-19 00:00:00', '2021-07-26', 2);
INSERT INTO public.emprestimo VALUES (10, 4, 4, 4, 1, '2021-07-24 00:00:00', '2021-07-31', 1);
INSERT INTO public.emprestimo VALUES (11, 4, 4, 6, 3, '2022-07-30 00:00:00', '2022-08-06', 4);
INSERT INTO public.emprestimo VALUES (12, 5, 1, 8, 1, '2021-08-03 00:00:00', '2021-08-10', 3);
INSERT INTO public.emprestimo VALUES (13, 5, 1, 7, 2, '2021-08-19 00:00:00', '2021-08-26', 3);
INSERT INTO public.emprestimo VALUES (14, 1, 2, 2, 1, '2021-08-25 00:00:00', '2021-09-08', 3);
INSERT INTO public.emprestimo VALUES (15, 1, 2, 3, 1, '2021-08-25 00:00:00', '2021-09-08', 1);
INSERT INTO public.emprestimo VALUES (16, 2, 1, 2, 4, '2021-09-27 00:00:00', '2021-10-04', 2);
INSERT INTO public.emprestimo VALUES (17, 2, 1, 4, 1, '2021-10-01 00:00:00', '2021-10-08', 4);
INSERT INTO public.emprestimo VALUES (18, 5, 3, 1, 1, '2021-10-21 00:00:00', '2021-10-28', 2);
INSERT INTO public.emprestimo VALUES (19, 2, 3, 1, 2, '2021-10-26 00:00:00', '2021-11-02', 3);
INSERT INTO public.emprestimo VALUES (20, 2, 3, 8, 1, '2021-11-01 00:00:00', '2021-11-08', 1);


--
-- TOC entry 2905 (class 0 OID 81813)
-- Dependencies: 205
-- Data for Name: exemplar; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.exemplar VALUES (1, 1, NULL, '2018-01-01', 'Ativo');
INSERT INTO public.exemplar VALUES (1, 2, NULL, '2018-02-02', 'Ativo');
INSERT INTO public.exemplar VALUES (2, 1, NULL, '2018-03-03', 'Inativo');
INSERT INTO public.exemplar VALUES (2, 2, NULL, '2018-03-04', 'Ativo');
INSERT INTO public.exemplar VALUES (2, 3, NULL, '2018-04-05', 'Ativo');
INSERT INTO public.exemplar VALUES (2, 4, NULL, '2018-01-06', 'Ativo');
INSERT INTO public.exemplar VALUES (3, 1, NULL, '2018-01-07', 'Ativo');
INSERT INTO public.exemplar VALUES (3, 2, NULL, '2018-01-08', 'Ativo');
INSERT INTO public.exemplar VALUES (3, 3, NULL, '2018-01-09', 'Ativo');
INSERT INTO public.exemplar VALUES (4, 1, NULL, '2018-02-10', 'Ativo');
INSERT INTO public.exemplar VALUES (4, 2, NULL, '2018-02-11', 'Ativo');
INSERT INTO public.exemplar VALUES (5, 1, NULL, '2018-03-12', 'Ativo');
INSERT INTO public.exemplar VALUES (5, 2, NULL, '2018-03-13', 'Inativo');
INSERT INTO public.exemplar VALUES (5, 3, NULL, '2018-03-14', 'Ativo');
INSERT INTO public.exemplar VALUES (6, 1, NULL, '2018-04-12', 'Ativo');
INSERT INTO public.exemplar VALUES (6, 2, NULL, '2018-04-13', 'Ativo');
INSERT INTO public.exemplar VALUES (6, 3, NULL, '2018-04-14', 'Ativo');
INSERT INTO public.exemplar VALUES (6, 4, NULL, '2018-04-15', 'Ativo');
INSERT INTO public.exemplar VALUES (7, 1, NULL, '2018-05-13', 'Ativo');
INSERT INTO public.exemplar VALUES (7, 2, NULL, '2018-05-14', 'Ativo');
INSERT INTO public.exemplar VALUES (7, 3, NULL, '2018-05-15', 'Inativo');
INSERT INTO public.exemplar VALUES (8, 1, NULL, '2018-03-13', 'Ativo');


--
-- TOC entry 2906 (class 0 OID 81816)
-- Dependencies: 206
-- Data for Name: filial; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.filial VALUES (1, 'Filial 001', 'Biblioteca institucional - Filial 001', '70.368.538/0001-39');
INSERT INTO public.filial VALUES (2, 'Filial 002', 'Biblioteca institucional - Filial 002', '70.368.538/0001-40');
INSERT INTO public.filial VALUES (3, 'Filial 003', 'Biblioteca institucional - Filial 003', '70.368.538/0001-41');
INSERT INTO public.filial VALUES (4, 'Filial 004', 'Biblioteca institucional - Filial 004', '70.368.538/0001-42');


--
-- TOC entry 2908 (class 0 OID 81821)
-- Dependencies: 208
-- Data for Name: genero; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.genero VALUES (1, 'Ficção científica');
INSERT INTO public.genero VALUES (2, 'Aventura');
INSERT INTO public.genero VALUES (3, 'Fantasia');
INSERT INTO public.genero VALUES (4, 'Terror');
INSERT INTO public.genero VALUES (5, 'Romance');
INSERT INTO public.genero VALUES (6, 'Suspense');


--
-- TOC entry 2910 (class 0 OID 81826)
-- Dependencies: 210
-- Data for Name: obra; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.obra VALUES (1, 1, 'O Hobbit', '', '111111');
INSERT INTO public.obra VALUES (2, 1, 'O Silmarillion', '', '222222');
INSERT INTO public.obra VALUES (3, 2, 'O Iluminado', '', '3333333');
INSERT INTO public.obra VALUES (4, 2, 'O cemitério', '', '4444444');
INSERT INTO public.obra VALUES (5, 2, 'A Torre Negra', 'O Pistoleiro', '55555555');
INSERT INTO public.obra VALUES (6, 3, 'Se houver amanhã', '', '6666666');
INSERT INTO public.obra VALUES (7, 3, 'A outra face', '', '7777777');
INSERT INTO public.obra VALUES (8, 3, 'AS areias do tempo', '', '88888888');


--
-- TOC entry 2911 (class 0 OID 81832)
-- Dependencies: 211
-- Data for Name: obra_autor; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.obra_autor VALUES (1, 3);
INSERT INTO public.obra_autor VALUES (2, 3);
INSERT INTO public.obra_autor VALUES (3, 1);
INSERT INTO public.obra_autor VALUES (4, 1);
INSERT INTO public.obra_autor VALUES (5, 1);
INSERT INTO public.obra_autor VALUES (6, 2);
INSERT INTO public.obra_autor VALUES (7, 2);
INSERT INTO public.obra_autor VALUES (8, 2);


--
-- TOC entry 2912 (class 0 OID 81835)
-- Dependencies: 212
-- Data for Name: obra_genero; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.obra_genero VALUES (1, 2);
INSERT INTO public.obra_genero VALUES (1, 3);
INSERT INTO public.obra_genero VALUES (2, 2);
INSERT INTO public.obra_genero VALUES (2, 3);
INSERT INTO public.obra_genero VALUES (3, 1);
INSERT INTO public.obra_genero VALUES (3, 4);
INSERT INTO public.obra_genero VALUES (3, 6);
INSERT INTO public.obra_genero VALUES (4, 1);
INSERT INTO public.obra_genero VALUES (4, 4);
INSERT INTO public.obra_genero VALUES (4, 6);
INSERT INTO public.obra_genero VALUES (5, 1);
INSERT INTO public.obra_genero VALUES (5, 2);
INSERT INTO public.obra_genero VALUES (5, 3);
INSERT INTO public.obra_genero VALUES (6, 3);
INSERT INTO public.obra_genero VALUES (6, 5);
INSERT INTO public.obra_genero VALUES (7, 3);
INSERT INTO public.obra_genero VALUES (7, 5);
INSERT INTO public.obra_genero VALUES (8, 3);
INSERT INTO public.obra_genero VALUES (8, 5);


--
-- TOC entry 2914 (class 0 OID 81840)
-- Dependencies: 214
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.usuario VALUES (2, 'Maria', '222.222.222-22', '1981-01-01', 'F', 'maria@teste.com', '(48)888888888');
INSERT INTO public.usuario VALUES (3, 'José', '333.333.333-33', '1970-12-31', 'M', 'jose@teste.com', '(48)777777777');
INSERT INTO public.usuario VALUES (4, 'Bruna', '444.444.444-44', '1992-06-01', 'F', 'bruna@teste.com', '(48)666666666');
INSERT INTO public.usuario VALUES (5, 'Marcos', '555.555.555-55', NULL, NULL, NULL, NULL);
INSERT INTO public.usuario VALUES (1, 'João', '111.111.111-11', NULL, NULL, NULL, NULL);


--
-- TOC entry 2929 (class 0 OID 0)
-- Dependencies: 197
-- Name: atendente_id_atendente_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.atendente_id_atendente_seq', 4, true);


--
-- TOC entry 2930 (class 0 OID 0)
-- Dependencies: 199
-- Name: autor_id_autor_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.autor_id_autor_seq', 3, true);


--
-- TOC entry 2931 (class 0 OID 0)
-- Dependencies: 202
-- Name: editora_id_editora_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.editora_id_editora_seq', 3, true);


--
-- TOC entry 2932 (class 0 OID 0)
-- Dependencies: 204
-- Name: emprestimo_id_emprestimo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.emprestimo_id_emprestimo_seq', 20, true);


--
-- TOC entry 2933 (class 0 OID 0)
-- Dependencies: 207
-- Name: filial_id_filial_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.filial_id_filial_seq', 4, true);


--
-- TOC entry 2934 (class 0 OID 0)
-- Dependencies: 209
-- Name: genero_id_genero_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.genero_id_genero_seq', 6, true);


--
-- TOC entry 2935 (class 0 OID 0)
-- Dependencies: 213
-- Name: obra_id_obra_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.obra_id_obra_seq', 8, true);


--
-- TOC entry 2936 (class 0 OID 0)
-- Dependencies: 215
-- Name: usuario_id_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuario_id_usuario_seq', 5, true);


--
-- TOC entry 2739 (class 2606 OID 81854)
-- Name: atendente atendente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.atendente
    ADD CONSTRAINT atendente_pkey PRIMARY KEY (id_atendente);


--
-- TOC entry 2741 (class 2606 OID 81856)
-- Name: autor autor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autor
    ADD CONSTRAINT autor_pkey PRIMARY KEY (id_autor);


--
-- TOC entry 2743 (class 2606 OID 81858)
-- Name: devolucao devolucao_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.devolucao
    ADD CONSTRAINT devolucao_pkey PRIMARY KEY (id_emprestimo);


--
-- TOC entry 2745 (class 2606 OID 81860)
-- Name: editora editora_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.editora
    ADD CONSTRAINT editora_pkey PRIMARY KEY (id_editora);


--
-- TOC entry 2747 (class 2606 OID 81862)
-- Name: emprestimo emprestimo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emprestimo
    ADD CONSTRAINT emprestimo_pkey PRIMARY KEY (id_emprestimo);


--
-- TOC entry 2749 (class 2606 OID 81864)
-- Name: exemplar exemplar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exemplar
    ADD CONSTRAINT exemplar_pkey PRIMARY KEY (id_obra, numero_exemplar);


--
-- TOC entry 2751 (class 2606 OID 81866)
-- Name: filial filial_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.filial
    ADD CONSTRAINT filial_pkey PRIMARY KEY (id_filial);


--
-- TOC entry 2753 (class 2606 OID 81868)
-- Name: genero genero_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genero
    ADD CONSTRAINT genero_pkey PRIMARY KEY (id_genero);


--
-- TOC entry 2757 (class 2606 OID 81870)
-- Name: obra_autor obra_autor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.obra_autor
    ADD CONSTRAINT obra_autor_pkey PRIMARY KEY (id_obra, id_autor);


--
-- TOC entry 2759 (class 2606 OID 81872)
-- Name: obra_genero obra_genero_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.obra_genero
    ADD CONSTRAINT obra_genero_pkey PRIMARY KEY (id_obra, id_genero);


--
-- TOC entry 2755 (class 2606 OID 81874)
-- Name: obra obra_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.obra
    ADD CONSTRAINT obra_pkey PRIMARY KEY (id_obra);


--
-- TOC entry 2761 (class 2606 OID 81876)
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id_usuario);


--
-- TOC entry 2762 (class 2606 OID 81877)
-- Name: devolucao devolucao_id_emprestimo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.devolucao
    ADD CONSTRAINT devolucao_id_emprestimo_fkey FOREIGN KEY (id_emprestimo) REFERENCES public.emprestimo(id_emprestimo) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2763 (class 2606 OID 81882)
-- Name: devolucao devoulacoao_pa_atendente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.devolucao
    ADD CONSTRAINT devoulacoao_pa_atendente_fkey FOREIGN KEY (id_atendente) REFERENCES public.atendente(id_atendente);


--
-- TOC entry 2764 (class 2606 OID 81887)
-- Name: emprestimo emprestimo_id_filial_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emprestimo
    ADD CONSTRAINT emprestimo_id_filial_fkey FOREIGN KEY (id_filial) REFERENCES public.filial(id_filial) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2765 (class 2606 OID 81892)
-- Name: emprestimo emprestimo_id_obra_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emprestimo
    ADD CONSTRAINT emprestimo_id_obra_fkey FOREIGN KEY (id_obra, numero_exemplar) REFERENCES public.exemplar(id_obra, numero_exemplar) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2766 (class 2606 OID 81897)
-- Name: emprestimo emprestimo_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emprestimo
    ADD CONSTRAINT emprestimo_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2767 (class 2606 OID 81902)
-- Name: emprestimo emprestimo_pa_atendente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emprestimo
    ADD CONSTRAINT emprestimo_pa_atendente_fkey FOREIGN KEY (id_atendente) REFERENCES public.atendente(id_atendente) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2768 (class 2606 OID 81907)
-- Name: exemplar exemplar_id_filial_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exemplar
    ADD CONSTRAINT exemplar_id_filial_fkey FOREIGN KEY (id_filial) REFERENCES public.filial(id_filial) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2769 (class 2606 OID 81912)
-- Name: exemplar exemplar_id_obra_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exemplar
    ADD CONSTRAINT exemplar_id_obra_fkey FOREIGN KEY (id_obra) REFERENCES public.obra(id_obra) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2771 (class 2606 OID 81917)
-- Name: obra_autor obra_autor_id_autor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.obra_autor
    ADD CONSTRAINT obra_autor_id_autor_fkey FOREIGN KEY (id_autor) REFERENCES public.autor(id_autor) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2772 (class 2606 OID 81922)
-- Name: obra_autor obra_autor_id_obra_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.obra_autor
    ADD CONSTRAINT obra_autor_id_obra_fkey FOREIGN KEY (id_obra) REFERENCES public.obra(id_obra) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2773 (class 2606 OID 81927)
-- Name: obra_genero obra_genero_id_genero_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.obra_genero
    ADD CONSTRAINT obra_genero_id_genero_fkey FOREIGN KEY (id_genero) REFERENCES public.genero(id_genero) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2774 (class 2606 OID 81932)
-- Name: obra_genero obra_genero_id_obra_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.obra_genero
    ADD CONSTRAINT obra_genero_id_obra_fkey FOREIGN KEY (id_obra) REFERENCES public.obra(id_obra) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2770 (class 2606 OID 81937)
-- Name: obra obra_id_editora_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.obra
    ADD CONSTRAINT obra_id_editora_fkey FOREIGN KEY (id_editora) REFERENCES public.editora(id_editora) DEFERRABLE INITIALLY DEFERRED;


COMMIT;