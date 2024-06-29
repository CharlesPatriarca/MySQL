CREATE TABLE Alunos (
  id_aluno int auto_increment PRIMARY KEY,
  nome varchar (50) NOT NULL,
  idade int (2) NOT NULL,
  email varchar (50) not null,
  telefone varchar (11) not null
);

CREATE TABLE Instrutores (
  id_instrutor int auto_increment PRIMARY KEY,
  nome varchar (50) NOT NULL,
  especialidade varchar (20) NOT NULL,
  email varchar (50) not null,
  telefone varchar (11) not null
);

CREATE TABLE Planos_de_treinamento (
  id_planos int auto_increment PRIMARY KEY,
  nome varchar (50) NOT NULL,
  descricao varchar (100) NOT NULL,
  duracao_semanas int not null,
  valor_mensal varchar (100) not null
);

CREATE TABLE Equipamentos (
  id_equipamentos int auto_increment PRIMARY KEY,
  nome varchar (50) NOT NULL,
  descricao varchar (50) NOT NULL,
  quantidade_disponivel int not null
);

CREATE TABLE Registro_de_treinos (
  id_treinos int auto_increment PRIMARY KEY,
  data_treino date not null,
  descricao varchar (200),
  observacoes varchar (200),
  id_aluno int,
  id_instrutor int,
  foreign key (id_aluno) references Alunos (id_aluno),
  foreign key (id_instrutor) references Instrutores (id_instrutor)
);

CREATE TABLE Pagamento_mensalidades (
  id_pagamento int auto_increment PRIMARY KEY,
  data_pagamento date not null,
  valor_mensalidade int not null,
  id_aluno int,
  foreign key (id_aluno) references Alunos (id_aluno)
);


insert into Alunos (nome, idade, email, telefone) values 
("Charles", 23, "djsvaljk@gmail.com", "81993847573"),
("Isabelly", 22, "jfowifj@gmail.com", "81986736264"),
("Lindinalva", 54, "ekfhwkkf@gmail.com", "81994837263" );


insert into Instrutores (nome, especialidade, email, telefone) values 
("Gerson", "Yoga", "jfljfj@gmail.com", "81987596425"),
("Leide", "Pernas", "fhsgndol@gmail.com", "81997320214"),
("Pato", "Dorsal", "dkjfls@gmail.com", "81978564126");


insert into Planos_de_treinamento (nome, descricao, duracao_semanas, valor_mensal) values 
("Jaula", "O monsto ta saindo", 52, "50,25"),
("Vem", "Vem timbora", 20, "84,52"),
("Vai", "não volta", 12, "89,00");



insert into Equipamentos (nome, descricao, quantidade_disponivel) values 
("Alter", "Redondo", 11),
("Manilha", "Pesado", 2),
("Barra", "Longo", 87);



insert into Registro_de_treinos (id_aluno, id_instrutor, data_treino, descricao, observacoes)  values 
(2, 3, "2024-05-08", "Feioso", "Fraco demais"),
(1, 2, "2024-09-09", "Calma", "nervoso"),
(3, 1, "2024-09-02", "eita", "Vem de novo");



insert into Pagamento_mensalidades (id_aluno, data_pagamento, valor_mensalidade) values 
(3, "2024-07-05", 84),
(2, "2024-04-03", 498),
(1, "2024-04-03", 161);


-- Selecione todos os campos da tabela alunos.
select * from Alunos;


-- Selecione todos os campos da tabela instrutores onde a especialidade seja 'Yoga'.
select * 
from Instrutores 
where especialidade = "Yoga";

-- Selecione todos os campos da tabela planos_treinamento onde a duracao_semanas seja maior que 20.
select *
from Planos_de_treinamento
where duracao_semanas > 20;


-- Selecione todos os campos da tabela equipamentos.
select *
from Equipamentos;


-- Selecione todos os campos da tabela registros_treinos onde aluno_id seja 1.
select *
from Registro_de_treinos
where id_aluno = 1;


-- Selecione todos os campos da tabela pagamentos_mensalidades onde aluno_id seja 2.
select *
from Pagamento_mensalidades
where id_aluno = 3;



-- Realize um join entre registros_treinos, alunos e instrutores e selecione os nomes dos alunos e instrutores.
select Alunos.nome as nome_do_aluno,
Instrutores.nome as nome_instrutor
from Registro_de_treinos
inner join Alunos on Registro_de_treinos.id_aluno = Alunos.id_aluno
inner join Instrutores on Registro_de_treinos.id_instrutor = Instrutores.id_instrutor;


-- Selecione os campos nome e valor_mensal da tabela planos_treinamento.
select nome, valor_mensal
from Planos_de_treinamento;


-- Selecione os campos nome e quantidade_disponivel da tabela equipamentos onde quantidade_disponivel seja maior que 10.
select nome, quantidade_disponivel
from Equipamentos
where quantidade_disponivel > 10;



-- Utilize uma subconsulta para selecionar os alunos cujo id não esteja presente na tabela pagamentos_mensalidades.
select nome 
from Alunos 
where id_aluno not in (select id_aluno from Pagamento_mensalidades);