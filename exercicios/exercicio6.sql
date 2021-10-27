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
insert into tb_categoria(area, qtvagas, professor) values ("Informatica", 42, "Rafael");
insert into tb_categoria(area, qtvagas, professor) values ("Culinaria", 40, "Tia Jess");
insert into tb_categoria(area, qtvagas, professor) values ("Artes Cenicas", 82, "Jeffrey");
insert into tb_categoria(area, qtvagas, professor) values ("Pedagogia", 100, "Wesley");
insert into tb_categoria(area, qtvagas, professor) values ("Contabilidade", 60, "André");

-- Criando os Cursos  --
insert into tb_curso(nome, preco, tempo_de_duracao_em_meses, em_promocao, certificado, precoformatura, categoria_id)
values ("Programação em POO", 562.50, 6, false, true, 120.00, 1);
insert into tb_curso(nome, preco, tempo_de_duracao_em_meses, em_promocao, certificado, precoformatura, categoria_id)
values ("Curso de Churrasco", 145.99, 3, false, false, null, 2);
insert into tb_curso(nome, preco, tempo_de_duracao_em_meses, em_promocao, certificado, precoformatura, categoria_id)
values ("Atuaçao", 165.00, 6, false, false, 100.00, 3);
insert into tb_curso(nome, preco, tempo_de_duracao_em_meses, em_promocao, certificado, precoformatura, categoria_id)
values ("Libras", 15.00, 1, false, false, null, 4);
insert into tb_curso(nome, preco, tempo_de_duracao_em_meses, em_promocao, certificado, precoformatura, categoria_id)
values ("Tributos", 600.50, 12, true, true, 390.00, 5);
insert into tb_curso(nome, preco, tempo_de_duracao_em_meses, em_promocao, certificado, precoformatura, categoria_id)
values ("Controle de Caixa", 475.50, 8, true, true, 260.00, 5);
insert into tb_curso(nome, preco, tempo_de_duracao_em_meses, em_promocao, certificado, precoformatura, categoria_id)
values ("CSS", 300.00, 6, true, true, 120.00, 1);
insert into tb_curso(nome, preco, tempo_de_duracao_em_meses, em_promocao, certificado, precoformatura, categoria_id)
values ("Confeiteiro", 1110.50, 3, true, true, 20.00, 2);

-- comando selecione curso com valor maior que 50 --
select * from tb_curso where preco > 50.00;

-- comando selecione curso com valor entre 3 a 60 --
select * from tb_curso where preco between 03.00 AND 60.00;

-- Buscar curso com a letra C no nome --
select * from tb_curso where nome Like "%J%";

-- Inner Join --
select * from tb_curso inner join tb_categoria
on tb_curso.categoria_id = tb_categoria.id;

-- Selecione curso de um determinado tipo --
select tb_curso.nome, tb_curso.preco, tb_curso.tempo_de_duracao_em_meses, tb_categoria.area, tb_categoria.qtvagas, tb_categoria.professor from tb_curso inner join tb_categoria 
on tb_curso.categoria_id = tb_categoria.id
where tb_categoria.id = 5;