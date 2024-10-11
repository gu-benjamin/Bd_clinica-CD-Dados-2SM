USE db_clinica;

-- EXERCICIO 1. Crie uma stored procedure que adicione um novo veterinário na tabela
-- Veterinarios.
DELIMITER $$
CREATE PROCEDURE novoVeterinario(
IN nome_p VARCHAR(255),
IN especialidade_p VARCHAR(100),
IN telefone_p VARCHAR(17)
)
BEGIN
INSERT INTO veterinarios(nome, especialidade, telefone)
VALUES (nome_p, especialidade_p, telefone_p);
END $$
DELIMITER ;

SELECT * FROM veterinarios;
CALL novoVeterinario('Fausto', 'Demato', '(11) 91234-5338');

-- EXERCICIO 2. Crie uma stored procedure para atualizar os dados de um cliente,
-- como nome, endereço e telefone.
DELIMITER $$
CREATE PROCEDURE atualizarCliente(
IN id_cliente_p INT,
IN nome_p VARCHAR(255),
IN endereco_p VARCHAR(255),
IN telefone_p VARCHAR(17)
)
BEGIN
UPDATE clientes SET nome = nome_p, endereco = endereco_p, telefone = telefone_p 
WHERE id_cliente = id_cliente_p;
END $$
DELIMITER ;

CALL atualizarCliente(2, 'Neymar', 'Vila Viva Sorte, 1912', '(13) 92011-6263');
SELECT * FROM clientes;

-- EXERCICIO 3. Crie uma stored procedure que registre um novo atendimento de um
-- pet, verificando se o veterinário e o pet existem.
DELIMITER $$
CREATE PROCEDURE novoAtendimento(
IN id_pet_p INT,
IN id_veterinario_p INT,
IN data_a_p DATE,
IN desc_p VARCHAR(255)
)
BEGIN

IF id_pet_p NOT IN (SELECT id_pet FROM pets) AND id_veterinario_p NOT IN (SELECT id_veterinario FROM veterinarios) THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Erro. Pet ou veterinário inserido não existe!';
ELSE
INSERT INTO atendimentos(id_pet, id_veterinario, data_atendimento, descricao) 
VALUES(id_pet_p, id_veterinario_p, data_a_p, desc_p);
END IF;

END $$
DELIMITER ;

SELECT * FROM pets;
CALL novoAtendimento(3, 1, DATE(NOW()), 'Check-up');
SELECT * FROM atendimentos;