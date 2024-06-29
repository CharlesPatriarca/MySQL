-- Tabela Cliente
CREATE TABLE Cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(100),
    email VARCHAR(50) UNIQUE NOT NULL,
    data_criacao DATE NOT NULL
);

-- Tabela Produto
CREATE TABLE Produto (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10, 2) NOT NULL,
    quantidade_estoque INT NOT NULL
);

-- Tabela Pedido
CREATE TABLE Pedido (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    data_pedido DATE NOT NULL,
    status VARCHAR(50) NOT NULL,
    valor_total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

-- Tabela Pedido_Produto
CREATE TABLE Pedido_Produto (
    id_pedido INT,
    id_produto INT,
    quantidade INT NOT NULL,
    PRIMARY KEY (id_pedido, id_produto),
    FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido),
    FOREIGN KEY (id_produto) REFERENCES Produto(id_produto)
);

-- Tabela Carrinho
CREATE TABLE Carrinho (
    id_carrinho INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    data_sessao DATE NOT NULL,
    status VARCHAR(50) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

-- Tabela Carrinho_Produto
CREATE TABLE Carrinho_Produto (
    id_carrinho INT,
    id_produto INT,
    quantidade INT NOT NULL,
    PRIMARY KEY (id_carrinho, id_produto),
    FOREIGN KEY (id_carrinho) REFERENCES Carrinho(id_carrinho),
    FOREIGN KEY (id_produto) REFERENCES Produto(id_produto)
);

-- Tabela Pagamento
CREATE TABLE Pagamento (
    id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT,
    valor_pago DECIMAL(10, 2) NOT NULL,
    metodo_pagamento VARCHAR(100) NOT NULL,
    data_transacao DATE NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido)
);

-- Tabela Avaliacao
CREATE TABLE Avaliacao (
    id_avaliacao INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_produto INT,
    pontuacao INT NOT NULL CHECK (pontuacao BETWEEN 1 AND 5),
    comentario TEXT,
    data_avaliacao DATE NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
    FOREIGN KEY (id_produto) REFERENCES Produto(id_produto)
);

-- Tabela Promocao
CREATE TABLE Promocao (
    id_promocao INT AUTO_INCREMENT PRIMARY KEY,
    codigo_promocional VARCHAR(100) UNIQUE NOT NULL,
    desconto DECIMAL(5, 2) NOT NULL CHECK (desconto BETWEEN 0 AND 100),
    data_inicio DATE NOT NULL,
    data_fim DATE NOT NULL
);


-- INSERÇÃO DE DADOS -----------------
-- Inserção de Clientes
INSERT INTO Cliente (nome, endereco, email, data_criacao) VALUES
('João Silva', 'Rua A, 123, São Paulo, SP', 'joao.silva@example.com', '2024-01-01'),
('Maria Oliveira', 'Avenida B, 456, Rio de Janeiro, RJ', 'maria.oliveira@example.com', '2024-01-02'),
('Carlos Sousa', 'Rua C, 789, Belo Horizonte, MG', 'carlos.sousa@example.com', '2024-01-03');


-- Inserção de Produtos
INSERT INTO Produto (nome, descricao, preco, quantidade_estoque) VALUES
('Notebook', 'Notebook 14" com 8GB de RAM', 3500.00, 10),
('Smartphone', 'Smartphone Android com 128GB de armazenamento', 1500.00, 20),
('Tablet', 'Tablet 10" com 64GB de armazenamento', 1000.00, 15);


-- Inserção de Pedidos
INSERT INTO Pedido (id_cliente, data_pedido, status, valor_total) VALUES
(1, '2024-01-05', 'Concluído', 3500.00),
(2, '2024-01-06', 'Enviado', 1500.00),
(3, '2024-01-07', 'Pendente', 1000.00);

-- Inserção de Produtos nos Pedidos
INSERT INTO Pedido_Produto (id_pedido, id_produto, quantidade) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1);


-- Inserção de Carrinhos
INSERT INTO Carrinho (id_cliente, data_sessao, status) VALUES
(1, '2024-01-04', 'Aberto'),
(2, '2024-01-05', 'Fechado');

-- Inserção de Produtos nos Carrinhos
INSERT INTO Carrinho_Produto (id_carrinho, id_produto, quantidade) VALUES
(1, 1, 2),
(2, 2, 1);

-- Inserção de Pagamentos
INSERT INTO Pagamento (id_pedido, valor_pago, metodo_pagamento, data_transacao) VALUES
(1, 3500.00, 'Cartão de Crédito', '2024-01-05'),
(2, 1500.00, 'PayPal', '2024-01-06'),
(3, 1000.00, 'Boleto Bancário', '2024-01-07');

-- Inserção de Avaliações
INSERT INTO Avaliacao (id_cliente, id_produto, pontuacao, comentario, data_avaliacao) VALUES
(1, 1, 5, 'Excelente notebook, superou minhas expectativas!', '2024-01-07'),
(2, 2, 4, 'Bom smartphone, mas a bateria poderia ser melhor.', '2024-01-08'),
(3, 3, 3, 'Tablet razoável, mas com preço justo.', '2024-01-09');

-- Inserção de Promoções
INSERT INTO Promocao (codigo_promocional, desconto, data_inicio, data_fim) VALUES
('PROMO10', 10.00, '2024-01-01', '2024-01-31'),
('PROMO20', 20.00, '2024-02-01', '2024-02-28'),
('PROMO15', 15.00, '2024-03-01', '2024-03-31');


-- Listar Clientes e Seus Pedidos
SELECT Cliente.nome, Pedido.id_pedido, Pedido.data_pedido, Pedido.valor_total FROM Cliente
JOIN  Pedido ON Cliente.id_cliente = Pedido.id_cliente;

-- Produtos e Suas Avaliações
SELECT Produto.nome AS produto, Avaliacao.pontuacao, Avaliacao.comentario FROM Produto
JOIN Avaliacao ON Produto.id_produto = Avaliacao.id_produto;


-- Promoções Ativas em um Período
SELECT codigo_promocional, desconto, data_inicio, data_fim FROM Promocao 
WHERE data_inicio <= '2024-01-31' AND data_fim >= '2024-01-01';