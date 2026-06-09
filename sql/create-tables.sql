-- Criando SCHEMA
CREATE SCHEMA IF NOT EXISTS confeitaria_db;

-- Tabela CLIENTES
CREATE TABLE IF NOT EXISTS confeitaria_db.CLIENTES (
    id_cliente SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_cadastro DATE NOT NULL
);

-- Tabela PRODUTOS
CREATE TABLE IF NOT EXISTS confeitaria_db.PRODUTOS (
    id_produto SERIAL PRIMARY KEY,
    sabor VARCHAR(100) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    tamanho VARCHAR(50) NOT NULL
);

-- Tabela TELEFONES
CREATE TABLE confeitaria_db.CLIENTE_TELEFONES (
    id_cliente INT NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    PRIMARY KEY (id_cliente, telefone),
    FOREIGN KEY (id_cliente) REFERENCES confeitaria_db.CLIENTES(id_cliente)
);

-- Tabela ESTOQUE
CREATE TABLE confeitaria_db.ESTOQUE (
    id_estoque SERIAL PRIMARY KEY,
    qtd_potes INT NOT NULL,
    fabricacao DATE NOT NULL,
    validade DATE NOT NULL,
    id_produto INT NOT NULL,
    FOREIGN KEY (id_produto) REFERENCES confeitaria_db.PRODUTOS(id_produto)
);

-- Tabela PEDIDOS
CREATE TABLE confeitaria_db.PEDIDOS (
    id_pedido SERIAL PRIMARY KEY,
    data_hora TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    tipo_pagamento VARCHAR(50) NOT NULL,
    id_cliente INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES confeitaria_db.CLIENTES(id_cliente)
);

-- Tabela ENTREGA 
CREATE TABLE confeitaria_db.ENTREGA (
    id_entrega SERIAL PRIMARY KEY,
    status_rota VARCHAR(50) NOT NULL,
    logradouro VARCHAR(150) NOT NULL,
    numero VARCHAR(20) NOT NULL,
    bairro VARCHAR(100) NOT NULL,
    cep VARCHAR(20) NOT NULL,
    id_pedido INT NOT NULL UNIQUE, 
    FOREIGN KEY (id_pedido) REFERENCES confeitaria_db.PEDIDOS(id_pedido)
);

-- Tabela ITEM_PEDIDO 
CREATE TABLE confeitaria_db.ITEM_PEDIDO (
    id_pedido INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unidade DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (id_pedido, id_produto), 
    FOREIGN KEY (id_pedido) REFERENCES confeitaria_db.PEDIDOS(id_pedido),
    FOREIGN KEY (id_produto) REFERENCES confeitaria_db.PRODUTOS(id_produto)
);