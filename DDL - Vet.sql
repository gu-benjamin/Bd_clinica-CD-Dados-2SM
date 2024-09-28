CREATE DATABASE db_clinica;
USE db_clinica;

CREATE TABLE veterinarios(
id_veterinario INT(10) NOT NULL AUTO_INCREMENT,
nome VARCHAR(255) NOT NULL,
especialidade VARCHAR(100) NOT NULL,
telefone VARCHAR(11) NOT NULL,
PRIMARY KEY(id_veterinario)
);

CREATE TABLE clientes(
id_cliente INT(10) NOT NULL AUTO_INCREMENT,
nome VARCHAR(255) NOT NULL,
endereco VARCHAR(255) NOT NULL,
telefone VARCHAR(13) NOT NULL,
PRIMARY KEY(id_cliente)
);

CREATE TABLE pets(
id_pet INT(10) NOT NULL AUTO_INCREMENT,
nome VARCHAR(255) NOT NULL,
tipo VARCHAR(255) NOT NULL,
raca VARCHAR(255) NOT NULL,
data_nascimento DATE,
id_cliente INT(10) NOT NULL,
PRIMARY KEY(id_pet),
FOREIGN KEY(id_cliente) REFERENCES clientes(id_cliente)
);

CREATE TABLE atendimentos(
id_atendimento INT(10) NOT NULL AUTO_INCREMENT,
id_pet INT(10) NOT NULL,
id_veterinario INT(10) NOT NULL,
data_atendimento DATE NOT NULL,
descricao VARCHAR(255) NOT NULL,
PRIMARY KEY(id_atendimento),
FOREIGN KEY(id_pet) REFERENCES pets(id_pet),
FOREIGN KEY(id_veterinario) REFERENCES veterinarios(id_veterinario)
);

SELECT * FROM veterinarios;
SELECT * FROM clientes;
SELECT * FROM pets;
SELECT * FROM atendimentos;

ALTER TABLE clientes DROP COLUMN telefone;
ALTER TABLE clientes ADD COLUMN telefone VARCHAR(17) NOT NULL;