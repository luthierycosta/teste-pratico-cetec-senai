SELECT
    o.titulo as "Título da obra",
    a.nome as "Nome do autor",
    e.numero_exemplar as "Num. exemplar",
    u.nome as "Nome do usuário",
    u.email as "E-mail",
    u.telefone as "Telefone",
    e.data_prevista_retorno as "Data prevista de devolução",
    f.nome_fantasia as "Nome da filial",
    CURRENT_DATE - e.data_prevista_retorno as "Dias de atraso"
FROM
    usuario u
    JOIN emprestimo e ON u.id_usuario = e.id_usuario
    JOIN filial f ON e.id_filial = f.id_filial
    JOIN obra o ON e.id_obra = o.id_obra
    JOIN obra_autor oa ON o.id_obra = oa.id_obra
    JOIN autor a ON oa.id_autor = a.id_autor
    LEFT JOIN devolucao d ON e.id_emprestimo = d.id_emprestimo
WHERE d.data_devolucao IS NULL
AND data_prevista_retorno < CURRENT_TIMESTAMP;