/* 2025-03-21 10:35:55 [9 ms] */ 
CREATE DATABASE 
    PruebaNode DEFAULT CHARACTER SET = 'utf8mb4';
/* 2025-03-21 10:41:54 [3 ms] */ 
USE pruebanode;
/* 2025-03-21 10:42:00 [32 ms] */ 
CREATE TABLE usuarios(
        id_user INT AUTO_INCREMENT,
        nombre VARCHAR(200),
        telefono VARCHAR (50),
        email VARCHAR (100),
        PRIMARY KEY(id_user)
    );
/* 2025-03-28 06:57:03 [27 ms] */ 
CREATE DATABASE 
   pruebaNode DEFAULT CHARACTER SET = 'utf8mb4';
/* 2025-03-28 06:57:19 [2 ms] */ 
USE pruebanode;
/* 2025-03-28 06:58:31 [19 ms] */ 
CREATE TABLE usuarios(
    id_user INT AUTO_INCREMENT,
    nombre VARCHAR(200),
    telefono VARCHAR(50),
    email VARCHAR(100),
    PRIMARY KEY(id_user)
);
/* 2025-03-28 07:12:40 [25 ms] */ 
CREATE DATABASE 
    proyectoNode DEFAULT CHARACTER SET = 'utf8mb4';
/* 2025-03-28 07:13:07 [2 ms] */ 
USE proyectoNode;
/* 2025-03-28 07:14:50 [19 ms] */ 
CREATE TABLE usuarios(
        id_user INT AUTO_INCREMENT,
        nombre VARCHAR (200),
        telefono VARCHAR (50),
        email VARCHAR (100),
        PRIMARY KEY (id_user)
);
/* 2025-04-04 11:27:36 [97 ms] */ 
ALTER TABLE `clientes` 
	CHANGE `fecha_registro` `fecha_registro` DATE;
/* 2025-04-04 16:26:22 [41 ms] */ 
ALTER TABLE `clientes` 
	CHANGE `fecha_registro` `fecha_registro` DATE;
/* 2025-04-04 16:26:46 [63 ms] */ 
ALTER TABLE `clientes` 
	CHANGE `fecha_registro` `fecha_registro` TIMESTAMP DEFAULT
CURRENT_TIMESTAMP;
/* 2025-06-20 10:37:11 [9 ms] */ 
CREATE DATABASE node_mvc;
/* 2025-06-20 10:39:03 [2 ms] */ 
Use
   node_mvc;
/* 2025-06-20 10:44:55 [34 ms] */ 
CREATE TABLE usuarios(
    id INT AUTO_INCREMENT,
    nombre VARCHAR(200),
    email VARCHAR(100),
    telefono VARCHAR(50),
    PRIMARY KEY (id)
   )Engine = innoDB;
/* 2025-06-27 09:29:01 [34 ms] */ 
USE
 node_mvc;
