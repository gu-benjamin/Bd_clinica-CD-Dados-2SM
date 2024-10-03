USE db_clinica;

-- 1. INNER JOIN

-- Exercício 1: Liste os nomes dos clientes e os nomes dos pets que pertencem
-- a eles.
SELECT * FROM clientes AS C
INNER JOIN pets AS P ON C.id_cliente = P.id_cliente;

-- Exercício 2: Liste os veterinários e os atendimentos realizados.
SELECT * FROM veterinarios AS V
INNER JOIN atendimentos as A
ON V.id_veterinario = A.id_veterinario
WHERE data_atendimento < NOW();

-- Exercício 3: Liste todos os pets e os detalhes de seus atendimentos (incluindo
-- o nome do veterinário).
SELECT * FROM pets AS P
INNER JOIN atendimentos AS A
ON P.id_pet = A.id_pet
INNER JOIN veterinarios AS V
ON A.id_veterinario = V.id_veterinario;

-- Exercício 4: Liste o nome dos pets, seus donos e o veterinário responsável por
-- seus últimos atendimentos.
SELECT * FROM pets AS P
INNER JOIN clientes AS C
ON P.id_cliente = C.id_cliente
INNER JOIN atendimentos AS A
ON P.id_pet = A.id_pet
INNER JOIN veterinarios AS V
ON A.id_veterinario = V.id_veterinario;

-- 2. RIGHT JOIN

-- Exercício 1: Liste todos os veterinários e os atendimentos que realizaram,
-- incluindo aqueles que ainda não realizaram nenhum atendimento.
SELECT * FROM veterinarios AS V
LEFT JOIN atendimentos as A
ON V.id_veterinario = A.id_veterinario
WHERE data_atendimento < NOW();

-- Exercício 2: Liste todos os clientes e os pets que possuem, incluindo clientes
-- que ainda não têm pets cadastrados.
SELECT * FROM clientes AS C
LEFT JOIN pets AS P ON C.id_cliente = P.id_cliente;

-- Exercício 3: Liste todos os veterinários e os atendimentos que realizaram,
-- incluindo aqueles que ainda não realizaram nenhum atendimento.
SELECT * FROM atendimentos AS A
RIGHT JOIN veterinarios as V
ON V.id_veterinario = A.id_veterinario
WHERE data_atendimento < NOW();

-- Exercício 4: Liste todos os clientes e os pets que possuem, incluindo clientes
-- que ainda não têm pets cadastrados.
SELECT * FROM pets AS P
RIGHT JOIN clientes AS C ON C.id_cliente = P.id_cliente;

-- 3. OUTER JOIN (FULL OUTER JOIN)

-- Exercício 1: Liste todos os pets e seus clientes, incluindo pets que não têm
-- clientes associados e clientes que não têm pets cadastrados.
SELECT * FROM pets AS P
LEFT JOIN clientes AS C
ON P.id_cliente = C.id_cliente
UNION
SELECT * FROM pets AS P
RIGHT JOIN clientes AS C
ON P.id_cliente = C.id_cliente;

-- Exercício 2: Liste todos os atendimentos e os pets, incluindo atendimentos que
-- não têm pets associados e pets que não têm atendimentos registrados.
SELECT * FROM atendimentos AS A
LEFT JOIN pets AS P
ON A.id_pet = P.id_pet
UNION
SELECT * FROM atendimentos AS A
RIGHT JOIN pets AS P
ON A.id_pet = P.id_pet;

-- Exercício 3: Liste todos os veterinários e atendimentos, incluindo veterinários
-- que ainda não realizaram atendimentos e atendimentos que não têm
-- veterinários associados.
SELECT * FROM veterinarios AS V
LEFT JOIN atendimentos AS A
ON V.id_veterinario = A.id_veterinario
UNION
SELECT * FROM veterinarios AS V
RIGHT JOIN atendimentos AS A
ON V.id_veterinario = A.id_veterinario;

-- Exercício 4: Liste todos os pets e atendimentos realizados, incluindo pets que
-- não foram atendidos e atendimentos sem pets associados.
SELECT * FROM pets AS P
LEFT JOIN atendimentos AS A
ON P.id_pet = A.id_pet
UNION
SELECT * FROM pets AS P
RIGHT JOIN atendimentos AS A
ON P.id_pet = A.id_pet;
