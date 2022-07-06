COPY usuario(nome,cpf,data_nascimento,genero,email,telefone)
FROM '/home/prova/usuarios.csv' DELIMITER ';' CSV HEADER;