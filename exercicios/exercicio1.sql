-- criando o banco de dados --
create database db_generation_game_online;

-- Criando Tabelas --
use db_generation_game_online;
create table tb_classe (
	id bigint(5) auto_increment,
    nome varchar (300) not null,
    equipamentos varchar (300),
    vestimenta varchar(300) not null,
     primary key (id)
);


create table tb_personagem (
	id bigint(5) auto_increment,
	nome varchar (300) not null,
    altura decimal(10,2) not null,
    genero varchar (300) not null,
    raca varchar (300) not null,
    deseja_a_coroa boolean not null,
    poder_de_ataque int not null,
    poder_de_defesa int not null,
    classe_id bigint,
    primary key (id),
    foreign KEY (classe_id) REFERENCES tb_classe (id)
);

-- Criando as Classes --
insert into tb_classe(nome, equipamentos, vestimenta) values ("Mago", "Varinha", "Manto");
insert into tb_classe(nome, equipamentos, vestimenta) values ("Guerreiro", "Scudo", "Tanga");
insert into tb_classe(nome, equipamentos, vestimenta) values ("Paladino", "Lança", "Armadura");
insert into tb_classe(nome, equipamentos, vestimenta) values ("Fada", "Po Magico", "Vestido");
insert into tb_classe(nome, equipamentos, vestimenta) values ("Druida", "Cajado", "Capa");

-- Criando os Personagens  --
insert into tb_personagem(nome, altura, genero, raca, deseja_a_coroa, poder_de_ataque, poder_de_defesa, classe_id)
values ("Bruno", 1.92, "Masculino", "Humano", true, 3000, 3000, 1);
insert into tb_personagem(nome, altura, genero, raca, deseja_a_coroa, poder_de_ataque, poder_de_defesa, classe_id)
values ("Denis", 1.75, "Masculino", "Elfo Negro", true, 9999, 200, 2);
insert into tb_personagem(nome, altura, genero, raca, deseja_a_coroa, poder_de_ataque, poder_de_defesa, classe_id)
values ("Paulo", 1.42, "Masculino", "Anão", true, 1500, 1000, 3);
insert into tb_personagem(nome, altura, genero, raca, deseja_a_coroa, poder_de_ataque, poder_de_defesa, classe_id)
values ("Catarina", 1.70, "Feminino", "Nordica", true, 1700, 3000, 2);
insert into tb_personagem(nome, altura, genero, raca, deseja_a_coroa, poder_de_ataque, poder_de_defesa, classe_id)
values ("Lin", 1.75, "Feminino", "Elfa da Floresta", true, 1700, 3000, 5);
insert into tb_personagem(nome, altura, genero, raca, deseja_a_coroa, poder_de_ataque, poder_de_defesa, classe_id)
values ("Rafa", 1.32, "Masculino", "Homem Fera", true, 1000, 500, 1);
insert into tb_personagem(nome, altura, genero, raca, deseja_a_coroa, poder_de_ataque, poder_de_defesa, classe_id)
values ("Leandro Matrix", 1.70, "Masculino", "Robô", true, 1200, 750, 4);
insert into tb_personagem(nome, altura, genero, raca, deseja_a_coroa, poder_de_ataque, poder_de_defesa, classe_id)
values ("Jess", 1.67, "Feminino", "Humano", true, 1475, 600, 4);

-- comando selecionar poder de ataque maior que 2000 --
select * from tb_personagem where poder_de_ataque > 2000;

-- comando selecionar poder de defesa entre 1000 a 2000 --
select * from tb_personagem where poder_de_defesa between 1000 and 2000;

-- Buscar personagens com a letra C no nome --
select * from tb_personagem where nome Like "%C%";

-- Inner Join --
select tb_personagem.nome, tb_personagem.genero, tb_personagem.raca, tb_classe.nome as classe, tb_classe.equipamentos as equipamentos
 from tb_personagem inner join tb_classe on  tb_classe.id = tb_personagem.classe_id;

-- Selecione personagens de uma determinada Classe --
select tb_personagem.nome, tb_classe.nome from tb_personagem inner join tb_classe
on tb_personagem.classe_id = tb_classe.id
where tb_classe.id = 2;