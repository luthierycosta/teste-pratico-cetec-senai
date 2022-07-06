SELECT
    o.titulo as "Título da obra",
    COUNT(e.id_emprestimo) as "Qtd. de empréstimos",
    MAX(e.data_emprestimo) as "Última data de empréstimo",
    MAX(CURRENT_DATE - e.data_prevista_retorno) as "Máximo atraso"
FROM
    emprestimo e
    JOIN obra o ON e.id_obra = o.id_obra
    LEFT JOIN devolucao d ON e.id_emprestimo = d.id_emprestimo
GROUP BY o.titulo
ORDER BY 2 DESC
FETCH FIRST 10 ROWS ONLY;