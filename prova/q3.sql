START TRANSACTION;

/* Cria tabela matrícula e sua sequência de PK */
CREATE TABLE public.matricula (
    id_matricula INTEGER NOT NULL,
    id_usuario INTEGER NOT NULL,
    matricula CHARACTER VARYING(20)
);

ALTER TABLE public.matricula OWNER TO postgres;

CREATE SEQUENCE public.matricula_id_matricula_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.matricula_id_matricula_seq OWNER TO postgres;

ALTER SEQUENCE public.matricula_id_matricula_seq OWNED BY public.matricula.id_matricula;

ALTER TABLE ONLY public.matricula
ALTER COLUMN id_matricula
SET DEFAULT nextval('public.matricula_id_matricula_seq'::regclass);


/* Cria constraints de PK e FK */
ALTER TABLE ONLY public.matricula
ADD CONSTRAINT matricula_pkey
PRIMARY KEY (id_matricula);

ALTER TABLE ONLY public.matricula
ADD CONSTRAINT matricula_id_usuario_fkey
FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario)
DEFERRABLE INITIALLY DEFERRED;


/* Migra matrículas da tabela usuario */
INSERT INTO public.matricula (id_usuario, matricula)
SELECT id_usuario, COALESCE(matricula, id_usuario::varchar) FROM public.usuario;


/* Deleta coluna matrícula de usuario */
ALTER TABLE public.usuario
DROP COLUMN matricula;


COMMIT;