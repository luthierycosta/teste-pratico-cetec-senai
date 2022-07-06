CREATE PROCEDURE GERA_RELATORIOS_EMPRESTIMO(p_caminho varchar) AS $$
DECLARE
    v_nome_arquivo VARCHAR(300);
    cur RECORD;

BEGIN

    FOR cur IN
    (SELECT id_usuario as userid, nome as username FROM usuario)
    LOOP
        v_nome_arquivo := p_caminho || cur.username || '.csv';

        COPY (
            SELECT
                e.id_emprestimo,
                f.nome_fantasia,
                o.titulo,
                a.nome,
                e.data_emprestimo
            FROM
                usuario u
                JOIN emprestimo e ON u.id_usuario = e.id_usuario
                JOIN filial f ON e.id_filial = f.id_filial
                JOIN obra o ON e.id_obra = o.id_obra
                JOIN obra_autor oa ON o.id_obra = oa.id_obra
                JOIN autor a ON oa.id_autor = a.id_autor
            WHERE
                u.id_usuario = cur.userid
        ) TO v_nome_arquivo (FORMAT CSV, HEADER);
    END LOOP;

END;
$$ LANGUAGE plpgsql;

GERA_RELATORIOS_EMPRESTIMO('/home/relatorios/');