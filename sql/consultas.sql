-- Junta Cliente e Pedido pra ver quem pagou com PIX
SELECT c.nome, p.data_hora, p.tipo_pagamento 
FROM confeitaria_db.CLIENTES c 
JOIN confeitaria_db.PEDIDOS p ON c.id_cliente = p.id_cliente 
WHERE p.tipo_pagamento = 'PIX' 
ORDER BY p.data_hora DESC;

-- Junta Pedido e Entrega pra achar as entregas atrasadas (Pendentes)
SELECT p.id_pedido, e.status_rota, e.bairro 
FROM confeitaria_db.PEDIDOS p 
JOIN confeitaria_db.ENTREGA e ON p.id_pedido = e.id_pedido 
WHERE e.status_rota = 'Pendente' 
ORDER BY e.bairro ASC;

-- Procura os bolos que têm bastante no estoque e mostra do maior pro menor.
SELECT pr.sabor, pr.tamanho, es.qtd_potes 
FROM confeitaria_db.PRODUTOS pr 
JOIN confeitaria_db.ESTOQUE es ON pr.id_produto = es.id_produto 
WHERE es.qtd_potes > 15 
ORDER BY es.qtd_potes DESC;

-- Pega os clientes cadastrados depois de fevereiro e mostra o telefone deles em ordem alfabética.
SELECT c.nome, t.telefone, c.data_cadastro 
FROM confeitaria_db.CLIENTES c 
JOIN confeitaria_db.CLIENTE_TELEFONES t ON c.id_cliente = t.id_cliente 
WHERE c.data_cadastro >= '2023-02-01' 
ORDER BY c.nome ASC;

-- Puxa todos os pedidos que têm bolo de Morango
SELECT p.id_pedido, pr.sabor, i.quantidade 
FROM confeitaria_db.ITEM_PEDIDO i 
JOIN confeitaria_db.PRODUTOS pr ON i.id_produto = pr.id_produto 
JOIN confeitaria_db.PEDIDOS p ON i.id_pedido = p.id_pedido 
WHERE pr.sabor = 'Morango' 
ORDER BY i.quantidade DESC;

-- Filtra as entregas que vão pro 'Centro' e lista o nome da rua em ordem alfabética
SELECT e.logradouro, e.numero, e.bairro, p.tipo_pagamento 
FROM confeitaria_db.ENTREGA e 
JOIN confeitaria_db.PEDIDOS p ON e.id_pedido = p.id_pedido 
WHERE e.bairro = 'Centro' 
ORDER BY e.logradouro ASC;

-- Acha as vendas onde o bolo custou 25 reais ou mais 
SELECT pr.sabor, i.quantidade, i.preco_unidade, p.data_hora 
FROM confeitaria_db.ITEM_PEDIDO i 
JOIN confeitaria_db.PRODUTOS pr ON i.id_produto = pr.id_produto 
JOIN confeitaria_db.PEDIDOS p ON i.id_pedido = p.id_pedido 
WHERE i.preco_unidade >= 25.00 
ORDER BY p.data_hora DESC;

-- Junta Cliente e Pedido pra ver só a galera que comprou no Cartão
SELECT c.nome, p.id_pedido, p.tipo_pagamento 
FROM confeitaria_db.CLIENTES c 
JOIN confeitaria_db.PEDIDOS p ON c.id_cliente = p.id_cliente 
WHERE p.tipo_pagamento = 'Cartão' 
ORDER BY c.nome ASC;

-- Mostra só o estoque dos potinhos pequenos de 150ml
SELECT pr.sabor, pr.tamanho, es.qtd_potes 
FROM confeitaria_db.PRODUTOS pr 
JOIN confeitaria_db.ESTOQUE es ON pr.id_produto = es.id_produto 
WHERE pr.tamanho = '150ml' 
ORDER BY pr.sabor ASC;

-- Junta 3 tabelas de uma vez pra saber o nome do cliente que tá com a entrega 'Em Trânsito'.
SELECT c.nome, p.id_pedido, e.status_rota, e.bairro 
FROM confeitaria_db.CLIENTES c 
JOIN confeitaria_db.PEDIDOS p ON c.id_cliente = p.id_cliente 
JOIN confeitaria_db.ENTREGA e ON p.id_pedido = e.id_pedido 
WHERE e.status_rota = 'Em Trânsito' 
ORDER BY c.nome ASC;