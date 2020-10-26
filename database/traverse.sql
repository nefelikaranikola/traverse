DROP SCHEMA IF EXISTS traverse;
CREATE SCHEMA traverse CHARACTER SET utf8 COLLATE utf8_general_ci;
USE traverse;

CREATE TABLE user (
        `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
        `username` VARCHAR(25) NOT NULL,
        `email` VARCHAR(100) NOT NULL,
        `password` VARCHAR(255) NOT NULL,
        `name` VARCHAR(25) NOT NULL,
        `surname` VARCHAR(25) NOT NULL,
        `phone` VARCHAR(10) NOT NULL,
        `address` VARCHAR(50),
        `birthdate` DATE NOT NULL,
        `acc_create` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
        PRIMARY KEY (id)
);

CREATE TABLE agency (
        `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
        `title` VARCHAR(255) NOT NULL,
        `excerpt` TEXT NOT NULL,
        `description` TEXT NOT NULL,
        `phone` VARCHAR(10) NOT NULL,
        `email` VARCHAR(100) NOT NULL,
        `address` VARCHAR(50),
        PRIMARY KEY (id)
);

CREATE TABLE package (
        `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
        `agency_id` INT UNSIGNED NOT NULL,
        `title` VARCHAR(255) NOT NULL,
        `category` VARCHAR(50) NOT NULL,
        `excerpt` TEXT NOT NULL,
        `description` TEXT NOT NULL,
        `price` MEDIUMINT UNSIGNED NOT NULL,
        `overnight` TINYINT UNSIGNED NOT NULL,
        `dates` DATE NOT NULL,
        `room_type` TINYINT UNSIGNED NOT NULL,
        `meals` VARCHAR(50) NOT NULL,
        `transportation` VARCHAR(50) NOT NULL,
        PRIMARY KEY (id),
        FOREIGN KEY (agency_id) REFERENCES agency(id)
);

CREATE TABLE user_info_res (
        `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
        `name` VARCHAR(25) NOT NULL,
        `surname` VARCHAR(25) NOT NULL,
        `email` VARCHAR(100) NOT NULL,
        `phone` VARCHAR(10) NOT NULL,
        `address` VARCHAR(50),
        PRIMARY KEY (id)
);

CREATE TABLE reservation (
        `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
        `user_id` INT UNSIGNED NOT NULL,
        `package_id` INT UNSIGNED NOT NULL,
        `user_info_res_id` INT UNSIGNED NOT NULL,
        PRIMARY KEY (id),
        FOREIGN KEY (user_id) REFERENCES user(id),
        FOREIGN KEY (package_id) REFERENCES package(id),
        FOREIGN KEY (user_info_res_id) REFERENCES user_info_res(id)
);

CREATE TABLE media (
        `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
        `package_id` INT UNSIGNED NOT NULL,
        `description` TEXT NOT NULL,
        PRIMARY KEY (id),
        FOREIGN KEY (package_id) REFERENCES package(id)
);

CREATE TABLE location (
        `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
        `package_id` INT UNSIGNED NOT NULL,
        `lat` VARCHAR(50) NOT NULL,
        `long` VARCHAR(50) NOT NULL,
        `description` TEXT NOT NULL,
        PRIMARY KEY (id),
        FOREIGN KEY (package_id) REFERENCES package(id)
);
