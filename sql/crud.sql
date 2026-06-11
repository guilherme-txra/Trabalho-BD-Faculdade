-- CRUD

-- CREATE
INSERT INTO confeitaria_db.PRODUTOS (sabor, preco, tamanho) 
VALUES ('Bolo de Churros', 18.50, '250ml');

-- READ
SELECT * FROM confeitaria_db.PRODUTOS 
WHERE sabor = 'Bolo de Churros';

-- UPDATE
UPDATE confeitaria_db.PRODUTOS 
SET preco = 20.00 
WHERE sabor = 'Bolo de Churros';

-- DELETE
DELETE FROM confeitaria_db.PRODUTOS 
WHERE sabor = 'Bolo de Churros';