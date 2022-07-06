SELECT
    o.titulo as "Título da obra",
    ed.nome as "Título da editora",
    a.nome as "Nome do autor",
    e.numero_exemplar as "Num. exemplar",
    f.nome_fantasia as "Nome da filial"
FROM
    usuario u
    JOIN emprestimo e ON u.id_usuario = e.id_usuario
    JOIN filial f ON e.id_filial = f.id_filial
    JOIN obra o ON e.id_obra = o.id_obra
    JOIN obra_autor oa ON o.id_obra = oa.id_obra
    JOIN autor a ON oa.id_autor = a.id_autor
    JOIN editora ed ON o.id_editora = ed.id_editora
    LEFT JOIN devolucao d ON e.id_emprestimo = d.id_emprestimo
WHERE d.data_devolucao IS NOT NULL
OR e.data_prevista_retorno < (DATE(CURRENT_TIMESTAMP) - 365);