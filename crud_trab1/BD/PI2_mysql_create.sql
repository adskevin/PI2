CREATE TABLE `usuario` (
	`id_usuario` INT(30) NOT NULL AUTO_INCREMENT,
	`nome_usuario` VARCHAR(100) NOT NULL,
	`nick` VARCHAR(20) NOT NULL UNIQUE,
	`senha` VARCHAR(30) NOT NULL,
	PRIMARY KEY (`id_usuario`)
);

CREATE TABLE `campanha` (
	`id_campanha` INT(30) NOT NULL AUTO_INCREMENT,
	`nome_campanha` VARCHAR(30) NOT NULL,
	`descr_campanha` TEXT NOT NULL,
	`id_mestre` INT(30) NOT NULL,
	PRIMARY KEY (`id_campanha`)
);

CREATE TABLE `usuario_campanha` (
	`id_campanha_usuario` INT(30) NOT NULL AUTO_INCREMENT,
	`id_campanha` INT(30) NOT NULL,
	`id_usuario` INT(30) NOT NULL,
	PRIMARY KEY (`id_campanha_usuario`)
);

CREATE TABLE `convite` (
	`id_convite` INT(30) NOT NULL AUTO_INCREMENT,
	`id_usuario` INT(30) NOT NULL,
	`id_campanha` INT(30) NOT NULL,
	`status` BOOLEAN NOT NULL,
	PRIMARY KEY (`id_convite`)
);

ALTER TABLE `campanha` ADD CONSTRAINT `campanha_fk0` FOREIGN KEY (`id_mestre`) REFERENCES `usuario`(`id_usuario`);

ALTER TABLE `usuario_campanha` ADD CONSTRAINT `usuario_campanha_fk0` FOREIGN KEY (`id_campanha`) REFERENCES `campanha`(`id_campanha`);

ALTER TABLE `usuario_campanha` ADD CONSTRAINT `usuario_campanha_fk1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario`(`id_usuario`);

ALTER TABLE `convite` ADD CONSTRAINT `convite_fk0` FOREIGN KEY (`id_usuario`) REFERENCES `usuario`(`id_usuario`);

ALTER TABLE `convite` ADD CONSTRAINT `convite_fk1` FOREIGN KEY (`id_campanha`) REFERENCES `campanha`(`id_campanha`);

