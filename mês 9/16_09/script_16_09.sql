-- MySQL Script generated by MySQL Workbench
-- Mon Sep 16 14:08:45 2024
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
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`categoria` (
  `idcategoria` INT NOT NULL,
  `categoria` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idcategoria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`produtos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`produtos` (
  `idprodutos` INT NOT NULL,
  `dsprodutoscol` VARCHAR(45) NULL,
  `preco` FLOAT NULL,
  `qtdade` INT NULL,
  `foto` LONGBLOB NULL,
  `categorias_idcategorias` INT NULL,
  `categoria_idcategoria` INT NOT NULL,
  PRIMARY KEY (`idprodutos`),
  INDEX `fk_produtos_categoria_idx` (`categoria_idcategoria` ASC) VISIBLE,
  CONSTRAINT `fk_produtos_categoria`
    FOREIGN KEY (`categoria_idcategoria`)
    REFERENCES `mydb`.`categoria` (`idcategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`clientes` (
  `idclientes` INT NOT NULL,
  `nome` VARCHAR(100) NOT NULL,
  `email` VARCHAR(100) NULL,
  `senha` VARCHAR(100) NULL,
  PRIMARY KEY (`idclientes`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`pedidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`pedidos` (
  `idpedidos` INT NOT NULL,
  `data` DATE NOT NULL,
  `status` VARCHAR(45) NOT NULL,
  `sessao` VARCHAR(45) NOT NULL,
  `clientes_idclientes` INT NULL,
  `clientes_idclientes1` INT NOT NULL,
  PRIMARY KEY (`idpedidos`),
  INDEX `fk_pedidos_clientes1_idx` (`clientes_idclientes1` ASC) VISIBLE,
  CONSTRAINT `fk_pedidos_clientes1`
    FOREIGN KEY (`clientes_idclientes1`)
    REFERENCES `mydb`.`clientes` (`idclientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`pedidoitens`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`pedidoitens` (
  `idpedidoitens` INT NOT NULL,
  `qtdade` INT NOT NULL,
  `preco` FLOAT NOT NULL,
  `total` FLOAT NOT NULL,
  `produtos_idprodutos` INT NOT NULL,
  `pedidos_idpedidos` INT NOT NULL,
  PRIMARY KEY (`idpedidoitens`),
  INDEX `fk_pedidoitens_produtos1_idx` (`produtos_idprodutos` ASC) VISIBLE,
  INDEX `fk_pedidoitens_pedidos1_idx` (`pedidos_idpedidos` ASC) VISIBLE,
  CONSTRAINT `fk_pedidoitens_produtos1`
    FOREIGN KEY (`produtos_idprodutos`)
    REFERENCES `mydb`.`produtos` (`idprodutos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedidoitens_pedidos1`
    FOREIGN KEY (`pedidos_idpedidos`)
    REFERENCES `mydb`.`pedidos` (`idpedidos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
