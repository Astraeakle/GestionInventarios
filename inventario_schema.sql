--
-- PostgreSQL database dump
--

\restrict f6geuJFYGmcaKUMt0q7ZLNWOxAHcIQkUdmRruC45u2oj9SWgzuFdjQfv0k6KcBp

-- Dumped from database version 16.10
-- Dumped by pg_dump version 16.10

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
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS '';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: cache; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cache (
    key character varying(255) NOT NULL,
    value text NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE public.cache OWNER TO postgres;

--
-- Name: cache_locks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cache_locks (
    key character varying(255) NOT NULL,
    owner character varying(255) NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE public.cache_locks OWNER TO postgres;

--
-- Name: clients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clients (
    id bigint NOT NULL,
    name character varying(250),
    surname character varying(250),
    full_name character varying(250) NOT NULL,
    phone character varying(35) NOT NULL,
    email character varying(250),
    type_client smallint DEFAULT 1 NOT NULL,
    type_document character varying(20) NOT NULL,
    n_document character varying(100) NOT NULL,
    birth_date timestamp without time zone,
    user_id bigint NOT NULL,
    sucursale_id bigint NOT NULL,
    state smallint DEFAULT 1 NOT NULL,
    ubigeo_region character varying(25) NOT NULL,
    ubigeo_provincia character varying(25) NOT NULL,
    ubigeo_distrito character varying(25) NOT NULL,
    region character varying(100) NOT NULL,
    provincia character varying(100) NOT NULL,
    distrito character varying(100) NOT NULL,
    address character varying(250) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone,
    gender character varying(4)
);


ALTER TABLE public.clients OWNER TO postgres;

--
-- Name: COLUMN clients.type_client; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.clients.type_client IS '1 es cliente final
2 es cliente empresa';


--
-- Name: COLUMN clients.state; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.clients.state IS '1 es activo
2 es inactivo';


--
-- Name: clients_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.clients_id_seq OWNER TO postgres;

--
-- Name: clients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clients_id_seq OWNED BY public.clients.id;


--
-- Name: conversions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.conversions (
    id bigint NOT NULL,
    product_id bigint NOT NULL,
    warehouse_id bigint NOT NULL,
    unit_start_id bigint NOT NULL,
    unit_end_id bigint NOT NULL,
    user_id bigint NOT NULL,
    quantity_start double precision DEFAULT 0 NOT NULL,
    quantity_end double precision DEFAULT 0 NOT NULL,
    description text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);


ALTER TABLE public.conversions OWNER TO postgres;

--
-- Name: conversions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.conversions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.conversions_id_seq OWNER TO postgres;

--
-- Name: conversions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.conversions_id_seq OWNED BY public.conversions.id;


--
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.failed_jobs OWNER TO postgres;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.failed_jobs_id_seq OWNER TO postgres;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- Name: job_batches; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.job_batches (
    id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    total_jobs integer NOT NULL,
    pending_jobs integer NOT NULL,
    failed_jobs integer NOT NULL,
    failed_job_ids text NOT NULL,
    options text,
    cancelled_at integer,
    created_at integer NOT NULL,
    finished_at integer
);


ALTER TABLE public.job_batches OWNER TO postgres;

--
-- Name: jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jobs (
    id bigint NOT NULL,
    queue character varying(255) NOT NULL,
    payload text NOT NULL,
    attempts smallint NOT NULL,
    reserved_at integer,
    available_at integer NOT NULL,
    created_at integer NOT NULL
);


ALTER TABLE public.jobs OWNER TO postgres;

--
-- Name: jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.jobs_id_seq OWNER TO postgres;

--
-- Name: jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.jobs_id_seq OWNED BY public.jobs.id;


--
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO postgres;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.migrations_id_seq OWNER TO postgres;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: model_has_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.model_has_permissions (
    permission_id bigint NOT NULL,
    model_type character varying(255) NOT NULL,
    model_id bigint NOT NULL
);


ALTER TABLE public.model_has_permissions OWNER TO postgres;

--
-- Name: model_has_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.model_has_roles (
    role_id bigint NOT NULL,
    model_type character varying(255) NOT NULL,
    model_id bigint NOT NULL
);


ALTER TABLE public.model_has_roles OWNER TO postgres;

--
-- Name: password_reset_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.password_reset_tokens (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_reset_tokens OWNER TO postgres;

--
-- Name: permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.permissions (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    guard_name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.permissions OWNER TO postgres;

--
-- Name: permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.permissions_id_seq OWNER TO postgres;

--
-- Name: permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.permissions_id_seq OWNED BY public.permissions.id;


--
-- Name: personal_access_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personal_access_tokens (
    id bigint NOT NULL,
    tokenable_type character varying(255) NOT NULL,
    tokenable_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    token character varying(64) NOT NULL,
    abilities text,
    last_used_at timestamp(0) without time zone,
    expires_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.personal_access_tokens OWNER TO postgres;

--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.personal_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.personal_access_tokens_id_seq OWNER TO postgres;

--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.personal_access_tokens_id_seq OWNED BY public.personal_access_tokens.id;


--
-- Name: product_categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_categories (
    id bigint NOT NULL,
    title character varying(250) NOT NULL,
    imagen character varying(250) NOT NULL,
    state smallint DEFAULT 1 NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);


ALTER TABLE public.product_categories OWNER TO postgres;

--
-- Name: COLUMN product_categories.state; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.product_categories.state IS '1 es actvio
2 es inactivo';


--
-- Name: product_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_categories_id_seq OWNER TO postgres;

--
-- Name: product_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_categories_id_seq OWNED BY public.product_categories.id;


--
-- Name: product_stock_initials; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_stock_initials (
    id bigint NOT NULL,
    product_id bigint NOT NULL,
    unit_id bigint NOT NULL,
    warehouse_id bigint NOT NULL,
    price_unit_avg double precision NOT NULL,
    stock double precision NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);


ALTER TABLE public.product_stock_initials OWNER TO postgres;

--
-- Name: product_stock_initials_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_stock_initials_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_stock_initials_id_seq OWNER TO postgres;

--
-- Name: product_stock_initials_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_stock_initials_id_seq OWNED BY public.product_stock_initials.id;


--
-- Name: product_wallets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_wallets (
    id bigint NOT NULL,
    product_id bigint NOT NULL,
    type_client smallint DEFAULT 1 NOT NULL,
    unit_id bigint NOT NULL,
    sucursale_id bigint,
    price double precision NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);


ALTER TABLE public.product_wallets OWNER TO postgres;

--
-- Name: COLUMN product_wallets.type_client; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.product_wallets.type_client IS '1 es para cliente final
2 es un cliente empresa';


--
-- Name: product_wallets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_wallets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_wallets_id_seq OWNER TO postgres;

--
-- Name: product_wallets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_wallets_id_seq OWNED BY public.product_wallets.id;


--
-- Name: product_warehouses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_warehouses (
    id bigint NOT NULL,
    product_id bigint NOT NULL,
    warehouse_id bigint NOT NULL,
    unit_id bigint NOT NULL,
    stock double precision DEFAULT 0 NOT NULL,
    umbral double precision DEFAULT 0 NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone,
    state_stock smallint DEFAULT 1 NOT NULL
);


ALTER TABLE public.product_warehouses OWNER TO postgres;

--
-- Name: COLUMN product_warehouses.state_stock; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.product_warehouses.state_stock IS '1 es disponible 
2 por agotar
3 agotado';


--
-- Name: product_warehouses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_warehouses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_warehouses_id_seq OWNER TO postgres;

--
-- Name: product_warehouses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_warehouses_id_seq OWNED BY public.product_warehouses.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id bigint NOT NULL,
    title character varying(250) NOT NULL,
    imagen character varying(250),
    product_categorie_id bigint NOT NULL,
    price_general double precision NOT NULL,
    price_company double precision NOT NULL,
    description text NOT NULL,
    is_discount smallint DEFAULT 1 NOT NULL,
    max_discount double precision DEFAULT 0 NOT NULL,
    is_gift smallint DEFAULT 1 NOT NULL,
    disponibilidad smallint DEFAULT 2 NOT NULL,
    state smallint DEFAULT 1 NOT NULL,
    state_stock smallint DEFAULT 1 NOT NULL,
    warranty_day double precision DEFAULT 0 NOT NULL,
    tax_selected smallint DEFAULT 1 NOT NULL,
    importe_iva double precision DEFAULT 18 NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone,
    sku character varying(100) NOT NULL
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: COLUMN products.is_discount; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.products.is_discount IS '1 no tiene descuento
2 tiene descuento';


--
-- Name: COLUMN products.max_discount; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.products.max_discount IS 'El máximo descuento que tiene un producto en %';


--
-- Name: COLUMN products.is_gift; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.products.is_gift IS '1 no es gratuito
2 es gratuito';


--
-- Name: COLUMN products.disponibilidad; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.products.disponibilidad IS '1 es poder ser atendió sin stock
2 no poder ser atendido sin stock';


--
-- Name: COLUMN products.state; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.products.state IS '1 es activo
2 es inactivo';


--
-- Name: COLUMN products.state_stock; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.products.state_stock IS '1 es disponible
2 por agotar
3 es agotado';


--
-- Name: COLUMN products.warranty_day; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.products.warranty_day IS 'El máximo numero de día en las que se puede devolver el producto';


--
-- Name: COLUMN products.tax_selected; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.products.tax_selected IS '1 es sujeto a impuesto
2 no sujeto a impuesto';


--
-- Name: COLUMN products.importe_iva; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.products.importe_iva IS 'La cantidad del importe es en porcentaje';


--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.products_id_seq OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: providers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.providers (
    id bigint NOT NULL,
    full_name character varying(255) NOT NULL,
    imagen character varying(255),
    email character varying(250),
    phone character varying(25) NOT NULL,
    address character varying(250),
    state smallint DEFAULT 1 NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone,
    ruc character varying(50) NOT NULL
);


ALTER TABLE public.providers OWNER TO postgres;

--
-- Name: COLUMN providers.state; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.providers.state IS '1 es activo
2 es inactivo';


--
-- Name: providers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.providers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.providers_id_seq OWNER TO postgres;

--
-- Name: providers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.providers_id_seq OWNED BY public.providers.id;


--
-- Name: purchase_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.purchase_details (
    id bigint NOT NULL,
    purchase_id bigint NOT NULL,
    product_id bigint NOT NULL,
    unit_id bigint NOT NULL,
    quantity double precision DEFAULT 0 NOT NULL,
    price_unit double precision DEFAULT 0 NOT NULL,
    total double precision DEFAULT 0 NOT NULL,
    state smallint DEFAULT 1 NOT NULL,
    user_entrega bigint,
    date_entrega timestamp without time zone,
    description text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);


ALTER TABLE public.purchase_details OWNER TO postgres;

--
-- Name: COLUMN purchase_details.state; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.purchase_details.state IS '1 SOLICITUD
2 ENTREGADO';


--
-- Name: purchase_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.purchase_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.purchase_details_id_seq OWNER TO postgres;

--
-- Name: purchase_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.purchase_details_id_seq OWNED BY public.purchase_details.id;


--
-- Name: purchases; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.purchases (
    id bigint NOT NULL,
    warehouse_id bigint NOT NULL,
    user_id bigint NOT NULL,
    sucursale_id bigint NOT NULL,
    date_emision timestamp without time zone,
    state smallint DEFAULT 1 NOT NULL,
    type_comprobant character varying(100) NOT NULL,
    n_comprobant character varying(100) NOT NULL,
    provider_id bigint NOT NULL,
    total double precision DEFAULT 0 NOT NULL,
    importe double precision DEFAULT 0 NOT NULL,
    igv double precision DEFAULT 0 NOT NULL,
    date_entrega timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone,
    description text
);


ALTER TABLE public.purchases OWNER TO postgres;

--
-- Name: COLUMN purchases.state; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.purchases.state IS '1 SOLICITUD
2 REVISION
3 PARCIAL
4 ENTREGADO';


--
-- Name: purchases_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.purchases_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.purchases_id_seq OWNER TO postgres;

--
-- Name: purchases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.purchases_id_seq OWNED BY public.purchases.id;


--
-- Name: refound_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.refound_products (
    id bigint NOT NULL,
    product_id bigint NOT NULL,
    unit_id bigint NOT NULL,
    warehouse_id bigint NOT NULL,
    quantity double precision NOT NULL,
    sale_detail_id bigint NOT NULL,
    client_id bigint NOT NULL,
    type smallint NOT NULL,
    state smallint DEFAULT 0 NOT NULL,
    description text NOT NULL,
    user_id bigint NOT NULL,
    resolution_date timestamp without time zone,
    description_resolution text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone,
    state_clone smallint DEFAULT 0 NOT NULL
);


ALTER TABLE public.refound_products OWNER TO postgres;

--
-- Name: COLUMN refound_products.type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.refound_products.type IS '1 Reparación
2 Remplazo
3 Devolución';


--
-- Name: COLUMN refound_products.state; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.refound_products.state IS '1 Pendiente
2 Revisión
3 Reparado
4 Descartado';


--
-- Name: refound_products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.refound_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.refound_products_id_seq OWNER TO postgres;

--
-- Name: refound_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.refound_products_id_seq OWNED BY public.refound_products.id;


--
-- Name: role_has_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role_has_permissions (
    permission_id bigint NOT NULL,
    role_id bigint NOT NULL
);


ALTER TABLE public.role_has_permissions OWNER TO postgres;

--
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    guard_name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.roles_id_seq OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: sale_detail_attentions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sale_detail_attentions (
    sale_detail_id bigint NOT NULL,
    product_id bigint NOT NULL,
    warehouse_id bigint NOT NULL,
    unit_id bigint NOT NULL,
    quantity double precision NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone,
    id bigint NOT NULL
);


ALTER TABLE public.sale_detail_attentions OWNER TO postgres;

--
-- Name: sale_detail_attentions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sale_detail_attentions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sale_detail_attentions_id_seq OWNER TO postgres;

--
-- Name: sale_detail_attentions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sale_detail_attentions_id_seq OWNED BY public.sale_detail_attentions.id;


--
-- Name: sale_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sale_details (
    id bigint NOT NULL,
    sale_id bigint NOT NULL,
    product_id bigint NOT NULL,
    product_categorie_id bigint NOT NULL,
    quantity double precision DEFAULT 1 NOT NULL,
    price_unit double precision DEFAULT 0 NOT NULL,
    discount double precision DEFAULT 0,
    subtotal double precision DEFAULT 0 NOT NULL,
    total double precision DEFAULT 0 NOT NULL,
    unit_id bigint NOT NULL,
    warehouse_id bigint,
    igv double precision DEFAULT 0,
    description text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone,
    state_attention smallint DEFAULT 1 NOT NULL,
    quantity_pending double precision DEFAULT 0 NOT NULL
);


ALTER TABLE public.sale_details OWNER TO postgres;

--
-- Name: COLUMN sale_details.subtotal; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.sale_details.subtotal IS 'Es el precio unitario - descuento';


--
-- Name: COLUMN sale_details.total; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.sale_details.total IS 'El subtotal * cantidad';


--
-- Name: COLUMN sale_details.state_attention; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.sale_details.state_attention IS '1 es pendiente
2 es parcial
3 es completo';


--
-- Name: COLUMN sale_details.quantity_pending; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.sale_details.quantity_pending IS 'La cantidad pendiente por atender';


--
-- Name: sale_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sale_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sale_details_id_seq OWNER TO postgres;

--
-- Name: sale_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sale_details_id_seq OWNED BY public.sale_details.id;


--
-- Name: sale_payments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sale_payments (
    id bigint NOT NULL,
    sale_id bigint NOT NULL,
    method_payment character varying(100) NOT NULL,
    n_transaction character varying(100),
    banco character varying(100),
    amount double precision NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);


ALTER TABLE public.sale_payments OWNER TO postgres;

--
-- Name: sale_payments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sale_payments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sale_payments_id_seq OWNER TO postgres;

--
-- Name: sale_payments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sale_payments_id_seq OWNED BY public.sale_payments.id;


--
-- Name: sales; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sales (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    client_id bigint NOT NULL,
    type_client smallint DEFAULT 1 NOT NULL,
    sucursale_id bigint NOT NULL,
    subtotal double precision DEFAULT 0 NOT NULL,
    total double precision DEFAULT 0 NOT NULL,
    igv double precision NOT NULL,
    state_sale smallint DEFAULT 1 NOT NULL,
    state_payment smallint DEFAULT 1 NOT NULL,
    debt double precision DEFAULT 0 NOT NULL,
    paid_out double precision DEFAULT 0 NOT NULL,
    date_validation timestamp without time zone,
    date_pay_complete timestamp without time zone,
    description text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone,
    state_entrega smallint DEFAULT 1 NOT NULL,
    discount double precision DEFAULT 0
);


ALTER TABLE public.sales OWNER TO postgres;

--
-- Name: COLUMN sales.type_client; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.sales.type_client IS '1 es cliente final
2 es cliente empresa';


--
-- Name: COLUMN sales.state_sale; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.sales.state_sale IS '1 es venta
2 es cotizacion';


--
-- Name: COLUMN sales.state_payment; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.sales.state_payment IS '1 es pendiente
2 es parcial
3 es completo';


--
-- Name: COLUMN sales.debt; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.sales.debt IS 'deuda';


--
-- Name: COLUMN sales.paid_out; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.sales.paid_out IS 'pagado o cancelado';


--
-- Name: COLUMN sales.date_validation; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.sales.date_validation IS 'fecha de la realización de una venta';


--
-- Name: COLUMN sales.state_entrega; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.sales.state_entrega IS '1 es pendiente
2 es parcial
3 completo';


--
-- Name: sales_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sales_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sales_id_seq OWNER TO postgres;

--
-- Name: sales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sales_id_seq OWNED BY public.sales.id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sessions (
    id character varying(255) NOT NULL,
    user_id bigint,
    ip_address character varying(45),
    user_agent text,
    payload text NOT NULL,
    last_activity integer NOT NULL
);


ALTER TABLE public.sessions OWNER TO postgres;

--
-- Name: sucursales; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sucursales (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    state smallint DEFAULT 1 NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone,
    address character varying(255)
);


ALTER TABLE public.sucursales OWNER TO postgres;

--
-- Name: COLUMN sucursales.state; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.sucursales.state IS '1 es activo
2 es inactivo';


--
-- Name: sucursales_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sucursales_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sucursales_id_seq OWNER TO postgres;

--
-- Name: sucursales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sucursales_id_seq OWNED BY public.sucursales.id;


--
-- Name: transport_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transport_details (
    id bigint NOT NULL,
    transport_id bigint NOT NULL,
    product_id bigint NOT NULL,
    unit_id bigint NOT NULL,
    quantity double precision DEFAULT 0 NOT NULL,
    price_unit double precision DEFAULT 0 NOT NULL,
    total double precision DEFAULT 0 NOT NULL,
    state smallint DEFAULT 1 NOT NULL,
    user_entrega bigint,
    date_entrega timestamp without time zone,
    user_salida bigint,
    date_salida timestamp without time zone,
    description text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);


ALTER TABLE public.transport_details OWNER TO postgres;

--
-- Name: COLUMN transport_details.state; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.transport_details.state IS '1  PENDIENTE
2 SALIDA
3 ENTREGA';


--
-- Name: transport_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.transport_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.transport_details_id_seq OWNER TO postgres;

--
-- Name: transport_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.transport_details_id_seq OWNED BY public.transport_details.id;


--
-- Name: transports; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transports (
    id bigint NOT NULL,
    warehouse_start_id bigint NOT NULL,
    warehouse_end_id bigint NOT NULL,
    date_emision timestamp without time zone,
    user_id bigint NOT NULL,
    state smallint DEFAULT 1 NOT NULL,
    total double precision DEFAULT 0 NOT NULL,
    importe double precision DEFAULT 0 NOT NULL,
    igv double precision DEFAULT 0 NOT NULL,
    description text,
    date_entrega timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone,
    date_salida timestamp without time zone
);


ALTER TABLE public.transports OWNER TO postgres;

--
-- Name: COLUMN transports.state; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.transports.state IS '1 SOLICITUD
2 REVISION SALIDAD
3 SALIDA
4 LLEGADA
5 REVISION LLEGADA
6 ENTREGA';


--
-- Name: transports_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.transports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.transports_id_seq OWNER TO postgres;

--
-- Name: transports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.transports_id_seq OWNED BY public.transports.id;


--
-- Name: unit_conversions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.unit_conversions (
    id bigint NOT NULL,
    unit_id bigint NOT NULL,
    unit_to_id bigint NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.unit_conversions OWNER TO postgres;

--
-- Name: COLUMN unit_conversions.unit_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.unit_conversions.unit_id IS 'Y la unidad a la que esta relacionada';


--
-- Name: COLUMN unit_conversions.unit_to_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.unit_conversions.unit_to_id IS 'La unidad a la que se quiere convertir';


--
-- Name: unit_conversions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.unit_conversions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.unit_conversions_id_seq OWNER TO postgres;

--
-- Name: unit_conversions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.unit_conversions_id_seq OWNED BY public.unit_conversions.id;


--
-- Name: units; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.units (
    id bigint NOT NULL,
    name character varying(250) NOT NULL,
    description character varying(300) NOT NULL,
    state smallint DEFAULT 1 NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);


ALTER TABLE public.units OWNER TO postgres;

--
-- Name: COLUMN units.state; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.units.state IS '1 activo
2 inactivo';


--
-- Name: units_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.units_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.units_id_seq OWNER TO postgres;

--
-- Name: units_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.units_id_seq OWNED BY public.units.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    role_id bigint DEFAULT 1 NOT NULL,
    surname character varying(255),
    avatar character varying(255),
    sucursale_id bigint DEFAULT 1 NOT NULL,
    phone character varying(50),
    type_document character varying(50),
    n_document character varying(50),
    deleted_at timestamp without time zone,
    state smallint DEFAULT 1,
    gender character varying(5)
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: COLUMN users.state; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.users.state IS '1 es activo
2 es inactivo';


--
-- Name: COLUMN users.gender; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.users.gender IS 'M es masculino
F es femenino';


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: warehouses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.warehouses (
    id bigint NOT NULL,
    name character varying(250) NOT NULL,
    address character varying(250) NOT NULL,
    sucursale_id bigint NOT NULL,
    state smallint DEFAULT 1 NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);


ALTER TABLE public.warehouses OWNER TO postgres;

--
-- Name: COLUMN warehouses.state; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.warehouses.state IS '1 es activo
2 es inactivo';


--
-- Name: warehouses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.warehouses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.warehouses_id_seq OWNER TO postgres;

--
-- Name: warehouses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.warehouses_id_seq OWNED BY public.warehouses.id;


--
-- Name: clients id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients ALTER COLUMN id SET DEFAULT nextval('public.clients_id_seq'::regclass);


--
-- Name: conversions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conversions ALTER COLUMN id SET DEFAULT nextval('public.conversions_id_seq'::regclass);


--
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- Name: jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissions ALTER COLUMN id SET DEFAULT nextval('public.permissions_id_seq'::regclass);


--
-- Name: personal_access_tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);


--
-- Name: product_categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_categories ALTER COLUMN id SET DEFAULT nextval('public.product_categories_id_seq'::regclass);


--
-- Name: product_stock_initials id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_stock_initials ALTER COLUMN id SET DEFAULT nextval('public.product_stock_initials_id_seq'::regclass);


--
-- Name: product_wallets id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_wallets ALTER COLUMN id SET DEFAULT nextval('public.product_wallets_id_seq'::regclass);


--
-- Name: product_warehouses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_warehouses ALTER COLUMN id SET DEFAULT nextval('public.product_warehouses_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: providers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.providers ALTER COLUMN id SET DEFAULT nextval('public.providers_id_seq'::regclass);


--
-- Name: purchase_details id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_details ALTER COLUMN id SET DEFAULT nextval('public.purchase_details_id_seq'::regclass);


--
-- Name: purchases id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchases ALTER COLUMN id SET DEFAULT nextval('public.purchases_id_seq'::regclass);


--
-- Name: refound_products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refound_products ALTER COLUMN id SET DEFAULT nextval('public.refound_products_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: sale_detail_attentions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale_detail_attentions ALTER COLUMN id SET DEFAULT nextval('public.sale_detail_attentions_id_seq'::regclass);


--
-- Name: sale_details id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale_details ALTER COLUMN id SET DEFAULT nextval('public.sale_details_id_seq'::regclass);


--
-- Name: sale_payments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale_payments ALTER COLUMN id SET DEFAULT nextval('public.sale_payments_id_seq'::regclass);


--
-- Name: sales id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales ALTER COLUMN id SET DEFAULT nextval('public.sales_id_seq'::regclass);


--
-- Name: sucursales id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sucursales ALTER COLUMN id SET DEFAULT nextval('public.sucursales_id_seq'::regclass);


--
-- Name: transport_details id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transport_details ALTER COLUMN id SET DEFAULT nextval('public.transport_details_id_seq'::regclass);


--
-- Name: transports id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transports ALTER COLUMN id SET DEFAULT nextval('public.transports_id_seq'::regclass);


--
-- Name: unit_conversions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unit_conversions ALTER COLUMN id SET DEFAULT nextval('public.unit_conversions_id_seq'::regclass);


--
-- Name: units id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.units ALTER COLUMN id SET DEFAULT nextval('public.units_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: warehouses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.warehouses ALTER COLUMN id SET DEFAULT nextval('public.warehouses_id_seq'::regclass);


--
-- Name: cache_locks cache_locks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cache_locks
    ADD CONSTRAINT cache_locks_pkey PRIMARY KEY (key);


--
-- Name: cache cache_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cache
    ADD CONSTRAINT cache_pkey PRIMARY KEY (key);


--
-- Name: clients clients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (id);


--
-- Name: conversions conversions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conversions
    ADD CONSTRAINT conversions_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- Name: job_batches job_batches_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_batches
    ADD CONSTRAINT job_batches_pkey PRIMARY KEY (id);


--
-- Name: jobs jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: model_has_permissions model_has_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.model_has_permissions
    ADD CONSTRAINT model_has_permissions_pkey PRIMARY KEY (permission_id, model_id, model_type);


--
-- Name: model_has_roles model_has_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.model_has_roles
    ADD CONSTRAINT model_has_roles_pkey PRIMARY KEY (role_id, model_id, model_type);


--
-- Name: password_reset_tokens password_reset_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (email);


--
-- Name: permissions permissions_name_guard_name_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_guard_name_unique UNIQUE (name, guard_name);


--
-- Name: permissions permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);


--
-- Name: personal_access_tokens personal_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_pkey PRIMARY KEY (id);


--
-- Name: personal_access_tokens personal_access_tokens_token_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_token_unique UNIQUE (token);


--
-- Name: product_categories product_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_categories
    ADD CONSTRAINT product_categories_pkey PRIMARY KEY (id);


--
-- Name: product_stock_initials product_stock_initials_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_stock_initials
    ADD CONSTRAINT product_stock_initials_pkey PRIMARY KEY (id);


--
-- Name: product_wallets product_wallets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_wallets
    ADD CONSTRAINT product_wallets_pkey PRIMARY KEY (id);


--
-- Name: product_warehouses product_warehouses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_warehouses
    ADD CONSTRAINT product_warehouses_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: providers providers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.providers
    ADD CONSTRAINT providers_pkey PRIMARY KEY (id);


--
-- Name: purchase_details purchase_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_details
    ADD CONSTRAINT purchase_details_pkey PRIMARY KEY (id);


--
-- Name: purchases purchases_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchases
    ADD CONSTRAINT purchases_pkey PRIMARY KEY (id);


--
-- Name: refound_products refound_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refound_products
    ADD CONSTRAINT refound_products_pkey PRIMARY KEY (id);


--
-- Name: role_has_permissions role_has_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_has_permissions
    ADD CONSTRAINT role_has_permissions_pkey PRIMARY KEY (permission_id, role_id);


--
-- Name: roles roles_name_guard_name_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_guard_name_unique UNIQUE (name, guard_name);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: sale_detail_attentions sale_detail_attentions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale_detail_attentions
    ADD CONSTRAINT sale_detail_attentions_pkey PRIMARY KEY (id);


--
-- Name: sale_details sale_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale_details
    ADD CONSTRAINT sale_details_pkey PRIMARY KEY (id);


--
-- Name: sale_payments sale_payments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale_payments
    ADD CONSTRAINT sale_payments_pkey PRIMARY KEY (id);


--
-- Name: sales sales_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales
    ADD CONSTRAINT sales_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: sucursales sucursales_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sucursales
    ADD CONSTRAINT sucursales_pkey PRIMARY KEY (id);


--
-- Name: transport_details transport_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transport_details
    ADD CONSTRAINT transport_details_pkey PRIMARY KEY (id);


--
-- Name: transports transports_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transports
    ADD CONSTRAINT transports_pkey PRIMARY KEY (id);


--
-- Name: unit_conversions unit_conversions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unit_conversions
    ADD CONSTRAINT unit_conversions_pkey PRIMARY KEY (id);


--
-- Name: units units_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.units
    ADD CONSTRAINT units_pkey PRIMARY KEY (id);


--
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: warehouses warehouses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.warehouses
    ADD CONSTRAINT warehouses_pkey PRIMARY KEY (id);


--
-- Name: jobs_queue_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX jobs_queue_index ON public.jobs USING btree (queue);


--
-- Name: model_has_permissions_model_id_model_type_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX model_has_permissions_model_id_model_type_index ON public.model_has_permissions USING btree (model_id, model_type);


--
-- Name: model_has_roles_model_id_model_type_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX model_has_roles_model_id_model_type_index ON public.model_has_roles USING btree (model_id, model_type);


--
-- Name: personal_access_tokens_tokenable_type_tokenable_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON public.personal_access_tokens USING btree (tokenable_type, tokenable_id);


--
-- Name: sessions_last_activity_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sessions_last_activity_index ON public.sessions USING btree (last_activity);


--
-- Name: sessions_user_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sessions_user_id_index ON public.sessions USING btree (user_id);


--
-- Name: model_has_permissions model_has_permissions_permission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.model_has_permissions
    ADD CONSTRAINT model_has_permissions_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES public.permissions(id) ON DELETE CASCADE;


--
-- Name: model_has_roles model_has_roles_role_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.model_has_roles
    ADD CONSTRAINT model_has_roles_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;


--
-- Name: role_has_permissions role_has_permissions_permission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_has_permissions
    ADD CONSTRAINT role_has_permissions_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES public.permissions(id) ON DELETE CASCADE;


--
-- Name: role_has_permissions role_has_permissions_role_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_has_permissions
    ADD CONSTRAINT role_has_permissions_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;


--
-- PostgreSQL database dump complete
--

\unrestrict f6geuJFYGmcaKUMt0q7ZLNWOxAHcIQkUdmRruC45u2oj9SWgzuFdjQfv0k6KcBp

