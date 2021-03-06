-- MySQL Script generated by MySQL Workbench
-- Sat Sep  1 14:25:59 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema impulse_db
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `impulse_db` ;

-- -----------------------------------------------------
-- Schema impulse_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `impulse_db` DEFAULT CHARACTER SET utf8 ;
USE `impulse_db` ;

-- -----------------------------------------------------
-- Table `impulse_db`.`role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `impulse_db`.`role` ;

CREATE TABLE IF NOT EXISTS `impulse_db`.`role` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `impulse_db`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `impulse_db`.`user` ;

CREATE TABLE IF NOT EXISTS `impulse_db`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(255) NOT NULL,
  `username` VARCHAR(255) NOT NULL,
  `password_hash` VARCHAR(255) NOT NULL,
  `password_salt` VARCHAR(255) NOT NULL,
  `role_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_user_role1_idx` (`role_id` ASC),
  CONSTRAINT `fk_user_role1`
    FOREIGN KEY (`role_id`)
    REFERENCES `impulse_db`.`role` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `impulse_db`.`individual_task`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `impulse_db`.`individual_task` ;

CREATE TABLE IF NOT EXISTS `impulse_db`.`individual_task` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `description` MEDIUMTEXT NULL,
  `started_at` DATETIME NOT NULL,
  `end_limit` DATETIME NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_individual_task_user_idx` (`user_id` ASC),
  CONSTRAINT `fk_individual_task_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `impulse_db`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `impulse_db`.`individual_task_config`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `impulse_db`.`individual_task_config` ;

CREATE TABLE IF NOT EXISTS `impulse_db`.`individual_task_config` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `notificated` TINYINT NOT NULL,
  `individual_task_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_individual_task_config_individual_task1_idx` (`individual_task_id` ASC),
  CONSTRAINT `fk_individual_task_config_individual_task1`
    FOREIGN KEY (`individual_task_id`)
    REFERENCES `impulse_db`.`individual_task` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `impulse_db`.`role_permission`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `impulse_db`.`role_permission` ;

CREATE TABLE IF NOT EXISTS `impulse_db`.`role_permission` (
  `id` INT NOT NULL,
  `permission` VARCHAR(255) NOT NULL,
  `role_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `permission_UNIQUE` (`permission` ASC),
  INDEX `fk_role_permission_role1_idx` (`role_id` ASC),
  CONSTRAINT `fk_role_permission_role1`
    FOREIGN KEY (`role_id`)
    REFERENCES `impulse_db`.`role` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
