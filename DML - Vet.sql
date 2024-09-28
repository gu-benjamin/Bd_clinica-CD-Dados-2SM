USE db_clinica;

SELECT * FROM veterinarios;
SELECT * FROM clientes;
SELECT * FROM pets;
SELECT * FROM atendimentos;

INSERT INTO veterinarios VALUES(
'1',
'João Silva',
'Cirurgia',
'(11) 98765-4321'
);

INSERT INTO veterinarios VALUES(
'2',
'Maria Oliveira',
'Dermatologia',
'(21) 91234-5678'
);

INSERT INTO veterinarios VALUES(
'3',
'Pedro Santos',
'Cardiologia',
'(31) 99876-5432'
);

INSERT INTO clientes VALUES(
'1',
'Gustavo',
'Av. Paulista, 1000',
'(11) 98765-4322'
);

INSERT INTO clientes VALUES(
'2',
'Neyma',
'Vila Belmiro, 1912',
'(13) 92011-6263'
);

INSERT INTO clientes VALUES(
'3',
'Carlos Lima',
'Rua do Sol, 456',
'(31) 99876-5433'
);

INSERT INTO pets VALUES(
'1',
'Logan',
'Cachorro',
'Husky Siberiano',
'2016-06-25',
'1'
);

INSERT INTO pets VALUES(
'2',
'Paçoca',
'Cachorro',
'Shih Tzu',
'2019-07-26',
'1'
);

INSERT INTO pets VALUES(
'3',
'Luna',
'Gato',
'Siamês',
'2019-11-15',
'2'
);

INSERT INTO pets VALUES(
'4',
'Thor',
'Cachorro',
'Golden Retriever',
'2020-10-01',
'3'
);

INSERT INTO atendimentos VALUES(
'1',
'1',
'1',
'2024-09-01',
'Consulta de check-up'
);

INSERT INTO atendimentos VALUES(
'2',
'2',
'2',
'2024-08-15',
'Tratamento dermatológico'
);

INSERT INTO atendimentos VALUES(
'3',
'3',
'3',
'2024-09-10',
'Exame de rotina cardiológico'
);

-- DELETE FROM veterinarios WHERE id_veterinario = 3;
-- DELETE FROM atendimentos WHERE id_atendimento = 3;