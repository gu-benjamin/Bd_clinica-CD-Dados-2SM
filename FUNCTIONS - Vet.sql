USE db_clinica;

SELECT * FROM atendimentos;

-- Exercicio 1. Crie uma função que receba o id_cliente e retorne a quantidade de
-- pets que esse cliente possui.
DELIMITER $$
CREATE FUNCTION quantidadePets(id_C INT)
RETURNS INT
READS SQL DATA
BEGIN
DECLARE totalPets INT;

SELECT COUNT(id_pet) INTO totalPets FROM pets WHERE id_cliente = id_C;
RETURN totalPets;

END $$
DELIMITER ;

SELECT nome, quantidadePets(id_cliente) AS 'Quantidade de pets' FROM clientes;

-- Exercicio 2. Crie uma função que recebe o id_pet e retorna a data da última
-- consulta do pet.
DELIMITER $$
CREATE FUNCTION ultimaConsulta(id_P INT)
RETURNS DATE
READS SQL DATA
BEGIN
DECLARE consulta DATE;

SELECT MAX(data_atendimento) INTO consulta FROM atendimentos WHERE id_pet = id_P;
RETURN consulta;

END $$
DELIMITER ;

SELECT nome, ultimaConsulta(id_pet) AS 'Ultima Consulta' FROM pets;

-- Exercicio 3. Crie uma função que receba o id_veterinario e retorne o número total
-- de atendimentos feitos por ele.
DELIMITER $$
CREATE FUNCTION totalAtendimentos(id_V INT)
RETURNS INT
READS SQL DATA
BEGIN
DECLARE total INT;

SELECT COUNT(id_atendimento) INTO total FROM atendimentos WHERE id_atendimento = id_V; 

RETURN total;

END $$
DELIMITER ;

SELECT nome, totalAtendimentos(id_veterinario) AS 'Quantidades de atendimentos' FROM veterinarios;

-- Exercicio 4. Crie uma função que receba o id_pet e retorne o nome do dono
-- (cliente) desse pet.
DELIMITER $$
CREATE FUNCTION donoPet(id_P INT)
RETURNS VARCHAR(100)
READS SQL DATA
BEGIN
DECLARE nomeDono VARCHAR(100);

SELECT C.nome INTO nomeDono FROM clientes AS C
INNER JOIN pets AS P ON C.id_cliente = P.id_cliente
WHERE id_pet = id_P;
RETURN nomeDono;

END $$
DELIMITER ;

SELECT nome, donoPet(id_pet) AS 'Dono do pet' FROM pets;
