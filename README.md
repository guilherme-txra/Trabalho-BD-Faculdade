# Trabalho-BD-Faculdade

Essa é uma **Modelagem de Banco de Dados** feita para um trabalho da **Faculdade (FATEC)**, onde é realizado a:
- Criação de Cenário
- Descrição Textual
- Modelo Conceitual (DER)
- Modelo Lógico
- Modelo Físico (SQL)
- CRUD
  - **C** - `CREATE`
  - **R** - `READ`
  - **U** - `UPDATE`
  - **D** - `DELETE`


## CENÁRIO

O sistema gerencia as vendas e o cardápio de uma confeitaria artesanal focada em bolos de pote. Clientes realizam pedidos que podem conter diferentes quantidades e sabores de bolos disponíveis no catálogo. Cada pedido registra informações essenciais como a forma de pagamento escolhida, o status de entrega no endereço do cliente e o preço unitário de cada produto no momento da compra, garantindo um histórico de faturamento preciso mesmo que os preços do cardápio mudem no futuro.

---

## DESCRIÇÃO TEXTUAL

- **Clientes**(id_cliente, nome, data_cadastro)
- **Cliente_Telefones**(id_cliente, telefone)
- **Produtos**(id_produto, sabor, preco, tamanho)
- **Estoque**(id_estoque, qtd_potes, fabricacao, validade, id_produto)
- **Pedidos**(id_pedido, data_hora, tipo_pagamento, id_cliente)
- **Entrega**(id_entrega, status_rota, logradouro, numero, bairro, cep, id_pedido)
- **Item_Pedido**(id_pedido, id_produto, quantidade, preco_unidade)
---

## MODELO CONCEITUAL

<img width="776" height="658" alt="modelo-conceitual" src="https://github.com/user-attachments/assets/f3097db6-683c-4d3d-9ff1-b14f8b2e23fe" />

---
