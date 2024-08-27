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
  `image_url` VARCHAR(2000) NULL,
  `longitude` DOUBLE NULL,
  `latitude` DOUBLE NULL,
  `price_of_entry` DECIMAL(8,2) NULL,
  `website_url` VARCHAR(200) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `flora_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `flora_type` ;

CREATE TABLE IF NOT EXISTS `flora_type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL,
  `description` TEXT NULL,
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
  `name` VARCHAR(100) NULL,
  `elevation_in_meters` INT NULL,
  `average_snowfall_in_inches` VARCHAR(45) NULL,
  `longitude` DOUBLE NULL,
  `latitude` DOUBLE NULL,
  `image_url` VARCHAR(2000) NULL,
  `description` TEXT NULL,
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
  `user_id` INT NULL,
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
  `length_in_miles` DOUBLE NULL,
  `trail_difficulty` VARCHAR(30) NULL,
  `trail_map` VARCHAR(2000) NULL,
  `description` TEXT NULL,
  `latitude` DOUBLE NULL,
  `longitude` DOUBLE NULL,
  `national_park_id` INT NOT NULL,
  `user_id` INT NULL,
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
INSERT INTO `national_park` (`id`, `name`, `description`, `state`, `year_established`, `image_url`, `longitude`, `latitude`, `price_of_entry`, `website_url`) VALUES (1, 'Yosemite National Park', 'Located in California\'s Sierra Nevada mountains, known for its waterfalls, giant sequoias, and granite cliffs.', 'California', 1890, 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/13/Tunnel_View%2C_Yosemite_Valley%2C_Yosemite_NP_-_Diliff.jpg/568px-Tunnel_View%2C_Yosemite_Valley%2C_Yosemite_NP_-_Diliff.jpg', 37.8651, -119.5383, 35.00, 'https://www.nps.gov/yose/index.htm');
INSERT INTO `national_park` (`id`, `name`, `description`, `state`, `year_established`, `image_url`, `longitude`, `latitude`, `price_of_entry`, `website_url`) VALUES (2, 'Zion National Park', 'Situated in southwestern Utah, famous for its steep red cliffs, slot canyons, and scenic drives.', 'Utah', 1919, 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/10/Zion_angels_landing_view.jpg/568px-Zion_angels_landing_view.jpg', 37.2982, -113.0263, 35.00, 'https://www.nps.gov/zion/index.htm');
INSERT INTO `national_park` (`id`, `name`, `description`, `state`, `year_established`, `image_url`, `longitude`, `latitude`, `price_of_entry`, `website_url`) VALUES (3, 'Glacier National Park', 'Located in Montana, known for its rugged mountains, diverse wildlife, and historic Going-to-the-Sun Road.', 'Montana', 1910, 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/51/Mountain_Goat_at_Hidden_Lake.jpg/2560px-Mountain_Goat_at_Hidden_Lake.jpg', 48.7596, -113.787, 35.00, 'https://www.nps.gov/glac/index.htm');
INSERT INTO `national_park` (`id`, `name`, `description`, `state`, `year_established`, `image_url`, `longitude`, `latitude`, `price_of_entry`, `website_url`) VALUES (4, 'Grand Canyon National Park', 'Spanning across Arizona, known for its immense size, layered red rock formations, and Colorado River views.', 'Arizona', 1919, 'https://upload.wikimedia.org/wikipedia/commons/a/aa/Dawn_on_the_S_rim_of_the_Grand_Canyon_%288645178272%29.jpg', 36.1069, -112.1129, 35.00, 'https://www.nps.gov/grca/index.htm');
INSERT INTO `national_park` (`id`, `name`, `description`, `state`, `year_established`, `image_url`, `longitude`, `latitude`, `price_of_entry`, `website_url`) VALUES (5, 'Great Smoky Mountains National Park', 'Located in Tennessee and North Carolina, famous for its mist-covered mountains, diverse plant life, and wildlife.', 'Tennessee', 1934, 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/View_atop_Cliff_Tops_on_Mount_LeConte%2C_GSMNP%2C_TN.jpg/2560px-View_atop_Cliff_Tops_on_Mount_LeConte%2C_GSMNP%2C_TN.jpg', 35.6118, -83.4895, 25.00, 'https://www.nps.gov/grsm/index.htm');
INSERT INTO `national_park` (`id`, `name`, `description`, `state`, `year_established`, `image_url`, `longitude`, `latitude`, `price_of_entry`, `website_url`) VALUES (6, 'Acadia National Park', 'Situated in Maine, known for its rocky coastline, forests, and the highest point on the U.S. Atlantic coast.', 'Maine', 1919, 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/76/Bass_Harbor_Lighthouse_b.jpg/2560px-Bass_Harbor_Lighthouse_b.jpg', 44.3386, -68.2733, 30.00, 'https://www.nps.gov/acad/index.htm');
INSERT INTO `national_park` (`id`, `name`, `description`, `state`, `year_established`, `image_url`, `longitude`, `latitude`, `price_of_entry`, `website_url`) VALUES (7, 'Yellowstone National Park', 'Primarily in Wyoming, known for its geothermal features, including Old Faithful geyser and the Yellowstone Caldera.', 'Wyoming', 1872, 'https://upload.wikimedia.org/wikipedia/commons/7/73/Grand_Canyon_of_yellowstone.jpg', 44.428, -110.5885, 35.00, 'https://www.nps.gov/yell/index.htm');
INSERT INTO `national_park` (`id`, `name`, `description`, `state`, `year_established`, `image_url`, `longitude`, `latitude`, `price_of_entry`, `website_url`) VALUES (8, 'Olympic National Park', 'Located in Washington, known for its diverse ecosystems, including temperate rainforests, alpine peaks, and coastal areas.', 'Washington', 1938, 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a8/Cedar_Creek_Abbey_Island_Ruby_Beach.jpg/2560px-Cedar_Creek_Abbey_Island_Ruby_Beach.jpg', 47.8021, -123.4168, 30.00, 'https://www.nps.gov/olym/index.htm');
INSERT INTO `national_park` (`id`, `name`, `description`, `state`, `year_established`, `image_url`, `longitude`, `latitude`, `price_of_entry`, `website_url`) VALUES (9, 'Grand Teton National Park', 'n Wyoming, features the majestic Teton Range, with sharp peaks, alpine lakes, and abundant wildlife.', 'Wyoming', 1929, 'https://upload.wikimedia.org/wikipedia/commons/d/d0/Barns_grand_tetons.jpg', 43.7904, -110.6818, 35.00, 'https://www.nps.gov/grte/index.htm');
INSERT INTO `national_park` (`id`, `name`, `description`, `state`, `year_established`, `image_url`, `longitude`, `latitude`, `price_of_entry`, `website_url`) VALUES (10, 'Rocky Mountain National Park', 'In Colorado, known for its towering peaks, alpine tundra, and scenic drives on Trail Ridge Road.', 'Colorado', 1915, 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3e/Rocky_Mountain_National_Park_in_September_2011_-_Glacier_Gorge_from_Bear_Lake.JPG/1920px-Rocky_Mountain_National_Park_in_September_2011_-_Glacier_Gorge_from_Bear_Lake.JPG', 40.3428, -105.6836, 35.00, 'https://www.nps.gov/romo/index.htm');
INSERT INTO `national_park` (`id`, `name`, `description`, `state`, `year_established`, `image_url`, `longitude`, `latitude`, `price_of_entry`, `website_url`) VALUES (11, 'Arches National Park', 'Located in Utah, famous for its over 2,000 natural stone arches, red rock formations, and desert landscapes.', 'Utah', 1971, 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/Landscape_Arch_Utah.jpg/2560px-Landscape_Arch_Utah.jpg', 38.7331, -109.5925, 30.00, 'https://www.nps.gov/arch/index.htm');
INSERT INTO `national_park` (`id`, `name`, `description`, `state`, `year_established`, `image_url`, `longitude`, `latitude`, `price_of_entry`, `website_url`) VALUES (12, 'Bryce Canyon National Park', 'Situated in Utah, known for its distinctive hoodoos, amphitheaters, and scenic vistas of red, orange, and white rock.', 'Utah', 1928, 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Inspiration_Point_Bryce_Canyon_November_2018_panorama.jpg/2560px-Inspiration_Point_Bryce_Canyon_November_2018_panorama.jpg', 37.593, -112.1871, 35.00, 'https://www.nps.gov/brca/index.htm');

COMMIT;


-- -----------------------------------------------------
-- Data for table `flora_type`
-- -----------------------------------------------------
START TRANSACTION;
USE `nationalparksdb`;
INSERT INTO `flora_type` (`id`, `name`, `description`, `image_url`) VALUES (1, 'Tree', 'In biology, a tree is a tall, free-standing plant with a woody stem and branches that support leaves, and a root system that anchors the stem and provides water and nutrients. Trees are the largest organisms on Earth that are not supported by anything else. They are also perennial, meaning they regularly renew their growth. The definition of a tree can vary, with some definitions being narrower and others being wider. For example, a narrower definition might only include woody plants that can be used as lumber, or plants that are above a certain height. A wider definition might include taller palms, tree ferns, bananas, and bamboos.', 'https://cdn.britannica.com/98/214598-050-9879F2FA/giant-sequoia-tree-Sequoia-National-Park-California.jpg');
INSERT INTO `flora_type` (`id`, `name`, `description`, `image_url`) VALUES (2, 'Shrub', 'A shrub is a woody plant that is smaller than a tree and typically has multiple stems or branches growing from the base. Unlike trees, shrubs usually have a bushy, dense appearance and can range in height from just a few inches to several feet tall. They can have various shapes, including rounded, oval, or spreading forms. Shrubs often have a variety of foliage, including evergreen leaves that stay green year-round or deciduous leaves that change color and fall off in the autumn. Their flowers, if present, can be quite diverse, ranging from small and subtle to large and showy. Some shrubs also produce berries or other fruits that attract wildlife.', 'https://cdn.prod.website-files.com/623de0e9fe0f9c6ed17335ad/62e9a44e1bd1f52b05718195_GettyImages-493238552-9772c8d6c81f48be8f9360881f811a29.jpg');
INSERT INTO `flora_type` (`id`, `name`, `description`, `image_url`) VALUES (3, 'Flower', 'A flower is the reproductive structure of flowering plants, often celebrated for its beauty and variety. Typically, it contains several parts, such as petals, sepals, stamens, pistil, and ovary. Flowers come in an astonishing array of shapes, sizes, and colors, each adapted to attract specific types of pollinators and fulfill different ecological roles. Beyond their reproductive function, flowers often have cultural and symbolic meanings and are widely used in decoration, ceremonies, and as expressions of emotion.', 'https://as1.ftcdn.net/v2/jpg/02/76/33/60/1000_F_276336029_jtKwZ0cD4QMJzNJ38bu2WKW0Jolq9yii.jpg');
INSERT INTO `flora_type` (`id`, `name`, `description`, `image_url`) VALUES (4, 'Cactus', 'Cacti are flowering plants with succulent stems, pads, or branches that have spines and scales instead of leaves. They are part of the Cactaceae plant family, which has around 1,750 known species and 127 genera. The word \"cactus\" comes from the Ancient Greek word kaktos, which was originally used by Theophrastus to describe a spiny plant. Cacti are native to the Americas, from Patagonia in the south to western Canada in the north, with the exception of Rhipsalis baccifera, which can also be found in Africa and Sri Lanka. They are adapted to survive in dry environments, such as deserts, and have many adaptations to conserve water. For example, most cacti are succulents, meaning they have thickened, fleshy parts that store water, usually in their stems. They also have a waxy substance called a cuticle to prevent water loss, and their spines break up the wind that blows across their pads and shade their stems. Cacti come in many shapes and sizes, and can be distinguished from other succulents by their areoles, which are small cushion-like structures with trichomes (plant hairs) and spines or barbed bristles. Areoles are modified branches that can grow into flowers, new branches, and leaves. Cacti can also have soft and feathery spines to protect them from sunlight, or sharp spines for protection.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cd/Carnegiea_gigantea_in_Saguaro_National_Park_near_Tucson%2C_Arizona_during_November_%2858%29.jpg/1200px-Carnegiea_gigantea_in_Saguaro_National_Park_near_Tucson%2C_Arizona_during_November_%2858%29.jpg');

COMMIT;


-- -----------------------------------------------------
-- Data for table `flora`
-- -----------------------------------------------------
START TRANSACTION;
USE `nationalparksdb`;
INSERT INTO `flora` (`id`, `name`, `species`, `flora_type_id`, `image_url`) VALUES (1, 'Giant Sequoia', 'Sequoiadendron giganteum', 1, 'https://cdn.britannica.com/62/167162-050-AF1D843E/General-Sherman-tree-giant-sequoia-world-Sequoia.jpg');
INSERT INTO `flora` (`id`, `name`, `species`, `flora_type_id`, `image_url`) VALUES (2, 'Desert Sage', 'Salvia dorrii', 2, 'https://www.gardenia.net/wp-content/uploads/2023/04/Xwbws18MLs3B36d8OGvJS8rlhj1wE2oFQd1Tgbnw-780x491.webp');
INSERT INTO `flora` (`id`, `name`, `species`, `flora_type_id`, `image_url`) VALUES (3, 'Subalpine Fir', 'Abies lasiocarpa', 1, 'https://upload.wikimedia.org/wikipedia/commons/b/bd/Abies_lasiocarpa_26008.JPG');
INSERT INTO `flora` (`id`, `name`, `species`, `flora_type_id`, `image_url`) VALUES (4, 'Joshua Tree', 'Yucca brevifolia', 1, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/49/Joshua_Tree_01.jpg/220px-Joshua_Tree_01.jpg');
INSERT INTO `flora` (`id`, `name`, `species`, `flora_type_id`, `image_url`) VALUES (5, 'Flame Azalea', 'Rhododendron calendulaceum', 2, 'https://upload.wikimedia.org/wikipedia/commons/8/88/Rhododendron_calendulaceum.jpg');
INSERT INTO `flora` (`id`, `name`, `species`, `flora_type_id`, `image_url`) VALUES (6, 'Red Maple', 'Acer rubrum', 1, 'https://www.vdberk.com/media/6015/acer-rubrum-redpointe-frank-jr.jpg');
INSERT INTO `flora` (`id`, `name`, `species`, `flora_type_id`, `image_url`) VALUES (7, 'Douglas Fir', 'Pseudotsuga menziesii', 1, 'https://www.gardenia.net/wp-content/uploads/2023/05/pseudotsuga-menziesii.webp');
INSERT INTO `flora` (`id`, `name`, `species`, `flora_type_id`, `image_url`) VALUES (8, 'Sitka Spruce', 'Picea sitchensis', 1, 'https://landscapeplants.oregonstate.edu/sites/plantid7/files/plantimage/pisi8735A_0.jpg');
INSERT INTO `flora` (`id`, `name`, `species`, `flora_type_id`, `image_url`) VALUES (9, 'Alpine Larkspur', 'Delphinium bicolor', 3, 'https://hillfarmnursery.com/wp-content/uploads/2014/04/delphinium-bicolor-3-farwell-canyon-may-2010.jpg');
INSERT INTO `flora` (`id`, `name`, `species`, `flora_type_id`, `image_url`) VALUES (10, 'Colorado Blue Spruce', 'Picea pungens', 1, 'https://s3.amazonaws.com/eit-planttoolbox-prod/media/images/Picea_pungens_form_A_wEFLqS5HJoG0.jpeg');
INSERT INTO `flora` (`id`, `name`, `species`, `flora_type_id`, `image_url`) VALUES (11, 'Prickly Pear Cactus', 'Opuntia spp.', 4, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSiqYqnRWI6l7mH3heCoU64FkiBWhhk8ZV4iQ&s');
INSERT INTO `flora` (`id`, `name`, `species`, `flora_type_id`, `image_url`) VALUES (12, 'Ponderosa Pine', 'Pinus ponderosa', 1, 'https://sactree.org/wp-content/uploads/2021/03/Pinus-ponderosa-Ponderosa-pine-SelecTree.jpeg');

COMMIT;


-- -----------------------------------------------------
-- Data for table `animal_type`
-- -----------------------------------------------------
START TRANSACTION;
USE `nationalparksdb`;
INSERT INTO `animal_type` (`id`, `name`, `description`, `image_url`) VALUES (1, 'Mammal', ' Warm-blooded vertebrates characterized by having hair or fur and mammary glands that produce milk to nourish their young', 'https://i.natgeofe.com/n/5892ed3f-0b48-4227-9900-a712811a5903/mammals-hero_16x9.jpg?w=1200');
INSERT INTO `animal_type` (`id`, `name`, `description`, `image_url`) VALUES (2, 'Bird', 'Warm-blooded vertebrates known for their ability to fly \'', '\' though some species are flightless. They have beaks or bills instead of teeth');
INSERT INTO `animal_type` (`id`, `name`, `description`, `image_url`) VALUES (3, 'Amphibian', ' Cold-blooded vertebrates that typically have a dual life cycle; beginning their lives in water as larvae with gills and then undergoing metamorphosis to become air-breathing adults with lungs', 'https://www.snexplores.org/wp-content/uploads/2022/06/1440_LL_amphibians_feat-1030x580.jpg');

COMMIT;


-- -----------------------------------------------------
-- Data for table `animal`
-- -----------------------------------------------------
START TRANSACTION;
USE `nationalparksdb`;
INSERT INTO `animal` (`id`, `name`, `animal_type_id`, `endangered`, `image_url`) VALUES (1, 'American Black Bear', 1, 0, 'https://upload.wikimedia.org/wikipedia/commons/0/08/01_Schwarzb%C3%A4r.jpg');
INSERT INTO `animal` (`id`, `name`, `animal_type_id`, `endangered`, `image_url`) VALUES (2, 'California Condor', 2, 1, 'https://www.allaboutbirds.org/guide/assets/og/75298111-1200px.jpg');
INSERT INTO `animal` (`id`, `name`, `animal_type_id`, `endangered`, `image_url`) VALUES (3, 'North American Elk', 1, 0, 'https://dehayf5mhw1h7.cloudfront.net/wp-content/uploads/sites/1491/2023/10/09150745/The-North-American-Elk-1024x613.png');
INSERT INTO `animal` (`id`, `name`, `animal_type_id`, `endangered`, `image_url`) VALUES (4, 'Mountain Lion', 1, 0, 'https://bloximages.newyork1.vip.townnews.com/unionleader.com/content/tncms/assets/v3/editorial/f/7a/f7a850d0-5c96-5b26-a5e8-2e465b85b10c/653a4e6ef2206.image.jpg?crop=1551%2C1163%2C115%2C0&resize=1551%2C1163&order=crop%2Cresize');
INSERT INTO `animal` (`id`, `name`, `animal_type_id`, `endangered`, `image_url`) VALUES (5, 'Southern Appalachian Salamander', 3, 0, 'https://www.tn.gov/content/dam/tn/twra/images/amphibians/southern-appalachian-salamander/southern-appalachian-salamander.jpg');
INSERT INTO `animal` (`id`, `name`, `animal_type_id`, `endangered`, `image_url`) VALUES (6, 'North Atlantic Right Whale', 1, 0, 'https://us.whales.org/wp-content/uploads/sites/2/2018/08/na-right-whale-breach-regina-asmutis-silvia.jpg');
INSERT INTO `animal` (`id`, `name`, `animal_type_id`, `endangered`, `image_url`) VALUES (7, 'American Bison', 1, 0, 'https://upload.wikimedia.org/wikipedia/commons/8/8d/American_bison_k5680-1.jpg');
INSERT INTO `animal` (`id`, `name`, `animal_type_id`, `endangered`, `image_url`) VALUES (8, 'Northern Spotted Owl', 2, 1, 'https://www.nps.gov/articles/images/SPOW_5-28-08_Female_5_HeatherJensen.JPG?maxwidth=650&autorotate=false');
INSERT INTO `animal` (`id`, `name`, `animal_type_id`, `endangered`, `image_url`) VALUES (9, 'Moose', 1, 0, 'https://d3d0lqu00lnqvz.cloudfront.net/media/media/82d06bf1-25ff-46ee-8ff5-93dd73cf05c4.jpg');
INSERT INTO `animal` (`id`, `name`, `animal_type_id`, `endangered`, `image_url`) VALUES (10, 'Coyote',  1, 0, 'https://cdn.britannica.com/45/125545-050-B705597E/Coyote.jpg');
INSERT INTO `animal` (`id`, `name`, `animal_type_id`, `endangered`, `image_url`) VALUES (11, 'Bighorn Sheep', 1, 0, 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/97/New_Mexico_Bighorn_Sheep.JPG/800px-New_Mexico_Bighorn_Sheep.JPG');
INSERT INTO `animal` (`id`, `name`, `animal_type_id`, `endangered`, `image_url`) VALUES (12, 'Mule Deer', 1, 0, 'https://www.nps.gov/romo/learn/nature/images/MuleDeer_Cover_688x400.jpg');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mountain`
-- -----------------------------------------------------
START TRANSACTION;
USE `nationalparksdb`;
INSERT INTO `mountain` (`id`, `name`, `elevation_in_meters`, `average_snowfall_in_inches`, `longitude`, `latitude`, `image_url`, `description`) VALUES (1, 'Half Dome', 2694, '60', 37.7459, -119.5332, 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d6/Half_Dome_from_Glacier_Point%2C_Yosemite_NP_-_Diliff.jpg/544px-Half_Dome_from_Glacier_Point%2C_Yosemite_NP_-_Diliff.jpg', 'A granite dome at the eastern end of Yosemite Valley, iconic for its distinct shape.');
INSERT INTO `mountain` (`id`, `name`, `elevation_in_meters`, `average_snowfall_in_inches`, `longitude`, `latitude`, `image_url`, `description`) VALUES (2, 'El Capitan', 2308, '55', 37.7339, -119.6371, 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/66/El_Capitan_en_Californie.jpg/1024px-El_Capitan_en_Californie.jpg', 'A vertical rock formation in Yosemite National Park, popular with climbers.');
INSERT INTO `mountain` (`id`, `name`, `elevation_in_meters`, `average_snowfall_in_inches`, `longitude`, `latitude`, `image_url`, `description`) VALUES (3, 'The West Temple', 2640, '35', 37.2278, -113.0449, 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/28/West_Temple%2C_Zion_N.P._5-14_%2815485128911%29.jpg/544px-West_Temple%2C_Zion_N.P._5-14_%2815485128911%29.jpg', 'The highest peak in Zion National Park, a prominent white and red sandstone mountain.');
INSERT INTO `mountain` (`id`, `name`, `elevation_in_meters`, `average_snowfall_in_inches`, `longitude`, `latitude`, `image_url`, `description`) VALUES (4, 'Angels Landing', 1760, '25', 37.2694, -112.9496, 'https://en.wikipedia.org/wiki/File:Angels_Landing_-_Zion_Canyon.jpg', 'A challenging and iconic hike offering panoramic views of Zion Canyon.');
INSERT INTO `mountain` (`id`, `name`, `elevation_in_meters`, `average_snowfall_in_inches`, `longitude`, `latitude`, `image_url`, `description`) VALUES (5, 'Mount Grinnell', 2982, '100', 48.7545, -113.6913, 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cd/Mount_Grinnell.jpg/544px-Mount_Grinnell.jpg', 'A prominent peak in the Many Glacier region of Glacier National Park.');
INSERT INTO `mountain` (`id`, `name`, `elevation_in_meters`, `average_snowfall_in_inches`, `longitude`, `latitude`, `image_url`, `description`) VALUES (6, 'Mount Gould', 2919, '95', 48.7539, -113.7454, 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cd/Mount_Gould_Montana.jpg/544px-Mount_Gould_Montana.jpg', 'Located along the Continental Divide, offers stunning views of glaciers and lakes.');
INSERT INTO `mountain` (`id`, `name`, `elevation_in_meters`, `average_snowfall_in_inches`, `longitude`, `latitude`, `image_url`, `description`) VALUES (7, 'Wotan\'s Throne', 2379, '30', 36.1613, -111.8901, 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a2/Grand_Canyon_National_Park%2C_North_Rim%2C_Muted_Sunrise_From_Cape_Royal_0163_-_Flickr_-_Grand_Canyon_NPS.jpg/1920px-Grand_Canyon_National_Park%2C_North_Rim%2C_Muted_Sunrise_From_Cape_Royal_0163_-_Flickr_-_Grand_Canyon_NPS.jpg', 'A flat-topped mesa in the Grand Canyon, sacred in Native American traditions.');
INSERT INTO `mountain` (`id`, `name`, `elevation_in_meters`, `average_snowfall_in_inches`, `longitude`, `latitude`, `image_url`, `description`) VALUES (9, 'Clingmans Dome', 2025, '85', 35.5629, -83.4986, 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Clingman%27s_Dome_Tower_on_a_Sunny%2C_Snowy_Day.JPG/1920px-Clingman%27s_Dome_Tower_on_a_Sunny%2C_Snowy_Day.JPG', 'The highest point in Tennessee, offering expansive views and a popular observation tower.');
INSERT INTO `mountain` (`id`, `name`, `elevation_in_meters`, `average_snowfall_in_inches`, `longitude`, `latitude`, `image_url`, `description`) VALUES (10, 'Mount Le Conte', 2010, '80', 35.6544, -83.4366, 'https://upload.wikimedia.org/wikipedia/commons/2/2c/Mt._LeConte_Clingmans_Dome_05-31-20.jpg', 'A mountain with a rich history, featuring a lodge and numerous hiking trails.');
INSERT INTO `mountain` (`id`, `name`, `elevation_in_meters`, `average_snowfall_in_inches`, `longitude`, `latitude`, `image_url`, `description`) VALUES (11, 'Cadillac Mountain', 466, '60', 44.3521, -68.2247, 'https://upload.wikimedia.org/wikipedia/commons/b/bb/Cadillac_Mountain_from_Champlain_Mountain_-_panoramio.jpg', 'The highest point on the eastern seaboard, known for its sunrise views.');
INSERT INTO `mountain` (`id`, `name`, `elevation_in_meters`, `average_snowfall_in_inches`, `longitude`, `latitude`, `image_url`, `description`) VALUES (13, 'Mount Washburn', 3122, '150', 44.7972, -110.4371, 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/17/YELLOWSTONE-2014_98.jpg/2560px-YELLOWSTONE-2014_98.jpg', 'A popular hiking destination with panoramic views of the Yellowstone area.');
INSERT INTO `mountain` (`id`, `name`, `elevation_in_meters`, `average_snowfall_in_inches`, `longitude`, `latitude`, `image_url`, `description`) VALUES (14, 'Electric Peak', 3342, '120', 45.0058, -110.835, 'https://upload.wikimedia.org/wikipedia/commons/7/76/Electric-peak-trees.jpg', 'The highest peak in the Gallatin Range, with challenging trails and electric storms.');
INSERT INTO `mountain` (`id`, `name`, `elevation_in_meters`, `average_snowfall_in_inches`, `longitude`, `latitude`, `image_url`, `description`) VALUES (15, 'Mount Olympus', 2428, '220', 47.8011, -123.7105, 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Olympus_National_Park_30.jpg/2560px-Olympus_National_Park_30.jpg', 'The tallest peak in the Olympic Mountains, known for its glaciers.');
INSERT INTO `mountain` (`id`, `name`, `elevation_in_meters`, `average_snowfall_in_inches`, `longitude`, `latitude`, `image_url`, `description`) VALUES (16, 'Hurricane Ridge', 1598, '400', 47.9701, -123.4985, 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/21/Hurricane_Ridge_snow.jpg/2560px-Hurricane_Ridge_snow.jpg', 'Offers spectacular views and winter sports activities.');
INSERT INTO `mountain` (`id`, `name`, `elevation_in_meters`, `average_snowfall_in_inches`, `longitude`, `latitude`, `image_url`, `description`) VALUES (17, 'Grand Teton', 4199, '500', 43.7414, -110.8022, 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/60/Grand_Teton_GTNP1.jpg/1024px-Grand_Teton_GTNP1.jpg', 'The highest peak in the Teton Range, a centerpiece of the park.');
INSERT INTO `mountain` (`id`, `name`, `elevation_in_meters`, `average_snowfall_in_inches`, `longitude`, `latitude`, `image_url`, `description`) VALUES (18, 'Mount Moran', 3842, '450', 43.8369, -110.7582, 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Aerial_image_of_Mount_Moran_%28view_from_the_east%29.jpg/2560px-Aerial_image_of_Mount_Moran_%28view_from_the_east%29.jpg', 'Known for its distinctive black dike, a favorite among climbers.');
INSERT INTO `mountain` (`id`, `name`, `elevation_in_meters`, `average_snowfall_in_inches`, `longitude`, `latitude`, `image_url`, `description`) VALUES (19, 'Longs Peak', 4346, '200', 40.2549, -105.616, 'https://upload.wikimedia.org/wikipedia/commons/3/37/Fall05-LongsPeakCU_JPG_RSZ_md.jpg', 'The highest peak in Rocky Mountain National Park, popular with hikers and climbers.');
INSERT INTO `mountain` (`id`, `name`, `elevation_in_meters`, `average_snowfall_in_inches`, `longitude`, `latitude`, `image_url`, `description`) VALUES (20, 'Hallett Peak', 3878, '180', 40.3037, -105.6836, 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b4/Hallet%27s_Peak_reflected_in_Lake_Haiyaha_at_darn_in_Rocky_Mountain_National_Park._NPS-Debra_Miller_%2818659267056%29.jpg/2560px-Hallet%27s_Peak_reflected_in_Lake_Haiyaha_at_darn_in_Rocky_Mountain_National_Park._NPS-Debra_Miller_%2818659267056%29.jpg', 'Offers stunning views and a challenging ascent from Bear Lake.');
INSERT INTO `mountain` (`id`, `name`, `elevation_in_meters`, `average_snowfall_in_inches`, `longitude`, `latitude`, `image_url`, `description`) VALUES (21, 'Elephant Butte', 1722, '10', 38.6958, -109.5521, 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/16/Elephant_Butte_in_Arches_National_Park.jpg/1920px-Elephant_Butte_in_Arches_National_Park.jpg', 'The highest point in Arches National Park, known for its rock formations.');

COMMIT;


-- -----------------------------------------------------
-- Data for table `national_park_has_mountain`
-- -----------------------------------------------------
START TRANSACTION;
USE `nationalparksdb`;
INSERT INTO `national_park_has_mountain` (`national_park_id`, `mountain_id`) VALUES (1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `nationalparksdb`;
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`) VALUES (1, 'admin', 'admin', 1, 'admin');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`) VALUES (2, 'user', 'user', 1, 'user');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`) VALUES (3, 't', 't', 1, 't');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`) VALUES (4, 'nationalparksuser', 'nationalparksuser', 1, 'nationalparksuser');

COMMIT;


-- -----------------------------------------------------
-- Data for table `point_of_interest`
-- -----------------------------------------------------
START TRANSACTION;
USE `nationalparksdb`;
INSERT INTO `point_of_interest` (`id`, `name`, `description`, `longitude`, `latitude`, `image_url`, `national_park_id`, `user_id`, `create_date`, `last_update`, `enabled`) VALUES (1, 'Mariposa Grove', 'Mariposa Grove of Giant Sequoias is a popular destination in Yosemite National Park\'s southern Valley, on the slopes of the Sierra Nevada Mountains. It\'s the largest of the park\'s three giant sequoia groves\', with about 500 mature trees, some of which may be thousands of years old. The grove is known for its magnificent trees, some with branches as large as a normal tree, and offers a variety of trails for all levels, including some accessible trails for visitors with disabilities.', 37.5098, -119.6047, 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/51/Yellowstone_National_Park_%28WY%2C_USA%29%2C_Old_Faithful_Geyser_--_2022_--_2599.jpg/2560px-Yellowstone_National_Park_%28WY%2C_USA%29%2C_Old_Faithful_Geyser_--_2022_--_2599.jpg', 1, NULL, NULL, NULL, 1);
INSERT INTO `point_of_interest` (`id`, `name`, `description`, `longitude`, `latitude`, `image_url`, `national_park_id`, `user_id`, `create_date`, `last_update`, `enabled`) VALUES (2, 'Angel’s Landing', 'Angels Landing is a famous hike in Zion National Park, Utah that leads to the top of a 1,488-foot rock formation. The trail is carved into the rock and climbs about 1,500 vertical feet along a narrow, exposed ridge to a summit elevation of 5,790 feet. The hike is considered strenuous and can take 1–5 hours, depending on the source. The trail has exposed edges and drop-offs of up to 1,000 feet, and in some places it\'s only wide enough for one person. Hikers must use chains for safety, watch their footing, and be prepared to yield to other hikers.', 37.2690, -112.9469, 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fd/Angels_Landing_-_Zion_Canyon.jpg/544px-Angels_Landing_-_Zion_Canyon.jpg', 2, NULL, NULL, NULL, 1);
INSERT INTO `point_of_interest` (`id`, `name`, `description`, `longitude`, `latitude`, `image_url`, `national_park_id`, `user_id`, `create_date`, `last_update`, `enabled`) VALUES (3, 'Logan Pass', 'Logan Pass is a popular destination in Glacier National Park, Montana that\'s the highest point on Going-to-the-Sun Road at 6,646 ft (2,026 m). It\'s located on the Continental Divide and above the tree line, and offers panoramic views in every direction.', 48.6966, -113.7182, 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/58/Logan_Pass-27527.jpg/1920px-Logan_Pass-27527.jpg', 3, NULL, NULL, NULL, 1);
INSERT INTO `point_of_interest` (`id`, `name`, `description`, `longitude`, `latitude`, `image_url`, `national_park_id`, `user_id`, `create_date`, `last_update`, `enabled`) VALUES (4, 'Mather Point', 'For many visitors coming to the South Rim, Mather Point offers the first glimpse of a world wonder. A short walk from the Grand Canyon Visitor Center and parking lots 1-4, Mather Point offers an expansive view of the canyon. On a clear day you can see 30+ miles (48 km) to the east and 60+ miles (96 km) to the west.', 36.0617, -112.1077, 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/21/0059_Grand_Canyon_Mather_Point_Improvements_%285373762649%29.jpg/560px-0059_Grand_Canyon_Mather_Point_Improvements_%285373762649%29.jpg', 4, NULL, NULL, NULL, 1);
INSERT INTO `point_of_interest` (`id`, `name`, `description`, `longitude`, `latitude`, `image_url`, `national_park_id`, `user_id`, `create_date`, `last_update`, `enabled`) VALUES (5, 'Clingman’s Dome', 'Clingmans Dome is a 6,643 ft (2,025 m) peak in Great Smoky Mountains National Park, located near the Tennessee–North Carolina border. It\'s the highest point in Tennessee and the Appalachian Trail, and the third highest peak east of the Mississippi. The dome is half in North Carolina and half in Tennessee, and is situated along the state-line ridge.', 35.6550, -83.4980, 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Clingman%27s_Dome_Tower_on_a_Sunny%2C_Snowy_Day.JPG/1920px-Clingman%27s_Dome_Tower_on_a_Sunny%2C_Snowy_Day.JPG', 5, NULL, NULL, NULL, 1);
INSERT INTO `point_of_interest` (`id`, `name`, `description`, `longitude`, `latitude`, `image_url`, `national_park_id`, `user_id`, `create_date`, `last_update`, `enabled`) VALUES (6, 'Jordan Pond', 'Jordan Pond is a 187-acre lake in Acadia National Park on Mount Desert Island, Maine that\'s known for its clear water, mountain scenery, and geological features.The pond is located in a steep valley carved by glaciers and is bordered by Penobscot and Pemetic mountains, as well as two rounded peaks called the Bubbles. The water is 150 feet deep and has visibility of up to 61 feet, which is the deepest and clearest in Maine.', 44.3341, -68.2571, 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c2/Jordan_Pond_Reflections_%2819247942291%29.jpg/2560px-Jordan_Pond_Reflections_%2819247942291%29.jpg', 6, NULL, NULL, NULL, 1);
INSERT INTO `point_of_interest` (`id`, `name`, `description`, `longitude`, `latitude`, `image_url`, `national_park_id`, `user_id`, `create_date`, `last_update`, `enabled`) VALUES (7, 'Old Faithful', 'Old Faithful is a famous geyser located in Yellowstone National Park in the United States. It\'s renowned for its predictable eruptions, which occur approximately every 90 minutes. The geyser shoots a column of boiling water and steam up to 180 feet (55 meters) into the air, and its eruptions can last from 1.5 to 5 minutes. Old Faithful is one of the most well-known and studied geysers in the world, and its consistent performance makes it a popular attraction for visitors.', 44.4605, -110.8281, 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/51/Yellowstone_National_Park_%28WY%2C_USA%29%2C_Old_Faithful_Geyser_--_2022_--_2599.jpg/2560px-Yellowstone_National_Park_%28WY%2C_USA%29%2C_Old_Faithful_Geyser_--_2022_--_2599.jpg', 7, NULL, NULL, NULL, 1);
INSERT INTO `point_of_interest` (`id`, `name`, `description`, `longitude`, `latitude`, `image_url`, `national_park_id`, `user_id`, `create_date`, `last_update`, `enabled`) VALUES (8, 'Rialto Beach', 'Rialto Beach is a stunning coastal destination located in Olympic National Park in Washington State. Known for its dramatic landscapes, the beach features rugged rock formations, large driftwood logs, and beautiful ocean views. It\'s situated along the Pacific Ocean and is part of the larger Olympic Peninsula, which is renowned for its diverse ecosystems, including temperate rainforests, alpine peaks, and coastal shores.', 47.9173, -124.6394, 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/db/Rialto_Beach.jpg/2560px-Rialto_Beach.jpg', 8, NULL, NULL, NULL, 1);
INSERT INTO `point_of_interest` (`id`, `name`, `description`, `longitude`, `latitude`, `image_url`, `national_park_id`, `user_id`, `create_date`, `last_update`, `enabled`) VALUES (9, 'Jenny Lake', 'Jenny Lake is a picturesque glacial lake located in Grand Teton National Park in Wyoming, USA. Nestled at the base of the Teton Range, the lake is a popular spot for outdoor activities and offers stunning views of the surrounding mountains. The lake covers about 1,200 acres (486 hectares) and is roughly 2.5 miles (4 kilometers) long and 1 mile (1.6 kilometers) wide. It has a distinctive, narrow shape, nestled in a glacially carved valley.', 43.7614, -110.7317, 'https://en.wikipedia.org/wiki/File:Aerial_image_of_Jenny_Lake_(view_from_the_east).jpg', 9, NULL, NULL, NULL, 1);
INSERT INTO `point_of_interest` (`id`, `name`, `description`, `longitude`, `latitude`, `image_url`, `national_park_id`, `user_id`, `create_date`, `last_update`, `enabled`) VALUES (10, 'Lake Haiyaha', 'Nestled in the high elevations of the park, Lake Haiyaha is situated at around 10,200 feet (3,109 meters) above sea level, within the Bear Lake Corridor. The lake is known for its stunning, clear blue waters surrounded by rocky terrain and alpine forests. The backdrop features dramatic mountain views, including peaks like Longs Peak. The lake is accessible via a popular hiking trail that starts from the Bear Lake Trailhead. The hike is approximately 3.5 miles (5.6 kilometers) round-trip, offering scenic vistas and a moderate ascent.', 40.3046, -105.6621, 'https://uploads-ssl.webflow.com/5d1a54305a9e4f1f6feb89d6/635463e271b74ab17df9d8cf_Haiyaha1.jpg', 10, NULL, NULL, NULL, 1);
INSERT INTO `point_of_interest` (`id`, `name`, `description`, `longitude`, `latitude`, `image_url`, `national_park_id`, `user_id`, `create_date`, `last_update`, `enabled`) VALUES (11, 'Delicate Arch', 'Delicate Arch is one of the most iconic and recognizable natural landmarks in Arches National Park, located in southeastern Utah.Delicate Arch is a natural arch formed from Entrada Sandstone. It is renowned for its striking, elegant shape, which resembles a delicate, arching window. The arch spans approximately 46 feet (14 meters) high and 32 feet (10 meters) wide. The arch is situated in a rugged, semi-desert landscape. It’s perched on a rock fin overlooking a broad expanse of the Utah desert, with panoramic views of the La Sal Mountains in the distance', 38.7436, -109.4993, 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f0/Delicate_arch_sunset.jpg/500px-Delicate_arch_sunset.jpg', 11, NULL, NULL, NULL, 1);
INSERT INTO `point_of_interest` (`id`, `name`, `description`, `longitude`, `latitude`, `image_url`, `national_park_id`, `user_id`, `create_date`, `last_update`, `enabled`) VALUES (12, 'Bryce Point', 'Bryce Point is one of the prominent viewpoints in Bryce Canyon National Park, located in southern Utah. It is situated at an elevation of approximately 8,300 feet (2,530 meters) above sea level, offering spectacular views of the Bryce Canyon amphitheater. From Bryce Point, visitors are treated to a breathtaking panoramic view of the park’s unique geological formations, including the park\'s signature hoodoos—tall, thin spires of rock that rise from the canyon floor. The viewpoint overlooks a dramatic landscape of colorful rock formations and intricate erosion patterns.', 38.7436, -109.4993, 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f0/Delicate_arch_sunset.jpg/500px-Delicate_arch_sunset.jpg', 12, NULL, NULL, NULL, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `trail`
-- -----------------------------------------------------
START TRANSACTION;
USE `nationalparksdb`;
INSERT INTO `trail` (`id`, `name`, `length_in_miles`, `trail_difficulty`, `trail_map`, `description`, `latitude`, `longitude`, `national_park_id`, `user_id`, `create_date`, `last_update`, `enabled`) VALUES (1, 'Upper Yosemite Falls Trail', 6.6 , 'Hard', 'https://www.alltrails.com/_next/image?url=https%3A%2F%2Fwww.alltrails.com%2Fapi%2Falltrails%2Fv3%2Fmaps%2F155658190%2Fstatic_map%3Fsize%3D295x240%26scale%3D2%26key%3D3p0t5s6b5g4g0e8k3c1j3w7y5c3m4t8i&w=640&q=75', 'his section of the trail begins with a lot of switchbacks.Though steep,it is actually well-shaded', 37.74297, -119.60325, 1, NULL, NULL, NULL, 1);
INSERT INTO `trail` (`id`, `name`, `length_in_miles`, `trail_difficulty`, `trail_map`, `description`, `latitude`, `longitude`, `national_park_id`, `user_id`, `create_date`, `last_update`, `enabled`) VALUES (2, 'Emerald Pools Trail', 3.0 , 'Moderate', 'https://www.alltrails.com/_next/image?url=https%3A%2F%2Fwww.alltrails.com%2Fapi%2Falltrails%2Fv3%2Fmaps%2F56662574%2Fstatic_map%3Fsize%3D295x240%26scale%3D2%26key%3D3p0t5s6b5g4g0e8k3c1j3w7y5c3m4t8i&w=640&q=75', 'The Lower Pool Trail is the easiest,gaining very little elevation and being smooth and wide,37.251123,-112.957232', 37.251123, -112.957232, 2, NULL, NULL, NULL, 1);
INSERT INTO `trail` (`id`, `name`, `length_in_miles`, `trail_difficulty`, `trail_map`, `description`, `latitude`, `longitude`, `national_park_id`, `user_id`, `create_date`, `last_update`, `enabled`) VALUES (3, 'Avalanche Lake', 5.9 , 'Moderate', 'https://www.alltrails.com/_next/image?url=https%3A%2F%2Fwww.alltrails.com%2Fapi%2Falltrails%2Fv3%2Fmaps%2F171922975%2Fstatic_map%3Fsize%3D295x240%26scale%3D2%26key%3D3p0t5s6b5g4g0e8k3c1j3w7y5c3m4t8i&w=640&q=75', 'Generally considered a moderately challenging route,this is a very popular area for camping and hiking', 48.68067, -113.81904, 3, NULL, NULL, NULL, 1);
INSERT INTO `trail` (`id`, `name`, `length_in_miles`, `trail_difficulty`, `trail_map`, `description`, `latitude`, `longitude`, `national_park_id`, `user_id`, `create_date`, `last_update`, `enabled`) VALUES (4, 'South Kaibab Trail to Ooh Aah Point', 1.8 , 'Moderate', 'https://www.alltrails.com/_next/image?url=https%3A%2F%2Fwww.alltrails.com%2Fapi%2Falltrails%2Fv3%2Fmaps%2F98001155%2Fstatic_map%3Fsize%3D295x240%26scale%3D2%26key%3D3p0t5s6b5g4g0e8k3c1j3w7y5c3m4t8i&w=640&q=75', 'The south Kaibab Trail is the shortest route to the Colorado river at 6.5 miles to achieve the almost mile elevation change', 36.05293, -112.08718, 4, NULL, NULL, NULL, 1);
INSERT INTO `trail` (`id`, `name`, `length_in_miles`, `trail_difficulty`, `trail_map`, `description`, `latitude`, `longitude`, `national_park_id`, `user_id`, `create_date`, `last_update`, `enabled`) VALUES (5, 'Alum Cave Trail to Mount LeConte', 11.0 , 'Hard', 'https://www.alltrails.com/_next/image?url=https%3A%2F%2Fwww.alltrails.com%2Fapi%2Falltrails%2Fv3%2Fmaps%2F106841060%2Fstatic_map%3Fsize%3D295x240%26scale%3D2%26key%3D3p0t5s6b5g4g0e8k3c1j3w7y5c3m4t8i&w=640&q=75', 'Generally considered a challenging route.This is a very popular area for backpacking and hiking', 35.6295702, -83.4517407, 5, NULL, NULL, NULL, 1);
INSERT INTO `trail` (`id`, `name`, `length_in_miles`, `trail_difficulty`, `trail_map`, `description`, `latitude`, `longitude`, `national_park_id`, `user_id`, `create_date`, `last_update`, `enabled`) VALUES (6, 'Jordan Pond Path', 3.1 , 'Easy', 'https://www.alltrails.com/_next/image?url=https%3A%2F%2Fwww.alltrails.com%2Fapi%2Falltrails%2Fv3%2Fmaps%2F85247657%2Fstatic_map%3Fsize%3D295x240%26scale%3D2%26key%3D3p0t5s6b5g4g0e8k3c1j3w7y5c3m4t8i&w=640&q=75', 'Generally considered an easy route,it takes an average of 55 min to complete', 44.3316563, -68.2577205, 6, NULL, NULL, NULL, 1);
INSERT INTO `trail` (`id`, `name`, `length_in_miles`, `trail_difficulty`, `trail_map`, `description`, `latitude`, `longitude`, `national_park_id`, `user_id`, `create_date`, `last_update`, `enabled`) VALUES (7, 'Upper Geyser Basin', 3.5 , 'Easy', 'https://www.alltrails.com/_next/image?url=https%3A%2F%2Fwww.alltrails.com%2Fapi%2Falltrails%2Fv3%2Fmaps%2F66234735%2Fstatic_map%3Fsize%3D295x240%26scale%3D2%26key%3D3p0t5s6b5g4g0e8k3c1j3w7y5c3m4t8i&w=640&q=75', 'The best times to visit this trail are May through October', 44.52357, -110.84006, 7, NULL, NULL, NULL, 1);
INSERT INTO `trail` (`id`, `name`, `length_in_miles`, `trail_difficulty`, `trail_map`, `description`, `latitude`, `longitude`, `national_park_id`, `user_id`, `create_date`, `last_update`, `enabled`) VALUES (8, 'Hall of Mosses Trail', 1.1 , 'Easy', 'https://www.alltrails.com/_next/image?url=https%3A%2F%2Fwww.alltrails.com%2Fapi%2Falltrails%2Fv3%2Fmaps%2F243606491%2Fstatic_map%3Fsize%3D295x240%26scale%3D2%26key%3D3p0t5s6b5g4g0e8k3c1j3w7y5c3m4t8i&w=640&q=75', 'You\'ll need to leave pups at home—dogs aren\'t allowed on this trail', 47.86329, -123.93352, 8, NULL, NULL, NULL, 1);
INSERT INTO `trail` (`id`, `name`, `length_in_miles`, `trail_difficulty`, `trail_map`, `description`, `latitude`, `longitude`, `national_park_id`, `user_id`, `create_date`, `last_update`, `enabled`) VALUES (9, 'Taggart Lake Loop', 3.8 , 'Easy', 'https://www.alltrails.com/_next/image?url=https%3A%2F%2Fwww.alltrails.com%2Fapi%2Falltrails%2Fv3%2Fmaps%2F181188621%2Fstatic_map%3Fsize%3D295x240%26scale%3D2%26key%3D3p0t5s6b5g4g0e8k3c1j3w7y5c3m4t8i&w=640&q=75', 'This is a very popular area for birding,hiking,and horseback riding', 43.70107, -110.742243, 9, NULL, NULL, NULL, 1);
INSERT INTO `trail` (`id`, `name`, `length_in_miles`, `trail_difficulty`, `trail_map`, `description`, `latitude`, `longitude`, `national_park_id`, `user_id`, `create_date`, `last_update`, `enabled`) VALUES (10, 'Emerald Lake Trail', 3.2 , 'Moderate', 'https://www.alltrails.com/_next/image?url=https%3A%2F%2Fwww.alltrails.com%2Fapi%2Falltrails%2Fv3%2Fmaps%2F171606678%2Fstatic_map%3Fsize%3D295x240%26scale%3D2%26key%3D3p0t5s6b5g4g0e8k3c1j3w7y5c3m4t8i&w=640&q=75', 'Generally considered a moderately challenging route,it takes an average of 1 h 39 min to complete', 40.28794, -105.66429, 10, NULL, NULL, NULL, 1);
INSERT INTO `trail` (`id`, `name`, `length_in_miles`, `trail_difficulty`, `trail_map`, `description`, `latitude`, `longitude`, `national_park_id`, `user_id`, `create_date`, `last_update`, `enabled`) VALUES (11, 'Delicate Arch Trail', 3.2 , 'Moderate', 'https://www.alltrails.com/_next/image?url=https%3A%2F%2Fwww.alltrails.com%2Fapi%2Falltrails%2Fv3%2Fmaps%2F69199735%2Fstatic_map%3Fsize%3D295x240%26scale%3D2%26key%3D3p0t5s6b5g4g0e8k3c1j3w7y5c3m4t8i&w=640&q=75', 'The trail is open year-round and is beautiful to visit anytime', 38.7356524, -109.5205071, 11, NULL, NULL, NULL, 1);
INSERT INTO `trail` (`id`, `name`, `length_in_miles`, `trail_difficulty`, `trail_map`, `description`, `latitude`, `longitude`, `national_park_id`, `user_id`, `create_date`, `last_update`, `enabled`) VALUES (12, 'Wall Street and Queens Garden Loop Trail', 3.2 , 'Moderate', 'https://www.alltrails.com/_next/image?url=https%3A%2F%2Fwww.alltrails.com%2Fapi%2Falltrails%2Fv3%2Fmaps%2F43068652%2Fstatic_map%3Fsize%3D295x240%26scale%3D2%26key%3D3p0t5s6b5g4g0e8k3c1j3w7y5c3m4t8i&w=640&q=75', 'This is a very popular area for hiking,so you\'ll likely encounter other people while exploring', 37.6229251, -112.1661025, 12, NULL, NULL, NULL, 1);

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
INSERT INTO `trail_comment` (`id`, `create_date`, `last_update`, `content`, `image_url`, `user_id`, `trail_id`) VALUES (1, '2024-08-23', NULL, 'Bring a raincoat or poncho,beautiful views', 'https://cascadeloop.objects.liquidweb.services/photos/_dsc0730.jpg', 1, 1);
INSERT INTO `trail_comment` (`id`, `create_date`, `last_update`, `content`, `image_url`, `user_id`, `trail_id`) VALUES (2, '2024-08-26', NULL, 'Absolutely incredible nice easy hike with beautiful views,the overcast and clouds made the colors pop like crazy', 'https://grandfather.com/wp-content/uploads/2022/02/hiking-grandfather.jpg', 2, 2);
INSERT INTO `trail_comment` (`id`, `create_date`, `last_update`, `content`, `image_url`, `user_id`, `trail_id`) VALUES (3, '2024-08-26', NULL, 'Went sunrise to sunset.Switchbacks are beautiful but steep', 'https://uploads.alaska.org/destinations/sitka/_960xAUTO_fit_center-center_65_none/IMG_2952-Alainadestination-photos-aliana-brownalaska.org-sitka.jpg', 3, 3);
INSERT INTO `trail_comment` (`id`, `create_date`, `last_update`, `content`, `image_url`, `user_id`, `trail_id`) VALUES (4, '2024-08-26', NULL, 'Very nicely maintained trail with a good diversity of views.Downhill for the first half,uphill for the second half,but stunning vistas along both legs', 'https://i0.wp.com/www.highrockiesliving.com/wp-content/uploads/2020/03/adventure-hiking-trails-scaled.jpg?fit=1140%2C1140&ssl=1', 4, 4);

COMMIT;


-- -----------------------------------------------------
-- Data for table `point_of_interest_type`
-- -----------------------------------------------------
START TRANSACTION;
USE `nationalparksdb`;
INSERT INTO `point_of_interest_type` (`id`, `name`, `description`, `image_url`) VALUES (1, 'Grove', 'A grove is a small group or cluster of trees that is typically characterized by a relatively dense arrangement. The term \"grove\" is often used to describe a natural or semi-natural area where trees grow closely together but are usually not as dense or extensive as a forest. Groves can vary in size, from a few trees to a few acres. They generally have a more open structure compared to forests, with space between trees allowing sunlight to reach the ground. They can be composed of a single species of tree, such as an olive grove or an apple orchard, or they can consist of various species. Groves provide habitat and food for various wildlife species. They can serve as important ecological niches, offering shelter and resources for animals, birds, and insects.', 'https://upload.wikimedia.org/wikipedia/commons/b/b1/Zawilec_gajowy_cm02.jpg');
INSERT INTO `point_of_interest_type` (`id`, `name`, `description`, `image_url`) VALUES (2, 'Rock Formation', 'A rock formation is a naturally occurring, distinct arrangement of rock types and structures, often characterized by its geological history and physical characteristics. Rock formations are significant in understanding Earth\'s geological processes and history. Rock formations are composed of various types of rocks, including igneous, sedimentary, and metamorphic rocks. The specific types of rocks and their arrangement can vary widely depending on the geological processes that formed them. The structure of a rock formation can include layers (strata), folds, faults, and other geological features. These structures provide clues about the formation’s geological history, such as the conditions under which the rocks were deposited or altered. Rock formations provide valuable information about Earth’s geological history, including past climates, the movement of tectonic plates, and volcanic activity. They are often studied in geology and paleontology to understand Earth’s evolution.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/87/Amanhecer_no_Hercules_--.jpg/2560px-Amanhecer_no_Hercules_--.jpg');
INSERT INTO `point_of_interest_type` (`id`, `name`, `description`, `image_url`) VALUES (3, 'Scenic Pass', 'A scenic pass is a high-altitude route or mountain pass known for its picturesque views and natural beauty. These passes are often located in mountainous or hilly regions and are popular with travelers for their stunning landscapes. They offer access to remote or elevated regions and provide panoramic views of surrounding terrain. Many scenic passes are subject to seasonal closures due to snow or weather conditions. The best times to visit are often during the warmer months when roads are clear and accessible.Scenic passes often serve as gateways to recreational activities such as hiking, skiing, photography, and sightseeing. Some passes also have viewpoints or pull-offs where travelers can stop and enjoy the scenery.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Cuesta_del_Obispo_en_la_Provincia_de_Salta_-_Argentina.JPG/1920px-Cuesta_del_Obispo_en_la_Provincia_de_Salta_-_Argentina.JPG');
INSERT INTO `point_of_interest_type` (`id`, `name`, `description`, `image_url`) VALUES (4, 'Scenic Viewpoint', 'A scenic viewpoint is a designated location or area that offers an exceptional view of natural or man-made landscapes. These viewpoints are often chosen for their ability to provide panoramic or otherwise stunning vistas. They are often set up to enhance the viewing experience, making it easier for people to observe and photograph the scenery. Viewpoints can be reached via various means, including roads, hiking trails, and lookouts.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/80/Woman_photographing_the_sunset_at_the_%27P%C3%B4r-do-Sol%27_scenic_viewpoint%2C_S%C3%A3o_Jorge%2C_Azores%2C_Portugal_%28PPL1-Corrected%29_julesvernex2.jpg/1600px-Woman_photographing_the_sunset_at_the_%27P%C3%B4r-do-Sol%27_scenic_viewpoint%2C_S%C3%A3o_Jorge%2C_Azores%2C_Portugal_%28PPL1-Corrected%29_julesvernex2.jpg?20200202204527');
INSERT INTO `point_of_interest_type` (`id`, `name`, `description`, `image_url`) VALUES (5, 'Pond', 'A pond is a small, shallow body of water, typically smaller than a lake. It can be natural or artificial and is often characterized by its relatively limited size and depth. Ponds often have a depth of less than 20 feet (6 meters). Their small size allows for the water to warm up more quickly compared to larger bodies of water. Ponds can form naturally through various processes, such as glacial activity, erosion, and spring or rainwater.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/62/Cornjum%2C_Martenastate_010.jpg/2560px-Cornjum%2C_Martenastate_010.jpg\n6,Geyser,\"A geyser is a natural hot spring that periodically erupts, expelling a column of hot water and steam into the air. Geysers are fascinating geothermal features and are often found in volcanic or tectonically active regions. Geysers form in areas with significant geothermal activity. They have a cyclical eruption pattern, which can vary from minutes to several hours between eruptions and can vary in terms of their eruption style and frequency.\",https://upload.wikimedia.org/wikipedia/commons/thumb/6/63/Strokkur_geyser_eruption%2C_close-up_view.jpg/2560px-Strokkur_geyser_eruption%2C_close-up_view.jpg');
INSERT INTO `point_of_interest_type` (`id`, `name`, `description`, `image_url`) VALUES (6, 'Beach', 'A beach is a landform along the shoreline of an ocean, sea, lake, or river where sediments such as sand, gravel, pebbles, cobblestones, or boulders accumulate. Beaches are dynamic environments shaped by the interaction of land and water, and they offer a range of ecological and recreational features. Beaches can consist of various types of sediments, including sand, pebbles, rocks, or shells. The composition often depends on the local geology and wave action. Waves and currents shape beaches by moving and depositing sediments. The action of waves breaking on the shore erodes materials from cliffs or riverbanks and deposits them along the coastline. Beaches provide crucial habitats for various wildlife, including birds, crabs, sea turtles, and plant species adapted to coastal conditions.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/20100726_Kalamitsi_Beach_Ionian_Sea_Lefkada_island_Greece.jpg/2560px-20100726_Kalamitsi_Beach_Ionian_Sea_Lefkada_island_Greece.jpg');
INSERT INTO `point_of_interest_type` (`id`, `name`, `description`, `image_url`) VALUES (7, 'Lake', 'A lake is a sizable, enclosed body of standing water, typically surrounded by land. Lakes can vary widely in size, depth, and ecological characteristics. Lakes can form through various natural processes, including glacial activity, tectonic activity, volcanic activity, river meandering, and erosion. The depth of lakes can vary from shallow to very deep. Some lakes have depths exceeding 1,000 feet (300 meters). Lakes can be freshwater or saline. Freshwater lakes contain low concentrations of salts, while saline lakes (or salt lakes) have high concentrations of salts, often due to high evaporation rates and lack of outlets.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ab/Gentau_Pic_du_Midi_Ossau.jpg/2560px-Gentau_Pic_du_Midi_Ossau.jpg');

COMMIT;


-- -----------------------------------------------------
-- Data for table `point_of_interest_has_type`
-- -----------------------------------------------------
START TRANSACTION;
USE `nationalparksdb`;
INSERT INTO `point_of_interest_has_type` (`point_of_interest_type_id`, `point_of_interest_id`) VALUES (1, 1);

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

