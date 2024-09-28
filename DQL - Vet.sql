USE db_clinica;

SELECT * FROM veterinarios;
SELECT * FROM clientes;
SELECT * FROM pets;
SELECT * FROM atendimentos;

-- a) O pet com a data de nascimento mais antigo
SELECT * FROM pets WHERE data_nascimento = (SELECT MIN(data_nascimento) FROM pets);

-- b) O pet com a data de nascimento mais recente
SELECT * FROM pets WHERE data_nascimento = (SELECT MAX(data_nascimento) FROM pets);

-- c) A quantidade de pets cadastrados no banco de dados
SELECT COUNT(id_pet) AS 'Quantidade de pets 'FROM pets;

-- d) Ordene o nome dos pets em ordem crescente
SELECT nome FROM pets ORDER BY nome ASC;

-- e) Ordene o nome dos pets em ordem decrescente
SELECT nome FROM pets ORDER BY nome DESC;

-- f) Ordene o nome dos veterinários em ordem crescente
SELECT nome FROM veterinarios ORDER BY nome ASC;

-- g) Ordene o nome dos veterinários em ordem decrescente
SELECT nome FROM veterinarios ORDER BY nome DESC;

-- h) A data de atendimento mais antiga
SELECT data_atendimento AS 'Atendimento(s) mais antigo' FROM atendimentos 
WHERE data_atendimento = (SELECT MIN(data_atendimento) FROM atendimentos);

-- i) A data de atendimento mais recente
SELECT data_atendimento AS 'Atendimento(s) mais recente' FROM atendimentos 
WHERE data_atendimento = (SELECT MAX(data_atendimento) FROM atendimentos);
 