-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Universidade
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Universidade
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Universidade` DEFAULT CHARACTER SET utf8 ;
USE `Universidade` ;

-- -----------------------------------------------------
-- Table `Universidade`.`Cursos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Universidade`.`Cursos` (
  `idCursos` INT NOT NULL AUTO_INCREMENT,
  `Nome_Cursos` VARCHAR(45) NULL,
  `Duracao` INT NULL,
  PRIMARY KEY (`idCursos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Universidade`.`Alunos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Universidade`.`Alunos` (
  `idAlunos` INT NOT NULL AUTO_INCREMENT,
  `Nome_Alunos` VARCHAR(50) NULL,
  `CPF` INT NULL,
  `EMAIL` VARCHAR(50) NULL,
  `RA` INT NULL,
  `Telefeone` INT NULL,
  `Cursos_idCursos` INT NOT NULL,
  PRIMARY KEY (`idAlunos`),
  INDEX `fk_Alunos_Cursos_idx` (`Cursos_idCursos` ASC) VISIBLE,
  CONSTRAINT `fk_Alunos_Cursos`
    FOREIGN KEY (`Cursos_idCursos`)
    REFERENCES `Universidade`.`Cursos` (`idCursos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
