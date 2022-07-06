START TRANSACTION;

/* Atendentes têm matricula e não cpf, por isso esse campo não pode mais ser NOT NULL */
ALTER TABLE public.usuario
ALTER COLUMN cpf DROP NOT NULL;


/* Adiciona campos novos */
ALTER TABLE public.usuario
ADD COLUMN tipo_usuario INTEGER,
ADD COLUMN matricula CHARACTER VARYING(20);


/* Atribui o perfil cliente (2) a todos os usuários atuais */
UPDATE public.usuario
SET tipo_usuario = 2;


/* Migra atendentes para usuários, com tipo bibliotecário (1) */
INSERT INTO public.usuario (nome, matricula, tipo_usuario)
SELECT nome, matricula, 1 FROM public.atendente;


/* Toda inserção na tabela usuario, daqui em diante, precisa informar o tipo de usuário */
ALTER TABLE ONLY public.usuario
ALTER COLUMN tipo_usuario SET NOT NULL;


/* Migra referências à tabela atendente para usuário na tabela empréstimo */
ALTER TABLE public.emprestimo
DROP CONSTRAINT emprestimo_pa_atendente_fkey;

UPDATE public.emprestimo e
SET id_atendente = (
    SELECT u.id_usuario
    FROM public.usuario u, public.atendente a
    WHERE u.matricula = a.matricula
    AND a.id_atendente = e.id_atendente
)
FROM public.atendente a
WHERE e.id_atendente = a.id_atendente;

ALTER TABLE public.emprestimo
ADD CONSTRAINT emprestimo_pa_atendente_fkey
FOREIGN KEY (id_atendente) REFERENCES public.usuario (id_usuario)
DEFERRABLE INITIALLY DEFERRED;


/* Migra referências à tabela atendente para usuário na tabela devolução */
ALTER TABLE public.devolucao
DROP CONSTRAINT devoulacoao_pa_atendente_fkey;

UPDATE public.devolucao d
SET id_atendente = (
    SELECT u.id_usuario
    FROM public.usuario u, public.atendente a
    WHERE u.matricula = a.matricula
    AND a.id_atendente = d.id_atendente
)
FROM public.atendente a
WHERE d.id_atendente = a.id_atendente;

ALTER TABLE public.devolucao
ADD CONSTRAINT devolucao_pa_atendente_fkey
FOREIGN KEY (id_atendente) REFERENCES public.usuario (id_usuario)
DEFERRABLE INITIALLY DEFERRED;


/* Deleta tabela atendente */
DROP TABLE public.atendente;

COMMIT;