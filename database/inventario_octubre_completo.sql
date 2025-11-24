--
-- PostgreSQL database dump
--

\restrict M164iZVRJ21E029JuJZUWXAbMeSyPcAwDM2Ld1FQbnC1eZwdc7aW9O5T7HhLa8T

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
-- Name: inventario; Type: DATABASE; Schema: -; Owner: -
--

CREATE DATABASE inventario WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'es-PE';


\unrestrict M164iZVRJ21E029JuJZUWXAbMeSyPcAwDM2Ld1FQbnC1eZwdc7aW9O5T7HhLa8T
\connect inventario
\restrict M164iZVRJ21E029JuJZUWXAbMeSyPcAwDM2Ld1FQbnC1eZwdc7aW9O5T7HhLa8T

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
-- Name: cache; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cache (
    key character varying(255) NOT NULL,
    value text NOT NULL,
    expiration integer NOT NULL
);


--
-- Name: cache_locks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cache_locks (
    key character varying(255) NOT NULL,
    owner character varying(255) NOT NULL,
    expiration integer NOT NULL
);


--
-- Name: clients; Type: TABLE; Schema: public; Owner: -
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
    ubigeo_region character varying(25),
    ubigeo_provincia character varying(25),
    ubigeo_distrito character varying(25),
    region character varying(100) NOT NULL,
    provincia character varying(100) NOT NULL,
    distrito character varying(100) NOT NULL,
    address character varying(250),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone,
    gender character varying(4)
);


--
-- Name: COLUMN clients.type_client; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.clients.type_client IS '1 es cliente final
2 es cliente empresa';


--
-- Name: COLUMN clients.state; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.clients.state IS '1 es activo
2 es inactivo';


--
-- Name: clients_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.clients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: clients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.clients_id_seq OWNED BY public.clients.id;


--
-- Name: conversions; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: conversions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.conversions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: conversions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.conversions_id_seq OWNED BY public.conversions.id;


--
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- Name: job_batches; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: jobs; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.jobs_id_seq OWNED BY public.jobs.id;


--
-- Name: migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: model_has_permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.model_has_permissions (
    permission_id bigint NOT NULL,
    model_type character varying(255) NOT NULL,
    model_id bigint NOT NULL
);


--
-- Name: model_has_roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.model_has_roles (
    role_id bigint NOT NULL,
    model_type character varying(255) NOT NULL,
    model_id bigint NOT NULL
);


--
-- Name: password_reset_tokens; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.password_reset_tokens (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


--
-- Name: permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.permissions (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    guard_name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- Name: permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.permissions_id_seq OWNED BY public.permissions.id;


--
-- Name: personal_access_tokens; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.personal_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.personal_access_tokens_id_seq OWNED BY public.personal_access_tokens.id;


--
-- Name: product_categories; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: COLUMN product_categories.state; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.product_categories.state IS '1 es actvio
2 es inactivo';


--
-- Name: product_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.product_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: product_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.product_categories_id_seq OWNED BY public.product_categories.id;


--
-- Name: product_stock_initials; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: product_stock_initials_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.product_stock_initials_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: product_stock_initials_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.product_stock_initials_id_seq OWNED BY public.product_stock_initials.id;


--
-- Name: product_wallets; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: COLUMN product_wallets.type_client; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.product_wallets.type_client IS '1 es para cliente final
2 es un cliente empresa';


--
-- Name: product_wallets_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.product_wallets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: product_wallets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.product_wallets_id_seq OWNED BY public.product_wallets.id;


--
-- Name: product_warehouses; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: COLUMN product_warehouses.state_stock; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.product_warehouses.state_stock IS '1 es disponible 
2 por agotar
3 agotado';


--
-- Name: product_warehouses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.product_warehouses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: product_warehouses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.product_warehouses_id_seq OWNED BY public.product_warehouses.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: COLUMN products.is_discount; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.products.is_discount IS '1 no tiene descuento
2 tiene descuento';


--
-- Name: COLUMN products.max_discount; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.products.max_discount IS 'El máximo descuento que tiene un producto en %';


--
-- Name: COLUMN products.is_gift; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.products.is_gift IS '1 no es gratuito
2 es gratuito';


--
-- Name: COLUMN products.disponibilidad; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.products.disponibilidad IS '1 es poder ser atendió sin stock
2 no poder ser atendido sin stock';


--
-- Name: COLUMN products.state; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.products.state IS '1 es activo
2 es inactivo';


--
-- Name: COLUMN products.state_stock; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.products.state_stock IS '1 es disponible
2 por agotar
3 es agotado';


--
-- Name: COLUMN products.warranty_day; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.products.warranty_day IS 'El máximo numero de día en las que se puede devolver el producto';


--
-- Name: COLUMN products.tax_selected; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.products.tax_selected IS '1 es sujeto a impuesto
2 no sujeto a impuesto';


--
-- Name: COLUMN products.importe_iva; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.products.importe_iva IS 'La cantidad del importe es en porcentaje';


--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: providers; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: COLUMN providers.state; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.providers.state IS '1 es activo
2 es inactivo';


--
-- Name: providers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.providers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: providers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.providers_id_seq OWNED BY public.providers.id;


--
-- Name: purchase_details; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: COLUMN purchase_details.state; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.purchase_details.state IS '1 SOLICITUD
2 ENTREGADO';


--
-- Name: purchase_details_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.purchase_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: purchase_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.purchase_details_id_seq OWNED BY public.purchase_details.id;


--
-- Name: purchases; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: COLUMN purchases.state; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.purchases.state IS '1 SOLICITUD
2 REVISION
3 PARCIAL
4 ENTREGADO';


--
-- Name: purchases_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.purchases_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: purchases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.purchases_id_seq OWNED BY public.purchases.id;


--
-- Name: refound_products; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: COLUMN refound_products.type; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.refound_products.type IS '1 Reparación
2 Remplazo
3 Devolución';


--
-- Name: COLUMN refound_products.state; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.refound_products.state IS '1 Pendiente
2 Revisión
3 Reparado
4 Descartado';


--
-- Name: refound_products_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.refound_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: refound_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.refound_products_id_seq OWNED BY public.refound_products.id;


--
-- Name: role_has_permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.role_has_permissions (
    permission_id bigint NOT NULL,
    role_id bigint NOT NULL
);


--
-- Name: roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.roles (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    guard_name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: sale_detail_attentions; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: sale_detail_attentions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sale_detail_attentions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sale_detail_attentions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sale_detail_attentions_id_seq OWNED BY public.sale_detail_attentions.id;


--
-- Name: sale_details; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: COLUMN sale_details.subtotal; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.sale_details.subtotal IS 'Es el precio unitario - descuento';


--
-- Name: COLUMN sale_details.total; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.sale_details.total IS 'El subtotal * cantidad';


--
-- Name: COLUMN sale_details.state_attention; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.sale_details.state_attention IS '1 es pendiente
2 es parcial
3 es completo';


--
-- Name: COLUMN sale_details.quantity_pending; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.sale_details.quantity_pending IS 'La cantidad pendiente por atender';


--
-- Name: sale_details_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sale_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sale_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sale_details_id_seq OWNED BY public.sale_details.id;


--
-- Name: sale_payments; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: sale_payments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sale_payments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sale_payments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sale_payments_id_seq OWNED BY public.sale_payments.id;


--
-- Name: sales; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: COLUMN sales.type_client; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.sales.type_client IS '1 es cliente final
2 es cliente empresa';


--
-- Name: COLUMN sales.state_sale; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.sales.state_sale IS '1 es venta
2 es cotizacion';


--
-- Name: COLUMN sales.state_payment; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.sales.state_payment IS '1 es pendiente
2 es parcial
3 es completo';


--
-- Name: COLUMN sales.debt; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.sales.debt IS 'deuda';


--
-- Name: COLUMN sales.paid_out; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.sales.paid_out IS 'pagado o cancelado';


--
-- Name: COLUMN sales.date_validation; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.sales.date_validation IS 'fecha de la realización de una venta';


--
-- Name: COLUMN sales.state_entrega; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.sales.state_entrega IS '1 es pendiente
2 es parcial
3 completo';


--
-- Name: sales_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sales_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sales_id_seq OWNED BY public.sales.id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sessions (
    id character varying(255) NOT NULL,
    user_id bigint,
    ip_address character varying(45),
    user_agent text,
    payload text NOT NULL,
    last_activity integer NOT NULL
);


--
-- Name: sucursales; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: COLUMN sucursales.state; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.sucursales.state IS '1 es activo
2 es inactivo';


--
-- Name: sucursales_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sucursales_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sucursales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sucursales_id_seq OWNED BY public.sucursales.id;


--
-- Name: transport_details; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: COLUMN transport_details.state; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.transport_details.state IS '1  PENDIENTE
2 SALIDA
3 ENTREGA';


--
-- Name: transport_details_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.transport_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: transport_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.transport_details_id_seq OWNED BY public.transport_details.id;


--
-- Name: transports; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: COLUMN transports.state; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.transports.state IS '1 SOLICITUD
2 REVISION SALIDAD
3 SALIDA
4 LLEGADA
5 REVISION LLEGADA
6 ENTREGA';


--
-- Name: transports_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.transports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: transports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.transports_id_seq OWNED BY public.transports.id;


--
-- Name: unit_conversions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.unit_conversions (
    id bigint NOT NULL,
    unit_id bigint NOT NULL,
    unit_to_id bigint NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: COLUMN unit_conversions.unit_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.unit_conversions.unit_id IS 'Y la unidad a la que esta relacionada';


--
-- Name: COLUMN unit_conversions.unit_to_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.unit_conversions.unit_to_id IS 'La unidad a la que se quiere convertir';


--
-- Name: unit_conversions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.unit_conversions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: unit_conversions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.unit_conversions_id_seq OWNED BY public.unit_conversions.id;


--
-- Name: units; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: COLUMN units.state; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.units.state IS '1 activo
2 inactivo';


--
-- Name: units_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.units_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: units_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.units_id_seq OWNED BY public.units.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: COLUMN users.state; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.users.state IS '1 es activo
2 es inactivo';


--
-- Name: COLUMN users.gender; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.users.gender IS 'M es masculino
F es femenino';


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: warehouses; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: COLUMN warehouses.state; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.warehouses.state IS '1 es activo
2 es inactivo';


--
-- Name: warehouses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.warehouses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: warehouses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.warehouses_id_seq OWNED BY public.warehouses.id;


--
-- Name: clients id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.clients ALTER COLUMN id SET DEFAULT nextval('public.clients_id_seq'::regclass);


--
-- Name: conversions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.conversions ALTER COLUMN id SET DEFAULT nextval('public.conversions_id_seq'::regclass);


--
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- Name: jobs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: permissions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.permissions ALTER COLUMN id SET DEFAULT nextval('public.permissions_id_seq'::regclass);


--
-- Name: personal_access_tokens id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);


--
-- Name: product_categories id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_categories ALTER COLUMN id SET DEFAULT nextval('public.product_categories_id_seq'::regclass);


--
-- Name: product_stock_initials id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_stock_initials ALTER COLUMN id SET DEFAULT nextval('public.product_stock_initials_id_seq'::regclass);


--
-- Name: product_wallets id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_wallets ALTER COLUMN id SET DEFAULT nextval('public.product_wallets_id_seq'::regclass);


--
-- Name: product_warehouses id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_warehouses ALTER COLUMN id SET DEFAULT nextval('public.product_warehouses_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: providers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.providers ALTER COLUMN id SET DEFAULT nextval('public.providers_id_seq'::regclass);


--
-- Name: purchase_details id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchase_details ALTER COLUMN id SET DEFAULT nextval('public.purchase_details_id_seq'::regclass);


--
-- Name: purchases id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchases ALTER COLUMN id SET DEFAULT nextval('public.purchases_id_seq'::regclass);


--
-- Name: refound_products id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.refound_products ALTER COLUMN id SET DEFAULT nextval('public.refound_products_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: sale_detail_attentions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sale_detail_attentions ALTER COLUMN id SET DEFAULT nextval('public.sale_detail_attentions_id_seq'::regclass);


--
-- Name: sale_details id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sale_details ALTER COLUMN id SET DEFAULT nextval('public.sale_details_id_seq'::regclass);


--
-- Name: sale_payments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sale_payments ALTER COLUMN id SET DEFAULT nextval('public.sale_payments_id_seq'::regclass);


--
-- Name: sales id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sales ALTER COLUMN id SET DEFAULT nextval('public.sales_id_seq'::regclass);


--
-- Name: sucursales id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sucursales ALTER COLUMN id SET DEFAULT nextval('public.sucursales_id_seq'::regclass);


--
-- Name: transport_details id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transport_details ALTER COLUMN id SET DEFAULT nextval('public.transport_details_id_seq'::regclass);


--
-- Name: transports id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transports ALTER COLUMN id SET DEFAULT nextval('public.transports_id_seq'::regclass);


--
-- Name: unit_conversions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.unit_conversions ALTER COLUMN id SET DEFAULT nextval('public.unit_conversions_id_seq'::regclass);


--
-- Name: units id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.units ALTER COLUMN id SET DEFAULT nextval('public.units_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: warehouses id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.warehouses ALTER COLUMN id SET DEFAULT nextval('public.warehouses_id_seq'::regclass);


--
-- Data for Name: cache; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.cache (key, value, expiration) FROM stdin;
spatie.permission.cache	a:3:{s:5:"alias";a:4:{s:1:"a";s:2:"id";s:1:"b";s:4:"name";s:1:"c";s:10:"guard_name";s:1:"r";s:5:"roles";}s:11:"permissions";a:36:{i:0;a:4:{s:1:"a";i:1;s:1:"b";s:9:"dashboard";s:1:"c";s:3:"api";s:1:"r";a:1:{i:0;i:9;}}i:1;a:3:{s:1:"a";i:2;s:1:"b";s:13:"register_role";s:1:"c";s:3:"api";}i:2;a:4:{s:1:"a";i:3;s:1:"b";s:9:"list_role";s:1:"c";s:3:"api";s:1:"r";a:1:{i:0;i:4;}}i:3;a:3:{s:1:"a";i:4;s:1:"b";s:9:"edit_role";s:1:"c";s:3:"api";}i:4;a:3:{s:1:"a";i:5;s:1:"b";s:11:"delete_role";s:1:"c";s:3:"api";}i:5;a:4:{s:1:"a";i:6;s:1:"b";s:13:"register_user";s:1:"c";s:3:"api";s:1:"r";a:1:{i:0;i:2;}}i:6;a:4:{s:1:"a";i:7;s:1:"b";s:9:"list_user";s:1:"c";s:3:"api";s:1:"r";a:1:{i:0;i:2;}}i:7;a:3:{s:1:"a";i:8;s:1:"b";s:9:"edit_user";s:1:"c";s:3:"api";}i:8;a:3:{s:1:"a";i:9;s:1:"b";s:11:"delete_user";s:1:"c";s:3:"api";}i:9;a:3:{s:1:"a";i:10;s:1:"b";s:8:"settings";s:1:"c";s:3:"api";}i:10;a:4:{s:1:"a";i:11;s:1:"b";s:16:"register_product";s:1:"c";s:3:"api";s:1:"r";a:2:{i:0;i:2;i:1;i:4;}}i:11;a:4:{s:1:"a";i:12;s:1:"b";s:12:"list_product";s:1:"c";s:3:"api";s:1:"r";a:4:{i:0;i:2;i:1;i:3;i:2;i:4;i:3;i:9;}}i:12;a:4:{s:1:"a";i:13;s:1:"b";s:12:"edit_product";s:1:"c";s:3:"api";s:1:"r";a:1:{i:0;i:3;}}i:13;a:3:{s:1:"a";i:14;s:1:"b";s:14:"delete_product";s:1:"c";s:3:"api";}i:14;a:4:{s:1:"a";i:15;s:1:"b";s:22:"show_inventory_product";s:1:"c";s:3:"api";s:1:"r";a:2:{i:0;i:3;i:1;i:9;}}i:15;a:4:{s:1:"a";i:16;s:1:"b";s:25:"show_wallet_price_product";s:1:"c";s:3:"api";s:1:"r";a:1:{i:0;i:3;}}i:16;a:4:{s:1:"a";i:17;s:1:"b";s:15:"register_client";s:1:"c";s:3:"api";s:1:"r";a:2:{i:0;i:2;i:1;i:9;}}i:17;a:4:{s:1:"a";i:18;s:1:"b";s:11:"list_client";s:1:"c";s:3:"api";s:1:"r";a:3:{i:0;i:2;i:1;i:4;i:2;i:9;}}i:18;a:4:{s:1:"a";i:19;s:1:"b";s:11:"edit_client";s:1:"c";s:3:"api";s:1:"r";a:2:{i:0;i:2;i:1;i:9;}}i:19;a:3:{s:1:"a";i:20;s:1:"b";s:13:"delete_client";s:1:"c";s:3:"api";}i:20;a:4:{s:1:"a";i:21;s:1:"b";s:13:"register_sale";s:1:"c";s:3:"api";s:1:"r";a:2:{i:0;i:2;i:1;i:9;}}i:21;a:4:{s:1:"a";i:22;s:1:"b";s:9:"list_sale";s:1:"c";s:3:"api";s:1:"r";a:4:{i:0;i:2;i:1;i:3;i:2;i:4;i:3;i:9;}}i:22;a:4:{s:1:"a";i:23;s:1:"b";s:9:"edit_sale";s:1:"c";s:3:"api";s:1:"r";a:1:{i:0;i:9;}}i:23;a:3:{s:1:"a";i:24;s:1:"b";s:11:"delete_sale";s:1:"c";s:3:"api";}i:24;a:4:{s:1:"a";i:25;s:1:"b";s:6:"return";s:1:"c";s:3:"api";s:1:"r";a:1:{i:0;i:4;}}i:25;a:4:{s:1:"a";i:26;s:1:"b";s:17:"register_purchase";s:1:"c";s:3:"api";s:1:"r";a:3:{i:0;i:3;i:1;i:5;i:2;i:4;}}i:26;a:4:{s:1:"a";i:27;s:1:"b";s:13:"list_purchase";s:1:"c";s:3:"api";s:1:"r";a:3:{i:0;i:3;i:1;i:5;i:2;i:4;}}i:27;a:4:{s:1:"a";i:28;s:1:"b";s:13:"edit_purchase";s:1:"c";s:3:"api";s:1:"r";a:2:{i:0;i:3;i:1;i:5;}}i:28;a:4:{s:1:"a";i:29;s:1:"b";s:15:"delete_purchase";s:1:"c";s:3:"api";s:1:"r";a:1:{i:0;i:5;}}i:29;a:4:{s:1:"a";i:30;s:1:"b";s:18:"register_transport";s:1:"c";s:3:"api";s:1:"r";a:1:{i:0;i:3;}}i:30;a:4:{s:1:"a";i:31;s:1:"b";s:14:"list_transport";s:1:"c";s:3:"api";s:1:"r";a:1:{i:0;i:3;}}i:31;a:4:{s:1:"a";i:32;s:1:"b";s:14:"edit_transport";s:1:"c";s:3:"api";s:1:"r";a:1:{i:0;i:3;}}i:32;a:3:{s:1:"a";i:33;s:1:"b";s:16:"delete_transport";s:1:"c";s:3:"api";}i:33;a:3:{s:1:"a";i:34;s:1:"b";s:11:"conversions";s:1:"c";s:3:"api";}i:34;a:4:{s:1:"a";i:35;s:1:"b";s:6:"kardex";s:1:"c";s:3:"api";s:1:"r";a:1:{i:0;i:3;}}i:35;a:3:{s:1:"a";i:36;s:1:"b";s:12:"profile_user";s:1:"c";s:3:"api";}}s:5:"roles";a:5:{i:0;a:3:{s:1:"a";i:9;s:1:"b";s:16:"Asesor Comercial";s:1:"c";s:3:"api";}i:1;a:3:{s:1:"a";i:4;s:1:"b";s:8:"Contador";s:1:"c";s:3:"api";}i:2;a:3:{s:1:"a";i:2;s:1:"b";s:27:"Administrador de Sucursales";s:1:"c";s:3:"api";}i:3;a:3:{s:1:"a";i:3;s:1:"b";s:20:"Encargado de almacen";s:1:"c";s:3:"api";}i:4;a:3:{s:1:"a";i:5;s:1:"b";s:20:"Encargado de compras";s:1:"c";s:3:"api";}}}	1764025786
\.


--
-- Data for Name: cache_locks; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.cache_locks (key, owner, expiration) FROM stdin;
\.


--
-- Data for Name: clients; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.clients (id, name, surname, full_name, phone, email, type_client, type_document, n_document, birth_date, user_id, sucursale_id, state, ubigeo_region, ubigeo_provincia, ubigeo_distrito, region, provincia, distrito, address, created_at, updated_at, deleted_at, gender) FROM stdin;
8	FAJARDO CABALLERO	JANET OLIVIA	FAJARDO CABALLERO JANET OLIVIA	989164070	\N	2	RUC	10430523479	2025-11-19 00:00:00	1	1	1	15	1501	150136	Lima	Lima	San Miguel	AV. VENEZUELA NRO. 3221 URB. PANDO	2025-10-02 10:03:27	2025-10-02 10:03:27	\N	F
6	ELVIRA	\N	ELVIRA	989164070	\N	1	DNI	00000011	\N	1	1	1	15	1501	150142	Lima	Lima	Villa María del Triunfo	\N	2025-10-02 09:02:11	2025-10-02 09:02:11	\N	F
15	AMBROSIO TEODORO	GALARZA ROJAS	AMBROSIO TEODORO GALARZA ROJAS	989164070	\N	2	RUC	10095126745	\N	1	1	1	15	1501	150142	Lima	Lima	Villa María del Triunfo	AL. SOLIDARIDAD MZA. H INT. TDA3 LOTE. 1A	2025-10-06 10:55:20	2025-10-06 10:55:20	\N	M
26	CERON	\N	CERON	989164070	\N	1	DNI	00000005	\N	1	1	1	15	1501	\N	Lima	Lima	Villa María del Triunfo	\N	2025-10-30 09:56:31	2025-10-30 09:56:31	\N	M
28	EDGAR	VELASQUEZ	EDGAR VELASQUEZ	989164070	\N	1	DNI	00000010	\N	1	1	1	15	1501	\N	Lima	Lima	Villa María del Triunfo	\N	2025-11-06 09:02:50	2025-11-06 09:02:50	\N	M
4	ALI	\N	ALI	989164070	\N	1	DNI	00000003	\N	1	1	1	15	1501	\N	Lima	Lima	Villa María del Triunfo	\N	2025-10-02 10:37:58	2025-10-02 10:37:58	\N	M
1	WILFREDO	CASTRO QUILIANO	WILFREDO CASTRO QUILIANO	989164070	\N	2	RUC	10068066978	\N	1	1	1	15	1501	150142	Lima	Lima	Villa María del Triunfo	TABLADA DE LURIN VILLA MARIA DEL TRIUNFO	2025-10-01 08:14:22	2025-10-01 08:14:22	\N	M
18	CARLOS	CASTRO	CARLOS CASTRO	989164070	\N	1	DNI	00000004	\N	1	1	1	15	1501	150142	Lima	Lima	Villa María del Triunfo	\N	2025-10-16 09:23:44	2025-10-16 09:23:44	\N	M
23	DAVID	DOMINGUEZ	DAVID DOMINGUEZ	989164070	\N	1	DNI	00000008	\N	1	1	1	15	1501	150142	Lima	Lima	Villa María del Triunfo	\N	2025-10-23 10:33:22	2025-10-23 10:33:22	\N	M
25	DIEGO	BAUTISTA	DIEGO BAUTISTA	989164070	\N	1	DNI	00000009	\N	1	1	1	15	1501	150142	Lima	Lima	Villa María del Triunfo	\N	2025-10-24 10:41:44	2025-10-24 10:41:44	\N	M
3	ALEX	GALARZA	ALEX GALARZA	989164070	\N	1	DNI	00000002	\N	1	1	1	15	1501	150142	Lima	Lima	Villa María del Triunfo	\N	2025-10-02 11:12:44	2025-10-02 11:12:44	\N	M
12	MUEBLES LOZANO	\N	MUEBLES LOZANO	989164070	\N	2	RUC	20607831452	\N	1	1	1	15	1501	150142	Lima	Lima	Villa María del Triunfo	\N	2025-10-02 10:11:59	2025-10-02 10:11:59	\N	M
2	ALAN	\N	ALAN	989164070	\N	1	DNI	00000001	\N	1	1	1	15	1501	150142	Lima	Lima	Villa María del Triunfo	\N	2025-10-02 09:55:03	2025-10-02 09:55:03	\N	M
29	INVERSIONES MELARC SAC	\N	INVERSIONES MELARC SAC	989164070	\N	2	RUC	20606831451	2025-11-19 00:00:00	1	1	1	15	1501	150132	Lima	Lima	San Juan de Lurigancho	san Carlos frente almacenes cacinelli, Av. Próceres de la Independencia 2933-2935, Lima 02002	2025-11-06 08:31:07	2025-11-06 08:31:07	\N	M
14	MANUEL	\N	MANUEL	989164070	\N	1	DNI	00000020	\N	1	1	1	15	1501	150142	Lima	Lima	Villa María del Triunfo	\N	2025-10-04 09:33:39	2025-10-04 09:33:39	\N	M
16	MARINO	CURO	MARINO CURO	989164070	\N	1	DNI	00000023	\N	1	1	1	15	1501	150142	Lima	Lima	Villa María del Triunfo	\N	2025-10-09 08:22:18	2025-10-09 08:22:18	\N	M
19	JENIFER	CHILENO	JENIFER CHILENO	989164070	\N	1	DNI	00000014	\N	1	1	1	15	1501	150142	Lima	Lima	Villa María del Triunfo	\N	2025-10-16 10:49:13	2025-10-16 10:49:13	\N	M
20	JONNY	\N	JONNY	989164070	\N	1	DNI	00000015	\N	1	1	1	15	1501	150142	Lima	Lima	Villa María del Triunfo	\N	2025-10-16 11:58:55	2025-10-16 11:58:55	\N	M
21	LUIS	LOZANO	LUIS LOZANO	989164070	\N	1	DNI	00000018	\N	1	1	1	15	1501	150142	Lima	Lima	Villa María del Triunfo	\N	2025-10-20 08:51:37	2025-10-20 08:51:37	\N	M
22	JEAN	\N	JEAN	989164070	\N	1	DNI	00000013	\N	1	1	1	15	1501	150142	Lima	Lima	Villa María del Triunfo	\N	2025-10-21 09:14:04	2025-10-21 09:14:04	\N	M
7	ESTEFANIA	\N	ESTEFANIA	989164070	\N	1	DNI	00000012	\N	1	1	1	15	1501	150142	Lima	Lima	Villa María del Triunfo	\N	2025-10-02 11:55:49	2025-10-02 11:55:49	\N	F
17	RICARDO	\N	RICARDO	989164070	\N	1	DNI	00000025	\N	1	1	1	15	1501	150143	Lima	Lima	Villa María del Triunfo	\N	2025-10-14 11:41:22	2025-10-14 11:41:22	\N	M
24	MARCO	\N	MARCO	989164070	\N	1	DNI	00000022	\N	1	1	1	15	1501	150142	Lima	Lima	Villa María del Triunfo	\N	2025-10-23 11:49:57	2025-10-23 11:49:57	\N	M
27	PEPE	\N	PEPE	989164070	\N	1	DNI	00000024	\N	1	1	1	15	1501	150142	Lima	Lima	Villa María del Triunfo	\N	2025-11-05 11:33:28	2025-11-05 11:33:28	\N	M
5	CONTIDIAZ	\N	CONTIDIAZ	989164070	\N	1	DNI	00000007	\N	1	1	1	15	1501	150142	Lima	Lima	Villa María del Triunfo	\N	2025-10-02 08:41:30	2025-10-02 08:41:30	\N	M
31	CLIENTE	2	CLIENTE 2	989164070	\N	1	DNI	00000006	2025-11-19 00:00:00	1	1	1	15	1501	150143	Lima	Lima	Villa María del Triunfo	\N	2025-11-10 10:29:41	2025-11-10 10:29:41	\N	M
30	LOLO	\N	LOLO null	989164070	\N	1	DNI	00000017	2025-11-19 00:00:00	1	1	1	15	1501	150142	Lima	Lima	Villa El Salvador	\N	2025-11-07 11:15:18	2025-11-07 11:15:18	\N	M
9	GODOY CUBA	LIVIO ESTEBAN	GODOY CUBA LIVIO ESTEBAN	989164070	\N	2	RUC	10083874665	\N	1	1	1	15	1501	150142	Lima	Lima	Villa María del Triunfo	A.H. NUEVA ESPERANZA 43A - VILLA MARIA DEL TRIUNFO	2025-10-02 08:21:52	2025-10-02 08:21:52	\N	M
10	JUAN	CHIPANA	JUAN CHIPANA	989164070	\N	1	DNI	00000016	\N	1	1	1	15	1501	150142	Lima	Lima	Villa María del Triunfo	\N	2025-10-02 11:47:00	2025-10-02 11:47:00	\N	M
11	MARCIAL	\N	MARCIAL	989164070	\N	1	DNI	00000021	\N	1	1	1	15	1501	150142	Lima	Lima	Villa María del Triunfo	\N	2025-10-02 09:30:44	2025-10-02 09:30:44	\N	M
13	LUIS	TABOADA	LUIS TABOADA	989164070	\N	1	DNI	00000019	\N	1	1	1	15	1501	150142	Lima	Lima	Villa María del Triunfo	\N	2025-10-03 11:10:03	2025-10-03 11:10:03	\N	M
\.


--
-- Data for Name: conversions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.conversions (id, product_id, warehouse_id, unit_start_id, unit_end_id, user_id, quantity_start, quantity_end, description, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
\.


--
-- Data for Name: job_batches; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.job_batches (id, name, total_jobs, pending_jobs, failed_jobs, failed_job_ids, options, cancelled_at, created_at, finished_at) FROM stdin;
\.


--
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.jobs (id, queue, payload, attempts, reserved_at, available_at, created_at) FROM stdin;
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.migrations (id, migration, batch) FROM stdin;
1	0001_01_01_000000_create_users_table	1
2	0001_01_01_000001_create_cache_table	1
3	0001_01_01_000002_create_jobs_table	1
4	2025_01_04_083200_create_personal_access_tokens_table	1
5	2025_01_04_092557_create_permission_tables	1
\.


--
-- Data for Name: model_has_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.model_has_permissions (permission_id, model_type, model_id) FROM stdin;
\.


--
-- Data for Name: model_has_roles; Type: TABLE DATA; Schema: public; Owner: -
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
1	App\\Models\\User	11
1	App\\Models\\User	3
1	App\\Models\\User	2
9	App\\Models\\User	3
9	App\\Models\\User	4
9	App\\Models\\User	5
\.


--
-- Data for Name: password_reset_tokens; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.password_reset_tokens (email, token, created_at) FROM stdin;
\.


--
-- Data for Name: permissions; Type: TABLE DATA; Schema: public; Owner: -
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
-- Data for Name: personal_access_tokens; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: product_categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.product_categories (id, title, imagen, state, created_at, updated_at, deleted_at) FROM stdin;
4	Cortes Especiales	categories/1762994861_images (1).jpg	1	2025-09-30 08:17:32	2025-09-30 08:17:32	\N
3	Accesorios y Herrajes	categories/1762994880_riel_para_cajon_de_melamina_1350x1458.webp	1	2025-09-30 08:14:55	2025-09-30 08:14:55	\N
2	Melaminas 15mm	categories/1762994937_w=800,h=800,fit=pad.webp	1	2025-09-30 08:12:48	2025-09-30 08:12:48	\N
1	Melaminas 18mm	categories/1762994964_Melamina Blanco.webp	1	2025-09-30 08:10:11	2025-09-30 08:10:11	\N
5	Servicios de Corte	categories/1763072831_enchapado-de-cantos-300x225-c-default.jpg	1	2025-09-30 08:19:58	2025-09-30 08:19:58	\N
\.


--
-- Data for Name: product_stock_initials; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.product_stock_initials (id, product_id, unit_id, warehouse_id, price_unit_avg, stock, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: product_wallets; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.product_wallets (id, product_id, type_client, unit_id, sucursale_id, price, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: product_warehouses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.product_warehouses (id, product_id, warehouse_id, unit_id, stock, umbral, created_at, updated_at, deleted_at, state_stock) FROM stdin;
7	1	1	2	5	0	2025-09-30 12:04:36	2025-09-30 12:04:36	\N	1
6	2	1	2	4	0	2025-09-30 12:04:35	2025-09-30 12:04:35	\N	1
5	3	1	2	2	0	2025-09-30 12:04:35	2025-09-30 12:04:35	\N	1
4	4	1	2	0	0	2025-09-30 12:04:35	2025-09-30 12:04:35	\N	1
3	5	1	2	3	0	2025-09-30 12:04:34	2025-09-30 12:04:34	\N	1
2	6	1	2	4	0	2025-09-30 12:04:34	2025-09-30 12:04:34	\N	1
1	12	1	2	2	0	2025-09-30 12:04:34	2025-09-30 12:04:34	\N	1
10	7	1	3	3	0	2025-09-30 14:42:05	2025-09-30 14:42:05	\N	1
9	8	1	1	116	0	2025-09-30 14:42:05	2025-09-30 14:42:05	\N	1
13	9	1	5	1	0	2025-09-30 14:42:05	2025-09-30 14:42:05	\N	1
12	10	1	5	5	0	2025-09-30 14:42:05	2025-09-30 14:42:05	\N	1
11	11	1	1	31	0	2025-09-30 14:42:05	2025-09-30 14:42:05	\N	1
15	13	1	1	0	0	2025-09-30 14:42:06	2025-09-30 14:42:06	\N	1
14	14	1	1	4	0	2025-09-30 14:42:06	2025-09-30 14:42:06	\N	1
8	15	1	1	2	0	2025-09-30 14:42:06	2025-09-30 14:42:06	\N	1
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products (id, title, imagen, product_categorie_id, price_general, price_company, description, is_discount, max_discount, is_gift, disponibilidad, state, state_stock, warranty_day, tax_selected, importe_iva, created_at, updated_at, deleted_at, sku) FROM stdin;
1	Melamina Pelikano Blanco 2.44 x 2.15 de 18mm	products/ICuDfFwucaqkWtvECabobeNnAsYa3ploeB6msbgR.webp	1	237.29	228.81	Melamina Pelikano de 18mm color blanco, ideal para muebles de cocina y closet	2	5	1	1	1	1	30	1	18	2025-09-30 08:20:11	2025-09-30 08:20:11	\N	MEL-PELI-BLAN-18
2	Melamina Pelikano Nogal 2.44 x 2.15 de 18mm	\N	1	237.29	228.81	Melamina Pelikano de 18mm color nogal, textura madera natural	2	5	1	1	1	1	30	1	18	2025-09-30 08:21:03	2025-09-30 08:21:03	\N	MEL-PELI-NOGAL-18
3	Melamina Pelikano Roble 2.44 x 2.15 de 18mm	\N	1	237.29	228.81	Melamina Pelikano de 18mm color roble claro, acabado premium	2	5	1	1	1	1	30	1	18	2025-09-30 08:22:15	2025-09-30 08:22:15	\N	MEL-PELI-ROBLE-18
4	Melamina Pelikano Wengue 2.44 x 2.15 de 18mm	\N	1	237.29	228.81	Melamina Pelikano de 18mm color wengue, elegante y moderno	2	5	1	1	1	1	30	1	18	2025-09-30 08:23:49	2025-09-30 08:23:49	\N	MEL-PELI-WENGUE-18
5	Melamina Pelikano Blanco 2.44 x 2.15 de 15mm	\N	2	220.34	211.86	Melamina standard de 15mm color blanco, para proyectos económicos	2	10	1	1	1	1	30	1	18	2025-09-30 08:24:10	2025-09-30 08:24:10	\N	MEL-STD-BLAN-15
6	Melamina Pelikano Negro 2.44 x 2.15 de 15mm	\N	2	220.34	211.86	Melamina standard de 15mm color negro, moderno y minimalista	2	10	1	1	1	1	30	1	18	2025-09-30 08:25:32	2025-09-30 08:25:32	\N	MEL-STD-NEGRO-15
7	Canto PVC 2mm x 100m Blanco	\N	3	76.27	72.03	Canto PVC adhesivo 2mm x 100 metros color blanco	1	0	1	1	1	1	0	1	18	2025-09-30 08:26:27	2025-11-20 14:33:21	\N	ACC-CANTO-PVC-BLAN
8	Tornillos Melamina 4x40mm	\N	3	0.072	0.0636	Tornillos especiales para melamina, paquete de 100 unidades	1	0	1	1	1	1	0	1	18	2025-09-30 08:27:14	2025-11-20 21:31:24	\N	ACC-TORN-MEL-100
9	Bisagra Oculta 35mm	\N	3	3.81	2.97	Bisagra oculta para muebles de melamina, pack de 2 unidades	1	0	1	1	1	1	0	1	18	2025-09-30 08:28:01	2025-09-30 08:28:01	\N	ACC-BIS-OCUL-35
10	Rieles para Cajones 40cm	\N	3	15.25	13.56	<p>Juego de rieles para cajones de 40cm</p>	2	5	1	1	1	1	0	1	18	2025-09-30 08:28:56	2025-11-20 17:44:42	\N	ACC-RIEL-CAJ-40
12	Melamina Pelikano Negro 2.44 x 2.15 de 18mm	\N	1	237.29	228.81	Melamina Pelikano de 18mm color negro, textura madera natural	2	5	1	1	1	1	30	1	18	2025-09-30 08:29:58	2025-09-30 08:29:58	\N	MEL-PELI-NEGRO-18
13	Interruptor táctil - Panel	\N	3	38.14	29.66	🔹Encender y apagar (On/Off). 🔹Regulación de intensidad. 🔹Rango de detección hasta 22mm. 🔹Funciona con luces LED de 12v. 🔹Capacidad: 5A, 60W Max. 🔹Uso en melamina, madera, piedra. 🔹Dimensiones: 48 x 48 x 6mm.	1	0	0	1	1	1	0	1	18	2025-01-07 03:51:00	2025-01-07 03:51:00	\N	ACC-INT-PANEL
14	Interruptor táctil para espejo	\N	3	25.42	21.19	ON/OFF + Dimmable	1	0	0	1	1	1	0	1	18	2025-01-07 03:51:00	2025-01-07 03:51:00	\N	ACC-INT-ESPEJO
15	Control touch CCT - 2 colores	\N	3	67.8	59.32	<p>Encendido y apagado. Regulada intensidad. Cambiar de color. Regula temperatura. </p><p>Voltaje de funcionamiento: DC12-24V.</p><p>Corriente de salida: 6A/2CH 144W. Rango de Control: 20 metros (área abierta).</p>	1	0	1	1	1	1	0	1	18	2025-01-07 03:51:00	2025-11-20 17:26:47	\N	ACC-CTRL-CCT
11	Tapatornillos	\N	3	0.3	0.25	<p></p>	1	0	1	1	1	1	0	1	18	2025-09-30 08:29:27	2025-11-20 21:05:59	\N	ACC-TAPA-BLA-12
\.


--
-- Data for Name: providers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.providers (id, full_name, imagen, email, phone, address, state, created_at, updated_at, deleted_at, ruc) FROM stdin;
1	NOVOPAN Pelikano	providers/5coWKGgw9ZgWFHUiMuDCxslc9izbVwepjfDovmXv.png	cepelikano@novopan.com.pe	516600000	Av. Eucaliptos Lote 3 D2B, Sta Genoveva Lurín, Lima, Lima Lima 16, PE	1	2025-09-30 09:32:41	2025-09-30 09:32:55	\N	20381034071
2	Fertec	providers/XyqSnQZW637NV7Mh5CToEtizq0Jdkk0eU9T42oq0.png	ventas@fertec.com.pe	51945899324	Oficina Principal: Jr. Los Jacintos 2118 Urb. Las Begonias SJL - Lima\r\nTienda: Av. Colonial 212 3er Piso Tda. 3049 C.C PLAZA FERRETERO Cercado de Lima	1	2025-09-30 09:40:34	2025-09-30 09:41:18	\N	20609588846
\.


--
-- Data for Name: purchase_details; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.purchase_details (id, purchase_id, product_id, unit_id, quantity, price_unit, total, state, user_entrega, date_entrega, description, created_at, updated_at, deleted_at) FROM stdin;
1	1	1	2	85	186.44	15847.4	2	1	2025-09-30 12:04:36	\N	2025-09-29 08:10:57	2025-09-30 12:04:36	\N
2	1	2	2	35	186.44	6525.4	2	1	2025-09-30 12:04:35	\N	2025-09-29 08:10:57	2025-09-30 12:04:35	\N
3	1	3	2	60	186.44	11186.4	2	1	2025-09-30 12:04:35	\N	2025-09-29 08:10:57	2025-09-30 12:04:35	\N
4	1	4	2	45	186.44	8389.8	2	1	2025-09-30 12:04:35	\N	2025-09-29 08:10:57	2025-09-30 12:04:35	\N
5	1	5	2	70	161.02	11271.4	2	1	2025-09-30 12:04:34	\N	2025-09-29 08:10:57	2025-09-30 12:04:34	\N
6	1	6	2	55	161.02	8856.1	2	1	2025-09-30 12:04:34	\N	2025-09-29 08:10:57	2025-09-30 12:04:34	\N
7	1	12	2	59	186.44	10999.96	2	1	2025-09-30 12:04:34	\N	2025-09-29 08:10:57	2025-09-30 12:04:34	\N
8	2	7	3	50	59.32	2966	2	1	2025-09-30 14:42:05	\N	2025-09-29 08:49:52	2025-09-30 14:42:05	\N
9	2	8	1	1500	0.065	97.5	2	1	2025-09-30 14:42:05	\N	2025-09-29 08:49:52	2025-09-30 14:42:05	\N
10	2	9	5	90	1.5	135	2	1	2025-09-30 14:42:05	\N	2025-09-29 08:49:52	2025-09-30 14:42:05	\N
11	2	10	5	60	11.02	661.2	2	1	2025-09-30 14:42:05	\N	2025-09-29 08:49:52	2025-09-30 14:42:05	\N
12	2	11	1	550	0.21	115.5	2	1	2025-09-30 14:42:05	\N	2025-09-29 08:49:52	2025-09-30 14:42:05	\N
13	2	13	1	50	3.9	195	2	1	2025-09-30 14:42:06	\N	2025-09-29 08:49:52	2025-09-30 14:42:06	\N
14	2	14	1	40	7.9	316	2	1	2025-09-30 14:42:06	\N	2025-09-29 08:49:52	2025-09-30 14:42:06	\N
15	2	15	1	75	34.74	2605.5	2	1	2025-09-30 14:42:06	\N	2025-09-29 08:49:52	2025-09-30 14:42:06	\N
\.


--
-- Data for Name: purchases; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.purchases (id, warehouse_id, user_id, sucursale_id, date_emision, state, type_comprobant, n_comprobant, provider_id, total, importe, igv, date_entrega, created_at, updated_at, deleted_at, description) FROM stdin;
1	1	1	1	2025-09-29 00:00:00	3	FACTURA ELECTRÓNICA	F001-0000001	1	86230.22	73076.46	13153.76	2025-09-30 12:04:36	2025-09-29 08:10:57	2025-09-30 12:04:36	\N	\N
2	1	1	1	2025-09-29 00:00:00	3	FACTURA ELECTRÓNICA	F001-0000002	2	8368.21	7091.7	1276.51	2025-09-30 14:42:06	2025-09-29 08:49:52	2025-09-30 14:42:06	\N	\N
\.


--
-- Data for Name: refound_products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.refound_products (id, product_id, unit_id, warehouse_id, quantity, sale_detail_id, client_id, type, state, description, user_id, resolution_date, description_resolution, created_at, updated_at, deleted_at, state_clone) FROM stdin;
\.


--
-- Data for Name: role_has_permissions; Type: TABLE DATA; Schema: public; Owner: -
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
1	9
12	9
15	9
17	9
19	9
21	9
22	9
23	9
18	9
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: -
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
-- Data for Name: sale_detail_attentions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.sale_detail_attentions (sale_detail_id, product_id, warehouse_id, unit_id, quantity, created_at, updated_at, deleted_at, id) FROM stdin;
2	12	1	2	3	2025-10-01 13:57:58	2025-10-01 13:57:58	\N	1
59	7	1	3	2	2025-10-03 16:55:18	2025-10-03 16:55:18	\N	44
3	12	1	2	6	2025-10-02 08:21:52	2025-10-02 08:21:52	\N	2
4	10	1	5	1	2025-10-02 08:21:52	2025-10-02 08:21:52	\N	3
5	5	1	2	1	2025-10-02 08:33:22	2025-10-02 08:33:22	\N	4
6	12	1	2	2	2025-10-02 08:41:30	2025-10-02 08:41:30	\N	5
7	8	1	6	1	2025-10-02 08:41:30	2025-10-02 08:41:30	\N	6
43	4	1	2	2	2025-10-03 14:08:21	2025-10-03 14:08:21	\N	28
44	7	1	3	1	2025-10-03 14:08:21	2025-10-03 14:08:21	\N	29
8	3	1	2	3	2025-10-02 09:02:15	2025-10-02 09:02:15	\N	11
45	10	1	5	1	2025-10-03 14:08:21	2025-10-03 14:08:21	\N	30
27	10	1	5	2	2025-10-02 10:01:03	2025-10-02 10:01:03	\N	12
28	13	1	1	1	2025-10-02 10:03:27	2025-10-02 10:03:27	\N	13
29	9	1	5	2	2025-10-02 10:03:27	2025-10-02 10:03:27	\N	14
60	9	1	5	2	2025-10-04 09:05:12	2025-10-04 09:05:12	\N	45
30	7	1	3	1	2025-10-02 10:15:01	2025-10-02 10:15:01	\N	15
31	6	1	2	1	2025-10-02 10:18:12	2025-10-02 10:18:12	\N	16
46	3	1	2	3	2025-10-03 15:27:44	2025-10-03 15:27:44	\N	31
47	5	1	2	3	2025-10-03 15:27:44	2025-10-03 15:27:44	\N	32
32	3	1	2	1	2025-10-02 10:38:05	2025-10-02 10:38:05	\N	17
33	13	1	1	1	2025-10-02 10:38:05	2025-10-02 10:38:05	\N	18
34	10	1	5	1	2025-10-02 11:12:44	2025-10-02 11:12:44	\N	19
35	5	1	2	1	2025-10-02 11:47:00	2025-10-02 11:47:00	\N	20
36	10	1	5	3	2025-10-02 11:47:00	2025-10-02 11:47:00	\N	21
37	14	1	1	1	2025-10-02 12:00:49	2025-10-02 12:00:49	\N	22
38	7	1	3	1	2025-10-03 11:01:51	2025-10-03 11:01:51	\N	23
39	10	1	5	1	2025-10-03 11:23:10	2025-10-03 11:23:10	\N	24
63	5	1	2	2	2025-10-04 10:18:59	2025-10-04 10:18:59	\N	46
40	8	1	1	100	2025-10-03 12:45:39	2025-10-03 12:45:39	\N	25
41	15	1	1	1	2025-10-03 13:12:55	2025-10-03 13:12:55	\N	26
42	13	1	1	1	2025-10-03 13:12:55	2025-10-03 13:12:55	\N	27
64	10	1	5	1	2025-10-04 10:55:21	2025-10-04 10:55:21	\N	47
48	12	1	2	3	2025-10-03 15:59:02	2025-10-03 15:59:02	\N	33
49	1	1	2	4	2025-10-03 15:59:02	2025-10-03 15:59:02	\N	34
50	8	1	1	50	2025-10-03 15:59:02	2025-10-03 15:59:02	\N	35
51	9	1	5	8	2025-10-03 15:59:02	2025-10-03 15:59:02	\N	36
52	10	1	5	3	2025-10-03 15:59:02	2025-10-03 15:59:02	\N	37
65	4	1	2	2	2025-10-04 12:11:44	2025-10-04 12:11:44	\N	48
66	5	1	2	1	2025-10-04 12:11:44	2025-10-04 12:11:44	\N	49
53	3	1	2	6	2025-10-03 16:14:37	2025-10-03 16:14:37	\N	38
54	8	1	1	30	2025-10-03 16:14:37	2025-10-03 16:14:37	\N	39
55	11	1	1	25	2025-10-03 16:14:37	2025-10-03 16:14:37	\N	40
56	14	1	1	3	2025-10-03 16:14:37	2025-10-03 16:14:37	\N	41
57	13	1	1	2	2025-10-03 16:14:37	2025-10-03 16:14:37	\N	42
58	15	1	1	5	2025-10-03 16:14:37	2025-10-03 16:14:37	\N	43
83	4	1	2	2	2025-10-07 09:13:21	2025-10-07 09:13:21	\N	57
74	10	1	5	1	2025-10-06 08:34:12	2025-10-06 08:34:12	\N	50
84	11	1	1	20	2025-10-07 09:13:21	2025-10-07 09:13:21	\N	58
85	7	1	3	3	2025-10-07 09:13:21	2025-10-07 09:13:21	\N	59
77	4	1	2	3	2025-10-06 10:05:27	2025-10-06 10:05:27	\N	51
78	3	1	2	1	2025-10-06 10:05:27	2025-10-06 10:05:27	\N	52
86	10	1	5	1	2025-10-07 09:13:21	2025-10-07 09:13:21	\N	60
79	3	1	2	5	2025-10-06 11:40:58	2025-10-06 11:40:58	\N	53
80	2	1	2	3	2025-10-07 08:31:03	2025-10-07 08:31:03	\N	54
81	10	1	5	1	2025-10-07 08:31:03	2025-10-07 08:31:03	\N	55
93	5	1	2	4	2025-10-09 08:42:33	2025-10-09 08:42:33	\N	67
82	13	1	1	2	2025-10-07 09:10:47	2025-10-07 09:10:47	\N	56
90	9	1	5	1	2025-10-07 12:20:18	2025-10-07 12:20:18	\N	64
95	15	1	1	2	2025-10-09 08:42:33	2025-10-09 08:42:33	\N	68
91	9	1	5	1	2025-10-07 13:05:49	2025-10-07 13:05:49	\N	65
87	6	1	2	1	2025-10-07 10:46:36	2025-10-07 10:46:36	\N	61
88	7	1	3	1	2025-10-07 10:46:36	2025-10-07 10:46:36	\N	62
96	14	1	1	1	2025-10-09 08:42:33	2025-10-09 08:42:33	\N	69
89	14	1	1	1	2025-10-07 11:03:52	2025-10-07 11:03:52	\N	63
92	5	1	2	1	2025-10-08 09:15:27	2025-10-08 09:15:27	\N	66
98	5	1	2	1	2025-10-09 10:12:55	2025-10-09 10:12:55	\N	70
99	6	1	2	3	2025-10-09 10:58:06	2025-10-09 10:58:06	\N	71
102	7	1	3	1	2025-10-09 11:45:39	2025-10-09 11:45:39	\N	74
100	11	1	1	10	2025-10-09 10:58:06	2025-10-09 10:58:06	\N	72
101	14	1	1	2	2025-10-09 10:58:06	2025-10-09 10:58:06	\N	73
103	10	1	5	1	2025-10-09 12:31:22	2025-10-09 12:31:22	\N	75
105	3	1	2	3	2025-10-09 13:18:47	2025-10-09 13:18:47	\N	76
106	6	1	2	1	2025-10-09 13:18:47	2025-10-09 13:18:47	\N	77
107	12	1	2	2	2025-10-09 13:18:47	2025-10-09 13:18:47	\N	78
179	9	1	5	1	2025-10-16 13:02:44	2025-10-16 13:02:44	\N	120
108	15	1	1	1	2025-10-09 14:02:15	2025-10-09 14:02:15	\N	79
109	10	1	5	1	2025-10-09 14:02:15	2025-10-09 14:02:15	\N	80
110	5	1	2	2	2025-10-09 14:49:50	2025-10-09 14:49:50	\N	81
182	13	1	1	2	2025-10-16 14:22:17	2025-10-16 14:22:17	\N	121
111	1	1	2	1	2025-10-10 08:55:18	2025-10-10 08:55:18	\N	82
114	10	1	5	1	2025-10-11 09:25:09	2025-10-11 09:25:09	\N	83
115	15	1	1	2	2025-10-11 10:12:34	2025-10-11 10:12:34	\N	84
146	12	1	2	1	2025-10-15 09:17:29	2025-10-15 09:17:29	\N	105
116	9	1	5	1	2025-10-11 11:03:51	2025-10-11 11:03:51	\N	85
147	11	1	1	16	2025-10-15 09:17:29	2025-10-15 09:17:29	\N	106
148	9	1	5	1	2025-10-15 09:17:29	2025-10-15 09:17:29	\N	107
118	3	1	2	1	2025-10-11 11:50:27	2025-10-11 11:50:27	\N	86
119	12	1	2	2	2025-10-11 11:50:27	2025-10-11 11:50:27	\N	87
149	13	1	1	1	2025-10-15 09:17:29	2025-10-15 09:17:29	\N	108
120	9	1	5	1	2025-10-11 12:36:44	2025-10-11 12:36:44	\N	88
151	8	1	1	10	2025-10-15 09:17:29	2025-10-15 09:17:29	\N	109
121	13	1	1	1	2025-10-13 08:45:12	2025-10-13 08:45:12	\N	89
152	10	1	5	6	2025-10-15 09:17:29	2025-10-15 09:17:29	\N	110
123	10	1	5	1	2025-10-13 10:14:07	2025-10-13 10:14:07	\N	90
124	14	1	1	1	2025-10-13 11:01:22	2025-10-13 11:01:22	\N	91
183	9	1	5	1	2025-10-16 14:48:36	2025-10-16 14:48:36	\N	122
126	5	1	2	1	2025-10-13 11:47:49	2025-10-13 11:47:49	\N	92
155	15	1	1	1	2025-10-15 10:50:12	2025-10-15 10:50:12	\N	111
127	12	1	2	2	2025-10-13 12:35:06	2025-10-13 12:35:06	\N	93
129	3	1	2	2	2025-10-13 12:35:06	2025-10-13 12:35:06	\N	94
158	9	1	5	2	2025-10-15 12:23:30	2025-10-15 12:23:30	\N	112
132	5	1	2	1	2025-10-14 08:32:50	2025-10-14 08:32:50	\N	95
133	3	1	2	1	2025-10-14 08:32:50	2025-10-14 08:32:50	\N	96
134	1	1	2	2	2025-10-14 08:32:50	2025-10-14 08:32:50	\N	97
135	1	1	2	2	2025-10-14 09:20:15	2025-10-14 09:20:15	\N	98
136	12	1	2	1	2025-10-14 09:20:15	2025-10-14 09:20:15	\N	99
137	12	1	2	2	2025-10-14 10:05:42	2025-10-14 10:05:42	\N	100
141	3	1	2	1	2025-11-22 18:17:47	2025-11-22 18:17:47	\N	101
142	12	1	2	4	2025-11-22 18:17:47	2025-11-22 18:17:47	\N	102
144	7	1	3	5	2025-11-22 18:17:47	2025-11-22 18:17:47	\N	103
145	8	1	1	49	2025-11-22 18:17:47	2025-11-22 18:17:47	\N	104
210	8	1	1	8	2025-10-18 08:33:46	2025-10-18 08:33:46	\N	130
160	8	1	1	6	2025-10-15 13:05:11	2025-10-15 13:05:11	\N	113
161	11	1	1	6	2025-10-15 13:05:11	2025-10-15 13:05:11	\N	114
162	15	1	1	1	2025-10-15 13:05:11	2025-10-15 13:05:11	\N	115
211	11	1	1	6	2025-10-18 08:33:46	2025-10-18 08:33:46	\N	131
165	12	1	2	3	2025-10-16 09:02:18	2025-10-16 09:02:18	\N	116
171	2	1	2	1	2025-10-16 09:55:12	2025-10-16 09:55:12	\N	117
186	12	1	2	1	2025-10-17 08:38:11	2025-10-17 08:38:11	\N	123
172	2	1	2	1	2025-10-16 10:21:36	2025-10-16 10:21:36	\N	118
187	8	1	1	8	2025-10-17 08:38:11	2025-10-17 08:38:11	\N	124
178	10	1	5	1	2025-10-16 12:35:16	2025-10-16 12:35:16	\N	119
188	11	1	1	6	2025-10-17 08:38:11	2025-10-17 08:38:11	\N	125
189	9	1	5	1	2025-10-17 09:05:29	2025-10-17 09:05:29	\N	126
192	9	1	5	2	2025-10-17 10:24:19	2025-10-17 10:24:19	\N	127
194	15	1	1	1	2025-10-17 11:17:03	2025-10-17 11:17:03	\N	128
195	9	1	5	1	2025-10-17 11:43:22	2025-10-17 11:43:22	\N	129
225	9	1	5	1	2025-10-20 10:58:42	2025-10-20 10:58:42	\N	142
215	6	1	2	1	2025-10-20 08:12:33	2025-10-20 08:12:33	\N	132
216	8	1	1	6	2025-10-20 08:12:33	2025-10-20 08:12:33	\N	133
217	11	1	1	4	2025-10-20 08:12:33	2025-10-20 08:12:33	\N	134
218	10	1	5	1	2025-10-20 08:12:33	2025-10-20 08:12:33	\N	135
227	3	1	2	1	2025-10-20 13:22:01	2025-10-20 13:22:01	\N	143
228	8	1	1	4	2025-10-20 13:22:01	2025-10-20 13:22:01	\N	144
219	5	1	2	2	2025-10-20 09:45:10	2025-10-20 09:45:10	\N	136
220	15	1	1	1	2025-10-20 09:45:10	2025-10-20 09:45:10	\N	137
221	7	1	3	2	2025-10-20 09:45:10	2025-10-20 09:45:10	\N	138
222	1	1	2	1	2025-10-20 09:45:10	2025-10-20 09:45:10	\N	139
223	8	1	1	16	2025-10-20 09:45:10	2025-10-20 09:45:10	\N	140
224	11	1	1	8	2025-10-20 09:45:10	2025-10-20 09:45:10	\N	141
229	11	1	1	4	2025-10-20 13:22:01	2025-10-20 13:22:01	\N	145
230	12	1	2	2	2025-10-20 14:49:37	2025-10-20 14:49:37	\N	146
231	4	1	2	2	2025-10-20 14:49:37	2025-10-20 14:49:37	\N	147
232	5	1	2	1	2025-10-20 14:49:37	2025-10-20 14:49:37	\N	148
233	6	1	2	2	2025-10-20 14:49:37	2025-10-20 14:49:37	\N	149
234	3	1	2	1	2025-10-20 14:49:37	2025-10-20 14:49:37	\N	150
237	8	1	1	54	2025-10-20 14:49:37	2025-10-20 14:49:37	\N	151
238	11	1	1	14	2025-10-20 14:49:37	2025-10-20 14:49:37	\N	152
240	5	1	2	1	2025-10-21 08:33:28	2025-10-21 08:33:28	\N	153
241	6	1	2	1	2025-10-21 08:33:28	2025-10-21 08:33:28	\N	154
242	15	1	1	1	2025-10-21 08:33:28	2025-10-21 08:33:28	\N	155
243	14	1	1	2	2025-10-21 08:33:28	2025-10-21 08:33:28	\N	156
244	13	1	1	2	2025-10-21 08:33:28	2025-10-21 08:33:28	\N	157
245	11	1	1	50	2025-10-21 08:33:28	2025-10-21 08:33:28	\N	158
249	10	1	5	2	2025-10-21 08:33:28	2025-10-21 08:33:28	\N	159
250	4	1	2	2	2025-10-21 08:33:28	2025-10-21 08:33:28	\N	160
255	11	1	1	27	2025-10-22 08:59:27	2025-10-22 08:59:27	\N	161
287	12	1	2	1	2025-10-23 15:39:42	2025-10-23 15:39:42	\N	162
349	2	1	2	2	2025-10-30 14:57:50	2025-10-30 14:57:50	\N	163
374	2	1	2	1	2025-11-03 13:22:18	2025-11-03 13:22:18	\N	164
\.


--
-- Data for Name: sale_details; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.sale_details (id, sale_id, product_id, product_categorie_id, quantity, price_unit, discount, subtotal, total, unit_id, warehouse_id, igv, description, created_at, updated_at, deleted_at, state_attention, quantity_pending) FROM stdin;
37	18	14	3	1	25.42	0	30	30	1	1	4.58	\N	2025-10-02 12:00:49	2025-10-02 12:00:49	\N	3	0
8	6	3	1	3	237.29	0	280	840.01	2	1	42.71	\N	2025-10-02 09:02:15	2025-10-02 09:02:15	\N	3	0
34	16	10	3	1	15.25	0	18	18	5	1	2.75	\N	2025-10-02 11:12:44	2025-10-02 11:12:44	\N	3	0
10	7	8	3	20	0.072	0	0.08496	1.6992	1	1	0.01296	\N	2025-10-02 09:33:11	2025-10-02 09:33:11	\N	1	20
20	9	2	1	4	237.29	0	280	1120.01	2	1	42.71	\N	2025-10-02 09:44:57	2025-10-02 09:44:57	\N	1	4
21	9	12	1	3	237.29	0	280	840.01	2	1	42.71	\N	2025-10-02 09:44:57	2025-10-02 09:44:57	\N	1	3
9	7	2	1	5	237.29	0	280	1400.01	2	1	42.71	\N	2025-10-02 09:33:11	2025-10-02 09:33:11	\N	1	5
28	12	13	3	1	29.66	0	35	35	1	1	5.34	\N	2025-10-02 10:03:27	2025-10-02 10:03:27	\N	3	0
11	7	13	3	1	38.14	0	45.01	45.01	1	1	6.87	\N	2025-10-02 09:33:11	2025-10-02 09:33:11	\N	1	1
12	7	9	3	2	3.81	0	4.5	8.99	5	1	0.69	\N	2025-10-02 09:33:11	2025-10-02 09:33:11	\N	1	2
22	9	5	2	2	220.34	0	260	520	2	1	39.66	\N	2025-10-02 09:44:57	2025-10-02 09:44:57	\N	1	2
2	2	12	1	3	228.81	0	269.9958	809.9874	2	1	41.1858	\N	2025-10-01 13:57:58	2025-10-01 13:57:58	\N	3	0
3	3	12	1	6	228.81	0	269.9958	1619.9748	2	1	41.1858	\N	2025-10-02 08:21:52	2025-10-02 08:21:52	\N	3	0
4	3	10	3	1	13.56	0	16.0008	16.0008	5	1	2.4408	\N	2025-10-02 08:21:52	2025-10-02 08:21:52	\N	3	0
5	4	5	2	1	211.86	0	249.9948	249.9948	2	1	38.1348	\N	2025-10-02 08:33:22	2025-10-02 08:33:22	\N	3	0
6	5	12	1	2	237.29	0	280.0022	560.0044	2	1	42.7122	\N	2025-10-02 08:41:30	2025-10-02 08:41:30	\N	3	0
29	12	9	3	2	2.97	0	3.5	7.01	5	1	0.53	\N	2025-10-02 10:03:27	2025-10-02 10:03:27	\N	3	0
1	1	12	1	3	228.81	0	270	809.99	2	1	41.19	\N	2025-10-01 12:50:40	2025-10-01 12:50:40	\N	1	3
7	5	8	3	10	0.072	0	0.08	0.85	1	1	0.01	\N	2025-10-02 08:41:30	2025-10-02 08:41:30	\N	3	0
17	8	8	3	10	0.072	0	0.08496	0.8496	1	1	0.01296	\N	2025-10-02 09:39:04	2025-10-02 09:39:04	\N	3	0
18	8	7	3	1	76.27	0	90	90	3	1	13.73	\N	2025-10-02 09:39:04	2025-10-02 09:39:04	\N	1	1
19	8	11	3	8	0.3	0	0.35	2.83	1	1	0.05	\N	2025-10-02 09:39:04	2025-10-02 09:39:04	\N	1	8
30	13	7	3	1	72.03	0	85	85	3	1	12.97	\N	2025-10-02 10:15:01	2025-10-02 10:15:01	\N	3	0
23	10	1	1	2	228.81	0	270	539.99	2	1	41.19	\N	2025-10-02 09:50:50	2025-10-02 09:50:50	\N	1	2
24	10	7	3	2	72.03	0	85	169.99	3	1	12.97	\N	2025-10-02 09:50:50	2025-10-02 09:50:50	\N	1	2
13	8	2	1	7	237.29	0	280	1960.02	2	1	42.71	\N	2025-10-02 09:39:04	2025-10-02 09:39:04	\N	1	7
14	8	9	3	5	3.81	0	4.5	22.48	5	1	0.69	\N	2025-10-02 09:39:04	2025-10-02 09:39:04	\N	1	5
15	8	10	3	4	15.25	0	18	71.98	5	1	2.75	\N	2025-10-02 09:39:04	2025-10-02 09:39:04	\N	1	4
16	8	14	3	2	25.42	0	30	59.99	1	1	4.58	\N	2025-10-02 09:39:04	2025-10-02 09:39:04	\N	1	2
31	14	6	2	1	211.86	0	249.99	249.99	2	1	38.13	\N	2025-10-02 10:18:12	2025-10-02 10:18:12	\N	3	0
26	10	4	1	2	228.81	0	270	539.99	2	1	41.19	\N	2025-10-02 09:50:50	2025-10-02 09:50:50	\N	1	2
25	10	2	1	3	228.81	0	270	809.99	2	1	41.19	\N	2025-10-02 09:50:50	2025-10-02 09:50:50	\N	1	3
27	11	10	3	2	15.25	0	18	35.99	5	1	2.75	\N	2025-10-02 10:01:03	2025-10-02 10:01:03	\N	3	0
39	20	10	3	1	15.25	0	18	18	5	1	2.75	\N	2025-10-03 11:23:10	2025-10-03 11:23:10	\N	3	0
32	15	3	1	1	237.29	0	280	280	2	1	42.71	\N	2025-10-02 10:38:05	2025-10-02 10:38:05	\N	3	0
33	15	13	3	1	38.14	0	45.01	45.01	1	1	6.87	\N	2025-10-02 10:38:05	2025-10-02 10:38:05	\N	3	0
35	17	5	2	1	220.34	0	260	260	2	1	39.66	\N	2025-10-02 11:47:00	2025-10-02 11:47:00	\N	3	0
36	17	10	3	3	15.25	0	18	53.98	5	1	2.75	\N	2025-10-02 11:47:00	2025-10-02 11:47:00	\N	3	0
38	19	7	3	1	72.03	0	85	85	3	1	12.97	\N	2025-10-03 11:01:51	2025-10-03 11:01:51	\N	3	0
40	21	8	3	100	0.072	0	0.08	8.5	1	1	0.01	\N	2025-10-03 12:45:39	2025-10-03 12:45:39	\N	3	0
41	22	15	3	1	67.8	0	80	80	1	1	12.2	\N	2025-10-03 13:12:55	2025-10-03 13:12:55	\N	3	0
42	22	13	3	1	38.14	0	45.01	45.01	1	1	6.87	\N	2025-10-03 13:12:55	2025-10-03 13:12:55	\N	3	0
43	23	4	1	2	237.29	0	280	560	2	1	42.71	\N	2025-10-03 14:08:21	2025-10-03 14:08:21	\N	3	0
44	23	7	3	1	76.27	0	90	90	3	1	13.73	\N	2025-10-03 14:08:21	2025-10-03 14:08:21	\N	3	0
45	23	10	3	1	15.25	0	18	18	5	1	2.75	\N	2025-10-03 14:08:21	2025-10-03 14:08:21	\N	3	0
60	28	9	3	2	3.81	0	4.5	8.99	5	1	0.69	\N	2025-10-04 09:05:12	2025-10-04 09:05:12	\N	3	0
46	24	3	1	3	237.29	0	280	840.01	2	1	42.71	\N	2025-10-03 15:27:44	2025-10-03 15:27:44	\N	3	0
47	24	5	2	3	220.34	0	260	780	2	1	39.66	\N	2025-10-03 15:27:44	2025-10-03 15:27:44	\N	3	0
69	35	5	2	1	220.34	0	260	260	2	1	39.66	\N	2025-10-04 13:03:08	2025-10-04 13:03:08	\N	1	1
61	29	1	1	3	237.29	0	280	840.01	2	1	42.71	\N	2025-10-04 09:07:32	2025-10-04 09:07:32	\N	1	3
48	25	12	1	3	228.81	0	270	809.99	2	1	41.19	\N	2025-10-03 15:59:02	2025-10-03 15:59:02	\N	3	0
49	25	1	1	4	228.81	0	270	1079.98	2	1	41.19	\N	2025-10-03 15:59:02	2025-10-03 15:59:02	\N	3	0
50	25	8	3	50	0.0636	0	0.08	3.75	1	1	0.01	\N	2025-10-03 15:59:02	2025-10-03 15:59:02	\N	3	0
51	25	9	3	8	2.97	0	3.5	28.04	5	1	0.53	\N	2025-10-03 15:59:02	2025-10-03 15:59:02	\N	3	0
52	25	10	3	3	13.56	0	16	48	5	1	2.44	\N	2025-10-03 15:59:02	2025-10-03 15:59:02	\N	3	0
62	29	12	1	1	237.29	0	280	280	2	1	42.71	\N	2025-10-04 09:07:32	2025-10-04 09:07:32	\N	1	1
70	35	12	1	1	237.29	0	280	280	2	1	42.71	\N	2025-10-04 13:03:08	2025-10-04 13:03:08	\N	1	1
63	30	5	2	2	220.34	0	260	520	2	1	39.66	\N	2025-10-04 10:18:59	2025-10-04 10:18:59	\N	3	0
53	26	3	1	6	228.81	0	270	1619.97	2	1	41.19	\N	2025-10-03 16:14:37	2025-10-03 16:14:37	\N	3	0
54	26	8	3	30	0.0636	0	0.08	2.25	1	1	0.01	\N	2025-10-03 16:14:37	2025-10-03 16:14:37	\N	3	0
55	26	11	3	25	0.25	0	0.29	7.38	1	1	0.04	\N	2025-10-03 16:14:37	2025-10-03 16:14:37	\N	3	0
56	26	14	3	3	21.19	0	25	75.01	1	1	3.81	\N	2025-10-03 16:14:37	2025-10-03 16:14:37	\N	3	0
57	26	13	3	2	29.66	0	35	70	1	1	5.34	\N	2025-10-03 16:14:37	2025-10-03 16:14:37	\N	3	0
58	26	15	3	5	59.32	0	70	349.99	1	1	10.68	\N	2025-10-03 16:14:37	2025-10-03 16:14:37	\N	3	0
64	31	10	3	1	15.25	0	18	18	5	1	2.75	\N	2025-10-04 10:55:21	2025-10-04 10:55:21	\N	3	0
59	27	7	3	2	72.03	0	85	169.99	3	1	12.97	\N	2025-10-03 16:55:18	2025-10-03 16:55:18	\N	3	0
65	32	4	1	2	228.81	0	270	539.99	2	1	41.19	\N	2025-10-04 12:11:44	2025-10-04 12:11:44	\N	3	0
66	32	5	2	1	211.86	0	249.99	249.99	2	1	38.13	\N	2025-10-04 12:11:44	2025-10-04 12:11:44	\N	3	0
67	33	5	2	2	220.34	0	260	520	2	1	39.66	\N	2025-10-04 12:58:07	2025-10-04 12:58:07	\N	1	2
68	34	5	2	3	220.34	0	260	780	2	1	39.66	\N	2025-10-04 13:00:59	2025-10-04 13:00:59	\N	1	3
71	36	2	1	3	237.29	0	280	840.01	2	1	42.71	\N	2025-10-04 14:59:18	2025-10-04 14:59:18	\N	1	3
72	36	14	3	2	25.42	0	30	59.99	1	1	4.58	\N	2025-10-04 14:59:18	2025-10-04 14:59:18	\N	1	2
73	36	13	3	2	38.14	0	45.01	90.01	1	1	6.87	\N	2025-10-04 14:59:18	2025-10-04 14:59:18	\N	1	2
80	41	2	1	3	228.81	0	270	809.99	2	1	41.19	\N	2025-10-07 08:31:03	2025-10-07 08:31:03	\N	3	0
74	37	10	3	1	13.56	0	16	16	5	1	2.44	\N	2025-10-06 08:34:12	2025-10-06 08:34:12	\N	3	0
81	41	10	3	1	13.56	0	16	16	5	1	2.44	\N	2025-10-07 08:31:03	2025-10-07 08:31:03	\N	3	0
75	38	6	2	5	220.34	0	260	1300.01	2	1	39.66	\N	2025-10-06 09:12:45	2025-10-06 09:12:45	\N	1	5
76	38	12	1	1	237.29	0	280	280	2	1	42.71	\N	2025-10-06 09:12:45	2025-10-06 09:12:45	\N	1	1
83	43	4	1	3	237.29	0	280	840.01	2	1	42.71	\N	2025-10-07 09:13:21	2025-10-07 09:13:21	\N	2	1
82	42	13	3	2	38.14	0	45.01	90.01	1	1	6.87	\N	2025-10-07 09:10:47	2025-10-07 09:10:47	\N	3	0
77	39	4	1	3	228.81	0	270	809.99	2	1	41.19	\N	2025-10-06 10:05:27	2025-10-06 10:05:27	\N	3	0
78	39	3	1	1	228.81	0	270	270	2	1	41.19	\N	2025-10-06 10:05:27	2025-10-06 10:05:27	\N	3	0
79	40	3	1	5	228.81	0	270	1349.98	2	1	41.19	\N	2025-10-06 11:40:58	2025-10-06 11:40:58	\N	3	0
84	43	11	3	20	0.3	0	0.35	7.08	1	1	0.05	\N	2025-10-07 09:13:21	2025-10-07 09:13:21	\N	3	0
85	43	7	3	3	76.27	0	90	270	3	1	13.73	\N	2025-10-07 09:13:21	2025-10-07 09:13:21	\N	3	0
89	45	14	3	1	25.42	0	30	30	1	1	4.58	\N	2025-10-07 11:03:52	2025-10-07 11:03:52	\N	3	0
87	44	6	2	1	220.34	0	260	260	2	1	39.66	\N	2025-10-07 10:46:36	2025-10-07 10:46:36	\N	3	0
88	44	7	3	1	76.27	0	90	90	3	1	13.73	\N	2025-10-07 10:46:36	2025-10-07 10:46:36	\N	3	0
86	43	10	3	1	15.25	0	18	18	5	1	2.75	\N	2025-10-07 09:13:21	2025-10-07 09:13:21	\N	3	0
91	47	9	3	1	3.81	0	4.5	4.5	5	1	0.69	\N	2025-10-07 13:05:49	2025-10-07 13:05:49	\N	3	0
90	46	9	3	1	2.97	0	3.5	3.5	5	1	0.53	\N	2025-10-07 12:20:18	2025-10-07 12:20:18	\N	3	0
92	48	5	2	1	220.34	0	260	260	2	1	39.66	\N	2025-10-08 09:15:27	2025-10-08 09:15:27	\N	3	0
93	49	5	2	4	211.86	0	249.99	999.98	2	1	38.13	\N	2025-10-09 08:42:33	2025-10-09 08:42:33	\N	3	0
94	49	4	1	2	228.81	0	270	539.99	2	1	41.19	\N	2025-10-09 08:42:33	2025-10-09 08:42:33	\N	1	2
95	49	15	3	2	59.32	0	70	140	1	1	10.68	\N	2025-10-09 08:42:33	2025-10-09 08:42:33	\N	3	0
96	49	14	3	1	21.19	0	25	25	1	1	3.81	\N	2025-10-09 08:42:33	2025-10-09 08:42:33	\N	3	0
125	69	4	1	1	228.81	0	270	270	2	1	41.19	\N	2025-10-13 11:47:49	2025-10-13 11:47:49	\N	1	1
97	50	4	1	4	228.81	0	270	1079.98	2	1	41.19	\N	2025-10-09 09:30:14	2025-10-09 09:30:14	\N	1	4
110	57	5	2	2	220.34	0	260	520	2	1	39.66	\N	2025-10-09 14:49:50	2025-10-09 14:49:50	\N	3	0
98	51	5	2	1	220.34	0	260	260	2	1	39.66	\N	2025-10-09 10:12:55	2025-10-09 10:12:55	\N	3	0
120	64	9	3	1	3.81	0	4.5	4.5	5	1	0.69	\N	2025-10-11 12:36:44	2025-10-11 12:36:44	\N	3	0
111	58	1	1	1	228.81	0	270	270	2	1	41.19	\N	2025-10-10 08:55:18	2025-10-10 08:55:18	\N	3	0
99	52	6	2	3	220.34	0	260	780	2	1	39.66	\N	2025-10-09 10:58:06	2025-10-09 10:58:06	\N	3	0
100	52	11	3	10	0.3	0	0.35	3.54	1	1	0.05	\N	2025-10-09 10:58:06	2025-10-09 10:58:06	\N	3	0
101	52	14	3	2	25.42	0	30	59.99	1	1	4.58	\N	2025-10-09 10:58:06	2025-10-09 10:58:06	\N	3	0
102	53	7	3	1	76.27	0	90	90	3	1	13.73	\N	2025-10-09 11:45:39	2025-10-09 11:45:39	\N	3	0
103	54	10	3	1	15.25	0	18	18	5	1	2.75	\N	2025-10-09 12:31:22	2025-10-09 12:31:22	\N	3	0
126	69	5	2	1	211.86	0	249.99	249.99	2	1	38.13	\N	2025-10-13 11:47:49	2025-10-13 11:47:49	\N	3	0
112	59	4	1	2	237.29	0	280	560	2	1	42.71	\N	2025-10-11 08:38:45	2025-10-11 08:38:45	\N	1	2
113	59	3	1	2	237.29	0	280	560	2	1	42.71	\N	2025-10-11 08:38:45	2025-10-11 08:38:45	\N	1	2
104	55	4	1	2	228.81	0	270	539.99	2	1	41.19	\N	2025-10-09 13:18:47	2025-10-09 13:18:47	\N	1	2
105	55	3	1	3	228.81	0	270	809.99	2	1	41.19	\N	2025-10-09 13:18:47	2025-10-09 13:18:47	\N	3	0
106	55	6	2	3	211.86	0	249.99	749.98	2	1	38.13	\N	2025-10-09 13:18:47	2025-10-09 13:18:47	\N	2	2
107	55	12	1	2	228.81	0	270	539.99	2	1	41.19	\N	2025-10-09 13:18:47	2025-10-09 13:18:47	\N	3	0
121	65	13	3	1	38.14	0	45.01	45.01	1	1	6.87	\N	2025-10-13 08:45:12	2025-10-13 08:45:12	\N	3	0
108	56	15	3	1	67.8	0	80	80	1	1	12.2	\N	2025-10-09 14:02:15	2025-10-09 14:02:15	\N	3	0
109	56	10	3	1	15.25	0	18	18	5	1	2.75	\N	2025-10-09 14:02:15	2025-10-09 14:02:15	\N	3	0
114	60	10	3	1	15.25	0	18	18	5	1	2.75	\N	2025-10-11 09:25:09	2025-10-11 09:25:09	\N	3	0
115	61	15	3	2	67.8	0	80	160.01	1	1	12.2	\N	2025-10-11 10:12:34	2025-10-11 10:12:34	\N	3	0
116	62	9	3	1	3.81	0	4.5	4.5	5	1	0.69	\N	2025-10-11 11:03:51	2025-10-11 11:03:51	\N	3	0
122	66	4	1	1	237.29	0	280	280	2	1	42.71	\N	2025-10-13 09:28:33	2025-10-13 09:28:33	\N	1	1
117	63	4	1	1	237.29	0	280	280	2	1	42.71	\N	2025-10-11 11:50:27	2025-10-11 11:50:27	\N	1	1
118	63	3	1	1	237.29	0	280	280	2	1	42.71	\N	2025-10-11 11:50:27	2025-10-11 11:50:27	\N	3	0
119	63	12	1	2	237.29	0	280	560	2	1	42.71	\N	2025-10-11 11:50:27	2025-10-11 11:50:27	\N	3	0
123	67	10	3	1	15.25	0	18	18	5	1	2.75	\N	2025-10-13 10:14:07	2025-10-13 10:14:07	\N	3	0
124	68	14	3	3	25.42	0	30	89.99	1	1	4.58	\N	2025-10-13 11:01:22	2025-10-13 11:01:22	\N	2	2
127	70	12	1	2	228.81	0	270	539.99	2	1	41.19	\N	2025-10-13 12:35:06	2025-10-13 12:35:06	\N	3	0
128	70	4	1	1	228.81	0	270	270	2	1	41.19	\N	2025-10-13 12:35:06	2025-10-13 12:35:06	\N	1	1
131	71	6	2	2	220.34	0	260	520	2	1	39.66	\N	2025-10-14 08:32:50	2025-10-14 08:32:50	\N	1	2
129	70	3	1	2	228.81	0	270	539.99	2	1	41.19	\N	2025-10-13 12:35:06	2025-10-13 12:35:06	\N	3	0
130	70	6	2	2	211.86	0	249.99	499.99	2	1	38.13	\N	2025-10-13 12:35:06	2025-10-13 12:35:06	\N	1	2
132	71	5	2	2	220.34	0	260	520	2	1	39.66	\N	2025-10-14 08:32:50	2025-10-14 08:32:50	\N	2	1
133	71	3	1	1	237.29	0	280	280	2	1	42.71	\N	2025-10-14 08:32:50	2025-10-14 08:32:50	\N	3	0
159	80	4	1	1	237.29	0	280	280	2	1	42.71	\N	2025-10-15 13:05:11	2025-10-15 13:05:11	\N	1	1
134	71	1	1	2	237.29	0	280	560	2	1	42.71	\N	2025-10-14 08:32:50	2025-10-14 08:32:50	\N	3	0
160	80	8	3	6	0.072	0	0.08	0.51	1	1	0.01	\N	2025-10-15 13:05:11	2025-10-15 13:05:11	\N	3	0
153	76	7	3	1	72.03	0	85	85	3	1	12.97	\N	2025-10-15 10:05:51	2025-10-15 10:05:51	\N	1	1
135	72	1	1	3	237.29	0	280	840.01	2	1	42.71	\N	2025-10-14 09:20:15	2025-10-14 09:20:15	\N	2	1
136	72	12	1	1	237.29	0	280	280	2	1	42.71	\N	2025-10-14 09:20:15	2025-10-14 09:20:15	\N	3	0
154	76	14	3	1	21.19	0	25	25	1	1	3.81	\N	2025-10-15 10:05:51	2025-10-15 10:05:51	\N	1	1
137	73	12	1	2	228.81	0	270	539.99	2	1	41.19	\N	2025-10-14 10:05:42	2025-10-14 10:05:42	\N	3	0
138	73	6	2	2	211.86	0	249.99	499.99	2	1	38.13	\N	2025-10-14 10:05:42	2025-10-14 10:05:42	\N	1	2
161	80	11	3	6	0.3	0	0.35	2.12	1	1	0.05	\N	2025-10-15 13:05:11	2025-10-15 13:05:11	\N	3	0
155	77	15	3	1	59.32	0	70	70	1	1	10.68	\N	2025-10-15 10:50:12	2025-10-15 10:50:12	\N	3	0
162	80	15	3	1	67.8	0	80	80	1	1	12.2	\N	2025-10-15 13:05:11	2025-10-15 13:05:11	\N	3	0
156	78	1	1	2	228.81	0	270	539.99	2	1	41.19	\N	2025-10-15 11:36:44	2025-10-15 11:36:44	\N	1	2
146	75	12	1	1	228.81	0	270	270	2	1	41.19	\N	2025-10-15 09:17:29	2025-10-15 09:17:29	\N	3	0
147	75	11	3	16	0.25	0	0.29	4.72	1	1	0.04	\N	2025-10-15 09:17:29	2025-10-15 09:17:29	\N	3	0
148	75	9	3	1	2.97	0	3.5	3.5	5	1	0.53	\N	2025-10-15 09:17:29	2025-10-15 09:17:29	\N	3	0
149	75	13	3	1	29.66	0	35	35	1	1	5.34	\N	2025-10-15 09:17:29	2025-10-15 09:17:29	\N	3	0
150	75	7	3	1	72.03	0	85	85	3	1	12.97	\N	2025-10-15 09:17:29	2025-10-15 09:17:29	\N	1	1
151	75	8	3	10	0.0636	0	0.08	0.75	1	1	0.01	\N	2025-10-15 09:17:29	2025-10-15 09:17:29	\N	3	0
152	75	10	3	6	13.56	0	16	96	5	1	2.44	\N	2025-10-15 09:17:29	2025-10-15 09:17:29	\N	3	0
157	78	5	2	1	211.86	0	249.99	249.99	2	1	38.13	\N	2025-10-15 11:36:44	2025-10-15 11:36:44	\N	1	1
164	82	3	1	3	237.29	0	280	840.01	2	1	42.71	\N	2025-10-16 09:02:18	2025-10-16 09:02:18	\N	1	3
158	79	9	3	2	3.81	0	4.5	8.99	5	1	0.69	\N	2025-10-15 12:23:30	2025-10-15 12:23:30	\N	3	0
165	82	12	1	3	237.29	0	280	840.01	2	1	42.71	\N	2025-10-16 09:02:18	2025-10-16 09:02:18	\N	3	0
166	82	5	2	2	220.34	0	260	520	2	1	39.66	\N	2025-10-16 09:02:18	2025-10-16 09:02:18	\N	1	2
145	74	8	3	49	0.0636	0	0.08	3.68	1	1	0.01	\N	2025-10-15 08:17:47	2025-10-15 08:17:47	\N	3	0
163	81	3	1	2	237.29	0	280	560	2	1	42.71	\N	2025-10-16 08:33:05	2025-10-16 08:33:05	\N	1	2
172	85	2	1	3	228.81	0	270	809.99	2	1	41.19	\N	2025-10-16 10:21:36	2025-10-16 10:21:36	\N	2	2
167	83	7	3	1	76.27	0	90	90	3	1	13.73	\N	2025-10-16 09:28:47	2025-10-16 09:28:47	\N	1	1
168	84	4	1	2	228.81	0	270	539.99	2	1	41.19	\N	2025-10-16 09:55:12	2025-10-16 09:55:12	\N	1	2
169	84	1	1	4	228.81	0	270	1079.98	2	1	41.19	\N	2025-10-16 09:55:12	2025-10-16 09:55:12	\N	1	4
170	84	6	2	5	211.86	0	249.99	1249.97	2	1	38.13	\N	2025-10-16 09:55:12	2025-10-16 09:55:12	\N	1	5
171	84	2	1	1	228.81	0	270	270	2	1	41.19	\N	2025-10-16 09:55:12	2025-10-16 09:55:12	\N	3	0
174	87	3	1	2	228.81	0	270	539.99	2	1	41.19	\N	2025-10-16 11:15:03	2025-10-16 11:15:03	\N	1	2
173	86	5	2	1	211.86	0	249.99	249.99	2	1	38.13	\N	2025-10-16 10:48:49	2025-10-16 10:48:49	\N	1	1
175	88	5	2	1	211.86	0	249.99	249.99	2	1	38.13	\N	2025-10-16 11:41:27	2025-10-16 11:41:27	\N	1	1
139	74	4	1	2	228.81	0	270	539.99	2	1	41.19	\N	2025-10-15 08:17:47	2025-10-15 08:17:47	\N	1	2
176	89	6	2	1	211.86	0	249.99	249.99	2	1	38.13	\N	2025-10-16 12:07:58	2025-10-16 12:07:58	\N	1	1
177	89	7	3	1	72.03	0	85	85	3	1	12.97	\N	2025-10-16 12:07:58	2025-10-16 12:07:58	\N	1	1
142	74	12	1	4	228.81	0	270	1079.98	2	1	41.19	\N	2025-10-15 08:17:47	2025-10-15 08:17:47	\N	3	0
140	74	5	2	3	211.86	0	249.99	749.98	2	1	38.13	\N	2025-10-15 08:17:47	2025-10-15 08:17:47	\N	1	3
144	74	7	3	10	72.03	0	85	849.95	3	1	12.97	\N	2025-10-15 08:17:47	2025-10-15 08:17:47	\N	2	5
213	112	5	2	1	211.86	0	249.99	249.99	2	1	38.13	\N	2025-10-18 09:10:12	2025-10-18 09:10:12	\N	1	1
178	90	10	3	1	15.25	0	18	18	5	1	2.75	\N	2025-10-16 12:35:16	2025-10-16 12:35:16	\N	3	0
179	91	9	3	1	3.81	0	4.5	4.5	5	1	0.69	\N	2025-10-16 13:02:44	2025-10-16 13:02:44	\N	3	0
193	103	13	3	2	29.66	0	35	70	1	1	5.34	\N	2025-10-17 11:17:03	2025-10-17 11:17:03	\N	1	2
180	92	10	3	1	13.56	0	16	16	5	1	2.44	\N	2025-10-16 13:29:30	2025-10-16 13:29:30	\N	1	1
194	103	15	3	1	59.32	0	70	70	1	1	10.68	\N	2025-10-17 11:17:03	2025-10-17 11:17:03	\N	3	0
181	93	6	2	1	220.34	0	260	260	2	1	39.66	\N	2025-10-16 13:55:51	2025-10-16 13:55:51	\N	1	1
182	94	13	3	2	29.66	0	35	70	1	1	5.34	\N	2025-10-16 14:22:17	2025-10-16 14:22:17	\N	3	0
183	95	9	3	1	2.97	0	3.5	3.5	5	1	0.53	\N	2025-10-16 14:48:36	2025-10-16 14:48:36	\N	3	0
195	104	9	3	1	3.81	0	4.5	4.5	5	1	0.69	\N	2025-10-17 11:43:22	2025-10-17 11:43:22	\N	3	0
184	96	14	3	5	25.42	0	30	149.98	1	1	4.58	\N	2025-10-16 15:15:12	2025-10-16 15:15:12	\N	1	5
185	97	6	2	1	220.34	0	260	260	2	1	39.66	\N	2025-10-16 15:42:48	2025-10-16 15:42:48	\N	1	1
214	113	10	3	1	15.25	0	18	18	5	1	2.75	\N	2025-10-18 09:47:58	2025-10-18 09:47:58	\N	1	1
196	105	6	2	2	220.34	0	260	520	2	1	39.66	\N	2025-10-17 12:09:48	2025-10-17 12:09:48	\N	1	2
186	98	12	1	1	237.29	0	280	280	2	1	42.71	\N	2025-10-17 08:38:11	2025-10-17 08:38:11	\N	3	0
187	98	8	3	8	0.072	0	0.08	0.68	1	1	0.01	\N	2025-10-17 08:38:11	2025-10-17 08:38:11	\N	3	0
188	98	11	3	6	0.3	0	0.35	2.12	1	1	0.05	\N	2025-10-17 08:38:11	2025-10-17 08:38:11	\N	3	0
189	99	9	3	1	3.81	0	4.5	4.5	5	1	0.69	\N	2025-10-17 09:05:29	2025-10-17 09:05:29	\N	3	0
190	100	14	3	1	21.19	0	25	25	1	1	3.81	\N	2025-10-17 09:31:47	2025-10-17 09:31:47	\N	1	1
191	101	10	3	1	15.25	0	18	18	5	1	2.75	\N	2025-10-17 09:58:02	2025-10-17 09:58:02	\N	1	1
192	102	9	3	2	3.81	0	4.5	8.99	5	1	0.69	\N	2025-10-17 10:24:19	2025-10-17 10:24:19	\N	3	0
202	107	15	3	2	67.8	0	80	160.01	1	1	12.2	\N	2025-10-17 13:02:34	2025-10-17 13:02:34	\N	1	2
203	107	5	2	1	220.34	0	260	260	2	1	39.66	\N	2025-10-17 13:02:34	2025-10-17 13:02:34	\N	1	1
204	107	8	3	6	0.072	0	0.08	0.51	1	1	0.01	\N	2025-10-17 13:02:34	2025-10-17 13:02:34	\N	1	6
205	107	11	3	6	0.3	0	0.35	2.12	1	1	0.05	\N	2025-10-17 13:02:34	2025-10-17 13:02:34	\N	1	6
197	106	6	2	1	220.34	0	260	260	2	1	39.66	\N	2025-10-17 12:36:11	2025-10-17 12:36:11	\N	1	1
198	106	10	3	1	15.25	0	18	18	5	1	2.75	\N	2025-10-17 12:36:11	2025-10-17 12:36:11	\N	1	1
199	106	11	3	4	0.3	0	0.35	1.42	1	1	0.05	\N	2025-10-17 12:36:11	2025-10-17 12:36:11	\N	1	4
200	106	8	3	6	0.072	0	0.08	0.51	1	1	0.01	\N	2025-10-17 12:36:11	2025-10-17 12:36:11	\N	1	6
201	106	15	3	1	67.8	0	80	80	1	1	12.2	\N	2025-10-17 12:36:11	2025-10-17 12:36:11	\N	1	1
209	111	1	1	1	228.81	0	270	270	2	1	41.19	\N	2025-10-18 08:33:46	2025-10-18 08:33:46	\N	1	1
206	108	7	3	1	76.27	0	90	90	3	1	13.73	\N	2025-10-17 13:10:52	2025-10-17 13:10:52	\N	1	1
210	111	8	3	8	0.0636	0	0.08	0.6	1	1	0.01	\N	2025-10-18 08:33:46	2025-10-18 08:33:46	\N	3	0
207	109	15	3	1	67.8	0	80	80	1	1	12.2	\N	2025-10-17 13:55:17	2025-10-17 13:55:17	\N	1	1
211	111	11	3	6	0.25	0	0.29	1.77	1	1	0.04	\N	2025-10-18 08:33:46	2025-10-18 08:33:46	\N	3	0
208	110	6	2	1	220.34	0	260	260	2	1	39.66	\N	2025-10-17 14:21:39	2025-10-17 14:21:39	\N	1	1
212	111	10	3	4	13.56	0	16	64	5	1	2.44	\N	2025-10-18 08:33:46	2025-10-18 08:33:46	\N	1	4
143	74	1	1	4	228.81	0	270	1079.98	2	1	41.19	\N	2025-10-15 08:17:47	2025-10-15 08:17:47	\N	1	4
141	74	3	1	4	228.81	0	270	1079.98	2	1	41.19	\N	2025-10-15 08:17:47	2025-10-15 08:17:47	\N	2	3
225	116	9	3	1	3.81	0	4.5	4.5	5	1	0.69	\N	2025-10-20 10:58:42	2025-10-20 10:58:42	\N	3	0
215	114	6	2	1	220.34	0	260	260	2	1	39.66	\N	2025-10-20 08:12:33	2025-10-20 08:12:33	\N	3	0
216	114	8	3	6	0.072	0	0.08	0.51	1	1	0.01	\N	2025-10-20 08:12:33	2025-10-20 08:12:33	\N	3	0
217	114	11	3	4	0.3	0	0.35	1.42	1	1	0.05	\N	2025-10-20 08:12:33	2025-10-20 08:12:33	\N	3	0
218	114	10	3	1	15.25	0	18	18	5	1	2.75	\N	2025-10-20 08:12:33	2025-10-20 08:12:33	\N	3	0
226	117	9	3	2	3.81	0	4.5	8.99	5	1	0.69	\N	2025-10-20 11:33:55	2025-10-20 11:33:55	\N	1	2
219	115	5	2	2	211.86	0	249.99	499.99	2	1	38.13	\N	2025-10-20 09:45:10	2025-10-20 09:45:10	\N	3	0
220	115	15	3	1	59.32	0	70	70	1	1	10.68	\N	2025-10-20 09:45:10	2025-10-20 09:45:10	\N	3	0
221	115	7	3	2	72.03	0	85	169.99	3	1	12.97	\N	2025-10-20 09:45:10	2025-10-20 09:45:10	\N	3	0
222	115	1	1	1	228.81	0	270	270	2	1	41.19	\N	2025-10-20 09:45:10	2025-10-20 09:45:10	\N	3	0
223	115	8	3	16	0.0636	0	0.08	1.2	1	1	0.01	\N	2025-10-20 09:45:10	2025-10-20 09:45:10	\N	3	0
224	115	11	3	8	0.25	0	0.29	2.36	1	1	0.04	\N	2025-10-20 09:45:10	2025-10-20 09:45:10	\N	3	0
227	118	3	1	1	237.29	0	280	280	2	1	42.71	\N	2025-10-20 13:22:01	2025-10-20 13:22:01	\N	3	0
228	118	8	3	4	0.072	0	0.08	0.34	1	1	0.01	\N	2025-10-20 13:22:01	2025-10-20 13:22:01	\N	3	0
229	118	11	3	4	0.3	0	0.35	1.42	1	1	0.05	\N	2025-10-20 13:22:01	2025-10-20 13:22:01	\N	3	0
230	119	12	1	2	228.81	0	270	539.99	2	1	41.19	\N	2025-10-20 14:49:37	2025-10-20 14:49:37	\N	3	0
231	119	4	1	2	228.81	0	270	539.99	2	1	41.19	\N	2025-10-20 14:49:37	2025-10-20 14:49:37	\N	3	0
232	119	5	2	1	211.86	0	249.99	249.99	2	1	38.13	\N	2025-10-20 14:49:37	2025-10-20 14:49:37	\N	3	0
233	119	6	2	2	211.86	0	249.99	499.99	2	1	38.13	\N	2025-10-20 14:49:37	2025-10-20 14:49:37	\N	3	0
257	124	3	1	2	228.81	0	270	539.99	2	1	41.19	\N	2025-10-22 09:47:55	2025-10-22 09:47:55	\N	1	2
234	119	3	1	3	228.81	0	270	809.99	2	1	41.19	\N	2025-10-20 14:49:37	2025-10-20 14:49:37	\N	2	2
235	119	1	1	1	228.81	0	270	270	2	1	41.19	\N	2025-10-20 14:49:37	2025-10-20 14:49:37	\N	1	1
236	119	7	3	3	72.03	0	85	254.99	3	1	12.97	\N	2025-10-20 14:49:37	2025-10-20 14:49:37	\N	1	3
237	119	8	3	75	0.0636	0	0.08	5.63	1	1	0.01	\N	2025-10-20 14:49:37	2025-10-20 14:49:37	\N	2	21
238	119	11	3	14	0.25	0	0.29	4.13	1	1	0.04	\N	2025-10-20 14:49:37	2025-10-20 14:49:37	\N	3	0
258	124	4	1	1	228.81	0	270	270	2	1	41.19	\N	2025-10-22 09:47:55	2025-10-22 09:47:55	\N	1	1
251	121	6	2	2	211.86	0	249.99	499.99	2	1	38.13	\N	2025-10-21 14:09:32	2025-10-21 14:09:32	\N	1	2
252	121	5	2	1	211.86	0	249.99	249.99	2	1	38.13	\N	2025-10-21 14:09:32	2025-10-21 14:09:32	\N	1	1
259	124	5	2	1	211.86	0	249.99	249.99	2	1	38.13	\N	2025-10-22 09:47:55	2025-10-22 09:47:55	\N	1	1
253	122	5	2	1	220.34	0	260	260	2	1	39.66	\N	2025-10-22 08:05:41	2025-10-22 08:05:41	\N	1	1
260	124	6	2	1	211.86	0	249.99	249.99	2	1	38.13	\N	2025-10-22 09:47:55	2025-10-22 09:47:55	\N	1	1
261	124	8	3	50	0.0636	0	0.08	3.75	1	1	0.01	\N	2025-10-22 09:47:55	2025-10-22 09:47:55	\N	1	50
262	124	9	3	8	2.97	0	3.5	28.04	5	1	0.53	\N	2025-10-22 09:47:55	2025-10-22 09:47:55	\N	1	8
239	120	1	1	4	237.29	0	280	1120.01	2	1	42.71	\N	2025-10-21 08:33:28	2025-10-21 08:33:28	\N	1	4
240	120	5	2	2	220.34	0	260	520	2	1	39.66	\N	2025-10-21 08:33:28	2025-10-21 08:33:28	\N	2	1
241	120	6	2	2	220.34	0	260	520	2	1	39.66	\N	2025-10-21 08:33:28	2025-10-21 08:33:28	\N	2	1
242	120	15	3	5	67.8	0	80	400.02	1	1	12.2	\N	2025-10-21 08:33:28	2025-10-21 08:33:28	\N	2	4
243	120	14	3	3	25.42	0	30	89.99	1	1	4.58	\N	2025-10-21 08:33:28	2025-10-21 08:33:28	\N	2	1
244	120	13	3	2	38.14	0	45.01	90.01	1	1	6.87	\N	2025-10-21 08:33:28	2025-10-21 08:33:28	\N	3	0
245	120	11	3	50	0.3	0	0.35	17.7	1	1	0.05	\N	2025-10-21 08:33:28	2025-10-21 08:33:28	\N	3	0
246	120	8	3	100	0.072	0	0.08	8.5	1	1	0.01	\N	2025-10-21 08:33:28	2025-10-21 08:33:28	\N	1	100
247	120	7	3	6	76.27	0	90	539.99	3	1	13.73	\N	2025-10-21 08:33:28	2025-10-21 08:33:28	\N	1	6
248	120	9	3	20	3.81	0	4.5	89.92	5	1	0.69	\N	2025-10-21 08:33:28	2025-10-21 08:33:28	\N	1	20
249	120	10	3	10	15.25	0	18	179.95	5	1	2.75	\N	2025-10-21 08:33:28	2025-10-21 08:33:28	\N	2	8
250	120	4	1	4	237.29	0	280	1120.01	2	1	42.71	\N	2025-10-21 08:33:28	2025-10-21 08:33:28	\N	2	2
254	123	1	1	2	237.29	0	280	560	2	1	42.71	\N	2025-10-22 08:59:27	2025-10-22 08:59:27	\N	1	2
255	123	11	3	50	0.3	0	0.35	17.7	1	1	0.05	\N	2025-10-22 08:59:27	2025-10-22 08:59:27	\N	2	23
256	123	8	3	50	0.072	0	0.08	4.25	1	1	0.01	\N	2025-10-22 08:59:27	2025-10-22 08:59:27	\N	1	50
268	128	3	1	1	237.29	0	280	280	2	1	42.71	\N	2025-10-22 14:33:45	2025-10-22 14:33:45	\N	1	1
264	125	1	1	4	237.29	0	280	1120.01	2	1	42.71	\N	2025-10-22 11:24:12	2025-10-22 11:24:12	\N	1	4
269	128	5	2	1	220.34	0	260	260	2	1	39.66	\N	2025-10-22 14:33:45	2025-10-22 14:33:45	\N	1	1
265	126	13	3	2	38.14	0	45.01	90.01	1	1	6.87	\N	2025-10-22 12:18:39	2025-10-22 12:18:39	\N	1	2
263	124	14	3	1	21.19	0	25	25	1	1	3.81	\N	2025-10-22 09:47:55	2025-10-22 09:47:55	\N	1	1
266	126	14	3	1	25.42	0	30	30	1	1	4.58	\N	2025-10-22 12:18:39	2025-10-22 12:18:39	\N	1	1
267	127	8	3	150	0.0636	0	0.08	11.26	1	1	0.01	\N	2025-10-22 13:42:01	2025-10-22 13:42:01	\N	1	150
273	131	9	3	2	3.81	0	4.5	8.99	5	1	0.69	\N	2025-10-22 17:00:11	2025-10-22 17:00:11	\N	1	2
271	130	6	2	2	211.86	0	249.99	499.99	2	1	38.13	\N	2025-10-22 16:54:28	2025-10-22 16:54:28	\N	1	2
270	129	10	3	1	13.56	0	16	16	5	1	2.44	\N	2025-10-22 15:10:57	2025-10-22 15:10:57	\N	1	1
272	130	1	1	2	228.81	0	270	539.99	2	1	41.19	\N	2025-10-22 16:54:28	2025-10-22 16:54:28	\N	1	2
274	132	1	1	3	237.29	0	280	840.01	2	1	42.71	\N	2025-10-23 08:14:22	2025-10-23 08:14:22	\N	1	3
275	133	1	1	1	237.29	0	280	280	2	1	42.71	\N	2025-10-23 09:22:57	2025-10-23 09:22:57	\N	1	1
276	134	1	1	2	237.29	0	280	560	2	1	42.71	\N	2025-10-23 10:36:44	2025-10-23 10:36:44	\N	1	2
277	134	5	2	1	220.34	0	260	260	2	1	39.66	\N	2025-10-23 10:36:44	2025-10-23 10:36:44	\N	1	1
299	145	3	1	2	228.81	0	270	539.99	2	1	41.19	\N	2025-10-24 14:46:03	2025-10-24 14:46:03	\N	1	2
300	145	5	2	2	211.86	0	249.99	499.99	2	1	38.13	\N	2025-10-24 14:46:03	2025-10-24 14:46:03	\N	1	2
292	140	5	2	2	220.34	0	260	520	2	1	39.66	\N	2025-10-24 08:01:10	2025-10-24 08:01:10	\N	1	2
293	140	14	3	2	25.42	0	30	59.99	1	1	4.58	\N	2025-10-24 08:01:10	2025-10-24 08:01:10	\N	1	2
278	135	5	2	1	220.34	0	260	260	2	1	39.66	\N	2025-10-23 11:58:33	2025-10-23 11:58:33	\N	1	1
279	135	12	1	1	237.29	0	280	280	2	1	42.71	\N	2025-10-23 11:58:33	2025-10-23 11:58:33	\N	1	1
280	135	11	3	6	0.3	0	0.35	2.12	1	1	0.05	\N	2025-10-23 11:58:33	2025-10-23 11:58:33	\N	1	6
281	135	8	3	10	0.072	0	0.08	0.85	1	1	0.01	\N	2025-10-23 11:58:33	2025-10-23 11:58:33	\N	1	10
282	135	13	3	1	38.14	0	45.01	45.01	1	1	6.87	\N	2025-10-23 11:58:33	2025-10-23 11:58:33	\N	1	1
301	145	1	1	3	228.81	0	270	809.99	2	1	41.19	\N	2025-10-24 14:46:03	2025-10-24 14:46:03	\N	1	3
302	145	6	2	3	211.86	0	249.99	749.98	2	1	38.13	\N	2025-10-24 14:46:03	2025-10-24 14:46:03	\N	1	3
283	136	13	3	1	38.14	0	45.01	45.01	1	1	6.87	\N	2025-10-23 13:00:16	2025-10-23 13:00:16	\N	1	1
294	141	6	2	1	220.34	0	260	260	2	1	39.66	\N	2025-10-24 09:48:26	2025-10-24 09:48:26	\N	1	1
295	141	15	3	1	67.8	0	80	80	1	1	12.2	\N	2025-10-24 09:48:26	2025-10-24 09:48:26	\N	1	1
284	137	5	2	1	211.86	0	249.99	249.99	2	1	38.13	\N	2025-10-23 14:48:01	2025-10-23 14:48:01	\N	1	1
285	137	8	3	100	0.0636	0	0.08	7.5	1	1	0.01	\N	2025-10-23 14:48:01	2025-10-23 14:48:01	\N	1	100
286	137	11	3	50	0.25	0	0.29	14.75	1	1	0.04	\N	2025-10-23 14:48:01	2025-10-23 14:48:01	\N	1	50
303	145	15	3	5	59.32	0	70	349.99	1	1	10.68	\N	2025-10-24 14:46:03	2025-10-24 14:46:03	\N	1	5
296	142	9	3	1	3.81	0	4.5	4.5	5	1	0.69	\N	2025-10-24 11:22:19	2025-10-24 11:22:19	\N	1	1
287	138	12	1	1	237.29	0	280	280	2	1	42.71	\N	2025-10-23 15:39:42	2025-10-23 15:39:42	\N	3	0
288	138	4	1	1	237.29	0	280	280	2	1	42.71	\N	2025-10-23 15:39:42	2025-10-23 15:39:42	\N	1	1
289	138	1	1	1	237.29	0	280	280	2	1	42.71	\N	2025-10-23 15:39:42	2025-10-23 15:39:42	\N	1	1
297	143	9	3	2	3.81	0	4.5	8.99	5	1	0.69	\N	2025-10-24 12:40:58	2025-10-24 12:40:58	\N	1	2
290	139	1	1	1	237.29	0	280	280	2	1	42.71	\N	2025-10-23 16:27:59	2025-10-23 16:27:59	\N	1	1
291	139	6	2	1	220.34	0	260	260	2	1	39.66	\N	2025-10-23 16:27:59	2025-10-23 16:27:59	\N	1	1
298	144	15	3	1	59.32	0	70	70	1	1	10.68	\N	2025-10-24 13:34:11	2025-10-24 13:34:11	\N	1	1
304	145	14	3	2	21.19	0	25	50.01	1	1	3.81	\N	2025-10-24 14:46:03	2025-10-24 14:46:03	\N	1	2
305	145	8	3	100	0.0636	0	0.08	7.5	1	1	0.01	\N	2025-10-24 14:46:03	2025-10-24 14:46:03	\N	1	100
306	145	11	3	50	0.25	0	0.29	14.75	1	1	0.04	\N	2025-10-24 14:46:03	2025-10-24 14:46:03	\N	1	50
307	145	7	3	4	72.03	0	85	339.98	3	1	12.97	\N	2025-10-24 14:46:03	2025-10-24 14:46:03	\N	1	4
324	155	1	1	3	228.81	0	270	809.99	2	1	41.19	\N	2025-10-27 09:39:30	2025-10-27 09:39:30	\N	1	3
325	155	4	1	2	228.81	0	270	539.99	2	1	41.19	\N	2025-10-27 09:39:30	2025-10-27 09:39:30	\N	1	2
308	146	3	1	2	237.29	0	280	560	2	1	42.71	\N	2025-10-24 16:59:54	2025-10-24 16:59:54	\N	1	2
309	146	14	3	1	25.42	0	30	30	1	1	4.58	\N	2025-10-24 16:59:54	2025-10-24 16:59:54	\N	1	1
326	155	3	1	2	228.81	0	270	539.99	2	1	41.19	\N	2025-10-27 09:39:30	2025-10-27 09:39:30	\N	1	2
327	155	6	2	3	211.86	0	249.99	749.98	2	1	38.13	\N	2025-10-27 09:39:30	2025-10-27 09:39:30	\N	1	3
310	147	5	2	2	220.34	0	260	520	2	1	39.66	\N	2025-10-25 08:13:07	2025-10-25 08:13:07	\N	1	2
311	147	13	3	2	38.14	0	45.01	90.01	1	1	6.87	\N	2025-10-25 08:13:07	2025-10-25 08:13:07	\N	1	2
312	148	8	3	100	0.072	0	0.08	8.5	1	1	0.01	\N	2025-10-25 09:22:45	2025-10-25 09:22:45	\N	1	100
319	154	12	1	5	237.29	0	280	1400.01	2	1	42.71	\N	2025-10-25 16:18:40	2025-10-25 16:18:40	\N	1	5
313	149	13	3	3	38.14	0	45.01	135.02	1	1	6.87	\N	2025-10-25 10:44:18	2025-10-25 10:44:18	\N	1	3
320	154	3	1	2	237.29	0	280	560	2	1	42.71	\N	2025-10-25 16:18:40	2025-10-25 16:18:40	\N	1	2
314	150	9	3	1	3.81	0	4.5	4.5	5	1	0.69	\N	2025-10-25 11:57:03	2025-10-25 11:57:03	\N	1	1
321	154	1	1	5	237.29	0	280	1400.01	2	1	42.71	\N	2025-10-25 16:18:40	2025-10-25 16:18:40	\N	1	5
322	154	15	3	5	67.8	0	80	400.02	1	1	12.2	\N	2025-10-25 16:18:40	2025-10-25 16:18:40	\N	1	5
315	151	5	2	1	220.34	0	260	260	2	1	39.66	\N	2025-10-25 12:33:50	2025-10-25 12:33:50	\N	1	1
316	151	7	3	1	76.27	0	90	90	3	1	13.73	\N	2025-10-25 12:33:50	2025-10-25 12:33:50	\N	1	1
323	154	13	3	10	38.14	0	45.01	450.05	1	1	6.87	\N	2025-10-25 16:18:40	2025-10-25 16:18:40	\N	1	10
317	152	11	3	20	0.25	0	0.29	5.9	1	1	0.04	\N	2025-10-25 14:55:01	2025-10-25 14:55:01	\N	1	20
318	153	14	3	1	25.42	0	30	30	1	1	4.58	\N	2025-10-25 15:22:19	2025-10-25 15:22:19	\N	1	1
332	157	5	2	5	220.34	0	260	1300.01	2	1	39.66	\N	2025-10-28 10:10:55	2025-10-28 10:10:55	\N	1	5
333	157	1	1	3	237.29	0	280	840.01	2	1	42.71	\N	2025-10-28 10:10:55	2025-10-28 10:10:55	\N	1	3
334	157	8	3	200	0.072	0	0.08	16.99	1	1	0.01	\N	2025-10-28 10:10:55	2025-10-28 10:10:55	\N	1	200
335	157	11	3	50	0.3	0	0.35	17.7	1	1	0.05	\N	2025-10-28 10:10:55	2025-10-28 10:10:55	\N	1	50
336	157	7	3	3	76.27	0	90	270	3	1	13.73	\N	2025-10-28 10:10:55	2025-10-28 10:10:55	\N	1	3
328	156	1	1	2	228.81	0	270	539.99	2	1	41.19	\N	2025-10-27 09:50:14	2025-10-27 09:50:14	\N	1	2
329	156	3	1	1	228.81	0	270	270	2	1	41.19	\N	2025-10-27 09:50:14	2025-10-27 09:50:14	\N	1	1
330	156	6	2	2	211.86	0	249.99	499.99	2	1	38.13	\N	2025-10-27 09:50:14	2025-10-27 09:50:14	\N	1	2
331	156	5	2	5	211.86	0	249.99	1249.97	2	1	38.13	\N	2025-10-27 09:50:14	2025-10-27 09:50:14	\N	1	5
347	163	14	3	3	25.42	0	30	89.99	1	1	4.58	\N	2025-10-30 13:14:09	2025-10-30 13:14:09	\N	1	3
348	163	13	3	2	38.14	0	45.01	90.01	1	1	6.87	\N	2025-10-30 13:14:09	2025-10-30 13:14:09	\N	1	2
349	164	2	1	2	237.29	0	280	560	2	1	42.71	\N	2025-10-30 14:57:50	2025-10-30 14:57:50	\N	3	0
350	165	5	2	1	220.34	0	260	260	2	1	39.66	\N	2025-10-30 15:26:31	2025-10-30 15:26:31	\N	1	1
337	157	13	3	10	38.14	0	45.01	450.05	1	1	6.87	\N	2025-10-28 10:10:55	2025-10-28 10:10:55	\N	1	10
338	157	15	3	15	67.8	0	80	1200.06	1	1	12.2	\N	2025-10-28 10:10:55	2025-10-28 10:10:55	\N	1	15
339	157	9	3	20	3.81	0	4.5	89.92	5	1	0.69	\N	2025-10-28 10:10:55	2025-10-28 10:10:55	\N	1	20
340	158	15	3	10	67.8	0	80	800.04	1	1	12.2	\N	2025-10-28 14:02:57	2025-10-28 14:02:57	\N	1	10
351	166	1	1	1	237.29	0	280	280	2	1	42.71	\N	2025-10-30 16:59:44	2025-10-30 16:59:44	\N	1	1
352	166	13	3	1	38.14	0	45.01	45.01	1	1	6.87	\N	2025-10-30 16:59:44	2025-10-30 16:59:44	\N	1	1
341	159	12	1	5	228.81	0	270	1349.98	2	1	41.19	\N	2025-10-28 16:45:39	2025-10-28 16:45:39	\N	1	5
342	159	1	1	3	228.81	0	270	809.99	2	1	41.19	\N	2025-10-28 16:45:39	2025-10-28 16:45:39	\N	1	3
353	166	8	3	10	0.072	0	0.08	0.85	1	1	0.01	\N	2025-10-30 16:59:44	2025-10-30 16:59:44	\N	1	10
343	160	12	1	2	237.29	0	280	560	2	1	42.71	\N	2025-10-30 08:05:11	2025-10-30 08:05:11	\N	1	2
354	166	11	3	6	0.3	0	0.35	2.12	1	1	0.05	\N	2025-10-30 16:59:44	2025-10-30 16:59:44	\N	1	6
344	161	3	1	3	228.81	0	270	809.99	2	1	41.19	\N	2025-10-30 09:54:42	2025-10-30 09:54:42	\N	1	3
345	161	1	1	2	228.81	0	270	539.99	2	1	41.19	\N	2025-10-30 09:54:42	2025-10-30 09:54:42	\N	1	2
346	162	15	3	1	67.8	0	80	80	1	1	12.2	\N	2025-10-30 10:33:28	2025-10-30 10:33:28	\N	1	1
355	167	1	1	10	228.81	0	270	2699.96	2	1	41.19	\N	2025-10-31 08:12:55	2025-10-31 08:12:55	\N	1	10
356	167	4	1	4	228.81	0	270	1079.98	2	1	41.19	\N	2025-10-31 08:12:55	2025-10-31 08:12:55	\N	1	4
357	167	8	3	100	0.0636	0	0.08	7.5	1	1	0.01	\N	2025-10-31 08:12:55	2025-10-31 08:12:55	\N	1	100
358	167	11	3	100	0.25	0	0.29	29.5	1	1	0.04	\N	2025-10-31 08:12:55	2025-10-31 08:12:55	\N	1	100
359	167	15	3	10	59.32	0	70	699.98	1	1	10.68	\N	2025-10-31 08:12:55	2025-10-31 08:12:55	\N	1	10
360	168	15	3	1	67.8	0	80	80	1	1	12.2	\N	2025-10-31 10:40:22	2025-10-31 10:40:22	\N	1	1
361	168	10	3	1	15.25	0	18	18	5	1	2.75	\N	2025-10-31 10:40:22	2025-10-31 10:40:22	\N	1	1
362	169	10	3	3	13.56	0	16	48	5	1	2.44	\N	2025-10-31 16:28:37	2025-10-31 16:28:37	\N	1	3
363	170	1	1	4	237.29	0	280	1120.01	2	1	42.71	\N	2025-11-03 08:12:34	2025-11-03 08:12:34	\N	1	4
376	177	3	1	2	237.29	0	280	560	2	1	42.71	\N	2025-11-03 16:58:49	2025-11-03 16:58:49	\N	1	2
364	171	4	1	5	237.29	0	280	1400.01	2	1	42.71	\N	2025-11-03 08:45:10	2025-11-03 08:45:10	\N	1	5
365	171	3	1	1	237.29	0	280	280	2	1	42.71	\N	2025-11-03 08:45:10	2025-11-03 08:45:10	\N	1	1
377	177	7	3	1	76.27	0	90	90	3	1	13.73	\N	2025-11-03 16:58:49	2025-11-03 16:58:49	\N	1	1
378	177	8	3	20	0.072	0	0.08	1.7	1	1	0.01	\N	2025-11-03 16:58:49	2025-11-03 16:58:49	\N	1	20
366	172	5	2	3	220.34	0	260	780	2	1	39.66	\N	2025-11-03 09:03:57	2025-11-03 09:03:57	\N	1	3
367	172	4	1	2	237.29	0	280	560	2	1	42.71	\N	2025-11-03 09:03:57	2025-11-03 09:03:57	\N	1	2
379	177	11	3	5	0.3	0	0.35	1.77	1	1	0.05	\N	2025-11-03 16:58:49	2025-11-03 16:58:49	\N	1	5
380	177	15	3	1	67.8	0	80	80	1	1	12.2	\N	2025-11-03 16:58:49	2025-11-03 16:58:49	\N	1	1
371	174	1	1	1	237.29	0	280	280	2	1	42.71	\N	2025-11-03 11:14:55	2025-11-03 11:14:55	\N	1	1
372	174	8	3	6	0.072	0	0.08	0.51	1	1	0.01	\N	2025-11-03 11:14:55	2025-11-03 11:14:55	\N	1	6
373	174	10	3	3	15.25	0	18	53.98	5	1	2.75	\N	2025-11-03 11:14:55	2025-11-03 11:14:55	\N	1	3
374	175	2	1	2	237.29	0	280	560	2	1	42.71	\N	2025-11-03 13:22:18	2025-11-03 13:22:18	\N	2	1
381	178	9	3	2	3.81	0	4.5	8.99	5	1	0.69	\N	2025-11-04 08:05:12	2025-11-04 08:05:12	\N	1	2
375	176	1	1	1	228.81	0	270	270	2	1	41.19	\N	2025-11-03 15:47:02	2025-11-03 15:47:02	\N	1	1
368	173	4	1	3	237.29	0	280	840.01	2	1	42.71	\N	2025-11-03 10:28:41	2025-11-03 10:28:41	\N	1	3
369	173	3	1	1	237.29	0	280	280	2	1	42.71	\N	2025-11-03 10:28:41	2025-11-03 10:28:41	\N	1	1
382	179	3	1	3	228.81	0	270	809.99	2	1	41.19	\N	2025-11-04 08:21:44	2025-11-04 08:21:44	\N	1	3
383	179	6	2	5	211.86	0	249.99	1249.97	2	1	38.13	\N	2025-11-04 08:21:44	2025-11-04 08:21:44	\N	1	5
384	179	5	2	3	211.86	0	249.99	749.98	2	1	38.13	\N	2025-11-04 08:21:44	2025-11-04 08:21:44	\N	1	3
385	179	8	3	50	0.0636	0	0.08	3.75	1	1	0.01	\N	2025-11-04 08:21:44	2025-11-04 08:21:44	\N	1	50
386	179	11	3	50	0.25	0	0.29	14.75	1	1	0.04	\N	2025-11-04 08:21:44	2025-11-04 08:21:44	\N	1	50
370	173	1	1	1	237.29	0	280	280	2	1	42.71	\N	2025-11-03 10:28:41	2025-11-03 10:28:41	\N	1	1
398	184	4	1	3	237.29	0	280	840.01	2	1	42.71	\N	2025-11-04 10:55:39	2025-11-04 10:55:39	\N	1	3
399	184	12	1	3	237.29	0	280	840.01	2	1	42.71	\N	2025-11-04 10:55:39	2025-11-04 10:55:39	\N	1	3
400	184	5	2	3	220.34	0	260	780	2	1	39.66	\N	2025-11-04 10:55:39	2025-11-04 10:55:39	\N	1	3
387	180	5	2	3	220.34	0	260	780	2	1	39.66	\N	2025-11-04 08:49:33	2025-11-04 08:49:33	\N	1	3
388	180	4	1	3	237.29	0	280	840.01	2	1	42.71	\N	2025-11-04 08:49:33	2025-11-04 08:49:33	\N	1	3
389	180	7	3	1	76.27	0	90	90	3	1	13.73	\N	2025-11-04 08:49:33	2025-11-04 08:49:33	\N	1	1
401	184	3	1	3	237.29	0	280	840.01	2	1	42.71	\N	2025-11-04 10:55:39	2025-11-04 10:55:39	\N	1	3
402	184	8	3	50	0.072	0	0.08	4.25	1	1	0.01	\N	2025-11-04 10:55:39	2025-11-04 10:55:39	\N	1	50
390	181	7	3	3	76.27	0	90	270	3	1	13.73	\N	2025-11-04 09:12:58	2025-11-04 09:12:58	\N	1	3
391	181	1	1	3	237.29	0	280	840.01	2	1	42.71	\N	2025-11-04 09:12:58	2025-11-04 09:12:58	\N	1	3
403	184	11	3	42	0.3	0	0.35	14.87	1	1	0.05	\N	2025-11-04 10:55:39	2025-11-04 10:55:39	\N	1	42
392	182	1	1	5	228.81	0	270	1349.98	2	1	41.19	\N	2025-11-04 09:37:21	2025-11-04 09:37:21	\N	1	5
393	182	5	2	5	211.86	0	249.99	1249.97	2	1	38.13	\N	2025-11-04 09:37:21	2025-11-04 09:37:21	\N	1	5
394	182	6	2	2	211.86	0	249.99	499.99	2	1	38.13	\N	2025-11-04 09:37:21	2025-11-04 09:37:21	\N	1	2
395	182	12	1	1	228.81	0	270	270	2	1	41.19	\N	2025-11-04 09:37:21	2025-11-04 09:37:21	\N	1	1
396	183	12	1	1	228.81	0	270	270	2	1	41.19	\N	2025-11-04 10:05:47	2025-11-04 10:05:47	\N	1	1
397	183	7	3	1	72.03	0	85	85	3	1	12.97	\N	2025-11-04 10:05:47	2025-11-04 10:05:47	\N	1	1
404	184	15	3	5	67.8	0	80	400.02	1	1	12.2	\N	2025-11-04 10:55:39	2025-11-04 10:55:39	\N	1	5
405	184	7	3	2	76.27	0	90	180	3	1	13.73	\N	2025-11-04 10:55:39	2025-11-04 10:55:39	\N	1	2
406	184	9	3	5	3.81	0	4.5	22.48	5	1	0.69	\N	2025-11-04 10:55:39	2025-11-04 10:55:39	\N	1	5
407	184	10	3	12	15.25	0	18	215.94	5	1	2.75	\N	2025-11-04 10:55:39	2025-11-04 10:55:39	\N	1	12
426	195	3	1	3	228.81	0	270	809.99	2	1	41.19	\N	2025-11-05 11:42:09	2025-11-05 11:42:09	\N	1	3
408	185	12	1	2	237.29	0	280	560	2	1	42.71	\N	2025-11-04 11:22:03	2025-11-04 11:22:03	\N	1	2
420	192	7	3	2	76.27	0	90	180	3	1	13.73	\N	2025-11-05 08:12:27	2025-11-05 08:12:27	\N	1	2
409	186	4	1	3	237.29	0	280	840.01	2	1	42.71	\N	2025-11-04 12:14:28	2025-11-04 12:14:28	\N	1	3
410	187	1	1	3	228.81	0	270	809.99	2	1	41.19	\N	2025-11-04 12:39:51	2025-11-04 12:39:51	\N	1	3
411	188	3	1	3	237.29	0	280	840.01	2	1	42.71	\N	2025-11-04 13:37:19	2025-11-04 13:37:19	\N	1	3
427	195	1	1	5	228.81	0	270	1349.98	2	1	41.19	\N	2025-11-05 11:42:09	2025-11-05 11:42:09	\N	1	5
412	189	3	1	2	237.29	0	280	560	2	1	42.71	\N	2025-11-04 14:05:42	2025-11-04 14:05:42	\N	1	2
413	189	6	2	2	220.34	0	260	520	2	1	39.66	\N	2025-11-04 14:05:42	2025-11-04 14:05:42	\N	1	2
414	189	5	2	1	220.34	0	260	260	2	1	39.66	\N	2025-11-04 14:05:42	2025-11-04 14:05:42	\N	1	1
428	195	5	2	3	211.86	0	249.99	749.98	2	1	38.13	\N	2025-11-05 11:42:09	2025-11-05 11:42:09	\N	1	3
429	195	12	1	3	228.81	0	270	809.99	2	1	41.19	\N	2025-11-05 11:42:09	2025-11-05 11:42:09	\N	1	3
430	195	6	2	5	211.86	0	249.99	1249.97	2	1	38.13	\N	2025-11-05 11:42:09	2025-11-05 11:42:09	\N	1	5
421	193	5	2	1	211.86	0	249.99	249.99	2	1	38.13	\N	2025-11-05 09:03:51	2025-11-05 09:03:51	\N	1	1
415	190	5	2	2	211.86	0	249.99	499.99	2	1	38.13	\N	2025-11-04 14:32:58	2025-11-04 14:32:58	\N	1	2
416	190	3	1	2	228.81	0	270	539.99	2	1	41.19	\N	2025-11-04 14:32:58	2025-11-04 14:32:58	\N	1	2
417	190	8	3	20	0.0636	0	0.08	1.5	1	1	0.01	\N	2025-11-04 14:32:58	2025-11-04 14:32:58	\N	1	20
418	190	11	3	4	0.25	0	0.29	1.18	1	1	0.04	\N	2025-11-04 14:32:58	2025-11-04 14:32:58	\N	1	4
422	193	8	3	16	0.0636	0	0.08	1.2	1	1	0.01	\N	2025-11-05 09:03:51	2025-11-05 09:03:51	\N	1	16
419	191	12	1	3	228.81	0	270	809.99	2	1	41.19	\N	2025-11-04 15:01:23	2025-11-04 15:01:23	\N	1	3
423	193	11	3	7	0.25	0	0.29	2.06	1	1	0.04	\N	2025-11-05 09:03:51	2025-11-05 09:03:51	\N	1	7
424	193	9	3	5	2.97	0	3.5	17.52	5	1	0.53	\N	2025-11-05 09:03:51	2025-11-05 09:03:51	\N	1	5
431	195	4	1	1	228.81	0	270	270	2	1	41.19	\N	2025-11-05 11:42:09	2025-11-05 11:42:09	\N	1	1
425	194	3	1	2	237.29	0	280	560	2	1	42.71	\N	2025-11-05 10:18:33	2025-11-05 10:18:33	\N	1	2
443	205	7	3	5	76.27	0	90	449.99	3	1	13.73	\N	2025-11-07 13:46:09	2025-11-07 13:46:09	\N	1	5
434	197	13	3	7	38.14	0	45.01	315.04	1	1	6.87	\N	2025-11-06 09:57:48	2025-11-06 09:57:48	\N	1	7
439	201	10	3	1	15.25	0	18	18	5	1	2.75	\N	2025-11-06 16:12:34	2025-11-06 16:12:34	\N	1	1
435	198	10	3	1	15.25	0	18	18	5	1	2.75	\N	2025-11-06 10:23:47	2025-11-06 10:23:47	\N	1	1
436	199	13	3	3	38.14	0	45.01	135.02	1	1	6.87	\N	2025-11-06 11:45:12	2025-11-06 11:45:12	\N	1	3
432	196	4	1	1	237.29	0	280	280	2	1	42.71	\N	2025-11-06 08:25:14	2025-11-06 08:25:14	\N	1	1
433	196	15	3	1	67.8	0	80	80	1	1	12.2	\N	2025-11-06 08:25:14	2025-11-06 08:25:14	\N	1	1
442	204	15	3	3	67.8	0	80	240.01	1	1	12.2	\N	2025-11-07 12:21:18	2025-11-07 12:21:18	\N	1	3
440	202	1	1	2	237.29	0	280	560	2	1	42.71	\N	2025-11-07 10:58:21	2025-11-07 10:58:21	\N	1	2
437	200	9	3	30	2.97	0	3.5	105.14	5	1	0.53	\N	2025-11-06 13:07:59	2025-11-06 13:07:59	\N	1	30
438	200	8	3	100	0.0636	0	0.08	7.5	1	1	0.01	\N	2025-11-06 13:07:59	2025-11-06 13:07:59	\N	1	100
441	203	9	3	1	3.81	0	4.5	4.5	5	1	0.69	\N	2025-11-07 11:33:45	2025-11-07 11:33:45	\N	1	1
447	207	1	1	3	228.81	0	270	809.99	2	1	41.19	\N	2025-11-07 15:48:06	2025-11-07 15:48:06	\N	1	3
444	205	1	1	5	237.29	0	280	1400.01	2	1	42.71	\N	2025-11-07 13:46:09	2025-11-07 13:46:09	\N	1	5
445	206	2	1	5	237.29	0	280	1400.01	2	1	42.71	\N	2025-11-07 15:12:38	2025-11-07 15:12:38	\N	1	5
446	206	1	1	3	237.29	0	280	840.01	2	1	42.71	\N	2025-11-07 15:12:38	2025-11-07 15:12:38	\N	1	3
462	215	6	2	1	220.34	0	260	260	2	1	39.66	\N	2025-11-10 11:32:05	2025-11-10 11:32:05	\N	1	1
448	207	3	1	2	228.81	0	270	539.99	2	1	41.19	\N	2025-11-07 15:48:06	2025-11-07 15:48:06	\N	1	2
449	207	12	1	5	228.81	0	270	1349.98	2	1	41.19	\N	2025-11-07 15:48:06	2025-11-07 15:48:06	\N	1	5
450	207	5	2	4	211.86	0	249.99	999.98	2	1	38.13	\N	2025-11-07 15:48:06	2025-11-07 15:48:06	\N	1	4
463	215	14	3	2	25.42	0	30	59.99	1	1	4.58	\N	2025-11-10 11:32:05	2025-11-10 11:32:05	\N	1	2
464	216	1	1	2	237.29	0	280	560	2	1	42.71	\N	2025-11-10 13:08:59	2025-11-10 13:08:59	\N	1	2
451	208	5	2	5	220.34	0	260	1300.01	2	1	39.66	\N	2025-11-07 16:29:44	2025-11-03 10:28:41	\N	1	5
452	208	1	1	3	237.29	0	280	840.01	2	1	42.71	\N	2025-11-07 16:29:44	2025-11-07 16:29:44	\N	1	3
453	209	9	3	2	3.81	0	4.5	8.99	5	1	0.69	\N	2025-11-08 12:14:42	2025-11-08 12:14:42	\N	1	2
454	210	14	3	1	25.42	0	30	30	1	1	4.58	\N	2025-11-08 13:33:19	2025-11-08 13:33:19	\N	1	1
465	217	3	1	2	228.81	0	270	539.99	2	1	41.19	\N	2025-11-10 16:21:33	2025-11-10 16:21:33	\N	1	2
455	211	4	1	5	237.29	0	280	1400.01	2	1	42.71	\N	2025-11-08 14:50:07	2025-11-08 14:50:07	\N	1	5
456	211	5	2	2	220.34	0	260	520	2	1	39.66	\N	2025-11-08 14:50:07	2025-11-08 14:50:07	\N	1	2
457	211	6	2	5	220.34	0	260	1300.01	2	1	39.66	\N	2025-11-08 14:50:07	2025-11-08 14:50:07	\N	1	5
466	217	1	1	3	228.81	0	270	809.99	2	1	41.19	\N	2025-11-10 16:21:33	2025-11-10 16:21:33	\N	1	3
458	212	9	3	1	3.81	0	4.5	4.5	5	1	0.69	\N	2025-11-08 16:22:50	2025-11-08 16:22:50	\N	1	1
467	217	6	2	5	211.86	0	249.99	1249.97	2	1	38.13	\N	2025-11-10 16:21:33	2025-11-10 16:21:33	\N	1	5
459	213	8	3	10	0.072	0	0.08	0.85	1	1	0.01	\N	2025-11-10 08:17:42	2025-11-10 08:17:42	\N	1	10
468	218	1	1	7	228.81	0	270	1889.97	2	1	41.19	\N	2025-11-23 02:50:57	2025-11-23 02:50:57	\N	1	7
469	218	12	1	5	228.81	0	270	1349.98	2	1	41.19	\N	2025-11-23 02:50:57	2025-11-23 02:50:57	\N	1	5
460	214	4	1	2	237.29	0	280	560	2	1	42.71	\N	2025-11-10 09:45:16	2025-11-10 09:45:16	\N	1	2
461	214	6	2	1	220.34	0	260	260	2	1	39.66	\N	2025-11-10 09:45:16	2025-11-10 09:45:16	\N	1	1
470	218	6	2	10	211.86	0	249.99	2499.95	2	1	38.13	\N	2025-11-23 02:50:57	2025-11-23 02:50:57	\N	1	10
471	218	5	2	8	211.86	0	249.99	1999.96	2	1	38.13	\N	2025-11-23 02:50:57	2025-11-23 02:50:57	\N	1	8
472	218	15	3	25	59.32	0	70	1749.94	1	1	10.68	\N	2025-11-23 02:50:57	2025-11-23 02:50:57	\N	1	25
473	218	13	3	8	29.66	0	35	279.99	1	1	5.34	\N	2025-11-23 02:50:57	2025-11-23 02:50:57	\N	1	8
474	218	7	3	7	72.03	0	85	594.97	3	1	12.97	\N	2025-11-23 02:50:57	2025-11-23 02:50:57	\N	1	7
475	218	8	3	300	0.0636	0	0.08	22.51	1	1	0.01	\N	2025-11-23 02:50:57	2025-11-23 02:50:57	\N	1	300
476	218	11	3	100	0.25	0	0.29	29.5	1	1	0.04	\N	2025-11-23 02:50:57	2025-11-23 02:50:57	\N	1	100
477	218	9	3	25	2.97	0	3.5	87.61	5	1	0.53	\N	2025-11-23 02:50:57	2025-11-23 02:50:57	\N	1	25
478	218	10	3	110	13.56	0	16	1760.09	5	1	2.44	\N	2025-11-23 02:50:57	2025-11-23 02:50:57	\N	1	110
479	218	14	3	18	21.19	0	25	450.08	1	1	3.81	\N	2025-11-23 02:50:57	2025-11-23 02:50:57	\N	1	18
480	218	4	1	9	228.81	0	270	2429.96	2	1	41.19	\N	2025-11-23 02:50:57	2025-11-23 02:50:57	\N	1	9
481	219	6	2	2	220.34	0	260	520	2	1	39.66	\N	2025-11-23 02:51:52	2025-11-23 02:51:52	\N	1	2
\.


--
-- Data for Name: sale_payments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.sale_payments (id, sale_id, method_payment, n_transaction, banco, amount, created_at, updated_at, deleted_at) FROM stdin;
1	2	YAPE	\N	\N	809.99	2025-10-01 13:57:58	2025-10-01 13:57:58	\N
2	3	TRANSFERENCIA	\N	\N	1635.98	2025-10-02 08:21:52	2025-10-02 08:21:52	\N
3	4	TRANSFERENCIA	\N	\N	249.99	2025-10-02 08:21:52	2025-10-02 08:21:52	\N
25	31	DEPOSITO	\N	\N	18	2025-10-04 10:55:21	2025-10-04 10:55:21	\N
26	32	TRANSFERENCIA	\N	\N	789.98	2025-10-04 12:11:44	2025-10-04 12:11:44	\N
5	6	YAPE	\N	\N	840.01	2025-10-02 09:02:15	2025-10-02 09:02:15	\N
4	5	TRANSFERENCIA	\N	\N	560.85	2025-10-02 08:41:30	2025-10-02 08:41:30	\N
6	11	YAPE	\N	\N	35.99	2025-10-02 10:01:03	2025-10-02 10:01:03	\N
7	12	EFECTIVO	\N	\N	42.01	2025-10-02 10:03:27	2025-10-02 10:03:27	\N
8	13	PLIN	\N	\N	85	2025-10-02 10:15:01	2025-10-02 10:15:01	\N
9	14	PLIN	\N	\N	249.99	2025-10-02 10:18:12	2025-10-02 10:18:12	\N
10	15	TRANSFERENCIA	\N	\N	325.01	2025-10-02 10:38:05	2025-10-02 10:38:05	\N
11	16	EFECTIVO	\N	\N	18	2025-10-02 11:12:44	2025-10-02 11:12:44	\N
12	17	TRANSFERENCIA	\N	\N	313.98	2025-10-02 11:47:00	2025-10-02 11:47:00	\N
13	18	EFECTIVO	\N	\N	30	2025-10-02 12:00:49	2025-10-02 12:00:49	\N
14	19	EFECTIVO	\N	\N	85	2025-10-03 11:01:51	2025-10-03 11:01:51	\N
15	20	EFECTIVO	\N	\N	18	2025-10-03 11:23:10	2025-10-03 11:23:10	\N
16	21	EFECTIVO	\N	\N	8.5	2025-10-03 12:45:39	2025-10-03 12:45:39	\N
17	22	EFECTIVO	\N	\N	125.01	2025-10-03 13:12:55	2025-10-03 13:12:55	\N
18	23	YAPE	\N	\N	668	2025-10-03 14:08:21	2025-10-03 14:08:21	\N
19	24	TRANSFERENCIA	\N	\N	1620.01	2025-10-03 15:27:44	2025-10-03 15:27:44	\N
20	25	TRANSFERENCIA	\N	\N	1969.76	2025-10-03 15:59:02	2025-10-03 15:59:02	\N
21	26	TRANSFERENCIA	\N	\N	2124.6	2025-10-03 16:14:37	2025-10-03 16:14:37	\N
22	27	TRANSFERENCIA	\N	\N	169.99	2025-10-03 16:55:18	2025-10-03 16:55:18	\N
23	28	EFECTIVO	\N	\N	8.99	2025-10-04 09:05:12	2025-10-04 09:05:12	\N
24	30	EFECTIVO	\N	\N	100	2025-10-04 10:18:59	2025-10-04 10:18:59	\N
57	69	DEPOSITO	\N	\N	519.99	2025-10-13 11:47:49	2025-10-13 11:47:49	\N
27	37	EFECTIVO	\N	\N	16	2025-10-06 08:34:12	2025-10-06 08:34:12	\N
45	56	PLIN	\N	\N	98	2025-10-09 14:02:15	2025-10-09 14:02:15	\N
28	39	EFECTIVO	\N	\N	50	2025-10-06 10:05:27	2025-10-06 10:05:27	\N
29	40	TRANSFERENCIA	\N	\N	1349.98	2025-10-06 11:40:58	2025-10-06 11:40:58	\N
30	41	EFECTIVO	\N	\N	825.99	2025-10-07 08:31:03	2025-10-07 08:31:03	\N
46	57	TRANSFERENCIA	\N	\N	520	2025-10-09 14:49:50	2025-10-09 14:49:50	\N
31	42	YAPE	\N	\N	90.01	2025-10-07 09:10:47	2025-10-07 09:10:47	\N
32	43	TRANSFERENCIA	\N	\N	1135.09	2025-10-07 09:13:21	2025-10-07 09:13:21	\N
65	77	PLIN	\N	\N	70	2025-10-15 10:50:12	2025-10-15 10:50:12	\N
33	44	TRANSFERENCIA	\N	\N	350	2025-10-07 10:46:36	2025-10-07 10:46:36	\N
47	58	PLIN	\N	\N	270	2025-10-10 08:55:18	2025-10-10 08:55:18	\N
34	45	EFECTIVO	\N	\N	30	2025-10-07 11:03:52	2025-10-07 11:03:52	\N
35	46	EFECTIVO	\N	\N	3.5	2025-10-07 12:20:18	2025-10-07 12:20:18	\N
58	70	TRANSFERENCIA	\N	\N	1849.97	2025-10-13 12:35:06	2025-10-13 12:35:06	\N
36	47	EFECTIVO	\N	\N	4.5	2025-10-07 13:05:49	2025-10-07 13:05:49	\N
48	60	DEPOSITO	\N	\N	18	2025-10-11 09:25:09	2025-10-11 09:25:09	\N
37	48	DEPOSITO	\N	\N	260	2025-10-08 09:15:27	2025-10-08 09:15:27	\N
38	49	TRANSFERENCIA	\N	\N	1704.97	2025-10-09 08:42:33	2025-10-09 08:42:33	\N
39	50	DEPOSITO	\N	\N	1079.98	2025-10-09 09:30:14	2025-10-09 09:30:14	\N
49	61	PLIN	\N	\N	160.01	2025-10-11 10:12:34	2025-10-11 10:12:34	\N
40	51	TRANSFERENCIA	\N	\N	260	2025-10-09 10:12:55	2025-10-09 10:12:55	\N
41	52	TRANSFERENCIA	\N	\N	843.53	2025-10-09 10:58:06	2025-10-09 10:58:06	\N
42	53	DEPOSITO	\N	\N	90	2025-10-09 11:45:39	2025-10-09 11:45:39	\N
50	62	EFECTIVO	\N	\N	4.5	2025-10-11 11:03:51	2025-10-11 11:03:51	\N
43	54	YAPE	\N	\N	18	2025-10-09 12:31:22	2025-10-09 12:31:22	\N
44	55	DEPOSITO	\N	\N	2639.95	2025-10-09 13:18:47	2025-10-09 13:18:47	\N
59	71	EFECTIVO	\N	\N	20	2025-10-14 08:32:50	2025-10-14 08:32:50	\N
51	63	DEPOSITO	\N	\N	1120	2025-10-11 11:50:27	2025-10-11 11:50:27	\N
52	64	EFECTIVO	\N	\N	4.5	2025-10-11 12:36:44	2025-10-11 12:36:44	\N
73	85	TRANSFERENCIA	\N	\N	809.99	2025-10-16 10:21:36	2025-10-16 10:21:36	\N
53	65	PLIN	\N	\N	45.01	2025-10-13 08:45:12	2025-10-13 08:45:12	\N
60	72	DEPOSITO	\N	\N	1120.01	2025-10-14 09:20:15	2025-10-14 09:20:15	\N
54	66	YAPE	\N	\N	280	2025-10-13 09:28:33	2025-10-13 09:28:33	\N
55	67	EFECTIVO	\N	\N	18	2025-10-13 10:14:07	2025-10-13 10:14:07	\N
66	78	DEPOSITO	\N	\N	789.98	2025-10-15 11:36:44	2025-10-15 11:36:44	\N
56	68	TRANSFERENCIA	\N	\N	89.99	2025-10-13 11:01:22	2025-10-13 11:01:22	\N
61	73	TRANSFERENCIA	\N	\N	1039.98	2025-10-14 10:05:42	2025-10-14 10:05:42	\N
70	82	DEPOSITO	\N	\N	2200.02	2025-10-16 09:02:18	2025-10-16 09:02:18	\N
63	75	TRANSFERENCIA	\N	\N	494.97	2025-10-15 09:17:29	2025-10-15 09:17:29	\N
67	79	PLIN	\N	\N	8.99	2025-10-15 12:23:30	2025-10-15 12:23:30	\N
64	76	TRANSFERENCIA	\N	\N	110	2025-10-15 10:05:51	2025-10-15 10:05:51	\N
68	80	TRANSFERENCIA	\N	\N	362.63	2025-10-15 13:05:11	2025-10-15 13:05:11	\N
71	83	YAPE	\N	\N	90	2025-10-16 09:28:47	2025-10-16 09:28:47	\N
69	81	TRANSFERENCIA	\N	\N	560	2025-10-16 08:33:05	2025-10-16 08:33:05	\N
72	84	TRANSFERENCIA	\N	\N	3139.94	2025-10-16 09:55:12	2025-10-16 09:55:12	\N
75	87	TRANSFERENCIA	\N	\N	539.99	2025-10-16 11:15:03	2025-10-16 11:15:03	\N
74	86	YAPE	\N	\N	249.99	2025-10-16 10:48:49	2025-10-16 10:48:49	\N
77	89	TRANSFERENCIA	\N	\N	334.99	2025-10-16 12:07:58	2025-10-16 12:07:58	\N
76	88	TRANSFERENCIA	\N	\N	249.99	2025-10-16 11:41:27	2025-10-16 11:41:27	\N
78	90	EFECTIVO	\N	\N	18	2025-10-16 12:35:16	2025-10-16 12:35:16	\N
79	91	EFECTIVO	\N	\N	4.5	2025-10-16 13:02:44	2025-10-16 13:02:44	\N
80	92	EFECTIVO	\N	\N	16	2025-10-16 13:29:30	2025-10-16 13:29:30	\N
81	93	EFECTIVO	\N	\N	10	2025-10-16 13:55:51	2025-10-16 13:55:51	\N
82	94	PLIN	\N	\N	70	2025-10-16 14:22:17	2025-10-16 14:22:17	\N
83	95	EFECTIVO	\N	\N	3.5	2025-10-16 14:48:36	2025-10-16 14:48:36	\N
84	96	YAPE	\N	\N	149.98	2025-10-16 15:15:12	2025-10-16 15:15:12	\N
85	97	TRANSFERENCIA	\N	\N	260	2025-10-16 15:42:48	2025-10-16 15:42:48	\N
86	98	PLIN	\N	\N	282.8	2025-10-17 08:38:11	2025-10-17 08:38:11	\N
87	99	EFECTIVO	\N	\N	4.5	2025-10-17 09:05:29	2025-10-17 09:05:29	\N
88	100	YAPE	\N	\N	25	2025-10-17 09:31:47	2025-10-17 09:31:47	\N
89	101	YAPE	\N	\N	18	2025-10-17 09:58:02	2025-10-17 09:58:02	\N
90	102	YAPE	\N	\N	8.99	2025-10-17 10:24:19	2025-10-17 10:24:19	\N
91	103	DEPOSITO	\N	\N	140	2025-10-17 11:17:03	2025-10-17 11:17:03	\N
92	104	YAPE	\N	\N	4.5	2025-10-17 11:43:22	2025-10-17 11:43:22	\N
93	109	EFECTIVO	\N	\N	5	2025-10-17 13:55:17	2025-10-17 13:55:17	\N
94	110	TRANSFERENCIA	\N	\N	260	2025-10-17 14:21:39	2025-10-17 14:21:39	\N
95	111	TRANSFERENCIA	\N	\N	336.37	2025-10-18 08:33:46	2025-10-18 08:33:46	\N
96	112	TRANSFERENCIA	\N	\N	249.99	2025-10-18 09:10:12	2025-10-18 09:10:12	\N
97	113	YAPE	\N	\N	18	2025-10-18 09:47:58	2025-10-18 09:47:58	\N
155	183	EFECTIVO	\N	\N	50	2025-11-04 10:05:47	2025-11-04 10:05:47	\N
98	114	TRANSFERENCIA	\N	\N	279.93	2025-10-20 08:12:33	2025-10-20 08:12:33	\N
123	144	PLIN	\N	\N	70	2025-10-24 13:34:11	2025-10-24 13:34:11	\N
99	115	TRANSFERENCIA	\N	\N	1013.54	2025-10-20 09:45:10	2025-10-20 09:45:10	\N
100	116	EFECTIVO	\N	\N	4.5	2025-10-20 10:58:42	2025-10-20 10:58:42	\N
137	158	TRANSFERENCIA	\N	\N	800.04	2025-10-28 14:02:57	2025-10-28 14:02:57	\N
101	117	EFECTIVO	\N	\N	8.99	2025-10-20 11:33:55	2025-10-20 11:33:55	\N
124	145	TRANSFERENCIA	\N	\N	3362.18	2025-10-24 14:46:03	2025-10-24 14:46:03	\N
102	118	TRANSFERENCIA	\N	\N	281.76	2025-10-20 13:22:01	2025-10-20 13:22:01	\N
103	119	PLIN	\N	\N	235	2025-10-20 14:49:37	2025-10-20 14:49:37	\N
104	120	TRANSFERENCIA	\N	\N	2184.8	2025-10-21 08:33:28	2025-10-21 08:33:28	\N
125	146	TRANSFERENCIA	\N	\N	590	2025-10-24 16:59:54	2025-10-24 16:59:54	\N
105	121	EFECTIVO	\N	\N	50	2025-10-21 14:09:32	2025-10-21 14:09:32	\N
106	122	TRANSFERENCIA	\N	\N	260	2025-10-22 08:05:41	2025-10-22 08:05:41	\N
148	169	TRANSFERENCIA	\N	\N	48	2025-10-31 16:28:37	2025-10-31 16:28:37	\N
107	123	TRANSFERENCIA	\N	\N	581.95	2025-10-22 08:59:27	2025-10-22 08:59:27	\N
126	147	TRANSFERENCIA	\N	\N	610.01	2025-10-25 08:13:07	2025-10-25 08:13:07	\N
108	124	EFECTIVO	\N	\N	10	2025-10-22 09:47:55	2025-10-22 09:47:55	\N
109	125	TRANSFERENCIA	\N	\N	1120.01	2025-10-22 11:24:12	2025-10-22 11:24:12	\N
138	159	TRANSFERENCIA	\N	\N	2159.97	2025-10-28 16:45:39	2025-10-28 16:45:39	\N
110	126	DEPOSITO	\N	\N	120.01	2025-10-22 12:18:39	2025-10-22 12:18:39	\N
127	148	YAPE	\N	\N	8.5	2025-10-25 09:22:45	2025-10-25 09:22:45	\N
111	127	YAPE	\N	\N	11.26	2025-10-22 13:42:01	2025-10-22 13:42:01	\N
112	128	TRANSFERENCIA	\N	\N	540	2025-10-22 14:33:45	2025-10-22 14:33:45	\N
113	129	EFECTIVO	\N	\N	16	2025-10-22 15:10:57	2025-10-22 15:10:57	\N
128	149	TRANSFERENCIA	\N	\N	135.02	2025-10-25 10:44:18	2025-10-25 10:44:18	\N
114	130	EFECTIVO	\N	\N	100	2025-10-22 16:54:28	2025-10-22 16:54:28	\N
115	131	YAPE	\N	\N	8.99	2025-10-22 17:00:11	2025-10-22 17:00:11	\N
116	137	TRANSFERENCIA	\N	\N	272.24	2025-10-23 14:48:01	2025-10-23 14:48:01	\N
129	150	EFECTIVO	\N	\N	4.5	2025-10-25 11:57:03	2025-10-25 11:57:03	\N
117	138	TRANSFERENCIA	\N	\N	840	2025-10-23 15:39:42	2025-10-23 15:39:42	\N
118	139	TRANSFERENCIA	\N	\N	540	2025-10-23 16:27:59	2025-10-23 16:27:59	\N
139	160	DEPOSITO	\N	\N	560	2025-10-30 08:05:11	2025-10-30 08:05:11	\N
119	140	PLIN	\N	\N	33	2025-10-24 08:01:10	2025-10-24 08:01:10	\N
130	151	TRANSFERENCIA	\N	\N	350	2025-10-25 12:33:50	2025-10-25 12:33:50	\N
120	141	TRANSFERENCIA	\N	\N	340	2025-10-24 09:48:26	2025-10-24 09:48:26	\N
121	142	EFECTIVO	\N	\N	4.5	2025-10-24 11:22:19	2025-10-24 11:22:19	\N
122	143	YAPE	\N	\N	8.99	2025-10-24 12:40:58	2025-10-24 12:40:58	\N
131	152	YAPE	\N	\N	5.9	2025-10-25 14:55:01	2025-10-25 14:55:01	\N
132	153	EFECTIVO	\N	\N	30	2025-10-25 15:22:19	2025-10-25 15:22:19	\N
140	161	TRANSFERENCIA	\N	\N	1349.98	2025-10-30 09:54:42	2025-10-30 09:54:42	\N
133	154	EFECTIVO	\N	\N	10	2025-10-25 16:18:40	2025-10-25 16:18:40	\N
149	174	DEPOSITO	\N	\N	334.49	2025-11-03 11:14:55	2025-11-03 11:14:55	\N
141	162	TRANSFERENCIA	\N	\N	80	2025-10-30 10:33:28	2025-10-30 10:33:28	\N
134	155	EFECTIVO	\N	\N	10	2025-10-27 09:39:30	2025-10-27 09:39:30	\N
135	156	EFECTIVO	\N	\N	5	2025-10-27 09:50:14	2025-10-27 09:50:14	\N
142	163	EFECTIVO	\N	\N	180	2025-10-30 13:14:09	2025-10-30 13:14:09	\N
166	195	TRANSFERENCIA	\N	\N	5239.91	2025-11-05 11:42:09	2025-11-05 11:42:09	\N
143	164	TRANSFERENCIA	\N	\N	560	2025-10-30 14:57:50	2025-10-30 14:57:50	\N
136	157	TRANSFERENCIA	\N	\N	4184.74	2025-10-28 10:10:55	2025-10-28 10:10:55	\N
150	175	TRANSFERENCIA	\N	\N	560	2025-11-03 13:22:18	2025-11-03 13:22:18	\N
144	165	TRANSFERENCIA	\N	\N	260	2025-10-30 15:26:31	2025-10-30 15:26:31	\N
145	166	TRANSFERENCIA	\N	\N	327.98	2025-10-30 16:59:44	2025-10-30 16:59:44	\N
156	184	DEPOSITO	\N	\N	1000	2025-11-04 10:55:39	2025-11-04 10:55:39	\N
146	167	TRANSFERENCIA	\N	\N	4516.92	2025-10-31 08:12:55	2025-10-31 08:12:55	\N
151	176	PLIN	\N	\N	270	2025-11-03 15:47:02	2025-11-03 15:47:02	\N
147	168	PLIN	\N	\N	98	2025-10-31 10:40:22	2025-10-31 10:40:22	\N
152	177	EFECTIVO	\N	\N	50	2025-11-03 16:58:49	2025-11-03 16:58:49	\N
160	189	DEPOSITO	\N	\N	1000	2025-11-04 14:05:42	2025-11-04 14:05:42	\N
153	178	YAPE	\N	\N	8.99	2025-11-04 08:05:12	2025-11-04 08:05:12	\N
157	185	DEPOSITO	\N	\N	50	2025-11-04 11:22:03	2025-11-04 11:22:03	\N
154	179	DEPOSITO	\N	\N	1000	2025-11-04 08:21:44	2025-11-04 08:21:44	\N
163	192	DEPOSITO	\N	\N	180	2025-11-05 08:12:27	2025-11-05 08:12:27	\N
158	187	TRANSFERENCIA	\N	\N	809.99	2025-11-04 12:39:51	2025-11-04 12:39:51	\N
161	190	EFECTIVO	\N	\N	100	2025-11-04 14:32:58	2025-11-04 14:32:58	\N
159	188	EFECTIVO	\N	\N	500	2025-11-04 13:37:19	2025-11-04 13:37:19	\N
162	191	DEPOSITO	\N	\N	809.99	2025-11-04 15:01:23	2025-11-04 15:01:23	\N
165	194	DEPOSITO	\N	\N	500	2025-11-05 10:18:33	2025-11-05 10:18:33	\N
164	193	DEPOSITO	\N	\N	170	2025-11-05 09:03:51	2025-11-05 09:03:51	\N
167	196	DEPOSITO	\N	\N	360	2025-11-06 08:25:14	2025-11-06 08:25:14	\N
168	197	DEPOSITO	\N	\N	315.04	2025-11-06 09:57:48	2025-11-06 09:57:48	\N
169	198	PLIN	\N	\N	18	2025-11-06 10:23:47	2025-11-06 10:23:47	\N
170	199	TRANSFERENCIA	\N	\N	135.02	2025-11-06 11:45:12	2025-11-06 11:45:12	\N
171	200	PLIN	\N	\N	112.64	2025-11-06 13:07:59	2025-11-06 13:07:59	\N
172	201	PLIN	\N	\N	18	2025-11-06 16:12:34	2025-11-06 16:12:34	\N
173	202	TRANSFERENCIA	\N	\N	560	2025-11-07 10:58:21	2025-11-07 10:58:21	\N
174	203	EFECTIVO	\N	\N	4.5	2025-11-07 11:33:45	2025-11-07 11:33:45	\N
175	204	TRANSFERENCIA	\N	\N	240.01	2025-11-07 12:21:18	2025-11-07 12:21:18	\N
176	206	DEPOSITO	\N	\N	2240.02	2025-11-07 15:12:38	2025-11-07 15:12:38	\N
177	207	DEPOSITO	\N	\N	3699.94	2025-11-07 15:48:06	2025-11-07 15:48:06	\N
178	208	TRANSFERENCIA	\N	\N	2140.02	2025-11-07 16:29:44	2025-11-07 16:29:44	\N
62	74	TRANSFERENCIA	\N	\N	5383.54	2025-10-15 08:17:47	2025-10-15 08:17:47	\N
179	209	PLIN	\N	\N	8.99	2025-11-08 12:14:42	2025-11-08 12:14:42	\N
180	210	TRANSFERENCIA	\N	\N	30	2025-11-08 13:33:19	2025-11-08 13:33:19	\N
181	211	TRANSFERENCIA	\N	\N	3220.02	2025-11-08 14:50:07	2025-11-08 14:50:07	\N
182	212	EFECTIVO	\N	\N	4.5	2025-11-08 16:22:50	2025-11-08 16:22:50	\N
183	213	YAPE	\N	\N	0.85	2025-11-10 08:17:42	2025-11-10 08:17:42	\N
184	214	TRANSFERENCIA	\N	\N	100	2025-11-10 09:45:16	2025-11-10 09:45:16	\N
185	215	DEPOSITO	\N	\N	300	2025-11-10 11:32:05	2025-11-10 11:32:05	\N
186	217	TRANSFERENCIA	\N	\N	2000	2025-11-10 16:21:33	2025-11-10 16:21:33	\N
187	218	TRANSFERENCIA	\N	\N	15144.51	2025-11-23 02:50:57	2025-11-23 02:50:57	\N
\.


--
-- Data for Name: sales; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.sales (id, user_id, client_id, type_client, sucursale_id, subtotal, total, igv, state_sale, state_payment, debt, paid_out, date_validation, date_pay_complete, description, created_at, updated_at, deleted_at, state_entrega, discount) FROM stdin;
2	3	1	2	1	725	809.99	123.56	1	3	0	809.99	2025-10-01 13:57:58	2025-10-01 13:57:58	\N	2025-10-01 13:57:58	2025-10-01 13:57:58	\N	3	0
3	4	9	2	1	1488.12	1635.98	249.56	1	3	0	1635.98	2025-10-02 08:21:52	2025-10-02 08:21:52	\N	2025-10-02 08:21:52	2025-10-02 08:21:52	\N	3	0
4	5	9	2	1	208.59	249.99	38.13	1	3	0	249.99	2025-10-02 08:33:22	2025-10-02 08:33:22	\N	2025-10-02 08:33:22	2025-10-02 08:33:22	\N	3	0
26	3	12	2	1	1800.51	2124.6	323.95	1	3	0	2124.6	2025-10-03 16:14:37	2025-10-03 16:14:37	\N	2025-10-03 16:14:37	2025-10-03 16:14:37	\N	3	0
28	4	3	1	1	7.62	8.99	1.38	1	3	0	8.99	2025-10-04 09:05:12	2025-10-04 09:05:12	\N	2025-10-04 09:05:12	2025-10-04 09:05:12	\N	3	0
5	5	5	1	1	280.08	560.85	42.72	1	3	0	560.85	2025-10-02 08:41:30	2025-10-02 08:41:30	\N	2025-10-02 08:41:30	2025-10-02 08:41:30	\N	3	0
6	4	6	1	1	711.87	840.01	128.13	1	3	0	840.01	2025-10-02 09:02:15	2025-10-02 09:02:15	\N	2025-10-02 09:02:15	2025-10-02 09:02:15	\N	3	0
17	3	10	1	1	266.09	313.98	47.91	1	3	0	313.98	2025-10-02 11:47:00	2025-10-02 11:47:00	\N	2025-10-02 11:47:00	2025-10-02 11:47:00	\N	3	0
12	4	8	2	1	35.6	42.01	6.4	1	3	0	42.01	2025-10-02 10:03:27	2025-10-02 10:03:27	\N	2025-10-02 10:03:27	2025-10-02 10:03:27	\N	3	0
7	3	11	1	1	1239.55	1455.71	222.06	2	1	1455.71	0	\N	\N	Cotización proyecto	2025-10-02 09:33:11	2025-10-02 09:33:11	\N	1	0
13	5	12	2	1	72.03	85	12.97	1	3	0	85	2025-10-02 10:15:01	2025-10-02 10:15:01	\N	2025-10-02 10:15:01	2025-10-02 10:15:01	\N	3	0
27	3	12	2	1	144.06	169.99	25.94	1	3	0	169.99	2025-10-03 16:55:18	2025-10-03 16:55:18	\N	2025-10-03 16:55:18	2025-10-03 16:55:18	\N	3	0
21	3	6	1	1	7.2	8.5	1	1	3	0	8.5	2025-10-03 12:45:39	2025-10-03 12:45:39	Caja de 100 unidades	2025-10-03 12:45:39	2025-10-03 12:45:39	\N	3	0
20	5	10	1	1	15.25	18	2.75	1	3	0	18	2025-10-03 11:23:10	2025-10-03 11:23:10	\N	2025-10-03 11:23:10	2025-10-03 11:23:10	\N	3	0
14	5	12	2	1	211.86	249.99	38.13	1	3	0	249.99	2025-10-02 10:18:12	2025-10-02 10:18:12	\N	2025-10-02 10:18:12	2025-10-02 10:18:12	\N	3	0
9	3	11	1	1	2101.71	2480.02	378.29	2	1	2480.02	0	\N	\N	\N	2025-10-02 09:44:57	2025-10-02 09:44:57	\N	1	0
33	4	7	1	1	440.68	520	79.32	2	1	520	0	\N	\N	\N	2025-10-04 12:58:07	2025-10-04 12:58:07	\N	1	0
24	3	11	1	1	1372.89	1620.01	247.11	1	3	0	1620.01	2025-10-03 15:27:44	2025-10-03 15:27:44	\N	2025-10-03 15:27:44	2025-10-03 15:27:44	\N	3	0
18	3	7	1	1	25.42	30	4.58	1	3	0	30	2025-10-02 12:00:49	2025-10-02 12:00:49	\N	2025-10-02 12:00:49	2025-10-02 12:00:49	\N	3	0
10	4	12	2	1	2162.16	2059.96	314.27	2	1	2059.96	0	\N	\N	\N	2025-10-02 09:50:50	2025-10-02 09:50:50	\N	1	0
15	3	4	1	1	275.43	325.01	49.58	1	3	0	325.01	2025-10-02 10:38:05	2025-10-02 10:38:05	\N	2025-10-02 10:38:05	2025-10-02 10:38:05	\N	3	0
30	5	14	1	1	440.68	520	79.32	1	2	420	100	2025-10-04 10:18:59	\N	\N	2025-10-04 10:18:59	2025-10-04 10:18:59	\N	3	0
8	3	11	1	1	1884.99496	2224.2896	339.3396	2	1	2224.2896	0	\N	\N	\N	2025-10-02 09:39:04	2025-10-02 09:39:04	\N	1	0
22	4	11	1	1	105.94	125.01	19.07	1	3	0	125.01	2025-10-03 13:12:55	2025-10-03 13:12:55	\N	2025-10-03 13:12:55	2025-10-03 13:12:55	\N	3	0
11	3	2	1	1	30.5	35.99	5.5	1	3	0	35.99	2025-10-02 10:01:03	2025-10-02 10:01:03	\N	2025-10-02 10:01:03	2025-10-02 10:01:03	\N	3	0
19	4	9	2	1	72.03	85	12.97	1	3	0	85	2025-10-03 11:01:51	2025-10-03 11:01:51	\N	2025-10-03 11:01:51	2025-10-03 11:01:51	\N	3	0
16	3	3	1	1	15.25	18	2.75	1	3	0	18	2025-10-02 11:12:44	2025-10-02 11:12:44	\N	2025-10-02 11:12:44	2025-10-02 11:12:44	\N	3	0
25	4	12	2	1	1669.29	1969.76	300.39	1	3	0	1969.76	2025-10-03 15:59:02	2025-10-03 15:59:02	Proyecto completo	2025-10-03 15:59:02	2025-10-03 15:59:02	\N	3	0
35	4	7	1	1	457.63	540	82.37	2	1	540	0	\N	\N	\N	2025-10-04 13:03:08	2025-10-04 13:03:08	\N	1	0
23	3	13	1	1	566.1	668	101.9	1	3	0	668	2025-10-03 14:08:21	2025-10-03 14:08:21	\N	2025-10-03 14:08:21	2025-10-03 14:08:21	\N	3	0
29	4	3	1	1	949.16	1120.01	170.84	2	1	1120.01	0	\N	\N	\N	2025-10-04 09:07:32	2025-10-04 09:07:32	\N	1	0
34	4	7	1	1	661.02	780	118.98	2	1	780	0	\N	\N	\N	2025-10-04 13:00:59	2025-10-04 13:00:59	\N	1	0
32	3	12	2	1	669.48	789.98	120.51	1	3	0	789.98	2025-10-04 12:11:44	2025-10-04 12:11:44	\N	2025-10-04 12:11:44	2025-10-04 12:11:44	\N	3	0
31	5	7	1	1	15.25	18	2.75	1	3	0	18	2025-10-04 10:55:21	2025-10-04 10:55:21	\N	2025-10-04 10:55:21	2025-10-04 10:55:21	\N	3	0
36	5	3	1	1	838.99	990.01	151.03	2	1	990.01	0	\N	\N	\N	2025-10-04 14:59:18	2025-10-04 14:59:18	\N	1	0
38	4	3	1	1	1338.99	1580.01	241.01	2	1	1580.01	0	\N	\N	\N	2025-10-06 09:12:45	2025-10-06 09:12:45	\N	1	0
37	5	8	2	1	13.56	16	2.44	1	3	0	16	2025-10-06 08:34:12	2025-10-06 08:34:12	\N	2025-10-06 08:34:12	2025-10-06 08:34:12	\N	3	0
44	3	7	1	1	296.61	350	53.39	1	3	0	350	2025-10-07 10:46:36	2025-10-07 10:46:36	\N	2025-10-07 10:46:36	2025-10-07 10:46:36	\N	3	0
39	5	15	2	1	915.24	1079.99	164.76	1	2	1029.99	50	2025-10-06 10:05:27	\N	\N	2025-10-06 10:05:27	2025-10-06 10:05:27	\N	3	0
40	3	8	2	1	1144.05	1349.98	205.95	1	3	0	1349.98	2025-10-06 11:40:58	2025-10-06 11:40:58	\N	2025-10-06 11:40:58	2025-10-06 11:40:58	\N	3	0
43	3	3	1	1	961.93	1135.09	173.07	1	3	0	1135.09	2025-10-07 09:13:21	2025-10-07 09:13:21	\N	2025-10-07 09:13:21	2025-10-07 09:13:21	\N	2	0
41	5	12	2	1	699.99	825.99	126.01	1	3	0	825.99	2025-10-07 08:31:03	2025-10-07 08:31:03	\N	2025-10-07 08:31:03	2025-10-07 08:31:03	\N	3	0
42	4	3	1	1	76.28	90.01	13.74	1	3	0	90.01	2025-10-07 09:10:47	2025-10-07 09:10:47	\N	2025-10-07 09:10:47	2025-10-07 09:10:47	\N	3	0
70	3	9	2	1	1567.77	1849.97	282.21	1	3	0	1849.97	2025-10-13 12:35:06	2025-10-13 12:35:06	\N	2025-10-13 12:35:06	2025-10-13 12:35:06	\N	1	0
45	5	7	1	1	25.42	30	4.58	1	3	0	30	2025-10-07 11:03:52	2025-10-07 11:03:52	\N	2025-10-07 11:03:52	2025-10-07 11:03:52	\N	3	0
64	5	2	1	1	3.81	4.5	0.69	1	3	0	4.5	2025-10-11 12:36:44	2025-10-11 12:36:44	\N	2025-10-11 12:36:44	2025-10-11 12:36:44	\N	3	0
51	3	7	1	1	220.34	260	39.66	1	3	0	260	2025-10-09 10:12:55	2025-10-09 10:12:55	\N	2025-10-09 10:12:55	2025-10-09 10:12:55	\N	3	0
56	5	3	1	1	83.05	98	14.95	1	3	0	98	2025-10-09 14:02:15	2025-10-09 14:02:15	\N	2025-10-09 14:02:15	2025-10-09 14:02:15	\N	3	0
46	4	1	2	1	2.97	3.5	0.53	1	3	0	3.5	2025-10-07 12:20:18	2025-10-07 12:20:18	\N	2025-10-07 12:20:18	2025-10-07 12:20:18	\N	3	0
82	5	13	1	1	1864.42	2200.02	335.58	1	3	0	2200.02	2025-10-16 09:02:18	2025-10-16 09:02:18	\N	2025-10-16 09:02:18	2025-10-16 09:02:18	\N	1	0
52	5	3	1	1	714.86	843.53	128.64	1	3	0	843.53	2025-10-09 10:58:06	2025-10-09 10:58:06	\N	2025-10-09 10:58:06	2025-10-09 10:58:06	\N	3	0
61	5	7	1	1	135.6	160.01	24.4	1	3	0	160.01	2025-10-11 10:12:34	2025-10-11 10:12:34	\N	2025-10-11 10:12:34	2025-10-11 10:12:34	\N	3	0
47	4	3	1	1	3.81	4.5	0.69	1	3	0	4.5	2025-10-07 13:05:49	2025-10-07 13:05:49	\N	2025-10-07 13:05:49	2025-10-07 13:05:49	\N	3	0
57	5	6	1	1	440.68	520	79.32	1	3	0	520	2025-10-09 14:49:50	2025-10-09 14:49:50	\N	2025-10-09 14:49:50	2025-10-09 14:49:50	\N	3	0
53	4	16	1	1	76.27	90	13.73	1	3	0	90	2025-10-09 11:45:39	2025-10-09 11:45:39	\N	2025-10-09 11:45:39	2025-10-09 11:45:39	\N	3	0
48	4	13	1	1	220.34	260	39.66	1	3	0	260	2025-10-08 09:15:27	2025-10-08 09:15:27	\N	2025-10-08 09:15:27	2025-10-08 09:15:27	\N	3	0
75	3	12	2	1	419.47	494.97	75.41	1	3	0	494.97	2025-10-15 09:17:29	2025-10-15 09:17:29	\N	2025-10-15 09:17:29	2025-10-15 09:17:29	\N	1	0
68	5	10	1	1	76.26	89.99	13.74	1	3	0	89.99	2025-10-13 11:01:22	2025-10-13 11:01:22	\N	2025-10-13 11:01:22	2025-10-13 11:01:22	\N	2	0
65	3	13	1	1	38.14	45.01	6.87	1	3	0	45.01	2025-10-13 08:45:12	2025-10-13 08:45:12	\N	2025-10-13 08:45:12	2025-10-13 08:45:12	\N	3	0
49	5	9	2	1	1444.89	1704.97	260.07	1	3	0	1704.97	2025-10-09 08:42:33	2025-10-09 08:42:33	\N	2025-10-09 08:42:33	2025-10-09 08:42:33	\N	1	0
62	3	3	1	1	3.81	4.5	0.69	1	3	0	4.5	2025-10-11 11:03:51	2025-10-11 11:03:51	\N	2025-10-11 11:03:51	2025-10-11 11:03:51	\N	3	0
54	3	7	1	1	15.25	18	2.75	1	3	0	18	2025-10-09 12:31:22	2025-10-09 12:31:22	\N	2025-10-09 12:31:22	2025-10-09 12:31:22	\N	3	0
58	4	15	2	1	228.81	270	41.19	1	3	0	270	2025-10-10 08:55:18	2025-10-10 08:55:18	\N	2025-10-10 08:55:18	2025-10-10 08:55:18	\N	3	0
50	4	8	2	1	915.24	1079.98	164.76	1	3	0	1079.98	2025-10-09 09:30:14	2025-10-09 09:30:14	\N	2025-10-09 09:30:14	2025-10-09 09:30:14	\N	1	0
73	5	12	2	1	881.34	1039.98	158.64	1	3	0	1039.98	2025-10-14 10:05:42	2025-10-14 10:05:42	\N	2025-10-14 10:05:42	2025-10-14 10:05:42	\N	1	0
59	4	2	1	1	949.16	1120	170.84	2	1	1120	0	\N	\N	\N	2025-10-11 08:38:45	2025-10-11 08:38:45	\N	1	0
71	3	17	1	1	1593.23	1880	286.77	1	2	1860	20	2025-10-14 08:32:50	\N	\N	2025-10-14 08:32:50	2025-10-14 08:32:50	\N	2	0
55	3	8	2	1	2237.25	2639.95	402.72	1	3	0	2639.95	2025-10-09 13:18:47	2025-10-09 13:18:47	\N	2025-10-09 13:18:47	2025-10-09 13:18:47	\N	2	0
63	3	2	1	1	949.16	1120	170.84	1	3	0	1120	2025-10-11 11:50:27	2025-10-11 11:50:27	\N	2025-10-11 11:50:27	2025-10-11 11:50:27	\N	1	0
66	3	2	1	1	237.29	280	42.71	1	3	0	280	2025-10-13 09:28:33	2025-10-13 09:28:33	\N	2025-10-13 09:28:33	2025-10-13 09:28:33	\N	1	0
60	5	2	1	1	15.25	18	2.75	1	3	0	18	2025-10-11 09:25:09	2025-10-11 09:25:09	\N	2025-10-11 09:25:09	2025-10-11 09:25:09	\N	3	0
69	4	15	2	1	440.67	519.99	79.32	1	3	0	519.99	2025-10-13 11:47:49	2025-10-13 11:47:49	\N	2025-10-13 11:47:49	2025-10-13 11:47:49	\N	1	0
78	3	8	2	1	669.48	789.98	120.51	1	3	0	789.98	2025-10-15 11:36:44	2025-10-15 11:36:44	\N	2025-10-15 11:36:44	2025-10-15 11:36:44	\N	1	0
74	3	12	2	1	4562.34	5383.54	821.24	1	3	0	5383.54	2025-10-15 08:31:08	2025-11-22 18:17:47	\N	2025-10-15 08:31:08	2025-11-22 18:17:47	\N	2	0
67	3	11	1	1	15.25	18	2.75	1	3	0	18	2025-10-13 10:14:07	2025-10-13 10:14:07	\N	2025-10-13 10:14:07	2025-10-13 10:14:07	\N	3	0
72	3	17	1	1	949.16	1120.01	170.84	1	3	0	1120.01	2025-10-14 09:20:15	2025-10-14 09:20:15	\N	2025-10-14 09:20:15	2025-10-14 09:20:15	\N	2	0
83	3	20	1	1	76.27	90	13.73	1	3	0	90	2025-10-16 09:28:47	2025-10-16 09:28:47	\N	2025-10-16 09:28:47	2025-10-16 09:28:47	\N	1	0
77	3	8	2	1	59.32	70	10.68	1	3	0	70	2025-10-15 10:50:12	2025-10-15 10:50:12	\N	2025-10-15 10:50:12	2025-10-15 10:50:12	\N	3	0
79	3	10	1	1	7.62	8.99	1.38	1	3	0	8.99	2025-10-15 12:23:30	2025-10-15 12:23:30	\N	2025-10-15 12:23:30	2025-10-15 12:23:30	\N	3	0
76	5	12	2	1	93.22	110	16.78	1	3	0	110	2025-10-15 10:05:51	2025-10-15 10:05:51	\N	2025-10-15 10:05:51	2025-10-15 10:05:51	\N	1	0
80	3	10	1	1	307.32	362.63	55.27	1	3	0	362.63	2025-10-15 13:05:11	2025-10-15 13:05:11	\N	2025-10-15 13:05:11	2025-10-15 13:05:11	\N	1	0
81	5	13	1	1	474.58	560	85.42	1	3	0	560	2025-10-16 08:33:05	2025-10-16 08:33:05	\N	2025-10-16 08:33:05	2025-10-16 08:33:05	\N	1	0
84	3	12	2	1	2660.97	3139.94	478.98	1	3	0	3139.94	2025-10-16 09:55:12	2025-10-16 09:55:12	\N	2025-10-16 09:55:12	2025-10-16 09:55:12	\N	1	0
85	5	12	2	1	686.43	809.99	123.57	1	3	0	809.99	2025-10-16 10:21:36	2025-10-16 10:21:36	\N	2025-10-16 10:21:36	2025-10-16 10:21:36	\N	2	0
87	3	12	2	1	457.62	539.99	82.38	1	3	0	539.99	2025-10-16 11:15:03	2025-10-16 11:15:03	\N	2025-10-16 11:15:03	2025-10-16 11:15:03	\N	1	0
86	3	12	2	1	211.86	249.99	38.13	1	3	0	249.99	2025-10-16 10:48:49	2025-10-16 10:48:49	\N	2025-10-16 10:48:49	2025-10-16 10:48:49	\N	1	0
113	5	18	1	1	15.25	18	2.75	1	3	0	18	2025-10-18 09:47:58	2025-10-18 09:47:58	\N	2025-10-18 09:47:58	2025-10-18 09:47:58	\N	1	0
111	3	12	2	1	285.06	336.37	51.27	1	3	0	336.37	2025-10-18 08:33:46	2025-10-18 08:33:46	\N	2025-10-18 08:33:46	2025-10-18 08:33:46	\N	1	0
103	4	12	2	1	118.64	140	21.36	1	3	0	140	2025-10-17 11:17:03	2025-10-17 11:17:03	\N	2025-10-17 11:17:03	2025-10-17 11:17:03	\N	1	0
88	3	12	2	1	211.86	249.99	38.13	1	3	0	249.99	2025-10-16 11:41:27	2025-10-16 11:41:27	\N	2025-10-16 11:41:27	2025-10-16 11:41:27	\N	1	0
94	5	9	2	1	59.32	70	10.68	1	3	0	70	2025-10-16 14:22:17	2025-10-16 14:22:17	\N	2025-10-16 14:22:17	2025-10-16 14:22:17	\N	3	0
99	5	3	1	1	3.81	4.5	0.69	1	3	0	4.5	2025-10-17 09:05:29	2025-10-17 09:05:29	\N	2025-10-17 09:05:29	2025-10-17 09:05:29	\N	3	0
108	5	19	1	1	76.27	90	13.73	2	1	90	0	\N	\N	\N	2025-10-17 13:10:52	2025-10-17 13:10:52	\N	1	0
89	4	12	2	1	283.89	334.99	51.1	1	3	0	334.99	2025-10-16 12:07:58	2025-10-16 12:07:58	\N	2025-10-16 12:07:58	2025-10-16 12:07:58	\N	1	0
95	5	15	2	1	2.97	3.5	0.53	1	3	0	3.5	2025-10-16 14:48:36	2025-10-16 14:48:36	\N	2025-10-16 14:48:36	2025-10-16 14:48:36	\N	3	0
90	4	2	1	1	15.25	18	2.75	1	3	0	18	2025-10-16 12:35:16	2025-10-16 12:35:16	\N	2025-10-16 12:35:16	2025-10-16 12:35:16	\N	3	0
104	5	6	1	1	3.81	4.5	0.69	1	3	0	4.5	2025-10-17 11:43:22	2025-10-17 11:43:22	\N	2025-10-17 11:43:22	2025-10-17 11:43:22	\N	3	0
100	4	8	2	1	21.19	25	3.81	1	3	0	25	2025-10-17 09:31:47	2025-10-17 09:31:47	\N	2025-10-17 09:31:47	2025-10-17 09:31:47	\N	1	0
96	3	3	1	1	127.1	149.98	22.9	1	3	0	149.98	2025-10-16 15:15:12	2025-10-16 15:15:12	\N	2025-10-16 15:15:12	2025-10-16 15:15:12	\N	1	0
91	3	19	1	1	3.81	4.5	0.69	1	3	0	4.5	2025-10-16 13:02:44	2025-10-16 13:02:44	\N	2025-10-16 13:02:44	2025-10-16 13:02:44	\N	3	0
109	4	20	1	1	67.8	80	12.2	1	2	75	5	2025-10-17 13:55:17	\N	\N	2025-10-17 13:55:17	2025-10-17 13:55:17	\N	1	0
92	5	8	2	1	13.56	16	2.44	1	3	0	16	2025-10-16 13:29:30	2025-10-16 13:29:30	\N	2025-10-16 13:29:30	2025-10-16 13:29:30	\N	1	0
101	5	3	1	1	15.25	18	2.75	1	3	0	18	2025-10-17 09:58:02	2025-10-17 09:58:02	\N	2025-10-17 09:58:02	2025-10-17 09:58:02	\N	1	0
97	3	18	1	1	220.34	260	39.66	1	3	0	260	2025-10-16 15:42:48	2025-10-16 15:42:48	\N	2025-10-16 15:42:48	2025-10-16 15:42:48	\N	1	0
93	5	7	1	1	220.34	260	39.66	1	2	250	10	2025-10-16 13:55:51	\N	\N	2025-10-16 13:55:51	2025-10-16 13:55:51	\N	1	0
105	5	19	1	1	440.68	520	79.32	2	1	520	0	\N	\N	\N	2025-10-17 12:09:48	2025-10-17 12:09:48	\N	1	0
112	3	8	2	1	211.86	249.99	38.13	1	3	0	249.99	2025-10-18 09:10:12	2025-10-18 09:10:12	\N	2025-10-18 09:10:12	2025-10-18 09:10:12	\N	1	0
98	4	6	1	1	239.67	282.8	43.09	1	3	0	282.8	2025-10-17 08:38:11	2025-10-17 08:38:11	\N	2025-10-17 08:38:11	2025-10-17 08:38:11	\N	3	0
102	4	3	1	1	7.62	8.99	1.38	1	3	0	8.99	2025-10-17 10:24:19	2025-10-17 10:24:19	\N	2025-10-17 10:24:19	2025-10-17 10:24:19	\N	3	0
106	5	19	1	1	305.02	359.93	54.87	2	1	359.93	0	\N	\N	\N	2025-10-17 12:36:11	2025-10-17 12:36:11	\N	1	0
110	4	18	1	1	220.34	260	39.66	1	3	0	260	2025-10-17 14:21:39	2025-10-17 14:21:39	\N	2025-10-17 14:21:39	2025-10-17 14:21:39	\N	1	0
107	5	19	1	1	358.17	422.64	64.42	2	1	422.64	0	\N	\N	\N	2025-10-17 13:02:34	2025-10-17 13:02:34	\N	1	0
129	4	8	2	1	13.56	16	2.44	1	3	0	16	2025-10-22 15:10:57	2025-10-22 15:10:57	\N	2025-10-22 15:10:57	2025-10-22 15:10:57	\N	1	0
117	5	18	1	1	7.62	8.99	1.38	1	3	0	8.99	2025-10-20 11:33:55	2025-10-20 11:33:55	\N	2025-10-20 11:33:55	2025-10-20 11:33:55	\N	1	0
120	3	22	1	1	3979.74	4696.1	715.98	1	2	2511.3	2184.8	2025-10-21 08:33:28	\N	\N	2025-10-21 08:33:28	2025-10-21 08:33:28	\N	2	0
114	4	13	1	1	237.22	279.93	42.67	1	3	0	279.93	2025-10-20 08:12:33	2025-10-20 08:12:33	\N	2025-10-20 08:12:33	2025-10-20 08:12:33	\N	3	0
125	3	22	1	1	949.16	1120.01	170.84	1	3	0	1120.01	2025-10-22 11:24:12	2025-10-22 11:24:12	\N	2025-10-22 11:24:12	2025-10-22 11:24:12	\N	1	0
128	4	19	1	1	457.63	540	82.37	1	3	0	540	2025-10-22 14:33:45	2025-10-22 14:33:45	\N	2025-10-22 14:33:45	2025-10-22 14:33:45	\N	1	0
118	4	21	1	1	238.78	281.76	42.95	1	3	0	281.76	2025-10-20 13:22:01	2025-10-20 13:22:01	\N	2025-10-20 13:22:01	2025-10-20 13:22:01	\N	3	0
115	4	12	2	1	858.93	1013.54	154.55	1	3	0	1013.54	2025-10-20 09:45:10	2025-10-20 09:45:10	\N	2025-10-20 09:45:10	2025-10-20 09:45:10	\N	3	0
123	5	13	1	1	493.18	581.95	88.42	1	3	0	581.95	2025-10-22 08:59:27	2025-10-22 08:59:27	\N	2025-10-22 08:59:27	2025-10-22 08:59:27	\N	2	0
121	3	8	2	1	635.58	749.98	114.39	1	2	699.98	50	2025-10-21 14:09:32	\N	\N	2025-10-21 14:09:32	2025-10-21 14:09:32	\N	1	0
119	4	9	2	1	2690.42	3174.7	484.13	1	2	2939.7	235	2025-10-20 14:49:37	\N	\N	2025-10-20 14:49:37	2025-10-20 14:49:37	\N	2	0
116	5	3	1	1	3.81	4.5	0.69	1	3	0	4.5	2025-10-20 10:58:42	2025-10-20 10:58:42	\N	2025-10-20 10:58:42	2025-10-20 10:58:42	\N	3	0
132	5	11	1	1	711.87	840.01	128.13	2	1	840.01	0	\N	\N	\N	2025-10-23 08:14:22	2025-10-23 08:14:22	\N	1	0
127	5	8	2	1	9.54	11.26	1.5	1	3	0	11.26	2025-10-22 13:42:01	2025-10-22 13:42:01	\N	2025-10-22 13:42:01	2025-10-22 13:42:01	\N	1	0
124	5	8	2	1	1158.28	1366.76	208.38	1	2	1356.76	10	2025-10-22 09:47:55	\N	\N	2025-10-22 09:47:55	2025-10-22 09:47:55	\N	1	0
122	5	6	1	1	220.34	260	39.66	1	3	0	260	2025-10-22 08:05:41	2025-10-22 08:05:41	\N	2025-10-22 08:05:41	2025-10-22 08:05:41	\N	1	0
126	5	13	1	1	101.7	120.01	18.32	1	3	0	120.01	2025-10-22 12:18:39	2025-10-22 12:18:39	\N	2025-10-22 12:18:39	2025-10-22 12:18:39	\N	1	0
134	5	24	1	1	694.92	820	125.08	2	1	820	0	\N	\N	\N	2025-10-23 10:36:44	2025-10-23 10:36:44	\N	1	0
131	4	3	1	1	7.62	8.99	1.38	1	3	0	8.99	2025-10-22 17:00:11	2025-10-22 17:00:11	\N	2025-10-22 17:00:11	2025-10-22 17:00:11	\N	1	0
130	4	15	2	1	881.34	1039.98	158.64	1	2	939.98	100	2025-10-22 16:54:28	\N	\N	2025-10-22 16:54:28	2025-10-22 16:54:28	\N	1	0
135	4	23	1	1	498.29	587.98	89.64	2	1	587.98	0	\N	\N	\N	2025-10-23 11:58:33	2025-10-23 11:58:33	\N	1	0
137	5	12	2	1	230.72	272.24	41.13	1	3	0	272.24	2025-10-23 14:48:01	2025-10-23 14:48:01	\N	2025-10-23 14:48:01	2025-10-23 14:48:01	\N	1	0
133	5	11	1	1	237.29	280	42.71	2	1	280	0	\N	\N	\N	2025-10-23 09:22:57	2025-10-23 09:22:57	\N	1	0
136	4	23	1	1	38.14	45.01	6.87	2	1	45.01	0	\N	\N	\N	2025-10-23 13:00:16	2025-10-23 13:00:16	\N	1	0
138	5	3	1	1	711.87	840	128.13	1	3	0	840	2025-10-23 15:39:42	2025-10-23 15:39:42	\N	2025-10-23 15:39:42	2025-10-23 15:39:42	\N	1	0
183	4	8	2	1	300.84	355	54.16	1	2	305	50	2025-11-04 10:05:47	\N	\N	2025-11-04 10:05:47	2025-11-04 10:05:47	\N	1	0
184	4	6	1	1	3506.42	4137.59	630.88	1	2	3137.59	1000	2025-11-04 10:55:39	\N	\N	2025-11-04 10:55:39	2025-11-04 10:55:39	\N	1	0
185	5	13	1	1	474.58	560	85.42	1	2	510	50	2025-11-04 11:22:03	\N	\N	2025-11-04 11:22:03	2025-11-04 11:22:03	\N	1	0
186	4	23	1	1	711.87	840.01	128.13	2	1	840.01	0	\N	\N	\N	2025-11-04 12:14:28	2025-11-04 12:14:28	\N	1	0
139	5	10	1	1	457.63	540	82.37	1	3	0	540	2025-10-23 16:27:59	2025-10-23 16:27:59	\N	2025-10-23 16:27:59	2025-10-23 16:27:59	\N	1	0
175	5	13	1	1	474.58	560	85.42	1	3	0	560	2025-11-03 13:22:18	2025-11-03 13:22:18	\N	2025-11-03 13:22:18	2025-11-03 13:22:18	\N	2	0
157	3	3	1	1	3546.38	4184.74	637.62	1	3	0	4184.74	2025-10-28 10:10:55	2025-10-28 10:10:55	\N	2025-10-28 10:10:55	2025-10-28 10:10:55	\N	1	0
140	4	11	1	1	491.52	579.99	88.48	1	2	546.99	33	2025-10-24 08:01:10	\N	\N	2025-10-24 08:01:10	2025-10-24 08:01:10	\N	1	0
166	5	3	1	1	277.95	327.98	49.98	1	3	0	327.98	2025-10-30 16:59:44	2025-10-30 16:59:44	\N	2025-10-30 16:59:44	2025-10-30 16:59:44	\N	1	0
155	3	9	2	1	2237.25	2639.95	402.72	1	2	2629.95	10	2025-10-27 09:39:30	\N	\N	2025-10-27 09:39:30	2025-10-27 09:39:30	\N	1	0
146	5	25	1	1	500	590	90	1	3	0	590	2025-10-24 16:59:54	2025-10-24 16:59:54	\N	2025-10-24 16:59:54	2025-10-24 16:59:54	\N	1	0
151	5	22	1	1	296.61	350	53.39	1	3	0	350	2025-10-25 12:33:50	2025-10-25 12:33:50	\N	2025-10-25 12:33:50	2025-10-25 12:33:50	\N	1	0
141	4	10	1	1	288.14	340	51.86	1	3	0	340	2025-10-24 09:48:26	2025-10-24 09:48:26	\N	2025-10-24 09:48:26	2025-10-24 09:48:26	\N	1	0
171	3	13	1	1	1423.74	1680.01	256.26	2	1	1680.01	0	\N	\N	\N	2025-11-03 08:45:10	2025-11-03 08:45:10	\N	1	0
147	3	17	1	1	516.96	610.01	93.06	1	3	0	610.01	2025-10-25 08:13:07	2025-10-25 08:13:07	\N	2025-10-25 08:13:07	2025-10-25 08:13:07	\N	1	0
142	4	6	1	1	3.81	4.5	0.69	1	3	0	4.5	2025-10-24 11:22:19	2025-10-24 11:22:19	\N	2025-10-24 11:22:19	2025-10-24 11:22:19	\N	1	0
161	5	12	2	1	1144.05	1349.98	205.95	1	3	0	1349.98	2025-10-30 09:54:42	2025-10-30 09:54:42	\N	2025-10-30 09:54:42	2025-10-30 09:54:42	\N	1	0
158	3	24	1	1	678	800.04	122	1	3	0	800.04	2025-10-28 14:02:57	2025-10-28 14:02:57	\N	2025-10-28 14:02:57	2025-10-28 14:02:57	\N	1	0
152	3	8	2	1	5	5.9	0.8	1	3	0	5.9	2025-10-25 14:55:01	2025-10-25 14:55:01	\N	2025-10-25 14:55:01	2025-10-25 14:55:01	\N	1	0
143	4	19	1	1	7.62	8.99	1.38	1	3	0	8.99	2025-10-24 12:40:58	2025-10-24 12:40:58	\N	2025-10-24 12:40:58	2025-10-24 12:40:58	\N	1	0
156	3	9	2	1	2169.45	2559.95	390.48	1	2	2554.95	5	2025-10-27 09:50:14	\N	\N	2025-10-27 09:50:14	2025-10-27 09:50:14	\N	1	0
148	3	3	1	1	7.2	8.5	1	1	3	0	8.5	2025-10-25 09:22:45	2025-10-25 09:22:45	\N	2025-10-25 09:22:45	2025-10-25 09:22:45	\N	1	0
144	4	8	2	1	59.32	70	10.68	1	3	0	70	2025-10-24 13:34:11	2025-10-24 13:34:11	\N	2025-10-24 13:34:11	2025-10-24 13:34:11	\N	1	0
164	4	17	1	1	474.58	560	85.42	1	3	0	560	2025-10-30 14:57:50	2025-10-30 14:57:50	\N	2025-10-30 14:57:50	2025-10-30 14:57:50	\N	3	0
153	5	18	1	1	25.42	30	4.58	1	3	0	30	2025-10-25 15:22:19	2025-10-25 15:22:19	\N	2025-10-25 15:22:19	2025-10-25 15:22:19	\N	1	0
149	3	13	1	1	114.42	135.02	20.61	1	3	0	135.02	2025-10-25 10:44:18	2025-10-25 10:44:18	\N	2025-10-25 10:44:18	2025-10-25 10:44:18	\N	1	0
145	5	12	2	1	2849.31	3362.18	512.5	1	3	0	3362.18	2025-10-24 14:46:03	2025-10-24 14:46:03	\N	2025-10-24 14:46:03	2025-10-24 14:46:03	\N	1	0
168	3	3	1	1	83.05	98	14.95	1	3	0	98	2025-10-31 10:40:22	2025-10-31 10:40:22	\N	2025-10-31 10:40:22	2025-10-31 10:40:22	\N	1	0
150	5	18	1	1	3.81	4.5	0.69	1	3	0	4.5	2025-10-25 11:57:03	2025-10-25 11:57:03	\N	2025-10-25 11:57:03	2025-10-25 11:57:03	\N	1	0
154	5	3	1	1	3567.88	4210.09	642.22	1	2	4200.09	10	2025-10-25 16:18:40	\N	\N	2025-10-25 16:18:40	2025-10-25 16:18:40	\N	1	0
170	5	23	1	1	949.16	1120.01	170.84	2	1	1120.01	0	\N	\N	\N	2025-11-03 08:12:34	2025-11-03 08:12:34	\N	1	0
162	4	21	1	1	67.8	80	12.2	1	3	0	80	2025-10-30 10:33:28	2025-10-30 10:33:28	\N	2025-10-30 10:33:28	2025-10-30 10:33:28	\N	1	0
167	3	12	2	1	3827.9	4516.92	688.46	1	3	0	4516.92	2025-10-31 08:12:55	2025-10-31 08:12:55	\N	2025-10-31 08:12:55	2025-10-31 08:12:55	\N	1	0
165	4	10	1	1	220.34	260	39.66	1	3	0	260	2025-10-30 15:26:31	2025-10-30 15:26:31	\N	2025-10-30 15:26:31	2025-10-30 15:26:31	\N	1	0
160	5	6	1	1	474.58	560	85.42	1	3	0	560	2025-10-30 08:05:11	2025-10-30 08:05:11	\N	2025-10-30 08:05:11	2025-10-30 08:05:11	\N	1	0
159	5	15	2	1	1830.48	2159.97	329.52	1	3	0	2159.97	2025-10-28 16:45:39	2025-10-28 16:45:39	\N	2025-10-28 16:45:39	2025-10-28 16:45:39	\N	1	0
163	4	26	1	1	152.54	180	27.48	1	3	0	180	2025-10-30 13:14:09	2025-10-30 13:14:09	\N	2025-10-30 13:14:09	2025-10-30 13:14:09	\N	1	0
173	3	23	1	1	1186.45	1400.01	213.55	2	1	1400.01	0	\N	\N	\N	2025-11-03 10:28:41	2025-11-03 10:28:41	\N	1	0
1	3	1	2	1	2344.35	809.99	123.57	2	1	809.99	0	\N	\N	\N	2025-10-01 12:50:40	2025-10-01 12:50:40	\N	1	0
169	3	8	2	1	40.68	48	7.32	1	3	0	48	2025-10-31 16:28:37	2025-10-31 16:28:37	\N	2025-10-31 16:28:37	2025-10-31 16:28:37	\N	1	0
176	3	8	2	1	228.81	270	41.19	1	3	0	270	2025-11-03 15:47:02	2025-11-03 15:47:02	\N	2025-11-03 15:47:02	2025-11-03 15:47:02	\N	1	0
177	3	7	1	1	621.59	733.47	111.8	1	2	683.47	50	2025-11-03 16:58:49	\N	\N	2025-11-03 16:58:49	2025-11-03 16:58:49	\N	1	0
172	3	23	1	1	1135.6	1340	204.4	2	1	1340	0	\N	\N	\N	2025-11-03 09:03:57	2025-11-03 09:03:57	\N	1	0
174	5	3	1	1	283.47	334.49	51.02	1	3	0	334.49	2025-11-03 11:14:55	2025-11-03 11:14:55	\N	2025-11-03 11:14:55	2025-11-03 11:14:55	\N	1	0
178	5	3	1	1	7.62	8.99	1.38	1	3	0	8.99	2025-11-04 08:05:12	2025-11-04 08:05:12	\N	2025-11-04 08:05:12	2025-11-04 08:05:12	\N	1	0
179	3	9	2	1	2396.99	2828.44	431.11	1	2	1828.44	1000	2025-11-04 08:21:44	\N	\N	2025-11-04 08:21:44	2025-11-04 08:21:44	\N	1	0
181	3	23	1	1	940.68	1110.01	169.32	2	1	1110.01	0	\N	\N	\N	2025-11-04 09:12:58	2025-11-04 09:12:58	\N	1	0
180	5	23	1	1	1449.16	1710.01	260.84	2	1	1710.01	0	\N	\N	\N	2025-11-04 08:49:33	2025-11-04 08:49:33	\N	1	0
182	5	8	2	1	2855.88	3369.94	514.05	2	1	3369.94	0	\N	\N	\N	2025-11-04 09:37:21	2025-11-04 09:37:21	\N	1	0
214	3	23	1	1	694.92	820	125.08	1	2	720	100	2025-11-10 09:45:16	\N	\N	2025-11-10 09:45:16	2025-11-10 09:45:16	\N	1	0
203	3	3	1	1	3.81	4.5	0.69	1	3	0	4.5	2025-11-07 11:33:45	2025-11-07 11:33:45	\N	2025-11-07 11:33:45	2025-11-07 11:33:45	\N	1	0
187	3	12	2	1	686.43	809.99	123.57	1	3	0	809.99	2025-11-04 12:39:51	2025-11-04 12:39:51	\N	2025-11-04 12:39:51	2025-11-04 12:39:51	\N	1	0
202	3	10	1	1	474.58	560	85.42	1	3	0	560	2025-11-07 10:58:21	2025-11-07 10:58:21	\N	2025-11-07 10:58:21	2025-11-07 10:58:21	\N	1	0
194	5	27	1	1	474.58	560	85.42	1	2	60	500	2025-11-05 10:18:33	\N	\N	2025-11-05 10:18:33	2025-11-05 10:18:33	\N	1	0
199	3	26	1	1	114.42	135.02	20.61	1	3	0	135.02	2025-11-06 11:45:12	2025-11-06 11:45:12	\N	2025-11-06 11:45:12	2025-11-06 11:45:12	\N	1	0
188	3	7	1	1	711.87	840.01	128.13	1	2	340.01	500	2025-11-04 13:37:19	\N	\N	2025-11-04 13:37:19	2025-11-04 13:37:19	\N	1	0
189	3	10	1	1	1135.6	1340	204.4	1	2	340	1000	2025-11-04 14:05:42	\N	\N	2025-11-04 14:05:42	2025-11-04 14:05:42	\N	1	0
195	3	12	2	1	4440.6	5239.91	799.32	1	3	0	5239.91	2025-11-05 11:42:09	2025-11-05 11:42:09	\N	2025-11-05 11:42:09	2025-11-05 11:42:09	\N	1	0
209	5	23	1	1	7.62	8.99	1.38	1	3	0	8.99	2025-11-08 12:14:42	2025-11-08 12:14:42	\N	2025-11-08 12:14:42	2025-11-08 12:14:42	\N	1	0
207	3	15	2	1	3135.54	3699.94	564.42	1	3	0	3699.94	2025-11-07 15:48:06	2025-11-07 15:48:06	\N	2025-11-07 15:48:06	2025-11-07 15:48:06	\N	1	0
190	5	9	2	1	883.61	1042.66	159	1	2	942.66	100	2025-11-04 14:32:58	\N	\N	2025-11-04 14:32:58	2025-11-04 14:32:58	\N	1	0
200	3	29	2	1	95.46	112.64	16.9	1	3	0	112.64	2025-11-06 13:07:59	2025-11-06 13:07:59	\N	2025-11-06 13:07:59	2025-11-06 13:07:59	\N	1	0
196	4	28	1	1	305.09	360	54.91	1	3	0	360	2025-11-06 08:25:14	2025-11-06 08:25:14	\N	2025-11-06 08:25:14	2025-11-06 08:25:14	\N	1	0
191	3	15	2	1	686.43	809.99	123.57	1	3	0	809.99	2025-11-04 15:01:23	2025-11-04 15:01:23	\N	2025-11-04 15:01:23	2025-11-04 15:01:23	\N	1	0
204	5	10	1	1	203.4	240.01	36.6	1	3	0	240.01	2025-11-07 12:21:18	2025-11-07 12:21:18	\N	2025-11-07 12:21:18	2025-11-07 12:21:18	\N	1	0
201	3	6	1	1	15.25	18	2.75	1	3	0	18	2025-11-06 16:12:34	2025-11-06 16:12:34	\N	2025-11-06 16:12:34	2025-11-06 16:12:34	\N	1	0
192	3	13	1	1	152.54	180	27.46	1	3	0	180	2025-11-05 08:12:27	2025-11-05 08:12:27	\N	2025-11-05 08:12:27	2025-11-05 08:12:27	\N	1	0
197	4	13	1	1	266.98	315.04	48.09	1	3	0	315.04	2025-11-06 09:57:48	2025-11-06 09:57:48	\N	2025-11-06 09:57:48	2025-11-06 09:57:48	\N	1	0
212	5	6	1	1	3.81	4.5	0.69	1	3	0	4.5	2025-11-08 16:22:50	2025-11-08 16:22:50	\N	2025-11-08 16:22:50	2025-11-08 16:22:50	\N	1	0
193	4	8	2	1	229.48	270.77	41.22	1	2	100.77	170	2025-11-05 09:03:51	\N	\N	2025-11-05 09:03:51	2025-11-05 09:03:51	\N	1	0
205	5	30	1	1	1567.8	1850	282.2	2	1	1850	0	\N	\N	\N	2025-11-07 13:46:09	2025-11-07 13:46:09	\N	1	0
217	3	9	2	1	2203.35	2599.95	396.6	1	2	599.95	2000	2025-11-10 16:21:33	\N	\N	2025-11-10 16:21:33	2025-11-10 16:21:33	\N	1	0
198	5	6	1	1	15.25	18	2.75	1	3	0	18	2025-11-06 10:23:47	2025-11-06 10:23:47	\N	2025-11-06 10:23:47	2025-11-06 10:23:47	\N	1	0
210	4	3	1	1	25.42	30	4.58	1	3	0	30	2025-11-08 13:33:19	2025-11-08 13:33:19	\N	2025-11-08 13:33:19	2025-11-08 13:33:19	\N	1	0
218	3	12	2	1	12834.33	15144.51	2309.07	1	3	0	15144.51	2025-11-23 02:50:57	2025-11-23 02:50:57	\N	2025-11-23 02:50:57	2025-11-23 02:50:57	\N	1	0
213	5	10	1	1	0.72	0.85	0.1	1	3	0	0.85	2025-11-10 08:17:42	2025-11-10 08:17:42	\N	2025-11-10 08:17:42	2025-11-10 08:17:42	\N	1	0
206	5	13	1	1	1898.32	2240.02	341.68	1	3	0	2240.02	2025-11-07 15:12:38	2025-11-07 15:12:38	\N	2025-11-07 15:12:38	2025-11-07 15:12:38	\N	1	0
211	3	19	1	1	2728.83	3220.02	491.17	1	3	0	3220.02	2025-11-08 14:50:07	2025-11-08 14:50:07	\N	2025-11-08 14:50:07	2025-11-08 14:50:07	\N	1	0
208	5	19	1	1	1813.57	2140.02	326.43	1	3	0	2140.02	2025-11-03 10:28:41	2025-11-03 10:28:41	\N	2025-11-03 10:28:41	2025-11-03 10:28:41	\N	1	0
216	4	31	1	1	474.58	560	85.42	2	1	560	0	\N	\N	\N	2025-11-10 13:08:59	2025-11-10 13:08:59	\N	1	0
215	5	17	1	1	271.18	319.99	48.82	1	2	19.99	300	2025-11-10 11:32:05	\N	\N	2025-11-10 11:32:05	2025-11-10 11:32:05	\N	1	0
219	5	31	1	1	440.68	520	79.32	2	1	520	0	\N	\N	\N	2025-11-11 14:44:27	2025-11-23 02:51:52	\N	1	0
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.sessions (id, user_id, ip_address, user_agent, payload, last_activity) FROM stdin;
Qbi5LVOMd0vCD0gPE5mL0lmpv1NdQ2WSwJNUKsQ7	\N	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiTXdVam41OWFmTHdwVlY5QWVqckxZNGFhNVhHeEgyV2J6bGdjUVB6VCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1737455097
y2KGBmVTzXtqs3JKj8WGI9twDT6pxB6R9lOQH8Sg	\N	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiQjRZMnZjWDJEVFRNRG1Zcm1vMUZOVVpFYmM4N1lHeHpIeTdENVNzNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1758494254
FfmDV9MTAk1kAUC9MMfuddXJUQMxZT1xSZbzBuG8	\N	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiNHViZmZwbUtCZ3EwQzV1bXRUOFN6NjlTWlVMdlU2OThqcXBZeTB6NyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1762990875
nf7tBNYAlnnLYdNfrE0VH3aeEsVTcV93TaTfiAZh	\N	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiMGE1RTZ1emNIOUdXQUNyTUwwRDhNNlV0UmR4YkE4R2FrNzVySVRxYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTEwOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvL3N0b3JhZ2UvY2F0ZWdvcmllcy8xNzYyOTkzOTk5X2VuY2hhcGFkby1kZS1jYW50b3MtMzAweDIyNS1jLWRlZmF1bHQuanBnP3Q9MTc2Mjk5NDgxMzY0NyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1762994813
zzAghcj5aUuozm6jV3b7GtEjnN8EbqmV6XOqfN9v	\N	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiZDhnZDNhQno2UW5QZmQ5TjdYWmJ2alYzNHVlODBXRWN0VFFNdTkxZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1762998925
LgPsQn4OxpDrfK8lhDIOxWZLWIncjI5ZANR7neuv	\N	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiU3JFN1NwQThoWWdib2tRQ3VQNlYwZlgyS25RcnB1eXE0MVBHWkNSSSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1762999233
k41ZNfZOb7DANeOO7eyLljQJWmnMyhwsqcSl4MWX	\N	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiRnhUc1VVMXRtMHZ2aVFkSDh0ZkgxNjd4UVJMVXh0c0M0NmJxYllVWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1763065511
0FqEegkGs3ECcFzTwO3pKCA7RLIZa8yYktUfZd9d	\N	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ25BZldKTFBWMm1nNUxFWTRUNjBiVjV0cHdDeWRYYW5qUTFRTUNTcSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1763065514
\.


--
-- Data for Name: sucursales; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.sucursales (id, name, state, created_at, updated_at, deleted_at, address) FROM stdin;
1	Lima, Villa Maria del Triunfo	1	2025-01-07 03:51:57	2025-09-23 21:06:52	\N	Jr. Francisco de Zela Mza. N Lote. 12
\.


--
-- Data for Name: transport_details; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.transport_details (id, transport_id, product_id, unit_id, quantity, price_unit, total, state, user_entrega, date_entrega, user_salida, date_salida, description, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: transports; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.transports (id, warehouse_start_id, warehouse_end_id, date_emision, user_id, state, total, importe, igv, description, date_entrega, created_at, updated_at, deleted_at, date_salida) FROM stdin;
\.


--
-- Data for Name: unit_conversions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.unit_conversions (id, unit_id, unit_to_id, created_at, updated_at) FROM stdin;
2	2	1	2025-09-30 10:18:11	2025-09-30 10:18:11
3	1	3	2025-09-30 10:18:34	2025-09-30 10:18:34
4	3	1	2025-09-30 10:18:58	2025-09-30 10:18:58
5	1	4	2025-09-30 10:19:12	2025-09-30 10:19:12
6	4	1	2025-09-30 10:19:28	2025-09-30 10:19:28
7	1	5	2025-09-30 10:19:40	2025-09-30 10:19:40
8	5	1	2025-09-30 10:20:11	2025-09-30 10:20:11
1	1	2	2025-09-30 10:20:27	2025-09-30 10:20:27
\.


--
-- Data for Name: units; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.units (id, name, description, state, created_at, updated_at, deleted_at) FROM stdin;
1	Unidad	Producto individual	1	2025-09-30 10:10:21	2025-09-30 10:10:21	\N
2	Plancha	Plancha completa de melamina	1	2025-09-30 10:11:35	2025-09-30 10:11:35	\N
3	Metro lineal	Medida en metros lineales	1	2025-09-30 10:15:11	2025-09-30 10:15:11	\N
4	Metro cuadrado	Medida en metros cuadrados	1	2025-09-30 10:15:29	2025-09-30 10:15:29	\N
5	Juego	Conjunto de piezas	1	2025-09-30 10:15:50	2025-09-30 10:15:50	\N
6	Caja	Caja (100 unidades)	1	2025-11-20 14:40:17	2025-11-20 14:40:17	\N
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at, role_id, surname, avatar, sucursale_id, phone, type_document, n_document, deleted_at, state, gender) FROM stdin;
1	Super-Admin User	melacenter@gmail.com	\N	$2y$10$epErCF8Ge/pC/mz2cOuhcOyAO/jReQez3C/tpWlprQfIoqFYc8tC.	PeHLJ8uezu	2025-09-30 08:11:11	2025-09-30 08:11:11	1	\N	users/dDdyY9aWz35UxNarMlo0lBZ9gMDiICmQ52jtfgiX.png	1	\N	\N	\N	\N	1	M
2	Stephany L	shuertash@melacenter.com	\N	$2y$12$nCFz0gpDSX4/v8uANFANjue3YWxHleaUMVfCamMaUJikBwPOpKyj6	\N	2025-09-30 08:11:11	2025-11-19 03:20:20	1	Huertas	users/4qVBP5pDzoz23B6SsBtVljoTpcHyMLnvhCKXXPz4.jpg	1	989164070	DNI	76512429	\N	1	F
3	Ashley	ashley@melacenter.com	\N	$2y$12$HfitnLnznx.YyjusrB1JMuHcb5HfBvaZw9KAV5y1aR79U.DQ8IQK.	\N	2025-09-30 08:11:11	2025-11-19 03:22:47	9	Galarza I	users/03pHfExIL04hfYxoaaYsMAfwvJhyZSQqB1RfuL6C.jpg	1	956256957	DNI	73977139	\N	1	F
4	Laura	laura@melacenter.com	\N	$2y$12$lTSS/XDWahOMAys2NykGcuN63gDXMT2jNSgqt3ADN1o/pws.IM9W.	\N	2025-09-30 08:11:11	2025-11-19 04:09:24	9	Gutiérrez	users/p1u6DVEH1UgG5tvgtj3nDonDMoxMHRuwXLURMQZI.jpg	1	987654323	DNI	87654323	\N	1	F
5	Maria	maria@melacenter.com	\N	$2y$12$Rw6Na70PZ5nizN3Hj4saBeDsnTKKn8l0mAAx7PTeeYJ.DE00ScsX2	\N	2025-09-30 08:11:11	2025-11-19 04:14:09	9	Fernández	users/6Vv78hZGVO2ikPRcAhu8pE2O46GqsqljqbiX4UEV.jpg	1	987654322	DNI	87654322	\N	1	F
\.


--
-- Data for Name: warehouses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.warehouses (id, name, address, sucursale_id, state, created_at, updated_at, deleted_at) FROM stdin;
1	Almacén Principal	Tablada de Lurin (Pque Ind.Tablada Alt Cda 46 y 47 Pachacu)	1	1	2025-09-23 21:09:08	2025-09-23 21:09:08	\N
\.


--
-- Name: clients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.clients_id_seq', 31, true);


--
-- Name: conversions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.conversions_id_seq', 1004, true);


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.jobs_id_seq', 1, false);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.migrations_id_seq', 5, true);


--
-- Name: permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.permissions_id_seq', 36, true);


--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 1, false);


--
-- Name: product_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.product_categories_id_seq', 7, true);


--
-- Name: product_stock_initials_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.product_stock_initials_id_seq', 1, false);


--
-- Name: product_wallets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.product_wallets_id_seq', 1, false);


--
-- Name: product_warehouses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.product_warehouses_id_seq', 15, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.products_id_seq', 12, true);


--
-- Name: providers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.providers_id_seq', 2, true);


--
-- Name: purchase_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.purchase_details_id_seq', 15, true);


--
-- Name: purchases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.purchases_id_seq', 2, true);


--
-- Name: refound_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.refound_products_id_seq', 1, false);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.roles_id_seq', 9, true);


--
-- Name: sale_detail_attentions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sale_detail_attentions_id_seq', 164, true);


--
-- Name: sale_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sale_details_id_seq', 481, true);


--
-- Name: sale_payments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sale_payments_id_seq', 187, true);


--
-- Name: sales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sales_id_seq', 219, true);


--
-- Name: sucursales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sucursales_id_seq', 3, true);


--
-- Name: transport_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.transport_details_id_seq', 1, false);


--
-- Name: transports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.transports_id_seq', 1, false);


--
-- Name: unit_conversions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.unit_conversions_id_seq', 12, true);


--
-- Name: units_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.units_id_seq', 6, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 5, true);


--
-- Name: warehouses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.warehouses_id_seq', 4, true);


--
-- Name: cache_locks cache_locks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cache_locks
    ADD CONSTRAINT cache_locks_pkey PRIMARY KEY (key);


--
-- Name: cache cache_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cache
    ADD CONSTRAINT cache_pkey PRIMARY KEY (key);


--
-- Name: clients clients_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (id);


--
-- Name: conversions conversions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.conversions
    ADD CONSTRAINT conversions_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- Name: job_batches job_batches_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.job_batches
    ADD CONSTRAINT job_batches_pkey PRIMARY KEY (id);


--
-- Name: jobs jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: model_has_permissions model_has_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.model_has_permissions
    ADD CONSTRAINT model_has_permissions_pkey PRIMARY KEY (permission_id, model_id, model_type);


--
-- Name: model_has_roles model_has_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.model_has_roles
    ADD CONSTRAINT model_has_roles_pkey PRIMARY KEY (role_id, model_id, model_type);


--
-- Name: password_reset_tokens password_reset_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (email);


--
-- Name: permissions permissions_name_guard_name_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_guard_name_unique UNIQUE (name, guard_name);


--
-- Name: permissions permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);


--
-- Name: personal_access_tokens personal_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_pkey PRIMARY KEY (id);


--
-- Name: personal_access_tokens personal_access_tokens_token_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_token_unique UNIQUE (token);


--
-- Name: product_categories product_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_categories
    ADD CONSTRAINT product_categories_pkey PRIMARY KEY (id);


--
-- Name: product_stock_initials product_stock_initials_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_stock_initials
    ADD CONSTRAINT product_stock_initials_pkey PRIMARY KEY (id);


--
-- Name: product_wallets product_wallets_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_wallets
    ADD CONSTRAINT product_wallets_pkey PRIMARY KEY (id);


--
-- Name: product_warehouses product_warehouses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_warehouses
    ADD CONSTRAINT product_warehouses_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: providers providers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.providers
    ADD CONSTRAINT providers_pkey PRIMARY KEY (id);


--
-- Name: purchase_details purchase_details_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchase_details
    ADD CONSTRAINT purchase_details_pkey PRIMARY KEY (id);


--
-- Name: purchases purchases_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchases
    ADD CONSTRAINT purchases_pkey PRIMARY KEY (id);


--
-- Name: refound_products refound_products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.refound_products
    ADD CONSTRAINT refound_products_pkey PRIMARY KEY (id);


--
-- Name: role_has_permissions role_has_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.role_has_permissions
    ADD CONSTRAINT role_has_permissions_pkey PRIMARY KEY (permission_id, role_id);


--
-- Name: roles roles_name_guard_name_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_guard_name_unique UNIQUE (name, guard_name);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: sale_detail_attentions sale_detail_attentions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sale_detail_attentions
    ADD CONSTRAINT sale_detail_attentions_pkey PRIMARY KEY (id);


--
-- Name: sale_details sale_details_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sale_details
    ADD CONSTRAINT sale_details_pkey PRIMARY KEY (id);


--
-- Name: sale_payments sale_payments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sale_payments
    ADD CONSTRAINT sale_payments_pkey PRIMARY KEY (id);


--
-- Name: sales sales_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sales
    ADD CONSTRAINT sales_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: sucursales sucursales_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sucursales
    ADD CONSTRAINT sucursales_pkey PRIMARY KEY (id);


--
-- Name: transport_details transport_details_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transport_details
    ADD CONSTRAINT transport_details_pkey PRIMARY KEY (id);


--
-- Name: transports transports_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transports
    ADD CONSTRAINT transports_pkey PRIMARY KEY (id);


--
-- Name: unit_conversions unit_conversions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.unit_conversions
    ADD CONSTRAINT unit_conversions_pkey PRIMARY KEY (id);


--
-- Name: units units_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.units
    ADD CONSTRAINT units_pkey PRIMARY KEY (id);


--
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: warehouses warehouses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.warehouses
    ADD CONSTRAINT warehouses_pkey PRIMARY KEY (id);


--
-- Name: jobs_queue_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX jobs_queue_index ON public.jobs USING btree (queue);


--
-- Name: model_has_permissions_model_id_model_type_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX model_has_permissions_model_id_model_type_index ON public.model_has_permissions USING btree (model_id, model_type);


--
-- Name: model_has_roles_model_id_model_type_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX model_has_roles_model_id_model_type_index ON public.model_has_roles USING btree (model_id, model_type);


--
-- Name: personal_access_tokens_tokenable_type_tokenable_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON public.personal_access_tokens USING btree (tokenable_type, tokenable_id);


--
-- Name: sessions_last_activity_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sessions_last_activity_index ON public.sessions USING btree (last_activity);


--
-- Name: sessions_user_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sessions_user_id_index ON public.sessions USING btree (user_id);


--
-- Name: model_has_permissions model_has_permissions_permission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.model_has_permissions
    ADD CONSTRAINT model_has_permissions_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES public.permissions(id) ON DELETE CASCADE;


--
-- Name: model_has_roles model_has_roles_role_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.model_has_roles
    ADD CONSTRAINT model_has_roles_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;


--
-- Name: role_has_permissions role_has_permissions_permission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.role_has_permissions
    ADD CONSTRAINT role_has_permissions_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES public.permissions(id) ON DELETE CASCADE;


--
-- Name: role_has_permissions role_has_permissions_role_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.role_has_permissions
    ADD CONSTRAINT role_has_permissions_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict M164iZVRJ21E029JuJZUWXAbMeSyPcAwDM2Ld1FQbnC1eZwdc7aW9O5T7HhLa8T

