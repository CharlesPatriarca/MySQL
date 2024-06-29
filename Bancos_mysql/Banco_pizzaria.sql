CREATE TABLE Clientes (
    ID_cliente INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR (20),
    Telefone VARCHAR (11),
    Endereco VARCHAR (100)
);




CREATE TABLE Pedidos (
    ID_pedido INT AUTO_INCREMENT PRIMARY KEY, 
    Data_pedido date,
    cliente_ID INT,
    FOREIGN KEY (cliente_ID) REFERENCES Clientes (ID_cliente)
);



Create table Pizzas (
    ID_pizza INT AUTO_INCREMENT PRIMARY KEY, 
    Nome VARCHAR (30),
    Preco VARCHAR (10)
);



Create table Ingredientes (
    ID_ingrediente INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR (20)
  
);



Create table Pizza_Ingredientes (
    pizza_ID INT,
    ingredientes_ID INT,
    FOREIGN KEY (pizza_ID) REFERENCES Pizzas (ID_pizza),
    FOREIGN KEY (ingredientes_ID) REFERENCES Ingredientes (ID_ingrediente)
    
  
);

INSERT INTO Ingredientes (Nome) values 
('Queijo mussarela'),
('Pepperoni'),
('Champignon'),
('Tomate'),
('Azeitonas pretas'),
('Cebola'),
('Pimentão'),
('Bacon'),
('Presunto'),
('Manjericão'),
('Frango com Catupiry');

INSERT INTO Clientes (Nome, Endereco, Telefone) values 
('Charles Junior','Rua da Guatemala 74','81986748458'),
('Rabelo Silvio', 'Rua das Flores, 94', '81991234862'),
('Carlos Ronaldodo', 'Rua Campina, 621', '81994849954'),
('Dimas Santos', 'Rua Rio Branco, 779', '81997852483'),
('Claudeci Moura', 'Rua das Flores, 3', '81993293427'),
('Lucas Alves', 'Jose ferreira, 7', '81998895626');


INSERT INTO Pizzas (Nome, Preco) values 
('Pizza Mangericao',29.58),
('Pizza Portuguesa',31.53),
('Pizza de Hamburger',43.87),
('Pizza Almondega', 12.42),
('Pizza Quatro Mortadelas', 25.50),
('Pizza Frango com Gororoba', 30.00);

INSERT INTO Pizza_Ingredientes (pizza_ID, ingredientes_ID) values 
(1, 5),
(2, 3),
(3, 4),
(1, 1),
(2, 6),
(3, 7),
(4, 9);

INSERT INTO Pedidos (cliente_ID, Data_pedido) values 
(1,'2024-01-02'),
(2,'2024-02-23'),
(3,'2023-02-17'),
(3,'2022-05-06'),
(3,'2020-07-27'),
(4,'2021-04-18'),
(5,'2023-06-05');


select * from Pizzas;

select * from Pizzas where preco > 30;

select * from Pedidos;

select * from Pedidos where Data_pedido > '2020-07-27';

select * from Pedidos where cliente_ID = '3';

select * from Pizzas where nome = 'Pizza de Hamburger';

select * from Clientes where telefone = '81991234862';

select * from Pizza_Ingredientes where pizza_ID = 2;

select * from Pizzas where preco = 29.58;

select * from Clientes where nome = 'Carlos Ronaldodo';