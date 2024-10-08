USE db_clinica;

SELECT * FROM pets;
-- TRIGGERS
-- Exercício 1. Crie um trigger que, sempre que um novo pet for inserido na tabela,
-- calcule automaticamente a idade do pet com base em sua data de nascimento e
-- armazene esse valor na coluna idade.

-- CREATE DEFINER=`root`@`localhost` TRIGGER `pets_BEFORE_INSERT` BEFORE INSERT ON `pets` FOR EACH ROW BEGIN
-- SET NEW.idade = TIMESTAMPDIFF(YEAR, NEW.data_nascimento, CURDATE());
-- END

ALTER TABLE pets ADD idade INT;
INSERT INTO pets (id_pet, nome, tipo, raca, data_nascimento, id_cliente) VALUES
('5', 'Mel', 'Cachorro', 'Vira-lata', '2014-04-15', '2');

-- Exercício 2. Crie um trigger que impeça a exclusão de um veterinário da tabela
-- Veterinarios caso ele tenha atendimentos registrados na tabela Atendimentos. 

