<?php

    USE hortomanage;
    CREATE TABLE IF NOT EXISTS venda (
        id INT AUTO_INCREMENT PRIMARY KEY,
        nome_cliente VARCHAR(150) NOT NULL,
        produto VARCHAR(100) NOT NULL,
        quantidade INT NOT NULL,
        valor DECIMAL(5,2) NOT NULL,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    );
?>