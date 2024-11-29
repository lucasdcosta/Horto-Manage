<?php

    CREATE DATABASE IF NOT EXISTS hortomanage;

    USE hortomanage;

    CREATE TABLE IF NOT EXISTS cliente (
        id INT AUTO_INCREMENT PRIMARY KEY,
        nome VARCHAR(150) NOT NULL,
        email VARCHAR(150) NOT NULL UNIQUE,
        rua VARCHAR(100) NOT NULL,
        bairro VARCHAR(50) NOT NULL,
        numero_casa TINYINT UNSIGNED NOT NULL,
        contato DECIMAL(10,0) NOT NULL
    );


?>