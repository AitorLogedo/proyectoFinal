-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';



-- -----------------------------------------------------
-- Schema webshop
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `webshop` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `webshop` ;

-- -----------------------------------------------------
-- Table `webshop`.`proveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `webshop`.`proveedor` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nif` VARCHAR(32) NOT NULL,
  `razon_social` VARCHAR(64) NOT NULL COMMENT 'nombre',
  `email` VARCHAR(64) NOT NULL COMMENT 'email de contacto y se utiliza como cuenta de acceso',
  `telefono` VARCHAR(64) NOT NULL COMMENT 'telefonos de contacto',
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `nombre_ind` (`razon_social` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
COMMENT = 'usuario registrado';


-- -----------------------------------------------------
-- Table `webshop`.`producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `webshop`.`producto` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'identificador del producto',
  `codigo` VARCHAR(32) NOT NULL COMMENT 'codigo de producto',
  `titulo` VARCHAR(128) NOT NULL COMMENT 'titulo para el producto',
  `desc_producto` LONGTEXT NOT NULL COMMENT 'descripción ampliada del producto',
  `stock` INT NOT NULL COMMENT 'nº articulos en stock',
  `stock_minimo` INT NOT NULL,
  `precio` DECIMAL(8,2) NOT NULL COMMENT 'precio del producto',
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  FULLTEXT INDEX `busqueda` (`titulo`, `desc_producto`) COMMENT '\'\'\'busqueda fulltext sobre un articulo\\\\n\'\'\'' INVISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
COMMENT = 'productos';


-- -----------------------------------------------------
-- Table `webshop`.`producto_x_proveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `webshop`.`producto_x_proveedor` (
  `id` INT NOT NULL,
  `proveedor_id` INT UNSIGNED NOT NULL,
  `producto_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_producto_x_proveedor_proveedor_idx` (`proveedor_id` ASC) VISIBLE,
  INDEX `fk_producto_x_proveedor_producto1_idx` (`producto_id` ASC) VISIBLE,
  CONSTRAINT `fk_producto_x_proveedor_proveedor`
    FOREIGN KEY (`proveedor_id`)
    REFERENCES `webshop`.`proveedor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_producto_x_proveedor_producto1`
    FOREIGN KEY (`producto_id`)
    REFERENCES `webshop`.`producto` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `webshop`.`metodo_pago`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `webshop`.`metodo_pago` (
  `id` INT NOT NULL,
  `desc_metodo_pago` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `webshop`.`metodo_envio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `webshop`.`metodo_envio` (
  `id` INT NOT NULL,
  `desc_medio_envio` VARCHAR(45) NOT NULL,
  `europa` TINYINT(1) NOT NULL DEFAULT 0,
  `mundo` TINYINT(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

USE `webshop` ;

-- -----------------------------------------------------
-- Table `webshop`.`cache`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `webshop`.`cache` (
  `key` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `value` MEDIUMTEXT CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `expiration` INT NOT NULL,
  PRIMARY KEY (`key`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `webshop`.`cache_locks`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `webshop`.`cache_locks` (
  `key` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `owner` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `expiration` INT NOT NULL,
  PRIMARY KEY (`key`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `webshop`.`categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `webshop`.`categoria` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'identificador de la categoria',
  `desc_categoria` VARCHAR(128) NOT NULL COMMENT 'titulo de la categoria',
  `logo` BLOB NOT NULL COMMENT 'imagen asociada a la categoria',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_unique` (`id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
COMMENT = 'categoria de productos';


-- -----------------------------------------------------
-- Table `webshop`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `webshop`.`cliente` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `alias` VARCHAR(32) NOT NULL,
  `nif` VARCHAR(32) NOT NULL,
  `nombre` VARCHAR(32) NOT NULL COMMENT 'nombre',
  `apellido_1` VARCHAR(32) NULL COMMENT 'primer apellido',
  `apellido_2` VARCHAR(32) NULL DEFAULT NULL COMMENT 'segundo apellido',
  `email` VARCHAR(64) NOT NULL COMMENT 'email de contacto y se utiliza como cuenta de acceso',
  `telefono` VARCHAR(64) NOT NULL COMMENT 'telefonos de contacto',
  `avatar` BLOB NOT NULL COMMENT 'imagen de perfil',
  `newsletter` TINYINT(1) NOT NULL DEFAULT 0,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `nombre_ind` (`nombre` ASC, `apellido_1` ASC, `apellido_2` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
COMMENT = 'usuario registrado';


-- -----------------------------------------------------
-- Table `webshop`.`pais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `webshop`.`pais` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `iso2` CHAR(2) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NULL DEFAULT NULL,
  `iso3` CHAR(3) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NULL DEFAULT NULL,
  `nombre` VARCHAR(100) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `is_eu` TINYINT(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `countries_iso2_unique` (`iso2` ASC) VISIBLE,
  UNIQUE INDEX `countries_iso3_unique` (`iso3` ASC) VISIBLE,
  INDEX `countries_name_index` (`nombre` ASC) VISIBLE,
  INDEX `countries_is_eu_index` (`is_eu` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 250
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `webshop`.`cupon`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `webshop`.`cupon` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id de la entidad',
  `cliente_id` INT UNSIGNED NULL,
  `porcentaje` DOUBLE NULL DEFAULT NULL COMMENT 'porcentaje de descuento',
  `importe` DOUBLE NULL DEFAULT NULL COMMENT 'importe fijo de descuento',
  `compra_minima` DOUBLE NULL DEFAULT NULL COMMENT 'valor minimo de compra para aplicar descuento',
  `fecha_desde` TIMESTAMP NULL DEFAULT NULL COMMENT 'fecha de inicio de validez del cupon',
  `fecha_hasta` TIMESTAMP NULL DEFAULT NULL COMMENT 'fecha hasta de validez del cupon',
  `codigo` VARCHAR(32) NULL DEFAULT NULL COMMENT 'codigo del cupon',
  `titulo` VARCHAR(64) NULL DEFAULT NULL COMMENT 'titulo para el cupon',
  `imagen` BLOB NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_cupon_cliente1_idx` (`cliente_id` ASC) VISIBLE,
  CONSTRAINT `fk_cupon_cliente1`
    FOREIGN KEY (`cliente_id`)
    REFERENCES `webshop`.`cliente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `webshop`.`tipo_via`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `webshop`.`tipo_via` (
  `id` INT NOT NULL COMMENT 'id del tipo de via',
  `desc_tipo_via` VARCHAR(32) NOT NULL COMMENT 'denominacion del tipo de via',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
COMMENT = 'tipos de via';


-- -----------------------------------------------------
-- Table `webshop`.`provincia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `webshop`.`provincia` (
  `id` INT NOT NULL COMMENT 'id de la provincia',
  `desc_provincia` VARCHAR(45) NOT NULL COMMENT 'nombre de la provincia',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
COMMENT = 'provincias';


-- -----------------------------------------------------
-- Table `webshop`.`direccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `webshop`.`direccion` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cliente_id` INT UNSIGNED NOT NULL,
  `pais_id` INT UNSIGNED NOT NULL,
  `tipo_via_id` INT NOT NULL,
  `provincia_id` INT NOT NULL COMMENT 'id de la provincia',
  `alias` VARCHAR(32) NOT NULL COMMENT 'alias de la direccion',
  `via` VARCHAR(128) NOT NULL COMMENT 'nombre de la via /carretera',
  `numero` INT NULL DEFAULT NULL COMMENT 'numero de via',
  `bloque` VARCHAR(16) NULL DEFAULT NULL COMMENT 'bloque',
  `planta` VARCHAR(32) NULL DEFAULT NULL COMMENT 'planta',
  `puerta` VARCHAR(16) NULL DEFAULT NULL COMMENT 'puerta',
  `poligono` VARCHAR(64) NULL DEFAULT NULL COMMENT 'poligono',
  `nave` VARCHAR(16) NULL DEFAULT NULL COMMENT 'nave',
  `punto_km` INT NULL DEFAULT NULL COMMENT 'punto km en caso de carretera',
  `otras_referencias` VARCHAR(128) NULL DEFAULT NULL COMMENT 'otras referencias como urbanizacion, nombre del negocio , etc',
  `cod_postal` VARCHAR(5) NULL DEFAULT NULL COMMENT 'codigo postal',
  `localidad` VARCHAR(128) NULL DEFAULT NULL COMMENT 'localidad',
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_direccion_tipo_via1_idx` (`tipo_via_id` ASC) VISIBLE,
  INDEX `fk_direccion_provincia1_idx` (`provincia_id` ASC) VISIBLE,
  INDEX `fk_direccion_pais1_idx` (`pais_id` ASC) VISIBLE,
  INDEX `fk_direccion_cliente1_idx` (`cliente_id` ASC) VISIBLE,
  CONSTRAINT `fk_direccion_tipo_via1`
    FOREIGN KEY (`tipo_via_id`)
    REFERENCES `webshop`.`tipo_via` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_direccion_pais1`
    FOREIGN KEY (`pais_id`)
    REFERENCES `webshop`.`pais` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_direccion_provincia1`
    FOREIGN KEY (`provincia_id`)
    REFERENCES `webshop`.`provincia` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_direccion_cliente1`
    FOREIGN KEY (`cliente_id`)
    REFERENCES `webshop`.`cliente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
COMMENT = 'direcciones de envio';


-- -----------------------------------------------------
-- Table `webshop`.`pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `webshop`.`pedido` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id de la entidad',
  `cliente_id` INT UNSIGNED NOT NULL,
  `direccion_id` INT NOT NULL,
  `metodo_pago_id` INT NOT NULL,
  `metodo_envio_id` INT NOT NULL,
  `numero` VARCHAR(45) NOT NULL COMMENT 'numero de pedido',
  `fecha` DATETIME NOT NULL COMMENT 'fecha del pedido',
  `factura` BLOB NULL DEFAULT NULL COMMENT 'factura del pedido',
  `ref_pago` VARCHAR(64) NULL,
  `desc_ref_pago` VARCHAR(256) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `numero_unique` (`numero` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_pedido_cliente1_idx` (`cliente_id` ASC) VISIBLE,
  INDEX `fk_pedido_direccion1_idx1` (`direccion_id` ASC) VISIBLE,
  INDEX `fk_pedido_metodo_pago1_idx` (`metodo_pago_id` ASC) VISIBLE,
  INDEX `fk_pedido_metodo_envio1_idx` (`metodo_envio_id` ASC) VISIBLE,
  CONSTRAINT `fk_pedido_cliente1`
    FOREIGN KEY (`cliente_id`)
    REFERENCES `webshop`.`cliente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedido_direccion1`
    FOREIGN KEY (`direccion_id`)
    REFERENCES `webshop`.`direccion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedido_metodo_pago1`
    FOREIGN KEY (`metodo_pago_id`)
    REFERENCES `webshop`.`metodo_pago` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedido_metodo_envio1`
    FOREIGN KEY (`metodo_envio_id`)
    REFERENCES `webshop`.`metodo_envio` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
COMMENT = 'pedidos de un usuario';


-- -----------------------------------------------------
-- Table `webshop`.`devolucion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `webshop`.`devolucion` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `pedido_id` INT UNSIGNED NOT NULL,
  `codigo` VARCHAR(45) NOT NULL COMMENT 'codigo de devolucion',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_devolucion_pedido1_idx` (`pedido_id` ASC) VISIBLE,
  CONSTRAINT `fk_devolucion_pedido1`
    FOREIGN KEY (`pedido_id`)
    REFERENCES `webshop`.`pedido` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `webshop`.`estado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `webshop`.`estado` (
  `id` INT NOT NULL COMMENT 'id de la entidad',
  `desc_estado` VARCHAR(32) NULL DEFAULT NULL COMMENT 'estado: procesando, enviado, entregado. anulado',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
COMMENT = 'estados de los pedidos';


-- -----------------------------------------------------
-- Table `webshop`.`estado_devolucion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `webshop`.`estado_devolucion` (
  `id` INT UNSIGNED NOT NULL COMMENT 'id de la entidad',
  `desc_estado` VARCHAR(32) NOT NULL COMMENT 'descripcion del estado de la devolucion',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `webshop`.`estado_x_pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `webshop`.`estado_x_pedido` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id de la entidad',
  `pedido_id` INT UNSIGNED NOT NULL,
  `estado_id` INT NOT NULL,
  `fecha` DATETIME NOT NULL COMMENT 'fecha del estado',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_estado_x_pedido_estado1_idx1` (`estado_id` ASC) VISIBLE,
  INDEX `fk_estado_x_pedido_pedido1_idx1` (`pedido_id` ASC) VISIBLE,
  CONSTRAINT `fk_estado_x_pedido_estado1`
    FOREIGN KEY (`estado_id`)
    REFERENCES `webshop`.`estado` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_estado_x_pedido_pedido1`
    FOREIGN KEY (`pedido_id`)
    REFERENCES `webshop`.`pedido` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
COMMENT = 'estados de un pedido';


-- -----------------------------------------------------
-- Table `webshop`.`estados_x_devolucion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `webshop`.`estados_x_devolucion` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id de la entidad',
  `devolucion_id` INT UNSIGNED NOT NULL,
  `estado_devolucion_id` INT UNSIGNED NOT NULL,
  `fecha` DATETIME NOT NULL COMMENT 'fecha del estado',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_estados_x_devolucion_estado_devolucion1_idx` (`estado_devolucion_id` ASC) VISIBLE,
  INDEX `fk_estados_x_devolucion_devolucion1_idx` (`devolucion_id` ASC) VISIBLE,
  CONSTRAINT `fk_estados_x_devolucion_estado_devolucion1`
    FOREIGN KEY (`estado_devolucion_id`)
    REFERENCES `webshop`.`estado_devolucion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_estados_x_devolucion_devolucion1`
    FOREIGN KEY (`devolucion_id`)
    REFERENCES `webshop`.`devolucion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
COMMENT = 'estados de un pedido';


-- -----------------------------------------------------
-- Table `webshop`.`failed_jobs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `webshop`.`failed_jobs` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `connection` TEXT CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `queue` TEXT CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `payload` LONGTEXT CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `exception` LONGTEXT CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `failed_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `failed_jobs_uuid_unique` (`uuid` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `webshop`.`job_batches`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `webshop`.`job_batches` (
  `id` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `name` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `total_jobs` INT NOT NULL,
  `pending_jobs` INT NOT NULL,
  `failed_jobs` INT NOT NULL,
  `failed_job_ids` LONGTEXT CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `options` MEDIUMTEXT CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NULL DEFAULT NULL,
  `cancelled_at` INT NULL DEFAULT NULL,
  `created_at` INT NOT NULL,
  `finished_at` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `webshop`.`jobs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `webshop`.`jobs` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `queue` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `payload` LONGTEXT CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `attempts` TINYINT UNSIGNED NOT NULL,
  `reserved_at` INT UNSIGNED NULL DEFAULT NULL,
  `available_at` INT UNSIGNED NOT NULL,
  `created_at` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `jobs_queue_index` (`queue` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `webshop`.`migrations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `webshop`.`migrations` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `batch` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `webshop`.`opinion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `webshop`.`opinion` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id de la opinion',
  `cliente_id` INT UNSIGNED NOT NULL,
  `producto_id` INT UNSIGNED NOT NULL,
  `comentario` VARCHAR(45) NOT NULL COMMENT 'comentario realizado por el usuario',
  `puntuacion` TINYINT(1) NOT NULL COMMENT 'puntuacion otorgada de 0-5 estrellas',
  `validado` TINYINT(1) NOT NULL COMMENT '0: no validado por moderador, 1: si validado y visible a resto usuarios',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_opinion_cliente1_idx` (`cliente_id` ASC) VISIBLE,
  INDEX `fk_opinion_producto1_idx1` (`producto_id` ASC) VISIBLE,
  CONSTRAINT `fk_opinion_cliente1`
    FOREIGN KEY (`cliente_id`)
    REFERENCES `webshop`.`cliente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_opinion_producto1`
    FOREIGN KEY (`producto_id`)
    REFERENCES `webshop`.`producto` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
COMMENT = 'opiniones sobre un producto';


-- -----------------------------------------------------
-- Table `webshop`.`password_reset_tokens`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `webshop`.`password_reset_tokens` (
  `email` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `token` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`email`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `webshop`.`pregunta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `webshop`.`pregunta` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'identificador de la pregunta',
  `cliente_id` INT UNSIGNED NOT NULL,
  `producto_id` INT UNSIGNED NOT NULL,
  `comentario` LONGTEXT NOT NULL COMMENT 'pregunta formulada',
  `validado` TINYINT(1) NOT NULL COMMENT '0: no validado por moderador, 1: si validado y visible a resto usuarios',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_pregunta_cliente1_idx` (`cliente_id` ASC) VISIBLE,
  INDEX `fk_pregunta_producto1_idx1` (`producto_id` ASC) VISIBLE,
  CONSTRAINT `fk_pregunta_cliente1`
    FOREIGN KEY (`cliente_id`)
    REFERENCES `webshop`.`cliente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pregunta_producto1`
    FOREIGN KEY (`producto_id`)
    REFERENCES `webshop`.`producto` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
COMMENT = 'preguntas sobre un producto';


-- -----------------------------------------------------
-- Table `webshop`.`producto_x_categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `webshop`.`producto_x_categoria` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id de la tabla',
  `producto_id` INT UNSIGNED NOT NULL,
  `categoria_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_producto_x_categoria_producto1_idx1` (`producto_id` ASC) VISIBLE,
  INDEX `fk_producto_x_categoria_categoria1_idx1` (`categoria_id` ASC) VISIBLE,
  CONSTRAINT `fk_producto_x_categoria_producto1`
    FOREIGN KEY (`producto_id`)
    REFERENCES `webshop`.`producto` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_producto_x_categoria_categoria1`
    FOREIGN KEY (`categoria_id`)
    REFERENCES `webshop`.`categoria` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
COMMENT = 'relacion entre productos y categoria';


-- -----------------------------------------------------
-- Table `webshop`.`producto_x_pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `webshop`.`producto_x_pedido` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `producto_id` INT UNSIGNED NOT NULL,
  `pedido_id` INT UNSIGNED NOT NULL,
  `unidades` VARCHAR(45) NOT NULL,
  `precio_unidad` DECIMAL(6,2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_producto_x_pedido_producto1_idx1` (`producto_id` ASC) VISIBLE,
  INDEX `fk_producto_x_pedido_pedido1_idx1` (`pedido_id` ASC) VISIBLE,
  CONSTRAINT `fk_producto_x_pedido_producto1`
    FOREIGN KEY (`producto_id`)
    REFERENCES `webshop`.`producto` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_producto_x_pedido_pedido1`
    FOREIGN KEY (`pedido_id`)
    REFERENCES `webshop`.`pedido` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
COMMENT = 'productos de un pedido';


-- -----------------------------------------------------
-- Table `webshop`.`productos_x_devolucion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `webshop`.`productos_x_devolucion` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id de la entidad',
  `devolucion_id` INT UNSIGNED NOT NULL,
  `producto_x_pedido_id` INT UNSIGNED NOT NULL,
  `cantidad` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_productos_x_devolucion_devolucion1_idx` (`devolucion_id` ASC) VISIBLE,
  INDEX `fk_productos_x_devolucion_producto_x_pedido1_idx` (`producto_x_pedido_id` ASC) VISIBLE,
  CONSTRAINT `fk_productos_x_devolucion_devolucion1`
    FOREIGN KEY (`devolucion_id`)
    REFERENCES `webshop`.`devolucion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_productos_x_devolucion_producto_x_pedido1`
    FOREIGN KEY (`producto_x_pedido_id`)
    REFERENCES `webshop`.`producto_x_pedido` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `webshop`.`recurso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `webshop`.`recurso` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'identificador del recurso',
  `producto_id` INT UNSIGNED NULL,
  `opinion_id` INT UNSIGNED NULL,
  `tipo_objeto` INT NOT NULL COMMENT '1: imagen, 2: video (enumeración por codigo)',
  `objeto` BLOB NOT NULL COMMENT 'imagen o video',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_recurso_producto1_idx1` (`producto_id` ASC) VISIBLE,
  INDEX `fk_recurso_opinion1_idx1` (`opinion_id` ASC) VISIBLE,
  CONSTRAINT `fk_recurso_producto1`
    FOREIGN KEY (`producto_id`)
    REFERENCES `webshop`.`producto` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_recurso_opinion1`
    FOREIGN KEY (`opinion_id`)
    REFERENCES `webshop`.`opinion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
COMMENT = 'imagenes o videos';


-- -----------------------------------------------------
-- Table `webshop`.`respuesta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `webshop`.`respuesta` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'identificador de la pregunta',
  `cliente_id` INT UNSIGNED NOT NULL,
  `comentario` LONGTEXT NOT NULL COMMENT 'respuesta del usuario',
  `validado` TINYINT(1) NOT NULL COMMENT '0: no validado por moderador, 1: si validado y visible a resto usuarios',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_respuesta_cliente1_idx` (`cliente_id` ASC) VISIBLE,
  CONSTRAINT `fk_respuesta_cliente1`
    FOREIGN KEY (`cliente_id`)
    REFERENCES `webshop`.`cliente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
COMMENT = 'respuestas a una pregunta';


-- -----------------------------------------------------
-- Table `webshop`.`rol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `webshop`.`rol` (
  `id` INT NOT NULL COMMENT 'id del rol de usuario',
  `desc_rol` VARCHAR(45) NOT NULL COMMENT 'nombre de rol',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
COMMENT = 'rol de usuario';


-- -----------------------------------------------------
-- Table `webshop`.`sessions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `webshop`.`sessions` (
  `id` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `user_id` BIGINT UNSIGNED NULL DEFAULT NULL,
  `ip_address` VARCHAR(45) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NULL DEFAULT NULL,
  `user_agent` TEXT CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NULL DEFAULT NULL,
  `payload` LONGTEXT CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `last_activity` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `sessions_user_id_index` (`user_id` ASC) VISIBLE,
  INDEX `sessions_last_activity_index` (`last_activity` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `webshop`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `webshop`.`users` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `rol_id` INT NOT NULL DEFAULT 2,
  `name` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `email` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `email_verified_at` TIMESTAMP NULL DEFAULT NULL,
  `password` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `remember_token` VARCHAR(100) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NULL DEFAULT NULL,
  `is_developer` TINYINT(1) NOT NULL DEFAULT '0',
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `users_email_unique` (`email` ASC) VISIBLE,
  INDEX `users_deleted_at_index` (`deleted_at` ASC) VISIBLE,
  INDEX `fk_users_rol1_idx` (`rol_id` ASC) VISIBLE,
  CONSTRAINT `fk_users_rol1`
    FOREIGN KEY (`rol_id`)
    REFERENCES `webshop`.`rol` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 51
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `webshop`.`userlogs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `webshop`.`userlogs` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` BIGINT UNSIGNED NOT NULL,
  `country_name` VARCHAR(100) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NULL DEFAULT NULL,
  `country_code` VARCHAR(2) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NULL DEFAULT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `userlogs_user_id_foreign` (`user_id` ASC) VISIBLE,
  INDEX `userlogs_created_at_index` (`created_at` ASC) VISIBLE,
  INDEX `userlogs_country_name_index` (`country_name` ASC) VISIBLE,
  CONSTRAINT `userlogs_user_id_foreign`
    FOREIGN KEY (`user_id`)
    REFERENCES `webshop`.`users` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 502
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `webshop`.`metodo_pago`
-- -----------------------------------------------------
START TRANSACTION;
INSERT INTO `webshop`.`metodo_pago` (`id`, `desc_metodo_pago`) VALUES (1, 'Visa/Master card');
INSERT INTO `webshop`.`metodo_pago` (`id`, `desc_metodo_pago`) VALUES (2, 'Paypal');
COMMIT;


-- -----------------------------------------------------
-- Data for table `webshop`.`metodo_envio`
-- -----------------------------------------------------
START TRANSACTION;
INSERT INTO `webshop`.`metodo_envio` (`id`, `desc_medio_envio`, `europa`, `mundo`) VALUES (1, 'Seur 24/48 h', 0, 0);
INSERT INTO `webshop`.`metodo_envio` (`id`, `desc_medio_envio`, `europa`, `mundo`) VALUES (2, 'Seur Internacional', 1, 1);
INSERT INTO `webshop`.`metodo_envio` (`id`, `desc_medio_envio`, `europa`, `mundo`) VALUES (3, 'Gls', 0, 0);
INSERT INTO `webshop`.`metodo_envio` (`id`, `desc_medio_envio`, `europa`, `mundo`) VALUES (4, 'DHL 24', 1, 0);
COMMIT;




-- -----------------------------------------------------
-- Data for table `rol`
-- -----------------------------------------------------
START TRANSACTION;
INSERT INTO `rol` (`id`, `desc_rol`) VALUES (1, 'Administrador');
INSERT INTO `rol` (`id`, `desc_rol`) VALUES (2, 'Cliente');

COMMIT;


-- -----------------------------------------------------
-- Data for table `estado`
-- -----------------------------------------------------
START TRANSACTION;
INSERT INTO `estado` (`id`, `desc_estado`) VALUES (1, 'Pedido Nuevo');
INSERT INTO `estado` (`id`, `desc_estado`) VALUES (2, 'Pendiente de pago');
INSERT INTO `estado` (`id`, `desc_estado`) VALUES (3, 'Pago realizado');
INSERT INTO `estado` (`id`, `desc_estado`) VALUES (4, 'preparando envío');
INSERT INTO `estado` (`id`, `desc_estado`) VALUES (5, 'Enviado');
INSERT INTO `estado` (`id`, `desc_estado`) VALUES (6, 'Entregado');
INSERT INTO `estado` (`id`, `desc_estado`) VALUES (7, 'Posibles devoluciones');
INSERT INTO `estado` (`id`, `desc_estado`) VALUES (8, 'Devoluciones en curso');
INSERT INTO `estado` (`id`, `desc_estado`) VALUES (9, 'Finalizado');

COMMIT;



-- -----------------------------------------------------
-- Data for table `estado_devolucion`
-- -----------------------------------------------------
START TRANSACTION;
INSERT INTO `estado_devolucion` (`id`, `desc_estado`) VALUES (1, 'Devolución iniciada');
INSERT INTO `estado_devolucion` (`id`, `desc_estado`) VALUES (2, 'productos recibidos');
INSERT INTO `estado_devolucion` (`id`, `desc_estado`) VALUES (3, 'reembolso emitido');
INSERT INTO `estado_devolucion` (`id`, `desc_estado`) VALUES (4, 'finalizado por expiración plazo');
INSERT INTO `estado_devolucion` (`id`, `desc_estado`) VALUES (5, 'finalizado por reembolso');

COMMIT;


-- -----------------------------------------------------
-- Data for table `provincia`
-- -----------------------------------------------------
START TRANSACTION;
INSERT INTO `provincia` (`id`, `desc_provincia`) VALUES (0, 'No España');
INSERT INTO `provincia` (`id`, `desc_provincia`) VALUES (1, 'Alava/Araba');
INSERT INTO `provincia` (`id`, `desc_provincia`) VALUES (2, 'Albacete');
INSERT INTO `provincia` (`id`, `desc_provincia`) VALUES (3, 'Alicante');
INSERT INTO `provincia` (`id`, `desc_provincia`) VALUES (4, 'Almería');
INSERT INTO `provincia` (`id`, `desc_provincia`) VALUES (5, 'Avila');
INSERT INTO `provincia` (`id`, `desc_provincia`) VALUES (6, 'Badajoz');
INSERT INTO `provincia` (`id`, `desc_provincia`) VALUES (7, 'Islas baleares');
INSERT INTO `provincia` (`id`, `desc_provincia`) VALUES (8, 'Barcelona');
INSERT INTO `provincia` (`id`, `desc_provincia`) VALUES (9, 'Burgos');
INSERT INTO `provincia` (`id`, `desc_provincia`) VALUES (10, 'Cáceres');
INSERT INTO `provincia` (`id`, `desc_provincia`) VALUES (11, 'Cádiz');
INSERT INTO `provincia` (`id`, `desc_provincia`) VALUES (12, 'Castellón');
INSERT INTO `provincia` (`id`, `desc_provincia`) VALUES (13, 'Ciudad real');
INSERT INTO `provincia` (`id`, `desc_provincia`) VALUES (14, 'Cordoba');
INSERT INTO `provincia` (`id`, `desc_provincia`) VALUES (15, 'La coruña/A Coruña');
INSERT INTO `provincia` (`id`, `desc_provincia`) VALUES (16, 'Cuenca');
INSERT INTO `provincia` (`id`, `desc_provincia`) VALUES (17, 'Gerona/Girona');
INSERT INTO `provincia` (`id`, `desc_provincia`) VALUES (18, 'Granada');
INSERT INTO `provincia` (`id`, `desc_provincia`) VALUES (19, 'Guadalajara');
INSERT INTO `provincia` (`id`, `desc_provincia`) VALUES (20, 'Guipuzcoa/Gipuzkoa');
INSERT INTO `provincia` (`id`, `desc_provincia`) VALUES (21, 'Huelva');
INSERT INTO `provincia` (`id`, `desc_provincia`) VALUES (22, 'Huesca');
INSERT INTO `provincia` (`id`, `desc_provincia`) VALUES (23, 'Jaen');
INSERT INTO `provincia` (`id`, `desc_provincia`) VALUES (24, 'León');
INSERT INTO `provincia` (`id`, `desc_provincia`) VALUES (25, 'Lérida/Lleida');
INSERT INTO `provincia` (`id`, `desc_provincia`) VALUES (26, 'La rioja');
INSERT INTO `provincia` (`id`, `desc_provincia`) VALUES (27, 'Lugo');
INSERT INTO `provincia` (`id`, `desc_provincia`) VALUES (28, 'Madrid');
INSERT INTO `provincia` (`id`, `desc_provincia`) VALUES (29, 'Málaga');
INSERT INTO `provincia` (`id`, `desc_provincia`) VALUES (30, 'Murcia');
INSERT INTO `provincia` (`id`, `desc_provincia`) VALUES (31, 'Navarra');
INSERT INTO `provincia` (`id`, `desc_provincia`) VALUES (32, 'Orense/Ourense');
INSERT INTO `provincia` (`id`, `desc_provincia`) VALUES (33, 'Asturias');
INSERT INTO `provincia` (`id`, `desc_provincia`) VALUES (34, 'Palencia');
INSERT INTO `provincia` (`id`, `desc_provincia`) VALUES (35, 'Las palmas');
INSERT INTO `provincia` (`id`, `desc_provincia`) VALUES (36, 'Pontevedra');
INSERT INTO `provincia` (`id`, `desc_provincia`) VALUES (37, 'Salamanca');
INSERT INTO `provincia` (`id`, `desc_provincia`) VALUES (38, 'S. C. Tenerife');
INSERT INTO `provincia` (`id`, `desc_provincia`) VALUES (39, 'Cantabria');
INSERT INTO `provincia` (`id`, `desc_provincia`) VALUES (40, 'Segovia');
INSERT INTO `provincia` (`id`, `desc_provincia`) VALUES (41, 'Sevilla');
INSERT INTO `provincia` (`id`, `desc_provincia`) VALUES (42, 'Soria');
INSERT INTO `provincia` (`id`, `desc_provincia`) VALUES (43, 'Tarragona');
INSERT INTO `provincia` (`id`, `desc_provincia`) VALUES (44, 'Teruel');
INSERT INTO `provincia` (`id`, `desc_provincia`) VALUES (45, 'Toledo');
INSERT INTO `provincia` (`id`, `desc_provincia`) VALUES (46, 'Valencia');
INSERT INTO `provincia` (`id`, `desc_provincia`) VALUES (47, 'Valladolid');
INSERT INTO `provincia` (`id`, `desc_provincia`) VALUES (48, 'Vizcaya/Bizkaia');
INSERT INTO `provincia` (`id`, `desc_provincia`) VALUES (49, 'Zamora');
INSERT INTO `provincia` (`id`, `desc_provincia`) VALUES (50, 'Zaragoza');
INSERT INTO `provincia` (`id`, `desc_provincia`) VALUES (51, 'Ceuta');
INSERT INTO `provincia` (`id`, `desc_provincia`) VALUES (52, 'Melilla');

COMMIT;


-- -----------------------------------------------------
-- Data for table `tipo_via`
-- -----------------------------------------------------
START TRANSACTION;
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (1, 'Acceso');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (2, 'Acequia');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (3, 'Acera');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (4, 'Alameda');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (5, 'Aldea');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (6, 'Alqueria');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (7, 'Alto');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (8, 'Andador');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (9, 'Angosta');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (10, 'Apartamentos');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (11, 'Apeadero');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (12, 'Arboleda');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (13, 'Arrabal');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (14, 'Arroyo');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (15, 'Atajo');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (16, 'Autopista');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (17, 'Autovia');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (18, 'Avenida');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (19, 'Bajada');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (20, 'Balneario');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (21, 'Barranco');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (22, 'Barreduela');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (23, 'Barriada');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (24, 'Barrio');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (25, 'Belena');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (26, 'Bloque');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (27, 'Brazal');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (28, 'Bulevar');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (29, 'Calexon');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (30, 'Caleya');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (31, 'Calle');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (32, 'Calleja');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (33, 'Callejon');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (34, 'Callejuela');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (35, 'Callizo');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (36, 'Calzada');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (37, 'Calzadas');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (38, 'Camino');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (39, 'Campa');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (40, 'Camping');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (41, 'Canal');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (42, 'Canella');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (43, 'Cantera');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (44, 'Cantina');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (45, 'Canton');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (46, 'Cañada');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (47, 'Carrera');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (48, 'Carrerada');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (49, 'Carrero');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (50, 'Carretera');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (51, 'Carreterin');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (52, 'Carretil');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (53, 'Carril');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (54, 'Casa');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (55, 'Cerro');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (56, 'Chalet');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (57, 'Cinturon');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (58, 'Circunvalacion');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (59, 'Cobertizo');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (60, 'Colonia');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (61, 'Complejo');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (62, 'Conjunto');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (63, 'Convento');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (64, 'Cooperativa');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (65, 'Corral');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (66, 'Corralillo');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (67, 'Corredor');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (68, 'Corrillo');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (69, 'Corriol');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (70, 'Cortijo');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (71, 'Costa');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (72, 'Costanilla');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (73, 'Costera');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (74, 'Cuadra');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (75, 'Cuesta');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (76, 'Cueva/S');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (77, 'Dehesa');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (78, 'Demarcacion');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (79, 'Diseminado');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (81, 'Edificio/S');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (82, 'Eirado');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (83, 'Empresa');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (84, 'Entrada');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (85, 'Escalera/S');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (86, 'Escalinata');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (87, 'Espalda');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (88, 'Espigo');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (89, 'Estacion');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (90, 'Estrada');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (91, 'Explanada');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (92, 'Extramuros');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (93, 'Extrarradio');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (94, 'Fabrica');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (95, 'Falda');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (96, 'Finca');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (97, 'Galeria');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (98, 'Gallizo');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (99, 'Glorieta');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (100, 'Gran Via');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (101, 'Granja');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (102, 'Grupo/S');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (103, 'Hegi');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (104, 'Hipodromo');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (105, 'Hoya');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (106, 'Illa');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (107, 'Inda');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (108, 'Jardin/Es');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (109, 'Ladera');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (110, 'Lago');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (111, 'Llanura');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (112, 'Loma');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (113, 'Lomo');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (114, 'Lugar');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (115, 'Malecon');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (116, 'Masia/S');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (117, 'Mazo');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (118, 'Mercado');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (119, 'Mirador');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (120, 'Monasterio');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (121, 'Monte');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (122, 'Muelle');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (123, 'Nave/S');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (124, 'Nucleo');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (125, 'Nudo');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (126, 'Pago');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (127, 'Palacio');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (128, 'Pantano');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (129, 'Paraje');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (130, 'Parque');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (131, 'Particular');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (132, 'Partida');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (133, 'Pas');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (134, 'Pasadizo');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (135, 'Pasaje');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (136, 'Paseo');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (137, 'Paseo Maritimo');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (138, 'Pasillo');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (139, 'Patio');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (140, 'Pinar');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (141, 'Pista');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (142, 'Pla');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (143, 'Playa');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (144, 'Plaza');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (145, 'Plazoleta');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (146, 'Poblado');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (147, 'Poligono');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (148, 'Portal');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (150, 'Prolongacion');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (151, 'Puente');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (152, 'Puerta');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (153, 'Puerto');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (154, 'Pujada');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (155, 'Pujada, Subida');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (156, 'Raconada');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (157, 'Ramal');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (158, 'Rambla');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (159, 'Rampa');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (160, 'Rento');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (161, 'Residencial');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (162, 'Ribera');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (163, 'Rincon');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (164, 'Rinconada');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (165, 'Ronda');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (166, 'Rotonda');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (167, 'Rua');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (168, 'Rueiro');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (169, 'Sanatorio');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (170, 'Santuario');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (171, 'Sector');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (172, 'Senda');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (173, 'Sendera');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (174, 'Sendero');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (175, 'Subida');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (176, 'Torrente');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (177, 'Transito');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (178, 'Transversal');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (179, 'Trasera');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (180, 'Travesia');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (181, 'Urbanizacion');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (182, 'Valle');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (183, 'Vecindario');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (184, 'Vega');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (185, 'Veinat');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (186, 'Venela');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (187, 'Vereda');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (188, 'Via');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (189, 'Viaducto');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (190, 'Vial');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (191, 'Villa');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (192, 'Viviendas');
Insert Into `tipo_via` (`id`, `desc_tipo_via`) Values (193, 'Zona');

COMMIT;



-- -----------------------------------------------------
-- Data for table `pais`
-- -----------------------------------------------------
START TRANSACTION;

iNsert into pais (id,iso2,iso3,nombre,is_eu) Values ('35','Af','Afg','Afganistán','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('42','Ax','Ala','Aland','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('1','Al','Alb','Albania','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('110','De','Deu','Alemania','1');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('8','Ad','And','Andorra','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('4','Ao','Ago','Angola','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('37','Ai','Aia','Anguila','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('36','Ag','Atg','Antigua Y Barbuda','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('3','An','Ant','Antillas Neerlandesas','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('208','Sa','Sau','Arabia Saudita','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('89','Dz','Dza','Argelia','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('5','Ar','Arg','Argentina','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('2','Am','Arm','Armenia','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('162','Aw','Abw','Aruba','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('40','Au','Aus','Australia','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('7','At','Aut','Austria','1');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('198','Ps','Pse','Autoridad Nacional Palestina','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('43','Az','Aze','Azerbaiyán','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('28','Bs','Bhs','Bahamas','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('45','Bd','Bgd','Banglades','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('163','Bb','Brb','Barbados','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('47','Bh','Bhr','Baraín','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('9','Be','Bel','Bélgica','1');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('33','Bz','Blz','Belice','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('23','Bj','Ben','Benín','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('24','Bm','Bmu','Bermudas','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('32','By','Blr','Bielorrusia','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('226','Mm','Mmr','Birmania','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('26','Bo','Bol','Bolivia','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('44','Ba','Bih','Bosnia Y Herzegovina','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('31','Bw','Bwa','Botsuana','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('27','Br','Bra','Brasil','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('25','Bn','Brn','Brunéi','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('41','Bg','Bgr','Bulgaria','1');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('46','Bf','Bfa','Burkina Faso','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('48','Bi','Bdi','Burundi','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('29','Bt','Btn','Bután','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('106','Cv','Cpv','Cabo Verde','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('153','Kh','Khm','Camboya','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('101','Cm','Cmr','Camerún','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('15','Ca','Can','Canadá','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('202','Qa','Qat','Catar','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('122','Td','Tcd','Chad','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('22','Cl','Chl','Chile','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('102','Cn','Chn','China','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('108','Cy','Cyp','Chipre','1');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('177','Va','Vat','Ciudad Del Vaticano','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('103','Co','Col','Colombia','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('155','Km','Com','Comoras','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('157','Kp','Prk','Corea Del Norte','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('158','Kr','Kor','Corea Del Sur','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('20','Ci','Civ','Costa De Marfil','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('104','Cr','Cri','Costa Rica','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('124','Hr','Hrv','Croacia','1');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('105','Cu','Cub','Cuba','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('86','Dk','Dnk','Dinamarca','1');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('87','Dm','Dma','Dominica','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('90','Ec','Ecu','Ecuador','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('92','Eg','Egy','Egipto','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('117','Sv','Slv','El Salvador','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('34','Ae','Are','Emiratos Árabes Unidos','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('94','Er','Eri','Eritrea','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('216','Sk','Svk','Eslovaquia','1');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('214','Si','Svn','Eslovenia','1');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('95','Es','Esp','España','1');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('174','Us','Usa','Estados Unidos','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('91','Ee','Est','Estonia','1');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('96','Et','Eth','Etiopía','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('192','Ph','Phl','Filipinas','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('97','Fi','Fin','Finlandia','1');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('136','Fj','Fji','Fiyi','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('139','Fr','Fra','Francia','1');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('140','Ga','Gab','Gabón','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('62','Gm','Gmb','Gambia','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('143','Ge','Geo','Georgia','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('145','Gh','Gha','Ghana','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('146','Gi','Gib','Gibraltar','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('142','Gd','Grd','Granada','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('66','Gr','Grc','Grecia','1');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('111','Gl','Grl','Groenlandia','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('64','Gp','Glp','Guadalupe','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('69','Gu','Gum','Guam','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('68','Gt','Gtm','Guatemala','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('144','Gf','Guf','Guayana Francesa','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('11','Gg','Ggy','Guernsey','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('63','Gn','Gin','Guinea','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('65','Gq','Gnq','Guinea Ecuatorial','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('70','Gw','Gnb','Guinea-Bisau','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('71','Gy','Guy','Guyana','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('125','Ht','Hti','Haití','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('123','Hn','Hnd','Honduras','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('72','Hk','Hkg','Hong Kong','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('126','Hu','Hun','Hungría','1');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('131','In','Ind','India','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('127','id','idn','Indonesia','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('133','Iq','Irq','Irak','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('134','Ir','Irn','Irán','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('128','Ie','Irl','Irlanda','1');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('30','Bv','Bvt','Isla Bouvet','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('130','Im','Imn','Isla De Man','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('107','Cx','Cxr','Isla De Navidad','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('135','Is','Isl','Islandia','1');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('112','Ky','Cym','Islas Caimán','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('16','Cc','Cck','Islas Cocos','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('21','Ck','Cok','Islas Cook','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('10','Fo','Fro','Islas Feroe','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('67','Gs','Sgs','Islas Georgias Del Sur Y Sandwich Del Sur','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('73','Hm','Hmd','Islas Heard Y Mcdonald','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('137','Fk','Flk','Islas Malvinas','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('229','Mp','Mnp','Islas Marianas Del Norte','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('222','Mh','Mhl','Islas Marshall','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('196','Pn','Pcn','Islas Pitcairn','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('209','Sb','Slb','Islas Salomé','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('121','Tc','Tca','Islas Turcas Y Caicos','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('179','Vg','Vgb','Islas Vírgenes Británicas','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('180','Vi','Vir','Islas Vírgenes De Los Estados Unidos','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('129','Il','Isr','Israel','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('147','It','Ita','Italia','1');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('148','Jm','Jam','Jamaica','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('150','Jp','Jpn','Japón','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('114','Je','Jey','Jersey','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('149','Jo','Jor','Jordania','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('113','Kz','Kaz','Kazajistán','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('151','Ke','Ken','Kenia','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('152','Kg','Kgz','Kirguistán','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('154','Ki','Kir','Kiribati','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('12','Kw','Kwt','Kuwait','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('115','La','Lao','Laos','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('57','Ls','Lso','Lesoto','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('60','Lv','Lva','Letonia','1');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('116','Lb','Lbn','Líbano','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('56','Lr','Lbr','Liberia','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('61','Ly','Lby','Libia','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('54','Li','Lie','Liechtenstein','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('58','Lt','Ltu','Lituania','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('59','Lu','Lux','Luxemburgo','1');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('228','Mo','Mac','Macao','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('221','Mg','Mdg','Madagascar','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('236','My','Mys','Malasia','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('234','Mw','Mwi','Malaui','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('233','Mv','Mdv','Maldivas','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('225','Ml','Mli','Malí','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('13','Mt','Mlt','Malta','1');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('98','Ma','Mar','Marruecos','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('242','Mq','Mtq','Martinica','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('232','Mu','Mus','Mauricio','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('243','Mr','Mrt','Mauritania','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('241','Yt','Myt','Mayotte','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('235','Mx','Mex','México','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('138','Fm','Fsm','Micronesia','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('100','Md','Mda','Moldavia','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('99','Mc','Mco','Mónaco','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('227','Mn','Mng','Mongolia','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('220','Me','Mne','Montenegro','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('231','Ms','Msr','Montserrat','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('237','Mz','Moz','Mozambique','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('78','Na','Nam','Namibia','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('185','Nr','Nru','Nauru','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('184','Np','Npl','Nepal','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('83','Ni','Nic','Nicaragua','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('80','Ne','Ner','Níger','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('82','Ng','Nga','Nigeria','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('186','Nu','Niu','Niue','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('81','Nf','Nfk','Norfolk','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('85','No','Nor','Noruega','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('79','Nc','Ncl','Nueva Caledonia','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('187','Nz','Nzl','Nueva Zelanda','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('188','Om','Omn','Omán','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('84','Nl','Nld','Países Bajos','1');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('193','Pk','Pak','Pakistán','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('200','Pw','Plw','Palaos','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('189','Pa','Pan','Panamá','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('191','Pg','Png','Papúa Nueva Guinea','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('201','Py','Pry','Paraguay','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('49','Pe','Per','Perú','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('190','Pf','Pyf','Polinesia Francesa','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('194','Pl','Pol','Polonia','1');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('199','Pt','Prt','Portugal','1');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('197','Pr','Pri','Puerto Rico','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('141','Gb','Gbr','Reino Unido','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('17','Cd','Cod','Rep. Dem. Del Congo','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('93','Eh','Esh','República Árabe Saharaui Democática','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('18','Cf','Caf','República Centroafricana','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('109','Cz','Cze','República Checa','1');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('224','Mk','Mkd','República De Macedonia','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('19','Cg','Cog','República Del Congo','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('88','Do','Dom','República Dominicana','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('203','Re','Reu','Reunión','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('207','Rw','Rwa','Ruanda','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('204','Ro','Rou','Rumania','1');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('206','Ru','Rus','Rusia','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('244','Ws','Wsm','Samoa','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('6','As','Asm','Samoa Americana','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('14','Bl','Blm','San Bartolomé','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('156','Kn','Kna','San Cristtóbal Y Nieves','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('218','Sm','Smr','San Marino','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('223','Mf','Maf','San Martín','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('195','Pm','Spm','San Pedro Y Miquelón','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('178','Vc','Vct','San Vicente Y Las Granadinas','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('213','Sh','Shn','Santa Helena, A. Y T.','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('53','Lc','Lca','Santa Lucía','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('240','St','Stp','Santo Tomé Y Príncipe','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('219','Sn','Sen','Senegal','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('205','Rs','Srb','Serbia','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('210','Sc','Syc','Seychelles','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('217','Sl','Sle','Sierra Leona','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('212','Sg','Sgp','Singapur','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('118','Sy','Syr','Siria','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('238','So','Som','Somalia','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('55','Lk','Lka','Sri Lanka','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('119','Sz','Swz','Suazilandia','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('159','Za','Zaf','Sudáfrica','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('50','Sd','Sdn','Sudán','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('120','Ss','Ssd','Sudأپn Del Sur','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('211','Se','Swe','Suecia','1');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('51','Ch','Che','Suiza','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('239','Sr','Sur','Surinam','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('215','Sj','Sjm','Svalbard Y Jan Mayen','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('75','Th','Tha','Tailandia','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('170','Tw','Twn','Taiwán','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('171','Tz','Tza','Tanzania','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('76','Tj','Tjk','Tayikisán','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('132','Io','Iot','Territorio Británico Del Oceano índico','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('230','Tf','Atf','Territorios Australes Franceses','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('164','Tl','Tls','Timor Oriental','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('74','Tg','Tgo','Togo','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('77','Tk','Tkl','Tokelau','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('166','To','Ton','Tonga','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('168','Tt','Tto','Trinidad Y Tobago','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('52','Tn','Tun','Tأڑnez','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('165','Tm','Tkm','Turkmenistأپn','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('167','Tr','Tur','Turquía','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('169','Tv','Tuv','Tuvalu','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('172','Ua','Ukr','Ucrania','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('173','Ug','Uga','Uganda','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('175','Uy','Ury','Uruguay','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('176','Uz','Uzb','Uzbekistán','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('182','Vu','Vut','Vanuatu','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('38','Ve','Ven','Venezuela','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('181','Vn','Vnm','Vietnam','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('183','Wf','Wlf','Wallis Y Futuna','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('245','Ye','Yem','Yemen','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('39','Dj','Dji','Yibuti','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('160','Zm','Zmb','Zambia','0');
Insert into pais (id,iso2,iso3,nombre,is_eu) Values ('161','Zw','Zwe','Zimbabue','0');

COMMIT;

