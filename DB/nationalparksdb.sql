-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema nationalparksdb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `nationalparksdb` ;

-- -----------------------------------------------------
-- Schema nationalparksdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `nationalparksdb` DEFAULT CHARACTER SET utf8 ;
USE `nationalparksdb` ;

-- -----------------------------------------------------
-- Table `national_park`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `national_park` ;

CREATE TABLE IF NOT EXISTS `national_park` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `description` TEXT NULL,
  `year_established` INT NULL,
  `state` VARCHAR(100) NULL,
  `longitude` DOUBLE NULL,
  `latitude` DOUBLE NULL,
  `price_of_entry` DECIMAL(8,2) NULL,
  `website_url` VARCHAR(200) NULL,
  `image_url` VARCHAR(2000) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `flora_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `flora_type` ;

CREATE TABLE IF NOT EXISTS `flora_type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL,
  `description` VARCHAR(250) NULL,
  `image_url` VARCHAR(2000) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `flora`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `flora` ;

CREATE TABLE IF NOT EXISTS `flora` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `species` VARCHAR(45) NULL,
  `flora_type_id` INT NOT NULL,
  `image_url` VARCHAR(2000) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_flora_flora_type1_idx` (`flora_type_id` ASC) VISIBLE,
  CONSTRAINT `fk_flora_flora_type1`
    FOREIGN KEY (`flora_type_id`)
    REFERENCES `flora_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `national_park_has_flora`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `national_park_has_flora` ;

CREATE TABLE IF NOT EXISTS `national_park_has_flora` (
  `national_parks_id` INT NOT NULL,
  `flora_id` INT NOT NULL,
  PRIMARY KEY (`national_parks_id`, `flora_id`),
  INDEX `fk_national_parks_has_flora_flora1_idx` (`flora_id` ASC) VISIBLE,
  INDEX `fk_national_parks_has_flora_national_parks_idx` (`national_parks_id` ASC) VISIBLE,
  CONSTRAINT `fk_national_parks_has_flora_national_parks`
    FOREIGN KEY (`national_parks_id`)
    REFERENCES `national_park` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_national_parks_has_flora_flora1`
    FOREIGN KEY (`flora_id`)
    REFERENCES `flora` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `animal_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `animal_type` ;

CREATE TABLE IF NOT EXISTS `animal_type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL,
  `description` VARCHAR(250) NULL,
  `image_url` VARCHAR(2000) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `animal`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `animal` ;

CREATE TABLE IF NOT EXISTS `animal` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `animal_type_id` INT NOT NULL,
  `endangered` TINYINT NULL,
  `image_url` VARCHAR(2000) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_animal_animal_type1_idx` (`animal_type_id` ASC) VISIBLE,
  CONSTRAINT `fk_animal_animal_type1`
    FOREIGN KEY (`animal_type_id`)
    REFERENCES `animal_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `national_park_has_animal`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `national_park_has_animal` ;

CREATE TABLE IF NOT EXISTS `national_park_has_animal` (
  `national_park_id` INT NOT NULL,
  `animal_id` INT NOT NULL,
  PRIMARY KEY (`national_park_id`, `animal_id`),
  INDEX `fk_national_park_has_animal_animal1_idx` (`animal_id` ASC) VISIBLE,
  INDEX `fk_national_park_has_animal_national_park1_idx` (`national_park_id` ASC) VISIBLE,
  CONSTRAINT `fk_national_park_has_animal_national_park1`
    FOREIGN KEY (`national_park_id`)
    REFERENCES `national_park` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_national_park_has_animal_animal1`
    FOREIGN KEY (`animal_id`)
    REFERENCES `animal` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountain`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mountain` ;

CREATE TABLE IF NOT EXISTS `mountain` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `description` TEXT NULL,
  `latitude` DOUBLE NULL,
  `longitude` DOUBLE NULL,
  `elevation_in_meters` INT NULL,
  `average_snowfall_in_inches` VARCHAR(45) NULL,
  `image_url` VARCHAR(2000) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `national_park_has_mountain`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `national_park_has_mountain` ;

CREATE TABLE IF NOT EXISTS `national_park_has_mountain` (
  `national_park_id` INT NOT NULL,
  `mountain_id` INT NOT NULL,
  PRIMARY KEY (`national_park_id`, `mountain_id`),
  INDEX `fk_national_park_has_mountain_mountain1_idx` (`mountain_id` ASC) VISIBLE,
  INDEX `fk_national_park_has_mountain_national_park1_idx` (`national_park_id` ASC) VISIBLE,
  CONSTRAINT `fk_national_park_has_mountain_national_park1`
    FOREIGN KEY (`national_park_id`)
    REFERENCES `national_park` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_national_park_has_mountain_mountain1`
    FOREIGN KEY (`mountain_id`)
    REFERENCES `mountain` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `enabled` TINYINT NULL,
  `role` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `point_of_interest`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `point_of_interest` ;

CREATE TABLE IF NOT EXISTS `point_of_interest` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL,
  `description` TEXT NULL,
  `longitude` DOUBLE NULL,
  `latitude` DOUBLE NULL,
  `image_url` VARCHAR(2000) NULL,
  `national_park_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `create_date` DATETIME NULL,
  `last_update` DATETIME NULL,
  `enabled` TINYINT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_point_of_interest_national_park1_idx` (`national_park_id` ASC) VISIBLE,
  INDEX `fk_point_of_interest_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_point_of_interest_national_park1`
    FOREIGN KEY (`national_park_id`)
    REFERENCES `national_park` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_point_of_interest_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trail`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `trail` ;

CREATE TABLE IF NOT EXISTS `trail` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL,
  `description` TEXT NULL,
  `longitude` DOUBLE NULL,
  `latitude` DOUBLE NULL,
  `length_in_miles` INT NULL,
  `trail_difficulty` INT NULL,
  `trail_map` VARCHAR(2000) NULL,
  `national_park_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `create_date` DATETIME NULL,
  `last_update` DATETIME NULL,
  `enabled` TINYINT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_trails_national_park1_idx` (`national_park_id` ASC) VISIBLE,
  INDEX `fk_trail_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_trails_national_park1`
    FOREIGN KEY (`national_park_id`)
    REFERENCES `national_park` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_trail_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tour`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tour` ;

CREATE TABLE IF NOT EXISTS `tour` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL,
  `description` TEXT NULL,
  `guided` TINYINT NULL,
  `length_in_hours` INT NULL,
  `cost` DECIMAL(8,2) NULL,
  `national_park_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_tour_national_park1_idx` (`national_park_id` ASC) VISIBLE,
  CONSTRAINT `fk_tour_national_park1`
    FOREIGN KEY (`national_park_id`)
    REFERENCES `national_park` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trail_comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `trail_comment` ;

CREATE TABLE IF NOT EXISTS `trail_comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `create_date` DATETIME NULL,
  `last_update` DATETIME NULL,
  `content` TEXT NOT NULL,
  `image_url` VARCHAR(2000) NULL,
  `user_id` INT NOT NULL,
  `trail_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_trail_comment_user1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_trail_comment_trail1_idx` (`trail_id` ASC) VISIBLE,
  CONSTRAINT `fk_trail_comment_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_trail_comment_trail1`
    FOREIGN KEY (`trail_id`)
    REFERENCES `trail` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `point_of_interest_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `point_of_interest_type` ;

CREATE TABLE IF NOT EXISTS `point_of_interest_type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL,
  `description` TEXT NULL,
  `image_url` VARCHAR(2000) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `point_of_interest_has_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `point_of_interest_has_type` ;

CREATE TABLE IF NOT EXISTS `point_of_interest_has_type` (
  `point_of_interest_type_id` INT NOT NULL,
  `point_of_interest_id` INT NOT NULL,
  PRIMARY KEY (`point_of_interest_type_id`, `point_of_interest_id`),
  INDEX `fk_point_of_interest_type_has_point_of_interest_point_of_in_idx` (`point_of_interest_id` ASC) VISIBLE,
  INDEX `fk_point_of_interest_type_has_point_of_interest_point_of_in_idx1` (`point_of_interest_type_id` ASC) VISIBLE,
  CONSTRAINT `fk_point_of_interest_type_has_point_of_interest_point_of_inte1`
    FOREIGN KEY (`point_of_interest_type_id`)
    REFERENCES `point_of_interest_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_point_of_interest_type_has_point_of_interest_point_of_inte2`
    FOREIGN KEY (`point_of_interest_id`)
    REFERENCES `point_of_interest` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `poi_comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `poi_comment` ;

CREATE TABLE IF NOT EXISTS `poi_comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `create_date` DATETIME NULL,
  `last_update` DATETIME NULL,
  `content` TEXT NOT NULL,
  `image_url` VARCHAR(2000) NULL,
  `user_id` INT NOT NULL,
  `point_of_interest_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_trail_comment_user1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_poi_comment_point_of_interest1_idx` (`point_of_interest_id` ASC) VISIBLE,
  CONSTRAINT `fk_trail_comment_user10`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_poi_comment_point_of_interest1`
    FOREIGN KEY (`point_of_interest_id`)
    REFERENCES `point_of_interest` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `national_park_comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `national_park_comment` ;

CREATE TABLE IF NOT EXISTS `national_park_comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `create_date` DATETIME NULL,
  `last_update` DATETIME NULL,
  `content` TEXT NOT NULL,
  `image_url` VARCHAR(2000) NULL,
  `user_id` INT NOT NULL,
  `national_park_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_trail_comment_user1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_national_park_comment_national_park1_idx` (`national_park_id` ASC) VISIBLE,
  CONSTRAINT `fk_trail_comment_user100`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_national_park_comment_national_park1`
    FOREIGN KEY (`national_park_id`)
    REFERENCES `national_park` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS nationalparksuser@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'nationalparksuser'@'localhost' IDENTIFIED BY 'nationalparksuser';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'nationalparksuser'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `national_park`
-- -----------------------------------------------------
START TRANSACTION;
USE `nationalparksdb`;
INSERT INTO `national_park` (`id`, `name`, `description`, `year_established`, `state`, `longitude`, `latitude`, `price_of_entry`, `website_url`, `image_url`) VALUES (1, 'Rocky Mountain', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `flora_type`
-- -----------------------------------------------------
START TRANSACTION;
USE `nationalparksdb`;
INSERT INTO `flora_type` (`id`, `name`, `description`, `image_url`) VALUES (1, 'Tree', NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `flora`
-- -----------------------------------------------------
START TRANSACTION;
USE `nationalparksdb`;
INSERT INTO `flora` (`id`, `name`, `species`, `flora_type_id`, `image_url`) VALUES (1, 'Maple Tree', '0', 1, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `animal_type`
-- -----------------------------------------------------
START TRANSACTION;
USE `nationalparksdb`;
INSERT INTO `animal_type` (`id`, `name`, `description`, `image_url`) VALUES (1, 'Mammal', NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `animal`
-- -----------------------------------------------------
START TRANSACTION;
USE `nationalparksdb`;
INSERT INTO `animal` (`id`, `name`, `animal_type_id`, `endangered`, `image_url`) VALUES (1, 'American Black Bear', 1, 0, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mountain`
-- -----------------------------------------------------
START TRANSACTION;
USE `nationalparksdb`;
INSERT INTO `mountain` (`id`, `description`, `latitude`, `longitude`, `elevation_in_meters`, `average_snowfall_in_inches`, `image_url`) VALUES (1, 'Mountain', 1, 1, 1, 'one', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `nationalparksdb`;
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`) VALUES (1, 'admin', 'admin', 1, 'admin');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`) VALUES (2, 'user', 'user', 1, 'user');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`) VALUES (3, 't', 't', 1, 't');

COMMIT;


-- -----------------------------------------------------
-- Data for table `point_of_interest`
-- -----------------------------------------------------
START TRANSACTION;
USE `nationalparksdb`;
INSERT INTO `point_of_interest` (`id`, `name`, `description`, `longitude`, `latitude`, `image_url`, `national_park_id`, `user_id`, `create_date`, `last_update`, `enabled`) VALUES (1, 'Mariposa Grove', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `trail`
-- -----------------------------------------------------
START TRANSACTION;
USE `nationalparksdb`;
INSERT INTO `trail` (`id`, `name`, `description`, `longitude`, `latitude`, `length_in_miles`, `trail_difficulty`, `trail_map`, `national_park_id`, `user_id`, `create_date`, `last_update`, `enabled`) VALUES (1, 'Alpine Ridge Trail', NULL, NULL, NULL, 45, NULL, NULL, 1, 1, NULL, NULL, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `tour`
-- -----------------------------------------------------
START TRANSACTION;
USE `nationalparksdb`;
INSERT INTO `tour` (`id`, `name`, `description`, `guided`, `length_in_hours`, `cost`, `national_park_id`) VALUES (DEFAULT, NULL, NULL, NULL, NULL, NULL, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `trail_comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `nationalparksdb`;
INSERT INTO `trail_comment` (`id`, `create_date`, `last_update`, `content`, `image_url`, `user_id`, `trail_id`) VALUES (1, '2024-08-23', NULL, '1', NULL, 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `point_of_interest_type`
-- -----------------------------------------------------
START TRANSACTION;
USE `nationalparksdb`;
INSERT INTO `point_of_interest_type` (`id`, `name`, `description`, `image_url`) VALUES (1, 'Visitor Center', NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `poi_comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `nationalparksdb`;
INSERT INTO `poi_comment` (`id`, `create_date`, `last_update`, `content`, `image_url`, `user_id`, `point_of_interest_id`) VALUES (1, '2024-08-23', NULL, '1', NULL, 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `national_park_comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `nationalparksdb`;
INSERT INTO `national_park_comment` (`id`, `create_date`, `last_update`, `content`, `image_url`, `user_id`, `national_park_id`) VALUES (1, '2024-08-23', NULL, '1', NULL, 1, 1);

COMMIT;

