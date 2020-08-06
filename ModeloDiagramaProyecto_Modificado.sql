-- MySQL Script generated by MySQL Workbench
-- Wed Aug  5 23:31:43 2020
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
-- -----------------------------------------------------
-- Schema new_schema1
-- -----------------------------------------------------
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Personas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Personas` (
  `PK_cedula` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido1` VARCHAR(30) NOT NULL,
  `apellido2` VARCHAR(30) NULL,
  `fecNacimiento` DATE NOT NULL,
  `sexo` INT NULL,
  `observaciones` VARCHAR(400) NULL,
  `lastUser` VARCHAR(20) NULL,
  `lastModification` DATE NULL,
  PRIMARY KEY (`PK_cedula`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Direcciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Direcciones` (
  `PKA_idDireccion` INT NOT NULL AUTO_INCREMENT,
  `FK_cedula` INT NOT NULL,
  `nomLugar` VARCHAR(40) NOT NULL,
  `direccion` VARCHAR(400) NOT NULL,
  `lastUser` VARCHAR(20) NULL,
  `lastModification` DATE NULL,
  INDEX `FK_DireccionesPersona_idx` (`FK_cedula` ASC) VISIBLE,
  PRIMARY KEY (`PKA_idDireccion`),
  CONSTRAINT `FK_DireccionesPersona`
    FOREIGN KEY (`FK_cedula`)
    REFERENCES `mydb`.`Personas` (`PK_cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Telefonos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Telefonos` (
  `PK_telefono` INT NOT NULL,
  `PK_FK_cedula` INT NOT NULL,
  `descripcion` VARCHAR(50) NULL,
  `lastUser` VARCHAR(20) NULL,
  `lastModification` DATE NULL,
  INDEX `FK_DireccionesPersonas_idx` (`PK_FK_cedula` ASC) VISIBLE,
  PRIMARY KEY (`PK_telefono`),
  CONSTRAINT `FK_DireccionesPersonas`
    FOREIGN KEY (`PK_FK_cedula`)
    REFERENCES `mydb`.`Personas` (`PK_cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Telefono`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Telefono` (
  `PK_Telefono` INT NOT NULL,
  `FK_Cedula` INT NOT NULL,
  `Descripcion` VARCHAR(5000) NULL,
  `Correo` VARCHAR(45) NULL,
  `Ult_Usuario` VARCHAR(45) NULL,
  `Ult_Modificacion` VARCHAR(45) NULL,
  PRIMARY KEY (`PK_Telefono`),
  INDEX `FK_Cedula_idx` (`FK_Cedula` ASC) VISIBLE,
  CONSTRAINT `FK_Cedula`
    FOREIGN KEY (`FK_Cedula`)
    REFERENCES `mydb`.`Cliente` (`PK_Cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cliente` (
  `PK_Cedula` INT NOT NULL,
  `FK_Telefono` INT NOT NULL,
  `Descripción` VARCHAR(5000) NULL,
  `UltimaVisita` DATE NULL,
  `Correo` VARCHAR(70) NULL,
  `Ult_Usuario` VARCHAR(45) NULL,
  `Ult_Modificacion` VARCHAR(45) NULL,
  PRIMARY KEY (`PK_Cedula`),
  INDEX `FK_ServidorClientes` (`FK_Telefono` ASC) VISIBLE,
  CONSTRAINT `FK_ServidorDeClientes`
    FOREIGN KEY (`FK_Telefono`)
    REFERENCES `mydb`.`Telefono` (`PK_Telefono`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Servidor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Servidor` (
  `PK_Tiempo` INT NOT NULL,
  `FK_Cedula` INT NOT NULL,
  `NumComputadora` VARCHAR(45) NOT NULL,
  `Ult_Usuario` VARCHAR(45) NULL,
  `Ult_Modificacion` VARCHAR(45) NULL,
  PRIMARY KEY (`PK_Tiempo`),
  INDEX `FK_Cedula` (`FK_Cedula` ASC) VISIBLE,
  CONSTRAINT `FK_ServidorDeCliente`
    FOREIGN KEY (`FK_Cedula`)
    REFERENCES `mydb`.`Cliente` (`PK_Cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Administración`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Administración` (
  `PK_Administracion` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Apellido1` VARCHAR(45) NOT NULL,
  `Apellido2` VARCHAR(45) NULL,
  `FechaNacimiento` DATE NOT NULL,
  `Telefono` VARCHAR(45) NULL,
  `Sexo` INT NULL,
  `Comentario` VARCHAR(600) NULL,
  `TiempoUsado` VARCHAR(10000) NULL,
  `UltimoUsuario` VARCHAR(45) NULL,
  `PK_Telefono` INT NULL,
  `PK_Celuda` INT NULL,
  `Administracióncol` VARCHAR(45) NULL,
  `Correo` VARCHAR(70) NULL,
  PRIMARY KEY (`PK_Administracion`),
  INDEX `Cedula_idx` (`PK_Celuda` ASC) VISIBLE,
  CONSTRAINT `Cedula`
    FOREIGN KEY (`PK_Celuda`)
    REFERENCES `mydb`.`Cliente` (`PK_Cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
