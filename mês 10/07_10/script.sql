-- MySQL Script generated by MySQL Workbench
-- Mon Oct  7 14:18:21 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `empregado_projeto` DEFAULT CHARACTER SET utf8 ;
USE `empregado_projeto` ;

-- -----------------------------------------------------
-- Table `mydb`.`departamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `empregado_projeto`.`departamento` (
  `iddepartamento` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(10) NULL,
  PRIMARY KEY (`iddepartamento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`empregado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `empregado_projeto`.`empregado` (
  `idempregado` INT NOT NULL AUTO_INCREMENT,
  `matricula` VARCHAR(10) NOT NULL,
  `nome` VARCHAR(200) NOT NULL,
  `salario` DECIMAL(2) NOT NULL,
  `rua` VARCHAR(100) NOT NULL,
  `bairro` VARCHAR(100) NULL,
  `departamento_iddepartamento` INT NOT NULL,
  PRIMARY KEY (`idempregado`),
 -- INDEX `fk_empregado_departamento1_idx` (`departamento_iddepartamento` ASC) VISIBLE,
  CONSTRAINT `fk_empregado_departamento1`
    FOREIGN KEY (`departamento_iddepartamento`)
    REFERENCES `empregado_projeto`.`departamento` (`iddepartamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`projeto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `empregado_projeto`.`projeto` (
  `idprojeto` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NULL,
  `localizacao` VARCHAR(100) NULL,
  PRIMARY KEY (`idprojeto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`dependente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `empregado_projeto`.`dependente` (
  `nomeDependente` VARCHAR(45) NOT NULL,
  `sexo` CHAR NULL,
  `dataNasc` DATE NOT NULL,
  `parentesco` VARCHAR(45) NOT NULL,
  `empregado_idempregado` INT NOT NULL,
  PRIMARY KEY (`nomeDependente`),
  -- INDEX `fk_dependente_empregado1_idx` (`empregado_idempregado` ASC) VISIBLE,
  CONSTRAINT `fk_dependente_empregado1`
    FOREIGN KEY (`empregado_idempregado`)
    REFERENCES `empregado_projeto`.`empregado` (`idempregado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`telefone`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `empregado_projeto`.`telefone` (
  `empregado_idempregado` INT NOT NULL,
  `telefone` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`telefone`, `empregado_idempregado`),
  -- INDEX `fk_telefone_empregado1_idx` (`empregado_idempregado` ASC) VISIBLE,
  CONSTRAINT `fk_telefone_empregado1`
    FOREIGN KEY (`empregado_idempregado`)
    REFERENCES `empregado_projeto`.`empregado` (`idempregado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`empregado_has_projeto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `empregado_projeto`.`empregado_has_projeto` (
  `empregado_idempregado` INT NOT NULL,
  `projeto_idprojeto` INT NOT NULL,
  PRIMARY KEY (`empregado_idempregado`, `projeto_idprojeto`),
  -- INDEX `fk_empregado_has_projeto_projeto1_idx` (`projeto_idprojeto` ASC) VISIBLE,
  -- INDEX `fk_empregado_has_projeto_empregado_idx` (`empregado_idempregado` ASC) VISIBLE,
  CONSTRAINT `fk_empregado_has_projeto_empregado`
    FOREIGN KEY (`empregado_idempregado`)
    REFERENCES `empregado_projeto`.`empregado` (`idempregado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_empregado_has_projeto_projeto1`
    FOREIGN KEY (`projeto_idprojeto`)
    REFERENCES `empregado_projeto`.`projeto` (`idprojeto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
