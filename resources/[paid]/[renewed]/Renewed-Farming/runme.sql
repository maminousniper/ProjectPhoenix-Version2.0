CREATE TABLE `farms` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`x` FLOAT NULL DEFAULT NULL,
	`y` FLOAT NULL DEFAULT NULL,
	`z` FLOAT NULL DEFAULT NULL,
	`heading` FLOAT NULL DEFAULT NULL,
	`spots` LONGTEXT NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=1;