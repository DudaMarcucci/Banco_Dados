-- MySQL Script generated by MySQL Workbench
-- Fri Sep 20 07:42:32 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema vendadeproduto
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema vendadeproduto
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `vendadeproduto` DEFAULT CHARACTER SET utf8 ;
USE `vendadeproduto` ;

-- -----------------------------------------------------
-- Table `vendadeproduto`.`categorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vendadeproduto`.`categorias` (
  `idCategorias` INT NOT NULL,
  `dsCategoria` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCategorias`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vendadeproduto`.`produtos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vendadeproduto`.`produtos` (
  `idProdutos` INT NOT NULL,
  `dsProduto` VARCHAR(45) NOT NULL,
  `preco` FLOAT NOT NULL,
  `qtdade` INT NOT NULL,
  `foto` LONGBLOB NOT NULL,
  `categorias_idCategorias` INT NOT NULL,
  PRIMARY KEY (`idProdutos`),
  -- INDEX `fk_produtos_categorias_idx` (`categorias_idCategorias` ASC) VISIBLE,
  CONSTRAINT `fk_produtos_categorias`
    FOREIGN KEY (`categorias_idCategorias`)
    REFERENCES `vendadeproduto`.`categorias` (`idCategorias`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vendadeproduto`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vendadeproduto`.`clientes` (
  `idClientes` INT NOT NULL,
  `nome` VARCHAR(100) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `senha` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idClientes`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vendadeproduto`.`pedidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vendadeproduto`.`pedidos` (
  `idPedidos` INT NOT NULL,
  `data` DATE NOT NULL,
  `status` VARCHAR(45) NOT NULL,
  `sessao` VARCHAR(45) NOT NULL,
  `clientes_idClientes` INT NOT NULL,
  PRIMARY KEY (`idPedidos`),
  -- INDEX `fk_pedidos_clientes1_idx` (`clientes_idClientes` ASC) VISIBLE,
  CONSTRAINT `fk_pedidos_clientes1`
    FOREIGN KEY (`clientes_idClientes`)
    REFERENCES `vendadeproduto`.`clientes` (`idClientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vendadeproduto`.`pedidoItens`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vendadeproduto`.`pedidoItens` (
  `idPedidoItens` INT NOT NULL,
  `qtdade` INT NOT NULL,
  `preco` FLOAT NOT NULL,
  `total` FLOAT NOT NULL,
  `produtos_idProdutos` INT NOT NULL,
  `pedidos_idPedidos` INT NOT NULL,
  PRIMARY KEY (`idPedidoItens`),
  -- INDEX `fk_pedidoItens_produtos1_idx` (`produtos_idProdutos` ASC) VISIBLE,
  -- INDEX `fk_pedidoItens_pedidos1_idx` (`pedidos_idPedidos` ASC) VISIBLE,
  CONSTRAINT `fk_pedidoItens_produtos1`
    FOREIGN KEY (`produtos_idProdutos`)
    REFERENCES `vendadeproduto`.`produtos` (`idProdutos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedidoItens_pedidos1`
    FOREIGN KEY (`pedidos_idPedidos`)
    REFERENCES `vendadeproduto`.`pedidos` (`idPedidos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
