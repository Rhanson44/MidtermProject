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
  `state` VARCHAR(100) NULL,
  `year_established` INT NULL,
  `img_url` VARCHAR(2000) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `flora`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `flora` ;

CREATE TABLE IF NOT EXISTS `flora` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `type` VARCHAR(100) NULL,
  `species` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
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
-- Table `animal`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `animal` ;

CREATE TABLE IF NOT EXISTS `animal` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `type` VARCHAR(45) NULL,
  `endangered` TINYINT NULL,
  PRIMARY KEY (`id`))
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
  `name` VARCHAR(100) NOT NULL,
  `elevation` INT NULL,
  `average_snowfall` VARCHAR(45) NULL,
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
-- Table `points_of_interest`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `points_of_interest` ;

CREATE TABLE IF NOT EXISTS `points_of_interest` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL,
  `type` VARCHAR(100) NULL,
  `longitude` INT NULL,
  `latitude` INT NULL,
  `img_url` VARCHAR(2000) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `national_park_has_points_of_interest`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `national_park_has_points_of_interest` ;

CREATE TABLE IF NOT EXISTS `national_park_has_points_of_interest` (
  `national_park_id` INT NOT NULL,
  `points_of_interest_id` INT NOT NULL,
  PRIMARY KEY (`national_park_id`, `points_of_interest_id`),
  INDEX `fk_national_park_has_points_of_interest_points_of_interest1_idx` (`points_of_interest_id` ASC) VISIBLE,
  INDEX `fk_national_park_has_points_of_interest_national_park1_idx` (`national_park_id` ASC) VISIBLE,
  CONSTRAINT `fk_national_park_has_points_of_interest_national_park1`
    FOREIGN KEY (`national_park_id`)
    REFERENCES `national_park` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_national_park_has_points_of_interest_points_of_interest1`
    FOREIGN KEY (`points_of_interest_id`)
    REFERENCES `points_of_interest` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trails`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `trails` ;

CREATE TABLE IF NOT EXISTS `trails` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `national_park_id` INT NOT NULL,
  `name` VARCHAR(100) NULL,
  `trail_length` INT NULL,
  `trail_difficulty` VARCHAR(45) NULL,
  `trail_map` VARCHAR(2000) NULL,
  PRIMARY KEY (`id`, `national_park_id`),
  INDEX `fk_trails_national_park1_idx` (`national_park_id` ASC) VISIBLE,
  CONSTRAINT `fk_trails_national_park1`
    FOREIGN KEY (`national_park_id`)
    REFERENCES `national_park` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `login`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `login` ;

CREATE TABLE IF NOT EXISTS `login` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  `active` TINYINT NULL,
  `role` VARCHAR(45) NULL,
  `first_name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
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

SET SQL_MODE = '';
DROP USER IF EXISTS nationalparksuser@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'nationalparksuser'@'localhost' IDENTIFIED BY 'nationalparksuser';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'nationalparksuser'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `flora`
-- -----------------------------------------------------
START TRANSACTION;
USE `nationalparksdb`;
INSERT INTO `flora` (`id`, `name`, `type`, `species`) VALUES (1, 'American Black Bear', 'Mammal', '0');
INSERT INTO `flora` (`id`, `name`, `type`, `species`) VALUES (2, 'California Condor', 'Bird', '1');
INSERT INTO `flora` (`id`, `name`, `type`, `species`) VALUES (3, 'North American Elk', 'Mammal', '0');
INSERT INTO `flora` (`id`, `name`, `type`, `species`) VALUES (4, 'Mountain Lion', 'Mammal', '0');
INSERT INTO `flora` (`id`, `name`, `type`, `species`) VALUES (5, 'Southern Appalachian Salamander', 'Amphibian', '0');
INSERT INTO `flora` (`id`, `name`, `type`, `species`) VALUES (6, 'North Atlantic Right Whale', 'Mammal', '0');
INSERT INTO `flora` (`id`, `name`, `type`, `species`) VALUES (7, 'American Bison', 'Mammal', '0');
INSERT INTO `flora` (`id`, `name`, `type`, `species`) VALUES (8, 'Northern Spotted Owl', 'Bird', '1');
INSERT INTO `flora` (`id`, `name`, `type`, `species`) VALUES (9, 'Moose', 'Mammal', '0');
INSERT INTO `flora` (`id`, `name`, `type`, `species`) VALUES (10, 'Coyote', ' Mammal', '0');

COMMIT;


-- -----------------------------------------------------
-- Data for table `animal`
-- -----------------------------------------------------
START TRANSACTION;
USE `nationalparksdb`;
INSERT INTO `animal` (`id`, `name`, `type`, `endangered`) VALUES (1, 'American Black Bear', 'Mammal', 0);
INSERT INTO `animal` (`id`, `name`, `type`, `endangered`) VALUES (2, 'California Condor', 'Bird', 1);
INSERT INTO `animal` (`id`, `name`, `type`, `endangered`) VALUES (3, 'North American Elk', 'Mammal', 0);
INSERT INTO `animal` (`id`, `name`, `type`, `endangered`) VALUES (4, 'Mountain Lion', 'Mammal', 0);
INSERT INTO `animal` (`id`, `name`, `type`, `endangered`) VALUES (5, 'Southern Appalachian Salamander', 'Amphibian', 0);
INSERT INTO `animal` (`id`, `name`, `type`, `endangered`) VALUES (6, 'North Atlantic Right Whale', 'Mammal', 0);
INSERT INTO `animal` (`id`, `name`, `type`, `endangered`) VALUES (7, 'American Bison', 'Mammal', 0);
INSERT INTO `animal` (`id`, `name`, `type`, `endangered`) VALUES (8, 'Northern Spotted Owl', 'Bird', 1);
INSERT INTO `animal` (`id`, `name`, `type`, `endangered`) VALUES (9, 'Moose', 'Mammal', 0);
INSERT INTO `animal` (`id`, `name`, `type`, `endangered`) VALUES (10, 'Coyote', ' Mammal', 0);
INSERT INTO `animal` (`id`, `name`, `type`, `endangered`) VALUES (11, 'Bighorn Sheep', 'Mammal', 0);
INSERT INTO `animal` (`id`, `name`, `type`, `endangered`) VALUES (12, 'Mule Deer', 'Mammal', 0);

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `nationalparksdb`;
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`) VALUES (1, 'admin', 'test', 1, NULL);

COMMIT;

