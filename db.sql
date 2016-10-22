--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: active_admin_comments; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE active_admin_comments (
    id integer NOT NULL,
    namespace character varying,
    body text,
    resource_id character varying NOT NULL,
    resource_type character varying NOT NULL,
    author_type character varying,
    author_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.active_admin_comments OWNER TO ubuntu;

--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE active_admin_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_admin_comments_id_seq OWNER TO ubuntu;

--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE active_admin_comments_id_seq OWNED BY active_admin_comments.id;


--
-- Name: admin_users; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE admin_users (
    id integer NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying,
    last_sign_in_ip character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.admin_users OWNER TO ubuntu;

--
-- Name: admin_users_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE admin_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_users_id_seq OWNER TO ubuntu;

--
-- Name: admin_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE admin_users_id_seq OWNED BY admin_users.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO ubuntu;

--
-- Name: campeurs; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE campeurs (
    id integer NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying,
    last_sign_in_ip character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    name character varying,
    gender character varying,
    adresse character varying,
    ville character varying,
    cp character varying,
    surname character varying,
    telephone integer,
    birthday date,
    description text,
    fonction character varying,
    verified boolean
);


ALTER TABLE public.campeurs OWNER TO ubuntu;

--
-- Name: campeurs_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE campeurs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.campeurs_id_seq OWNER TO ubuntu;

--
-- Name: campeurs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE campeurs_id_seq OWNED BY campeurs.id;


--
-- Name: campings; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE campings (
    id integer NOT NULL,
    name character varying,
    adresse character varying,
    code_postale character varying,
    commune character varying,
    courriel character varying,
    site_internet character varying,
    tel character varying,
    description text,
    nomdep character varying,
    nomregion character varying,
    numdep character varying,
    slug character varying,
    ville_id integer,
    region_id integer,
    departement_id integer,
    latitude double precision,
    longitude double precision,
    etoile character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    image character varying,
    emplacement integer,
    proprietaire_id integer,
    caracteristiquetest_id integer,
    image_file_name character varying,
    image_content_type character varying,
    image_file_size integer,
    image_updated_at timestamp without time zone,
    adressecomplete character varying,
    piscine character varying,
    barbecue character varying,
    youtube_url character varying
);


ALTER TABLE public.campings OWNER TO ubuntu;

--
-- Name: campings_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE campings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.campings_id_seq OWNER TO ubuntu;

--
-- Name: campings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE campings_id_seq OWNED BY campings.id;


--
-- Name: caracteristiquetests; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE caracteristiquetests (
    id integer NOT NULL,
    piscine character varying,
    barbecue character varying,
    camping_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    handicap character varying,
    animaux character varying,
    television character varying
);


ALTER TABLE public.caracteristiquetests OWNER TO ubuntu;

--
-- Name: caracteristiquetests_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE caracteristiquetests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.caracteristiquetests_id_seq OWNER TO ubuntu;

--
-- Name: caracteristiquetests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE caracteristiquetests_id_seq OWNED BY caracteristiquetests.id;


--
-- Name: departements; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE departements (
    id integer NOT NULL,
    description text,
    nomdep character varying,
    departement_id integer,
    slug character varying,
    region_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.departements OWNER TO ubuntu;

--
-- Name: departements_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE departements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.departements_id_seq OWNER TO ubuntu;

--
-- Name: departements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE departements_id_seq OWNED BY departements.id;


--
-- Name: mailboxer_conversation_opt_outs; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE mailboxer_conversation_opt_outs (
    id integer NOT NULL,
    unsubscriber_type character varying,
    unsubscriber_id integer,
    conversation_id integer
);


ALTER TABLE public.mailboxer_conversation_opt_outs OWNER TO ubuntu;

--
-- Name: mailboxer_conversation_opt_outs_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE mailboxer_conversation_opt_outs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mailboxer_conversation_opt_outs_id_seq OWNER TO ubuntu;

--
-- Name: mailboxer_conversation_opt_outs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE mailboxer_conversation_opt_outs_id_seq OWNED BY mailboxer_conversation_opt_outs.id;


--
-- Name: mailboxer_conversations; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE mailboxer_conversations (
    id integer NOT NULL,
    subject character varying DEFAULT ''::character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.mailboxer_conversations OWNER TO ubuntu;

--
-- Name: mailboxer_conversations_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE mailboxer_conversations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mailboxer_conversations_id_seq OWNER TO ubuntu;

--
-- Name: mailboxer_conversations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE mailboxer_conversations_id_seq OWNED BY mailboxer_conversations.id;


--
-- Name: mailboxer_notifications; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE mailboxer_notifications (
    id integer NOT NULL,
    type character varying,
    body text,
    subject character varying DEFAULT ''::character varying,
    sender_type character varying,
    sender_id integer,
    conversation_id integer,
    draft boolean DEFAULT false,
    notification_code character varying,
    notified_object_type character varying,
    notified_object_id integer,
    attachment character varying,
    updated_at timestamp without time zone NOT NULL,
    created_at timestamp without time zone NOT NULL,
    global boolean DEFAULT false,
    expires timestamp without time zone
);


ALTER TABLE public.mailboxer_notifications OWNER TO ubuntu;

--
-- Name: mailboxer_notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE mailboxer_notifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mailboxer_notifications_id_seq OWNER TO ubuntu;

--
-- Name: mailboxer_notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE mailboxer_notifications_id_seq OWNED BY mailboxer_notifications.id;


--
-- Name: mailboxer_receipts; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE mailboxer_receipts (
    id integer NOT NULL,
    receiver_type character varying,
    receiver_id integer,
    notification_id integer NOT NULL,
    is_read boolean DEFAULT false,
    trashed boolean DEFAULT false,
    deleted boolean DEFAULT false,
    mailbox_type character varying(25),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    is_delivered boolean DEFAULT false,
    delivery_method character varying,
    message_id character varying
);


ALTER TABLE public.mailboxer_receipts OWNER TO ubuntu;

--
-- Name: mailboxer_receipts_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE mailboxer_receipts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mailboxer_receipts_id_seq OWNER TO ubuntu;

--
-- Name: mailboxer_receipts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE mailboxer_receipts_id_seq OWNED BY mailboxer_receipts.id;


--
-- Name: proprietaires; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE proprietaires (
    id integer NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying,
    last_sign_in_ip character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    name character varying,
    gender character varying,
    adresse character varying,
    ville character varying,
    cp character varying,
    surname character varying,
    telephone integer,
    birthday date,
    description text,
    fonction character varying,
    verified boolean
);


ALTER TABLE public.proprietaires OWNER TO ubuntu;

--
-- Name: proprietaires_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE proprietaires_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.proprietaires_id_seq OWNER TO ubuntu;

--
-- Name: proprietaires_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE proprietaires_id_seq OWNED BY proprietaires.id;


--
-- Name: proprietaires_roles; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE proprietaires_roles (
    proprietaire_id integer,
    role_id integer
);


ALTER TABLE public.proprietaires_roles OWNER TO ubuntu;

--
-- Name: regions; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE regions (
    id integer NOT NULL,
    descriptionregion text,
    nomderegion character varying,
    slug character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.regions OWNER TO ubuntu;

--
-- Name: regions_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE regions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.regions_id_seq OWNER TO ubuntu;

--
-- Name: regions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE regions_id_seq OWNED BY regions.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE roles (
    id integer NOT NULL,
    name character varying,
    resource_type character varying,
    resource_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.roles OWNER TO ubuntu;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO ubuntu;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE roles_id_seq OWNED BY roles.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO ubuntu;

--
-- Name: situations; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE situations (
    id integer NOT NULL,
    plage character varying,
    distanceplage double precision,
    etang character varying,
    distanceetang double precision,
    lac character varying,
    distancelac double precision,
    riviere character varying,
    distanceriviere double precision,
    baseloisir character varying,
    distancebaseloisir double precision,
    foret character varying,
    distanceforet double precision,
    parcnaturel character varying,
    distanceparcnaturel double precision,
    montagne character varying,
    distancemontagne double precision,
    sporthiver character varying,
    distancesporthiver double precision,
    camping_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.situations OWNER TO ubuntu;

--
-- Name: situations_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE situations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.situations_id_seq OWNER TO ubuntu;

--
-- Name: situations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE situations_id_seq OWNED BY situations.id;


--
-- Name: villes; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE villes (
    id integer NOT NULL,
    nomcommune text,
    description text,
    nomdep character varying,
    departement_id integer,
    code_postale integer,
    region text,
    region_id integer,
    slug text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.villes OWNER TO ubuntu;

--
-- Name: villes_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE villes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.villes_id_seq OWNER TO ubuntu;

--
-- Name: villes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE villes_id_seq OWNED BY villes.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY active_admin_comments ALTER COLUMN id SET DEFAULT nextval('active_admin_comments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY admin_users ALTER COLUMN id SET DEFAULT nextval('admin_users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY campeurs ALTER COLUMN id SET DEFAULT nextval('campeurs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY campings ALTER COLUMN id SET DEFAULT nextval('campings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY caracteristiquetests ALTER COLUMN id SET DEFAULT nextval('caracteristiquetests_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY departements ALTER COLUMN id SET DEFAULT nextval('departements_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY mailboxer_conversation_opt_outs ALTER COLUMN id SET DEFAULT nextval('mailboxer_conversation_opt_outs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY mailboxer_conversations ALTER COLUMN id SET DEFAULT nextval('mailboxer_conversations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY mailboxer_notifications ALTER COLUMN id SET DEFAULT nextval('mailboxer_notifications_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY mailboxer_receipts ALTER COLUMN id SET DEFAULT nextval('mailboxer_receipts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY proprietaires ALTER COLUMN id SET DEFAULT nextval('proprietaires_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY regions ALTER COLUMN id SET DEFAULT nextval('regions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY roles ALTER COLUMN id SET DEFAULT nextval('roles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY situations ALTER COLUMN id SET DEFAULT nextval('situations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY villes ALTER COLUMN id SET DEFAULT nextval('villes_id_seq'::regclass);


--
-- Data for Name: active_admin_comments; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY active_admin_comments (id, namespace, body, resource_id, resource_type, author_type, author_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('active_admin_comments_id_seq', 1, false);


--
-- Data for Name: admin_users; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY admin_users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at) FROM stdin;
1	admin@example.com	$2a$11$wD70UbmQ2k0CheBkT/ZMdulri66kXOqY2dt5gFUYs0N/.vJDJ1DpO	\N	\N	\N	0	\N	\N	\N	\N	2016-10-16 19:16:49.496538	2016-10-16 19:16:49.496538
\.


--
-- Name: admin_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('admin_users_id_seq', 1, true);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2016-10-16 18:51:12.963037	2016-10-16 18:51:12.963037
\.


--
-- Data for Name: campeurs; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY campeurs (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, name, gender, adresse, ville, cp, surname, telephone, birthday, description, fonction, verified) FROM stdin;
\.


--
-- Name: campeurs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('campeurs_id_seq', 1, false);


--
-- Data for Name: campings; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY campings (id, name, adresse, code_postale, commune, courriel, site_internet, tel, description, nomdep, nomregion, numdep, slug, ville_id, region_id, departement_id, latitude, longitude, etoile, created_at, updated_at, image, emplacement, proprietaire_id, caracteristiquetest_id, image_file_name, image_content_type, image_file_size, image_updated_at, adressecomplete, piscine, barbecue, youtube_url) FROM stdin;
\.


--
-- Name: campings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('campings_id_seq', 1, false);


--
-- Data for Name: caracteristiquetests; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY caracteristiquetests (id, piscine, barbecue, camping_id, created_at, updated_at, handicap, animaux, television) FROM stdin;
\.


--
-- Name: caracteristiquetests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('caracteristiquetests_id_seq', 1, false);


--
-- Data for Name: departements; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY departements (id, description, nomdep, departement_id, slug, region_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: departements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('departements_id_seq', 1, false);


--
-- Data for Name: mailboxer_conversation_opt_outs; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY mailboxer_conversation_opt_outs (id, unsubscriber_type, unsubscriber_id, conversation_id) FROM stdin;
\.


--
-- Name: mailboxer_conversation_opt_outs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('mailboxer_conversation_opt_outs_id_seq', 1, false);


--
-- Data for Name: mailboxer_conversations; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY mailboxer_conversations (id, subject, created_at, updated_at) FROM stdin;
\.


--
-- Name: mailboxer_conversations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('mailboxer_conversations_id_seq', 1, false);


--
-- Data for Name: mailboxer_notifications; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY mailboxer_notifications (id, type, body, subject, sender_type, sender_id, conversation_id, draft, notification_code, notified_object_type, notified_object_id, attachment, updated_at, created_at, global, expires) FROM stdin;
\.


--
-- Name: mailboxer_notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('mailboxer_notifications_id_seq', 1, false);


--
-- Data for Name: mailboxer_receipts; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY mailboxer_receipts (id, receiver_type, receiver_id, notification_id, is_read, trashed, deleted, mailbox_type, created_at, updated_at, is_delivered, delivery_method, message_id) FROM stdin;
\.


--
-- Name: mailboxer_receipts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('mailboxer_receipts_id_seq', 1, false);


--
-- Data for Name: proprietaires; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY proprietaires (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, name, gender, adresse, ville, cp, surname, telephone, birthday, description, fonction, verified) FROM stdin;
\.


--
-- Name: proprietaires_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('proprietaires_id_seq', 1, false);


--
-- Data for Name: proprietaires_roles; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY proprietaires_roles (proprietaire_id, role_id) FROM stdin;
\.


--
-- Data for Name: regions; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY regions (id, descriptionregion, nomderegion, slug, created_at, updated_at) FROM stdin;
\.


--
-- Name: regions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('regions_id_seq', 1, false);


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY roles (id, name, resource_type, resource_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('roles_id_seq', 1, false);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY schema_migrations (version) FROM stdin;
20160806123913
20160806124513
20160806124624
20160806124733
20160806135636
20160806135656
20160806152414
20160806194950
20160807122529
20160807125508
20160807132727
20160807195709
20160807195744
20160807200420
20160808184439
20160808184754
20160808184834
20160808184918
20160808185009
20160808185050
20160808185140
20160808185255
20160808185348
20160808185452
20160808185549
20160809183714
20160822202005
20160823183532
20160823203602
20160827195410
20160908182909
20160914204003
20160916172840
20160916173527
20160924135954
20160925093904
20160925165154
20160928205135
20161007195441
20161007195442
20161007195443
20161007195444
20161008132120
20161009175635
20161009192420
20161009192421
20161009192422
20161009192423
\.


--
-- Data for Name: situations; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY situations (id, plage, distanceplage, etang, distanceetang, lac, distancelac, riviere, distanceriviere, baseloisir, distancebaseloisir, foret, distanceforet, parcnaturel, distanceparcnaturel, montagne, distancemontagne, sporthiver, distancesporthiver, camping_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: situations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('situations_id_seq', 1, false);


--
-- Data for Name: villes; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY villes (id, nomcommune, description, nomdep, departement_id, code_postale, region, region_id, slug, created_at, updated_at) FROM stdin;
\.


--
-- Name: villes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('villes_id_seq', 1, false);


--
-- Name: active_admin_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY active_admin_comments
    ADD CONSTRAINT active_admin_comments_pkey PRIMARY KEY (id);


--
-- Name: admin_users_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY admin_users
    ADD CONSTRAINT admin_users_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: campeurs_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY campeurs
    ADD CONSTRAINT campeurs_pkey PRIMARY KEY (id);


--
-- Name: campings_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY campings
    ADD CONSTRAINT campings_pkey PRIMARY KEY (id);


--
-- Name: caracteristiquetests_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY caracteristiquetests
    ADD CONSTRAINT caracteristiquetests_pkey PRIMARY KEY (id);


--
-- Name: departements_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY departements
    ADD CONSTRAINT departements_pkey PRIMARY KEY (id);


--
-- Name: mailboxer_conversation_opt_outs_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY mailboxer_conversation_opt_outs
    ADD CONSTRAINT mailboxer_conversation_opt_outs_pkey PRIMARY KEY (id);


--
-- Name: mailboxer_conversations_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY mailboxer_conversations
    ADD CONSTRAINT mailboxer_conversations_pkey PRIMARY KEY (id);


--
-- Name: mailboxer_notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY mailboxer_notifications
    ADD CONSTRAINT mailboxer_notifications_pkey PRIMARY KEY (id);


--
-- Name: mailboxer_receipts_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY mailboxer_receipts
    ADD CONSTRAINT mailboxer_receipts_pkey PRIMARY KEY (id);


--
-- Name: proprietaires_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY proprietaires
    ADD CONSTRAINT proprietaires_pkey PRIMARY KEY (id);


--
-- Name: regions_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY regions
    ADD CONSTRAINT regions_pkey PRIMARY KEY (id);


--
-- Name: roles_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: situations_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY situations
    ADD CONSTRAINT situations_pkey PRIMARY KEY (id);


--
-- Name: villes_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY villes
    ADD CONSTRAINT villes_pkey PRIMARY KEY (id);


--
-- Name: index_active_admin_comments_on_author_type_and_author_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_active_admin_comments_on_author_type_and_author_id ON active_admin_comments USING btree (author_type, author_id);


--
-- Name: index_active_admin_comments_on_namespace; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_active_admin_comments_on_namespace ON active_admin_comments USING btree (namespace);


--
-- Name: index_active_admin_comments_on_resource_type_and_resource_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_active_admin_comments_on_resource_type_and_resource_id ON active_admin_comments USING btree (resource_type, resource_id);


--
-- Name: index_admin_users_on_email; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE UNIQUE INDEX index_admin_users_on_email ON admin_users USING btree (email);


--
-- Name: index_admin_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE UNIQUE INDEX index_admin_users_on_reset_password_token ON admin_users USING btree (reset_password_token);


--
-- Name: index_campeurs_on_email; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE UNIQUE INDEX index_campeurs_on_email ON campeurs USING btree (email);


--
-- Name: index_campeurs_on_reset_password_token; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE UNIQUE INDEX index_campeurs_on_reset_password_token ON campeurs USING btree (reset_password_token);


--
-- Name: index_mailboxer_conversation_opt_outs_on_conversation_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_mailboxer_conversation_opt_outs_on_conversation_id ON mailboxer_conversation_opt_outs USING btree (conversation_id);


--
-- Name: index_mailboxer_conversation_opt_outs_on_unsubscriber_id_type; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_mailboxer_conversation_opt_outs_on_unsubscriber_id_type ON mailboxer_conversation_opt_outs USING btree (unsubscriber_id, unsubscriber_type);


--
-- Name: index_mailboxer_notifications_on_conversation_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_mailboxer_notifications_on_conversation_id ON mailboxer_notifications USING btree (conversation_id);


--
-- Name: index_mailboxer_notifications_on_notified_object_id_and_type; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_mailboxer_notifications_on_notified_object_id_and_type ON mailboxer_notifications USING btree (notified_object_id, notified_object_type);


--
-- Name: index_mailboxer_notifications_on_sender_id_and_sender_type; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_mailboxer_notifications_on_sender_id_and_sender_type ON mailboxer_notifications USING btree (sender_id, sender_type);


--
-- Name: index_mailboxer_notifications_on_type; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_mailboxer_notifications_on_type ON mailboxer_notifications USING btree (type);


--
-- Name: index_mailboxer_receipts_on_notification_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_mailboxer_receipts_on_notification_id ON mailboxer_receipts USING btree (notification_id);


--
-- Name: index_mailboxer_receipts_on_receiver_id_and_receiver_type; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_mailboxer_receipts_on_receiver_id_and_receiver_type ON mailboxer_receipts USING btree (receiver_id, receiver_type);


--
-- Name: index_proprietaires_on_email; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE UNIQUE INDEX index_proprietaires_on_email ON proprietaires USING btree (email);


--
-- Name: index_proprietaires_on_reset_password_token; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE UNIQUE INDEX index_proprietaires_on_reset_password_token ON proprietaires USING btree (reset_password_token);


--
-- Name: index_proprietaires_roles_on_proprietaire_id_and_role_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_proprietaires_roles_on_proprietaire_id_and_role_id ON proprietaires_roles USING btree (proprietaire_id, role_id);


--
-- Name: index_roles_on_name; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_roles_on_name ON roles USING btree (name);


--
-- Name: index_roles_on_name_and_resource_type_and_resource_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_roles_on_name_and_resource_type_and_resource_id ON roles USING btree (name, resource_type, resource_id);


--
-- Name: mb_opt_outs_on_conversations_id; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY mailboxer_conversation_opt_outs
    ADD CONSTRAINT mb_opt_outs_on_conversations_id FOREIGN KEY (conversation_id) REFERENCES mailboxer_conversations(id);


--
-- Name: notifications_on_conversation_id; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY mailboxer_notifications
    ADD CONSTRAINT notifications_on_conversation_id FOREIGN KEY (conversation_id) REFERENCES mailboxer_conversations(id);


--
-- Name: receipts_on_notification_id; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY mailboxer_receipts
    ADD CONSTRAINT receipts_on_notification_id FOREIGN KEY (notification_id) REFERENCES mailboxer_notifications(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

