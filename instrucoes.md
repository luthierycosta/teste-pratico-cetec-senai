## instruções

Cada questão está em seu arquivo sql próprio. Para copiar os arquivos ao container docker:

`docker cp prova ist-db:home/`

Para executar cada questão:
`docker exec -it ist-db psql -U postgres -d prova -a -f /home/prova/NOME_DA_QUESTAO.sql`


## obs: alterações no CSV:

Primeiro, foi necessário fazer algumas alterações no arquivo .csv, pois alguns erros estavam impedindo todos os registros de serem importados:

- alteração do formato do campo data_nascimento para 'YYYY-MM-DD' ao invés de 'DD/MM/YYYY'
- remoção do acento de todos os nomes em que apareciam
- atribuição de algum CPF nos registros 'Maria José' e 'José Paulo', pois o campo é CPF é not-null.