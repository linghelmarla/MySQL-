-- criando o banco de dados --
create database db_cidade_das_carnes;

-- Criando Tabelas --
use db_cidade_das_carnes;
create table tb_categoria (
	id bigint(5) auto_increment,
    tipo varchar (300) not null,
    Osso boolean not null,
     promocao boolean not null,
     primary key (id)
);


create table tb_produto (
	id bigint(5) auto_increment,
	nome varchar (300) not null,
    preco decimal(10,2) not null,
    primeira_ou_segunda varchar(200) not null,
    em_promocao boolean not null,
    em_estoque boolean not null,
    vermelha boolean not null,
    categoria_id bigint,
    primary key (id),
    foreign KEY (categoria_id) REFERENCES tb_categoria (id)
);

-- Criando as Categorias --
insert into tb_categoria(tipo,osso,promocao) values ("Boi",true,true );
insert into tb_categoria(tipo,osso,promocao) values ("Galinha",true, true);
insert into tb_categoria(tipo,osso,promocao) values ("Peixe", true, false);
insert into tb_categoria(tipo,osso,promocao) values ("Porco", true, true);
insert into tb_categoria(tipo,osso,promocao) values ("Vaca", true, false);

-- Criando as carnes  --
insert into tb_produto(nome, preco, Primeira_ou_segunda, em_promocao, em_estoque, vermelha, categoria_id)
values ("Costela", 79.50, "primeira", false, true, true, 1);
insert into tb_produto(nome, preco, Primeira_ou_segunda, em_promocao, em_estoque, vermelha, categoria_id)
values ("Asa de galinha", 20.00, "Segunda", false, true, false, 2);
insert into tb_produto(nome, preco, Primeira_ou_segunda, em_promocao, em_estoque, vermelha, categoria_id)
values ("Atum", 79.50, "primeira", false, true, false, 3);
insert into tb_produto(nome, preco, Primeira_ou_segunda, em_promocao, em_estoque, vermelha, categoria_id)
values ("Frango inteiro", 29.50, "primeira", false, true, false, 2);
insert into tb_produto(nome, preco, Primeira_ou_segunda, em_promocao, em_estoque, vermelha, categoria_id)
values ("Salmao", 179.50, "primeira", false, true, false, 3);
insert into tb_produto(nome, preco, Primeira_ou_segunda, em_promocao, em_estoque, vermelha, categoria_id)
values ("Picanha", 79.50, "primeira", false, true, true, 5);
insert into tb_produto(nome, preco, Primeira_ou_segunda, em_promocao, em_estoque, vermelha, categoria_id)
values ("Linguiça", 79.50, "segunda", false, true, true, 4);
insert into tb_produto(nome, preco, Primeira_ou_segunda, em_promocao, em_estoque, vermelha, categoria_id)
values ("Salsicha", 79.50, "primeira", false, true, true, 4);

-- comando selecionar produtos com valor maior que 50 --
select * from tb_produto where preco > 50.00;

-- comando selecionar produtos com valor entre 3 a 60 --
select * from tb_produto where preco between 03.00 AND 60.00;

-- Buscar produto com a letra C no nome --
select * from tb_produto where nome Like "%C%";

-- Inner Join --
select * from tb_produto inner join tb_categoria
on tb_produto.categoria_id = tb_categoria.id;

-- Seleccionar produto de um determinado tipo --
select tb_produto.nome, tb_produto.preco, tb_categoria.semente, tb_categoria.cor from tb_produto inner join tb_categoria 
on tb_produto.categoria_id = tb_categoria.id
where tb_categoria.id = 4;