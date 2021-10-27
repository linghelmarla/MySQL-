create database db_blog_pessoal;
use db_blog_pessoal;
CREATE TABLE `Temas` (
	`id` bigint(255) NOT NULL AUTO_INCREMENT,
	`descriçao` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Postagens` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`titulo` varchar(255) NOT NULL,
	`texto` varchar(1000) NOT NULL,
	`data` TIMESTAMP(255) NOT NULL,
	`tema_id` bigint NOT NULL,
	`usuario_id` bigint NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `usuario` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`nome` varchar(255) NOT NULL,
	`usuario` varchar(255) NOT NULL,
	`senha` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
);

ALTER TABLE `Postagens` ADD CONSTRAINT `Postagens_fk0` FOREIGN KEY (`tema_id`) REFERENCES `Temas`(`id`);

ALTER TABLE `Postagens` ADD CONSTRAINT `Postagens_fk1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario`(`id`);



