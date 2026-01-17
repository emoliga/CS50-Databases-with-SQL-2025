-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS `linkedin`;
USE `linkedin`;

-- Tabla de usuarios
CREATE TABLE `users` (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `first_name` VARCHAR(50) NOT NULL,
    `last_name` VARCHAR(50) NOT NULL,
    `username` VARCHAR(50) UNIQUE NOT NULL,
    `password` VARCHAR(128) NOT NULL,
    PRIMARY KEY (`id`)
);

-- Tabla de escuelas/universidades
CREATE TABLE `schools` (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    `type` ENUM('Primary', 'Secondary', 'Higher Education') NOT NULL,
    `location` VARCHAR(100) NOT NULL,
    `year_founded` YEAR NOT NULL,
    PRIMARY KEY (`id`)
);

-- Tabla de empresas
CREATE TABLE `companies` (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    `industry` ENUM('Technology', 'Education', 'Business') NOT NULL,
    `location` VARCHAR(100) NOT NULL,
    PRIMARY KEY (`id`)
);

-- Tabla de conexiones entre usuarios (relación muchos a muchos)
CREATE TABLE `connections` (
    `user_id_1` INT UNSIGNED NOT NULL,
    `user_id_2` INT UNSIGNED NOT NULL,
    PRIMARY KEY (`user_id_1`, `user_id_2`),
    FOREIGN KEY (`user_id_1`) REFERENCES `users`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`user_id_2`) REFERENCES `users`(`id`) ON DELETE CASCADE,
    CHECK (`user_id_1` < `user_id_2`)
);

-- Tabla de afiliaciones con escuelas
CREATE TABLE `school_affiliations` (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `user_id` INT UNSIGNED NOT NULL,
    `school_id` INT UNSIGNED NOT NULL,
    `start_date` DATE NOT NULL,
    `end_date` DATE,
    `degree_type` VARCHAR(10),
    PRIMARY KEY (`id`),
    FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`school_id`) REFERENCES `schools`(`id`) ON DELETE CASCADE
);

-- Tabla de afiliaciones con empresas
CREATE TABLE `company_affiliations` (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `user_id` INT UNSIGNED NOT NULL,
    `company_id` INT UNSIGNED NOT NULL,
    `start_date` DATE NOT NULL,
    `end_date` DATE,
    `title` VARCHAR(100),
    PRIMARY KEY (`id`),
    FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`company_id`) REFERENCES `companies`(`id`) ON DELETE CASCADE
);

-- Insertar datos de ejemplo
INSERT INTO `users` (`first_name`, `last_name`, `username`, `password`)
VALUES
    ('Claudine', 'Gay', 'claudine', 'password'),
    ('Reid', 'Hoffman', 'reid', 'password');

INSERT INTO `schools` (`name`, `type`, `location`, `year_founded`)
VALUES ('Harvard University', 'Higher Education', 'Cambridge, Massachusetts', 1636);

INSERT INTO `companies` (`name`, `industry`, `location`)
VALUES ('LinkedIn', 'Technology', 'Sunnyvale, California');

INSERT INTO `school_affiliations` (`user_id`, `school_id`, `start_date`, `end_date`, `degree_type`)
VALUES (
    (SELECT `id` FROM `users` WHERE `username` = 'claudine'),
    (SELECT `id` FROM `schools` WHERE `name` = 'Harvard University'),
    '1993-01-01',
    '1998-12-31',
    'PhD'
);

INSERT INTO `company_affiliations` (`user_id`, `company_id`, `start_date`, `end_date`, `title`)
VALUES (
    (SELECT `id` FROM `users` WHERE `username` = 'reid'),
    (SELECT `id` FROM `companies` WHERE `name` = 'LinkedIn'),
    '2003-01-01',
    '2007-02-01',
    'CEO and Chairman'
);
