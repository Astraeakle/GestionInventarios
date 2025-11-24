--
-- PostgreSQL database dump
--

\restrict 3mVjqc5nonvwXUOUGjyonocz2nU0gzZY0SaFdd1VgZrUS5b6agt3bWxUeXFyMp2

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
-- Data for Name: cache; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cache (key, value, expiration) FROM stdin;
spatie.permission.cache	a:3:{s:5:"alias";a:4:{s:1:"a";s:2:"id";s:1:"b";s:4:"name";s:1:"c";s:10:"guard_name";s:1:"r";s:5:"roles";}s:11:"permissions";a:36:{i:0;a:3:{s:1:"a";i:1;s:1:"b";s:9:"dashboard";s:1:"c";s:3:"api";}i:1;a:3:{s:1:"a";i:2;s:1:"b";s:13:"register_role";s:1:"c";s:3:"api";}i:2;a:4:{s:1:"a";i:3;s:1:"b";s:9:"list_role";s:1:"c";s:3:"api";s:1:"r";a:1:{i:0;i:4;}}i:3;a:3:{s:1:"a";i:4;s:1:"b";s:9:"edit_role";s:1:"c";s:3:"api";}i:4;a:3:{s:1:"a";i:5;s:1:"b";s:11:"delete_role";s:1:"c";s:3:"api";}i:5;a:4:{s:1:"a";i:6;s:1:"b";s:13:"register_user";s:1:"c";s:3:"api";s:1:"r";a:1:{i:0;i:2;}}i:6;a:4:{s:1:"a";i:7;s:1:"b";s:9:"list_user";s:1:"c";s:3:"api";s:1:"r";a:1:{i:0;i:2;}}i:7;a:3:{s:1:"a";i:8;s:1:"b";s:9:"edit_user";s:1:"c";s:3:"api";}i:8;a:3:{s:1:"a";i:9;s:1:"b";s:11:"delete_user";s:1:"c";s:3:"api";}i:9;a:3:{s:1:"a";i:10;s:1:"b";s:8:"settings";s:1:"c";s:3:"api";}i:10;a:4:{s:1:"a";i:11;s:1:"b";s:16:"register_product";s:1:"c";s:3:"api";s:1:"r";a:2:{i:0;i:2;i:1;i:4;}}i:11;a:4:{s:1:"a";i:12;s:1:"b";s:12:"list_product";s:1:"c";s:3:"api";s:1:"r";a:4:{i:0;i:2;i:1;i:3;i:2;i:4;i:3;i:9;}}i:12;a:4:{s:1:"a";i:13;s:1:"b";s:12:"edit_product";s:1:"c";s:3:"api";s:1:"r";a:1:{i:0;i:3;}}i:13;a:3:{s:1:"a";i:14;s:1:"b";s:14:"delete_product";s:1:"c";s:3:"api";}i:14;a:4:{s:1:"a";i:15;s:1:"b";s:22:"show_inventory_product";s:1:"c";s:3:"api";s:1:"r";a:1:{i:0;i:3;}}i:15;a:4:{s:1:"a";i:16;s:1:"b";s:25:"show_wallet_price_product";s:1:"c";s:3:"api";s:1:"r";a:1:{i:0;i:3;}}i:16;a:4:{s:1:"a";i:17;s:1:"b";s:15:"register_client";s:1:"c";s:3:"api";s:1:"r";a:2:{i:0;i:2;i:1;i:9;}}i:17;a:4:{s:1:"a";i:18;s:1:"b";s:11:"list_client";s:1:"c";s:3:"api";s:1:"r";a:3:{i:0;i:2;i:1;i:4;i:2;i:9;}}i:18;a:4:{s:1:"a";i:19;s:1:"b";s:11:"edit_client";s:1:"c";s:3:"api";s:1:"r";a:2:{i:0;i:2;i:1;i:9;}}i:19;a:3:{s:1:"a";i:20;s:1:"b";s:13:"delete_client";s:1:"c";s:3:"api";}i:20;a:4:{s:1:"a";i:21;s:1:"b";s:13:"register_sale";s:1:"c";s:3:"api";s:1:"r";a:2:{i:0;i:2;i:1;i:9;}}i:21;a:4:{s:1:"a";i:22;s:1:"b";s:9:"list_sale";s:1:"c";s:3:"api";s:1:"r";a:4:{i:0;i:2;i:1;i:3;i:2;i:4;i:3;i:9;}}i:22;a:4:{s:1:"a";i:23;s:1:"b";s:9:"edit_sale";s:1:"c";s:3:"api";s:1:"r";a:1:{i:0;i:9;}}i:23;a:3:{s:1:"a";i:24;s:1:"b";s:11:"delete_sale";s:1:"c";s:3:"api";}i:24;a:4:{s:1:"a";i:25;s:1:"b";s:6:"return";s:1:"c";s:3:"api";s:1:"r";a:1:{i:0;i:4;}}i:25;a:4:{s:1:"a";i:26;s:1:"b";s:17:"register_purchase";s:1:"c";s:3:"api";s:1:"r";a:3:{i:0;i:3;i:1;i:5;i:2;i:4;}}i:26;a:4:{s:1:"a";i:27;s:1:"b";s:13:"list_purchase";s:1:"c";s:3:"api";s:1:"r";a:3:{i:0;i:3;i:1;i:5;i:2;i:4;}}i:27;a:4:{s:1:"a";i:28;s:1:"b";s:13:"edit_purchase";s:1:"c";s:3:"api";s:1:"r";a:2:{i:0;i:3;i:1;i:5;}}i:28;a:4:{s:1:"a";i:29;s:1:"b";s:15:"delete_purchase";s:1:"c";s:3:"api";s:1:"r";a:1:{i:0;i:5;}}i:29;a:4:{s:1:"a";i:30;s:1:"b";s:18:"register_transport";s:1:"c";s:3:"api";s:1:"r";a:1:{i:0;i:3;}}i:30;a:4:{s:1:"a";i:31;s:1:"b";s:14:"list_transport";s:1:"c";s:3:"api";s:1:"r";a:1:{i:0;i:3;}}i:31;a:4:{s:1:"a";i:32;s:1:"b";s:14:"edit_transport";s:1:"c";s:3:"api";s:1:"r";a:1:{i:0;i:3;}}i:32;a:3:{s:1:"a";i:33;s:1:"b";s:16:"delete_transport";s:1:"c";s:3:"api";}i:33;a:3:{s:1:"a";i:34;s:1:"b";s:11:"conversions";s:1:"c";s:3:"api";}i:34;a:4:{s:1:"a";i:35;s:1:"b";s:6:"kardex";s:1:"c";s:3:"api";s:1:"r";a:1:{i:0;i:3;}}i:35;a:3:{s:1:"a";i:36;s:1:"b";s:12:"profile_user";s:1:"c";s:3:"api";}}s:5:"roles";a:5:{i:0;a:3:{s:1:"a";i:4;s:1:"b";s:8:"Contador";s:1:"c";s:3:"api";}i:1;a:3:{s:1:"a";i:2;s:1:"b";s:27:"Administrador de Sucursales";s:1:"c";s:3:"api";}i:2;a:3:{s:1:"a";i:3;s:1:"b";s:20:"Encargado de almacen";s:1:"c";s:3:"api";}i:3;a:3:{s:1:"a";i:9;s:1:"b";s:16:"Asesor Comercial";s:1:"c";s:3:"api";}i:4;a:3:{s:1:"a";i:5;s:1:"b";s:20:"Encargado de compras";s:1:"c";s:3:"api";}}}	1762919323
\.


--
-- Data for Name: cache_locks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cache_locks (key, owner, expiration) FROM stdin;
\.


--
-- Data for Name: clients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clients (id, name, surname, full_name, phone, email, type_client, type_document, n_document, birth_date, user_id, sucursale_id, state, ubigeo_region, ubigeo_provincia, ubigeo_distrito, region, provincia, distrito, address, created_at, updated_at, deleted_at, gender) FROM stdin;
\.


--
-- Data for Name: conversions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.conversions (id, product_id, warehouse_id, unit_start_id, unit_end_id, user_id, quantity_start, quantity_end, description, created_at, updated_at, deleted_at) FROM stdin;
1000	6	2	4	1	1	1	15	NECESITAMOS UNIDADES SUELTAS PARA VENDERLO A NUESTROS CLIENTES FINALES	2025-02-22 04:00:19	2025-02-22 04:00:19	\N
1001	4	2	2	3	1	1	15	NECESITAMOS PAQUETES PARA VENDERLO A NUESTRO CLIENTES EMPRESA	2025-02-22 04:05:04	2025-02-22 04:05:04	\N
1003	3	2	1	2	1	15	1	Necesitamos 1 caja para atender una orden de venta de nuestros clientes tipo empresa	2025-02-22 04:38:43	2025-02-22 05:36:44	2025-02-22 05:36:44
1002	3	2	3	1	1	1	18	NECESITAMOS UNIDADES PARA VENDER A LOS CLIENTE FINALES	2025-02-22 04:15:12	2025-02-22 05:38:20	2025-02-22 05:38:20
1004	9	2	2	4	1	1	5	hgjhgjhg	2025-02-26 23:03:00	2025-02-26 23:03:00	\N
\.


--
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
\.


--
-- Data for Name: job_batches; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.job_batches (id, name, total_jobs, pending_jobs, failed_jobs, failed_job_ids, options, cancelled_at, created_at, finished_at) FROM stdin;
\.


--
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jobs (id, queue, payload, attempts, reserved_at, available_at, created_at) FROM stdin;
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.migrations (id, migration, batch) FROM stdin;
1	0001_01_01_000000_create_users_table	1
2	0001_01_01_000001_create_cache_table	1
3	0001_01_01_000002_create_jobs_table	1
4	2025_01_04_083200_create_personal_access_tokens_table	1
5	2025_01_04_092557_create_permission_tables	1
\.


--
-- Data for Name: model_has_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.model_has_permissions (permission_id, model_type, model_id) FROM stdin;
\.


--
-- Data for Name: model_has_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.model_has_roles (role_id, model_type, model_id) FROM stdin;
1	App\\Models\\User	1
4	App\\Models\\User	4
3	App\\Models\\User	5
5	App\\Models\\User	6
9	App\\Models\\User	7
9	App\\Models\\User	8
9	App\\Models\\User	9
9	App\\Models\\User	10
\.


--
-- Data for Name: password_reset_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.password_reset_tokens (email, token, created_at) FROM stdin;
\.


--
-- Data for Name: permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.permissions (id, name, guard_name, created_at, updated_at) FROM stdin;
1	dashboard	api	2025-01-07 03:51:57	2025-01-07 03:51:57
2	register_role	api	2025-01-07 03:51:57	2025-01-07 03:51:57
3	list_role	api	2025-01-07 03:51:57	2025-01-07 03:51:57
4	edit_role	api	2025-01-07 03:51:57	2025-01-07 03:51:57
5	delete_role	api	2025-01-07 03:51:57	2025-01-07 03:51:57
6	register_user	api	2025-01-07 03:51:57	2025-01-07 03:51:57
7	list_user	api	2025-01-07 03:51:57	2025-01-07 03:51:57
8	edit_user	api	2025-01-07 03:51:57	2025-01-07 03:51:57
9	delete_user	api	2025-01-07 03:51:57	2025-01-07 03:51:57
10	settings	api	2025-01-07 03:51:57	2025-01-07 03:51:57
11	register_product	api	2025-01-07 03:51:57	2025-01-07 03:51:57
12	list_product	api	2025-01-07 03:51:57	2025-01-07 03:51:57
13	edit_product	api	2025-01-07 03:51:57	2025-01-07 03:51:57
14	delete_product	api	2025-01-07 03:51:57	2025-01-07 03:51:57
15	show_inventory_product	api	2025-01-07 03:51:57	2025-01-07 03:51:57
16	show_wallet_price_product	api	2025-01-07 03:51:57	2025-01-07 03:51:57
17	register_client	api	2025-01-07 03:51:57	2025-01-07 03:51:57
18	list_client	api	2025-01-07 03:51:57	2025-01-07 03:51:57
19	edit_client	api	2025-01-07 03:51:57	2025-01-07 03:51:57
20	delete_client	api	2025-01-07 03:51:57	2025-01-07 03:51:57
21	register_sale	api	2025-01-07 03:51:57	2025-01-07 03:51:57
22	list_sale	api	2025-01-07 03:51:57	2025-01-07 03:51:57
23	edit_sale	api	2025-01-07 03:51:57	2025-01-07 03:51:57
24	delete_sale	api	2025-01-07 03:51:57	2025-01-07 03:51:57
25	return	api	2025-01-07 03:51:57	2025-01-07 03:51:57
26	register_purchase	api	2025-01-07 03:51:57	2025-01-07 03:51:57
27	list_purchase	api	2025-01-07 03:51:57	2025-01-07 03:51:57
28	edit_purchase	api	2025-01-07 03:51:57	2025-01-07 03:51:57
29	delete_purchase	api	2025-01-07 03:51:57	2025-01-07 03:51:57
30	register_transport	api	2025-01-07 03:51:57	2025-01-07 03:51:57
31	list_transport	api	2025-01-07 03:51:57	2025-01-07 03:51:57
32	edit_transport	api	2025-01-07 03:51:57	2025-01-07 03:51:57
33	delete_transport	api	2025-01-07 03:51:57	2025-01-07 03:51:57
34	conversions	api	2025-01-07 03:51:57	2025-01-07 03:51:57
35	kardex	api	2025-01-07 03:51:57	2025-01-07 03:51:57
36	profile_user	api	2025-01-07 03:51:57	2025-01-07 03:51:57
\.


--
-- Data for Name: personal_access_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: product_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_categories (id, title, imagen, state, created_at, updated_at, deleted_at) FROM stdin;
1	Melaminas 18mm	categories/melamina-18mm.jpg	1	2025-01-07 03:51:57	2025-01-07 03:51:57	\N
2	Melaminas 15mm	categories/melamina-15mm.jpg	1	2025-01-07 03:51:57	2025-01-07 03:51:57	\N
3	Accesorios y Herrajes	categories/accesorios.jpg	1	2025-01-07 03:51:57	2025-01-07 03:51:57	\N
4	Cortes Especiales	categories/cortes-especiales.jpg	1	2025-01-07 03:51:57	2025-01-07 03:51:57	\N
5	Servicios de Corte	categories/servicios-corte.jpg	1	2025-01-07 03:51:57	2025-01-07 03:51:57	\N
\.


--
-- Data for Name: product_stock_initials; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_stock_initials (id, product_id, unit_id, warehouse_id, price_unit_avg, stock, created_at, updated_at, deleted_at) FROM stdin;
1	1	2	1	170	5	2025-01-18 06:50:35	2025-01-18 06:50:35	\N
2	2	2	1	270	1	2025-01-21 05:50:46	2025-02-22 04:05:04	\N
3	3	2	1	270	17	2025-01-31 04:45:47	2025-02-22 04:05:04	\N
4	4	2	1	270	2	2025-01-18 06:57:35	2025-02-22 05:36:44	\N
5	5	2	1	260	2	2025-01-22 05:38:40	2025-01-24 05:12:10	\N
6	6	2	1	270	1	2025-02-20 21:32:10	2025-02-22 05:38:20	\N
7	7	3	1	90	3	2025-02-03 03:45:24	2025-02-22 05:38:20	\N
8	8	1	1	8.5	1	2025-01-24 05:16:28	2025-01-24 05:16:48	\N
9	9	1	1	4.5	1	2025-01-21 05:50:46	2025-02-25 19:38:07	\N
10	10	5	1	18	0	2025-01-21 05:59:18	2025-01-24 05:16:48	\N
11	11	4	1	1	0	2025-01-21 05:59:18	2025-01-24 05:16:48	\N
\.


--
-- Data for Name: product_wallets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_wallets (id, product_id, type_client, unit_id, sucursale_id, price, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: product_warehouses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_warehouses (id, product_id, warehouse_id, unit_id, stock, umbral, created_at, updated_at, deleted_at, state_stock) FROM stdin;
1	1	1	2	5	1	2025-01-18 06:50:35	2025-01-18 06:50:35	\N	1
2	2	1	2	1	1	2025-01-21 05:50:46	2025-02-22 04:05:04	\N	1
3	3	1	2	17	1	2025-01-31 04:45:47	2025-02-22 04:05:04	\N	1
4	4	1	2	2	1	2025-01-18 06:57:35	2025-02-22 05:36:44	\N	1
5	5	1	2	2	2	2025-01-22 05:38:40	2025-01-24 05:12:10	\N	1
6	6	1	2	1	0	2025-02-20 21:32:10	2025-02-22 05:38:20	\N	1
7	7	1	3	3	1	2025-02-03 03:45:24	2025-02-22 05:38:20	\N	1
8	8	1	1	1	2	2025-01-24 05:16:28	2025-01-24 05:16:48	\N	1
9	9	1	1	1	2	2025-01-21 05:50:46	2025-02-25 19:38:07	\N	1
10	10	1	5	0	1	2025-01-21 05:59:18	2025-01-24 05:16:48	\N	1
11	11	1	4	0	1	2025-01-21 05:59:18	2025-01-24 05:16:48	\N	1
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, title, imagen, product_categorie_id, price_general, price_company, description, is_discount, max_discount, is_gift, disponibilidad, state, state_stock, warranty_day, tax_selected, importe_iva, created_at, updated_at, deleted_at, sku) FROM stdin;
1	Melamina Pelikano Blanco 2.44 x 2.15 de 18mm	products/pelikano-blanco.jpg	1	170	150	Melamina Pelikano de 18mm color blanco, ideal para muebles de cocina y closet	2	10	1	2	1	1	30	1	18	2025-01-07 03:51:00	2025-01-07 03:51:00	\N	MEL-PELI-BLAN-18
2	Melamina Pelikano Nogal 2.44 x 2.15 de 18mm	products/pelikano-nogal.jpg	1	270	250	Melamina Pelikano de 18mm color nogal, textura madera natural	2	8	1	2	1	1	30	1	18	2025-01-07 03:51:00	2025-01-07 03:51:00	\N	MEL-PELI-NOGAL-18
3	Melamina Pelikano Roble 2.44 x 2.15 de 18mm	products/pelikano-roble.jpg	1	270	250	Melamina Pelikano de 18mm color roble claro, acabado premium	2	12	1	2	1	1	30	1	18	2025-01-07 03:51:00	2025-01-07 03:51:00	\N	MEL-PELI-ROBLE-18
4	Melamina Pelikano Wengue 2.44 x 2.15 de 18mm	products/pelikano-wengue.jpg	1	270	250	Melamina Pelikano de 18mm color wengue, elegante y moderno	2	5	1	2	1	1	30	1	18	2025-01-07 03:51:00	2025-01-07 03:51:00	\N	MEL-PELI-WENGUE-18
5	Melamina Pelikano Negro 2.44 x 2.15 de 18mm	products/standard-blanco.jpg	2	260	240	Melamina standard de 15mm color blanco, para proyectos económicos	2	15	1	2	1	1	30	1	18	2025-01-07 03:51:00	2025-01-07 03:51:00	\N	MEL-STD-BLAN-15
6	Melamina Pelikano Agave 2.44 x 2.15 de 18mm	products/standard-negro.jpg	2	270	250	Melamina standard de 15mm color negro, moderno y minimalista	2	10	1	2	1	1	30	1	18	2025-01-07 03:51:00	2025-01-07 03:51:00	\N	MEL-STD-NEGRO-15
7	Canto PVC 2mm x 100m Blanco	products/canto-pvc.jpg	3	90	45	Canto PVC adhesivo 2mm x 100 metros color blanco	1	0	1	2	1	1	0	1	18	2025-01-07 03:51:00	2025-01-07 03:51:00	\N	ACC-CANTO-PVC-BLAN
8	Tornillos Melamina 4x40mm	products/tornillos-melamina.jpg	3	8.5	6.5	Tornillos especiales para melamina, paquete de 100 unidades	1	0	1	2	1	1	0	1	18	2025-01-07 03:51:00	2025-01-07 03:51:00	\N	ACC-TORN-MEL-100
9	Bisagra Oculta 35mm	products/bisagra-oculta.jpg	3	4.5	3.5	Bisagra oculta para muebles de melamina, pack de 2 unidades	1	0	1	2	1	1	0	1	18	2025-01-07 03:51:00	2025-01-07 03:51:00	\N	ACC-BIS-OCUL-35
10	Rieles para Cajones 40cm	products/rieles-cajones.jpg	3	18	15	Juego de rieles telescópicos para cajones de 40cm	2	5	1	2	1	1	0	1	18	2025-01-07 03:51:00	2025-01-07 03:51:00	\N	ACC-RIEL-CAJ-40
11	Corte Básico Melamina	products/corte-basico.jpg	5	1	1	Servicio de corte básico para planchas de melamina	1	0	1	1	1	1	0	1	18	2025-01-07 03:51:00	2025-01-07 03:51:00	\N	SERV-CORTE-BASICO
\.


--
-- Data for Name: providers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.providers (id, full_name, imagen, email, phone, address, state, created_at, updated_at, deleted_at, ruc) FROM stdin;
\.


--
-- Data for Name: purchase_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.purchase_details (id, purchase_id, product_id, unit_id, quantity, price_unit, total, state, user_entrega, date_entrega, description, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: purchases; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.purchases (id, warehouse_id, user_id, sucursale_id, date_emision, state, type_comprobant, n_comprobant, provider_id, total, importe, igv, date_entrega, created_at, updated_at, deleted_at, description) FROM stdin;
\.


--
-- Data for Name: refound_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.refound_products (id, product_id, unit_id, warehouse_id, quantity, sale_detail_id, client_id, type, state, description, user_id, resolution_date, description_resolution, created_at, updated_at, deleted_at, state_clone) FROM stdin;
\.


--
-- Data for Name: role_has_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role_has_permissions (permission_id, role_id) FROM stdin;
6	2
7	2
11	2
12	2
17	2
18	2
19	2
21	2
22	2
12	3
13	3
15	3
16	3
22	3
26	3
27	3
28	3
30	3
31	3
32	3
35	3
26	5
27	5
28	5
29	5
11	4
12	4
18	4
22	4
25	4
26	4
27	4
3	4
12	9
18	9
17	9
19	9
21	9
22	9
23	9
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (id, name, guard_name, created_at, updated_at) FROM stdin;
1	Super-Admin	api	2025-01-07 03:51:57	2025-01-07 03:51:57
2	Administrador de Sucursales	api	2025-01-08 03:27:29	2025-01-08 03:27:29
3	Encargado de almacen	api	2025-01-08 03:34:17	2025-01-08 03:34:17
4	Contador	api	2025-01-08 09:32:11	2025-01-08 09:32:11
5	Encargado de compras	api	2025-01-08 09:53:16	2025-01-08 09:53:16
9	Asesor Comercial	api	2025-03-04 14:18:34	2025-03-04 14:18:34
\.


--
-- Data for Name: sale_detail_attentions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sale_detail_attentions (sale_detail_id, product_id, warehouse_id, unit_id, quantity, created_at, updated_at, deleted_at, id) FROM stdin;
\.


--
-- Data for Name: sale_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sale_details (id, sale_id, product_id, product_categorie_id, quantity, price_unit, discount, subtotal, total, unit_id, warehouse_id, igv, description, created_at, updated_at, deleted_at, state_attention, quantity_pending) FROM stdin;
\.


--
-- Data for Name: sale_payments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sale_payments (id, sale_id, method_payment, n_transaction, banco, amount, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: sales; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sales (id, user_id, client_id, type_client, sucursale_id, subtotal, total, igv, state_sale, state_payment, debt, paid_out, date_validation, date_pay_complete, description, created_at, updated_at, deleted_at, state_entrega, discount) FROM stdin;
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sessions (id, user_id, ip_address, user_agent, payload, last_activity) FROM stdin;
Qbi5LVOMd0vCD0gPE5mL0lmpv1NdQ2WSwJNUKsQ7	\N	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiTXdVam41OWFmTHdwVlY5QWVqckxZNGFhNVhHeEgyV2J6bGdjUVB6VCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1737455097
y2KGBmVTzXtqs3JKj8WGI9twDT6pxB6R9lOQH8Sg	\N	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiQjRZMnZjWDJEVFRNRG1Zcm1vMUZOVVpFYmM4N1lHeHpIeTdENVNzNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1758494254
\.


--
-- Data for Name: sucursales; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sucursales (id, name, state, created_at, updated_at, deleted_at, address) FROM stdin;
1	Lima, Villa Maria del Triunfo	1	2025-01-07 03:51:57	2025-09-23 21:06:52	\N	Jr. Francisco de Zela Mza. N Lote. 12
\.


--
-- Data for Name: transport_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transport_details (id, transport_id, product_id, unit_id, quantity, price_unit, total, state, user_entrega, date_entrega, user_salida, date_salida, description, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: transports; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transports (id, warehouse_start_id, warehouse_end_id, date_emision, user_id, state, total, importe, igv, description, date_entrega, created_at, updated_at, deleted_at, date_salida) FROM stdin;
\.


--
-- Data for Name: unit_conversions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.unit_conversions (id, unit_id, unit_to_id, created_at, updated_at) FROM stdin;
1	1	2	2025-01-07 03:51:57	2025-01-07 03:51:57
2	2	1	2025-01-07 03:51:57	2025-01-07 03:51:57
3	1	3	2025-01-07 03:51:57	2025-01-07 03:51:57
4	3	1	2025-01-07 03:51:57	2025-01-07 03:51:57
5	1	4	2025-01-07 03:51:57	2025-01-07 03:51:57
6	4	1	2025-01-07 03:51:57	2025-01-07 03:51:57
7	1	5	2025-01-07 03:51:57	2025-01-07 03:51:57
8	5	1	2025-01-07 03:51:57	2025-01-07 03:51:57
\.


--
-- Data for Name: units; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.units (id, name, description, state, created_at, updated_at, deleted_at) FROM stdin;
1	Unidad	Producto individual	1	2025-01-07 03:51:57	2025-01-07 03:51:57	\N
2	Plancha	Plancha completa de melamina	1	2025-01-07 03:51:57	2025-01-07 03:51:57	\N
3	Metro lineal	Medida en metros lineales	1	2025-01-07 03:51:57	2025-01-07 03:51:57	\N
4	Metro cuadrado	Medida en metros cuadrados	1	2025-01-07 03:51:57	2025-01-07 03:51:57	\N
5	Juego	Conjunto de piezas	1	2025-01-07 03:51:57	2025-01-07 03:51:57	\N
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at, role_id, surname, avatar, sucursale_id, phone, type_document, n_document, deleted_at, state, gender) FROM stdin;
1	Super-Admin User	melacenter@gmail.com	\N	$2y$10$epErCF8Ge/pC/mz2cOuhcOyAO/jReQez3C/tpWlprQfIoqFYc8tC.	PeHLJ8uezu	2025-01-07 03:51:57	2025-01-07 03:51:57	1	\N	users/dDdyY9aWz35UxNarMlo0lBZ9gMDiICmQ52jtfgiX.png	1	\N	\N	\N	\N	1	M
2	Stephany	ghuertashuallcca@gmail.com	\N	$2y$12$P4dUaL9EBTf56lh8H6qWY.oZCcB7tW.L/cmMJGFOHnIxv79DHW2XW	\N	2025-09-24 01:15:56	2025-09-24 01:15:56	1	Huertas	users/NhJK97UlzgzpCTXuXMWbM1NSS1O9b7slYkBDdYJP.jpg	1	989164070	DNI	76512429	\N	1	F
3	Ashley	ashley@melacenter.com	\N	$2y$12$P4dUaL9EBTf56lh8H6qWY.oZCcB7tW.L/cmMJGFOHnIxv79DHW2XW	\N	2025-01-07 03:51:57	2025-01-07 03:51:57	9	Galazar	users/ashley.jpg	1	956256957	DNI	73977139	\N	1	F
4	María	maria@melacenter.com	\N	$2y$12$P4dUaL9EBTf56lh8H6qWY.oZCcB7tW.L/cmMJGFOHnIxv79DHW2XW	\N	2025-01-07 03:51:57	2025-01-07 03:51:57	9	Fernández	users/maria.jpg	1	987654322	DNI	87654322	\N	1	F
5	Laura	laura@melacenter.com	\N	$2y$12$P4dUaL9EBTf56lh8H6qWY.oZCcB7tW.L/cmMJGFOHnIxv79DHW2XW	\N	2025-01-07 03:51:57	2025-01-07 03:51:57	9	Gutiérrez	users/laura.jpg	1	987654323	DNI	87654323	\N	1	F
\.


--
-- Data for Name: warehouses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.warehouses (id, name, address, sucursale_id, state, created_at, updated_at, deleted_at) FROM stdin;
1	Almacén Principal	Tablada de Lurin (Pque Ind.Tablada Alt Cda 46 y 47 Pachacu)	1	1	2025-09-23 21:09:08	2025-09-23 21:09:08	\N
\.


--
-- Name: clients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clients_id_seq', 9, true);


--
-- Name: conversions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.conversions_id_seq', 1004, true);


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.jobs_id_seq', 1, false);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 5, true);


--
-- Name: permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.permissions_id_seq', 36, true);


--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 1, false);


--
-- Name: product_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_categories_id_seq', 7, true);


--
-- Name: product_stock_initials_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_stock_initials_id_seq', 93, true);


--
-- Name: product_wallets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_wallets_id_seq', 31, true);


--
-- Name: product_warehouses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_warehouses_id_seq', 44, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 25, true);


--
-- Name: providers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.providers_id_seq', 2, true);


--
-- Name: purchase_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.purchase_details_id_seq', 15, true);


--
-- Name: purchases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.purchases_id_seq', 1005, true);


--
-- Name: refound_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.refound_products_id_seq', 11, true);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_id_seq', 9, true);


--
-- Name: sale_detail_attentions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sale_detail_attentions_id_seq', 16, true);


--
-- Name: sale_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sale_details_id_seq', 6017, true);


--
-- Name: sale_payments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sale_payments_id_seq', 2026, true);


--
-- Name: sales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sales_id_seq', 3020, true);


--
-- Name: sucursales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sucursales_id_seq', 3, true);


--
-- Name: transport_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transport_details_id_seq', 10, true);


--
-- Name: transports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transports_id_seq', 1004, true);


--
-- Name: unit_conversions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.unit_conversions_id_seq', 12, true);


--
-- Name: units_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.units_id_seq', 4, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 10, true);


--
-- Name: warehouses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.warehouses_id_seq', 4, true);


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
-- PostgreSQL database dump complete
--

\unrestrict 3mVjqc5nonvwXUOUGjyonocz2nU0gzZY0SaFdd1VgZrUS5b6agt3bWxUeXFyMp2

