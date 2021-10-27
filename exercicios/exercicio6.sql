-- criando o banco de dados --
create database db_cursoDaMinhaVida;

-- Criando Tabelas --
use db_cursoDaMinhaVida;
create table tb_categoria (
	id bigint(5) auto_increment,
    area varchar (300) not null,
    qtvagas int (255) not null,
    professor varchar (300) not null,
     primary key (id)
);


create table tb_curso (
	id bigint(5) auto_increment,
	nome varchar (300) not null,
    preco decimal(10,2) not null,
    tempo_de_duracao_em_meses int (5) not null,
    em_promocao boolean not null,
    certificado boolean not null,
    precoformatura decimal (10,2),
    categoria_id bigint,
    primary key (id),
    foreign KEY (categoria_id) REFERENCES tb_categoria (id)
);

-- Criando as Categorias --
insert into tb_categoria(area, qtvagas, professor) values ("Informática", 82, "Maiury");
insert into tb_categoria(area, qtvagas, professor) values ("Gastronomia", 40, "Safira");
insert into tb_categoria(area, qtvagas, professor) values ("Moda", 112, "Danillo");
insert into tb_categoria(area, qtvagas, professor) values ("Jornalismo", 100, "Darcy");
insert into tb_categoria(area, qtvagas, professor) values ("Administração", 50, "André");

-- Criando as Frutas  --
insert into tb_curso(nome, preco, tempo_de_duracao_em_meses, em_promocao, certificado, precoformatura, categoria_id)
values ("Programação em Java", 112.50, 6, true, true, 120.00, 1);
insert into tb_curso(nome, preco, tempo_de_duracao_em_meses, em_promocao, certificado, precoformatura, categoria_id)
values ("Alimentação Saudável", 45.99, 3, false, false, null, 2);
insert into tb_curso(nome, preco, tempo_de_duracao_em_meses, em_promocao, certificado, precoformatura, categoria_id)
values ("Contraste das Cores", 65.00, 6, false, false, 30.00, 3);
insert into tb_curso(nome, preco, tempo_de_duracao_em_meses, em_promocao, certificado, precoformatura, categoria_id)
values ("Redação", 15.00, 1, false, false, null, 4);
insert into tb_curso(nome, preco, tempo_de_duracao_em_meses, em_promocao, certificado, precoformatura, categoria_id)
values ("Administração Financeira", 600.50, 12, true, true, 390.00, 5);
insert into tb_curso(nome, preco, tempo_de_duracao_em_meses, em_promocao, certificado, precoformatura, categoria_id)
values ("Administração de Estoque", 475.50, 8, true, true, 260.00, 5);
insert into tb_curso(nome, preco, tempo_de_duracao_em_meses, em_promocao, certificado, precoformatura, categoria_id)
values ("CSS", 300.00, 6, true, true, 120.00, 1);
insert into tb_curso(nome, preco, tempo_de_duracao_em_meses, em_promocao, certificado, precoformatura, categoria_id)
values ("Alimentação Vegana", 110.50, 3, true, true, 20.00, 2);

-- comando select curso com valor maior que 50 --
select * from tb_curso where preco > 50.00;

-- comando select curso com valor entre 3 a 60 --
select * from tb_curso where preco between 03.00 AND 60.00;

-- Buscar curso com a letra C no nome --
select * from tb_curso where nome Like "%J%";

-- Inner Join --
select * from tb_curso inner join tb_categoria
on tb_curso.categoria_id = tb_categoria.id;

-- Select curso de um determinado tipo --
select tb_curso.nome, tb_curso.preco, tb_curso.tempo_de_duracao_em_meses, tb_categoria.area, tb_categoria.qtvagas, tb_categoria.professor from tb_curso inner join tb_categoria 
on tb_curso.categoria_id = tb_categoria.id
where tb_categoria.id = 5;