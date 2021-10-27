-- criando o banco de dados --
create database db_construindo_a_nossa_vida;

-- Criando Tabelas --
use db_construindo_a_nossa_vida;
create table tb_categoria(
id bigint auto_increment,
tipo varchar(255) not null,
desconto boolean not null,
promocao boolean not null,
primary key (id)
);

create table tb_produto (
id bigint auto_increment,
nome varchar (255) not null,
preco decimal(6,2) not null,
qtproduto int not null,
em_estoque boolean not null,
marca_conhecida boolean not null,
categoria_id bigint,
primary key (id),
FOREIGN KEY (categoria_id) REFERENCES tb_categoria (id)
);

-- Criando as Categorias --
insert into tb_categoria (tipo, desconto, promocao) values ("Ferramenta", true, true);
insert into tb_categoria (tipo, desconto, promocao) values ("Material", true, true);
insert into tb_categoria (tipo, desconto, promocao) values ("Decoração", false, false);
insert into tb_categoria (tipo, desconto, promocao) values ("Elétrica", false, false);
insert into tb_categoria (tipo, desconto, promocao) values ("Hidraulica", false, false);

-- Criando os Produtos  --
insert into tb_produto (nome, preco, qtProduto, em_estoque, marca_conhecida, categoria_id) 
values ("Alicate", 70.00, 60, true, true, 1);
insert into tb_produto (nome, preco, qtProduto, em_estoque, marca_conhecida, categoria_id) 
values ("tijolo", 23.00, 200, true, true, 2);
insert into tb_produto (nome, preco, qtProduto, em_estoque, marca_conhecida, categoria_id)  
values ("Marreta", 40.00, 270, true, false, 1);
insert into tb_produto (nome, preco, qtProduto, em_estoque, marca_conhecida, categoria_id)  
values ("Moldura", 70.00, 54, true, false, 3);
insert into tb_produto (nome, preco, qtProduto, em_estoque, marca_conhecida, categoria_id)  
values ("Fiaçao", 17.70, 100, true, false, 4);
insert into tb_produto (nome, preco, qtProduto, em_estoque, marca_conhecida, categoria_id) 
values ("Cano ", 45.90, 500, true, true, 5);
insert into tb_produto (nome, preco, qtProduto, em_estoque, marca_conhecida, categoria_id) 
values ("Massa Corrida", 30.00, 60, true, true, 2);
insert into tb_produto (nome, preco, qtProduto, em_estoque, marca_conhecida, categoria_id) 
values ("Cimento", 20.00, 88, true, true, 2);

-- comando selecione produto com valor maior que 50 --
select * from tb_produto where preco > 50.00;

-- comando selecione produto com valor entre 3 a 60 --
select * from tb_produto where preco between 03.00 AND 60.00;

-- Buscar produto com a letra C no nome --
select * from tb_produto where nome Like "%C%";

-- Inner Join --
select * from tb_produto inner join tb_categoria
on tb_produto.categoria_id = tb_categoria.id;

-- Selecione produto de um determinado tipo --
select tb_produto.nome, tb_produto.preco, tb_produto.em_estoque, tb_categoria.tipo, tb_categoria.desconto, tb_categoria.promocao from tb_produto inner join tb_categoria 
on tb_produto.categoria_id = tb_categoria.id
where tb_categoria.id = 2;