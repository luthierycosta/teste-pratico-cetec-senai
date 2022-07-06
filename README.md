# Prova Analista de BD - Júnior

Você é analista de banco de dados em uma instituição de ensino. Sendo assim, suas habilidades e conhecimentos são requisitados constantemente pela área de gestão, pelos analistas de sistema e pela equipe de desenvolvimento.
Com base no Modelo de Entidades e Relacionamentos (MER) e orientações encaminhadas por e-mail, você irá atender algumas solicitações demandadas por essas áreas no contexto do sistema de gestão de bibliotecas.

Os scripts criados para as resoluções devem ser commitados nesse repositório, constando o número da questão no nome do arquivo. Ex.: 1.sql

**Utilize as melhores práticas possíveis para execução da prova**.

## Modelo ER

O XML referente ao modelo ER pode ser importado no endereço:
https://ondras.zarovi.cz/sql/demo/?keyword=default

Basta colar o conteúdo do arquivo em "Save / Load" e clicar em "Load XML".

## Docker

Para a iniciação do banco de dados, o *Docker* deve estar instalado no computador.
Verificar as instruções de instalação no próprio site do *Docker* em https://docs.docker.com/get-docker/

Na pasta raiz desse projeto, onde encontra-se o arquivo *docker-compose.yaml*, o banco de dados deve ser iniciado via docker, utilizando o cmd/terminal, com o comando:

`docker-compose up -d`

Verificar possíveis conflitos de porta, caso já haja alguma instancia usando a porta 5432 ou 16543 do *localhost*.

Para parar o servidor, utilizar o comando:

`docker-compose down`

## Dados de conexão

A imagem docker contem à seguinte configuração:

- **host**: db
- **port**: 5432
- **database**: prova
- **user**: postgres
- **pass**: postgres

### pgAdmin 4:
http://localhost:16543/

- **E-mail**: pgadmin@pgadmin.com.br
- **pass**: pgadmin

`Atenção`

Caso você prefira, poderá criar o banco de dados (Postgres 10) manualmente e utilizar o cliente para acesso ao banco de sua preferência (com a seguinte url de conexão jdbc:postgresql://localhost:5432/prova).
O arquivo para criação consta no diretório bd/biblioteca.sql
