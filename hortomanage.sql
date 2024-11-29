-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 29/11/2024 às 18:36
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `hortomanage`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `endereco`
--

CREATE TABLE `endereco` (
  `IdEnderecoPessoa` smallint(6) NOT NULL,
  `Cidade` varchar(28) NOT NULL,
  `Descricao` varchar(70) NOT NULL,
  `rua` varchar(100) NOT NULL,
  `bairro` varchar(50) NOT NULL,
  `numero_casa` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `funcionario`
--

CREATE TABLE `funcionario` (
  `IdPessoa` smallint(6) NOT NULL,
  `Salario` decimal(6,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `login`
--

CREATE TABLE `login` (
  `IdPessoa_Login` smallint(6) NOT NULL,
  `Usuario` varchar(30) NOT NULL,
  `Senha` varchar(18) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pessoa`
--

CREATE TABLE `pessoa` (
  `IdPessoa` smallint(6) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `Email` varchar(30) NOT NULL,
  `Contato` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `producao`
--

CREATE TABLE `producao` (
  `Id_Lote` tinyint(4) NOT NULL,
  `Id_Produto` smallint(6) NOT NULL,
  `Data_Producao` date NOT NULL,
  `Data_Validade` date DEFAULT NULL,
  `Quantidade` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto`
--

CREATE TABLE `produto` (
  `Id_Produto` smallint(6) NOT NULL,
  `Nome_Produto` varchar(20) NOT NULL,
  `Quantidade` tinyint(4) NOT NULL,
  `Id_Tipo_Produto` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `produto`
--

INSERT INTO `produto` (`Id_Produto`, `Nome_Produto`, `Quantidade`, `Id_Tipo_Produto`) VALUES
(20, 'Couve', 12, 3),
(21, 'Manga Maça', 5, 2),
(22, 'Salsa', 25, 7),
(23, 'Adubo', 20, 8),
(28, 'cebolinha', 21, 9),
(30, 'maracujá', 15, 10);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tabelapreco`
--

CREATE TABLE `tabelapreco` (
  `DataInicioVigencia` date NOT NULL,
  `Id_Produto` smallint(6) NOT NULL,
  `DataFimVigencia` date DEFAULT NULL,
  `ValorUnitario` decimal(6,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `telefone`
--

CREATE TABLE `telefone` (
  `IdPessoa` smallint(6) NOT NULL,
  `Sequencia` tinyint(4) NOT NULL,
  `Telefone` bigint(20) NOT NULL,
  `Id_Telefone_Secundario` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `telefone_secundario`
--

CREATE TABLE `telefone_secundario` (
  `Id_Telefone_Secundario` smallint(6) NOT NULL,
  `Descricao` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tipo_produto`
--

CREATE TABLE `tipo_produto` (
  `Id_Tipo_Produto` tinyint(4) NOT NULL,
  `Descricao_Tipo_Produto` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tipo_produto`
--

INSERT INTO `tipo_produto` (`Id_Tipo_Produto`, `Descricao_Tipo_Produto`) VALUES
(1, 'Enxerto'),
(2, 'Frutas'),
(3, 'Hortaliças'),
(4, 'Materia-Prima'),
(7, NULL),
(8, NULL),
(9, NULL),
(10, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `valor_item`
--

CREATE TABLE `valor_item` (
  `Id_Valor_Item` smallint(6) NOT NULL,
  `Id_Produto` smallint(6) NOT NULL,
  `Valor_Unidade` decimal(3,2) NOT NULL,
  `Data` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `venda`
--

CREATE TABLE `venda` (
  `Id_Venda` smallint(6) NOT NULL,
  `IdPessoa` smallint(6) NOT NULL,
  `Id_Produto` smallint(6) NOT NULL,
  `Valor_Total` decimal(7,2) NOT NULL,
  `Dia_Venda` date NOT NULL,
  `Valor_Venda` decimal(6,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `venda_item`
--

CREATE TABLE `venda_item` (
  `Id_Venda_Item` smallint(6) NOT NULL,
  `Id_Venda` smallint(6) NOT NULL,
  `Id_Produto` smallint(6) NOT NULL,
  `Quantidade` decimal(10,0) NOT NULL,
  `Data` date NOT NULL,
  `Valor_Item` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `endereco`
--
ALTER TABLE `endereco`
  ADD PRIMARY KEY (`IdEnderecoPessoa`);

--
-- Índices de tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`IdPessoa`);

--
-- Índices de tabela `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`IdPessoa_Login`);

--
-- Índices de tabela `pessoa`
--
ALTER TABLE `pessoa`
  ADD PRIMARY KEY (`IdPessoa`);

--
-- Índices de tabela `producao`
--
ALTER TABLE `producao`
  ADD PRIMARY KEY (`Id_Lote`),
  ADD KEY `produto_producao_fk` (`Id_Produto`);

--
-- Índices de tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`Id_Produto`),
  ADD KEY `tipo_produto_produtos_fk` (`Id_Tipo_Produto`);

--
-- Índices de tabela `tabelapreco`
--
ALTER TABLE `tabelapreco`
  ADD PRIMARY KEY (`DataInicioVigencia`,`Id_Produto`),
  ADD KEY `produto_tabelapreco_fk` (`Id_Produto`);

--
-- Índices de tabela `telefone`
--
ALTER TABLE `telefone`
  ADD PRIMARY KEY (`IdPessoa`,`Sequencia`),
  ADD KEY `telefone_secundario_telefone_fk` (`Id_Telefone_Secundario`);

--
-- Índices de tabela `telefone_secundario`
--
ALTER TABLE `telefone_secundario`
  ADD PRIMARY KEY (`Id_Telefone_Secundario`);

--
-- Índices de tabela `tipo_produto`
--
ALTER TABLE `tipo_produto`
  ADD PRIMARY KEY (`Id_Tipo_Produto`);

--
-- Índices de tabela `valor_item`
--
ALTER TABLE `valor_item`
  ADD PRIMARY KEY (`Id_Valor_Item`),
  ADD KEY `produtos_variedade_fk` (`Id_Produto`);

--
-- Índices de tabela `venda`
--
ALTER TABLE `venda`
  ADD PRIMARY KEY (`Id_Venda`),
  ADD KEY `produtos_vendas_fk` (`Id_Produto`),
  ADD KEY `pessoa_vendas_fk` (`IdPessoa`);

--
-- Índices de tabela `venda_item`
--
ALTER TABLE `venda_item`
  ADD PRIMARY KEY (`Id_Venda_Item`),
  ADD KEY `produtos_venda_item_fk` (`Id_Produto`),
  ADD KEY `vendas_venda_item_fk` (`Id_Venda`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `pessoa`
--
ALTER TABLE `pessoa`
  MODIFY `IdPessoa` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `producao`
--
ALTER TABLE `producao`
  MODIFY `Id_Lote` tinyint(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `Id_Produto` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de tabela `telefone_secundario`
--
ALTER TABLE `telefone_secundario`
  MODIFY `Id_Telefone_Secundario` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tipo_produto`
--
ALTER TABLE `tipo_produto`
  MODIFY `Id_Tipo_Produto` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `venda`
--
ALTER TABLE `venda`
  MODIFY `Id_Venda` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `venda_item`
--
ALTER TABLE `venda_item`
  MODIFY `Id_Venda_Item` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `endereco`
--
ALTER TABLE `endereco`
  ADD CONSTRAINT `pessoa_endereco_fk` FOREIGN KEY (`IdEnderecoPessoa`) REFERENCES `pessoa` (`IdPessoa`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `funcionario`
--
ALTER TABLE `funcionario`
  ADD CONSTRAINT `pessoa_funcionario_fk` FOREIGN KEY (`IdPessoa`) REFERENCES `pessoa` (`IdPessoa`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `login`
--
ALTER TABLE `login`
  ADD CONSTRAINT `pessoa_login_fk` FOREIGN KEY (`IdPessoa_Login`) REFERENCES `pessoa` (`IdPessoa`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `producao`
--
ALTER TABLE `producao`
  ADD CONSTRAINT `produto_producao_fk` FOREIGN KEY (`Id_Produto`) REFERENCES `produto` (`Id_Produto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `produto`
--
ALTER TABLE `produto`
  ADD CONSTRAINT `tipo_produto_produtos_fk` FOREIGN KEY (`Id_Tipo_Produto`) REFERENCES `tipo_produto` (`Id_Tipo_Produto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `tabelapreco`
--
ALTER TABLE `tabelapreco`
  ADD CONSTRAINT `produto_tabelapreco_fk` FOREIGN KEY (`Id_Produto`) REFERENCES `produto` (`Id_Produto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `telefone`
--
ALTER TABLE `telefone`
  ADD CONSTRAINT `pessoa_telefones_fk` FOREIGN KEY (`IdPessoa`) REFERENCES `pessoa` (`IdPessoa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `telefone_secundario_telefone_fk` FOREIGN KEY (`Id_Telefone_Secundario`) REFERENCES `telefone_secundario` (`Id_Telefone_Secundario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `valor_item`
--
ALTER TABLE `valor_item`
  ADD CONSTRAINT `produtos_variedade_fk` FOREIGN KEY (`Id_Produto`) REFERENCES `produto` (`Id_Produto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `venda`
--
ALTER TABLE `venda`
  ADD CONSTRAINT `pessoa_vendas_fk` FOREIGN KEY (`IdPessoa`) REFERENCES `pessoa` (`IdPessoa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `produtos_vendas_fk` FOREIGN KEY (`Id_Produto`) REFERENCES `produto` (`Id_Produto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `venda_item`
--
ALTER TABLE `venda_item`
  ADD CONSTRAINT `produtos_venda_item_fk` FOREIGN KEY (`Id_Produto`) REFERENCES `produto` (`Id_Produto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `vendas_venda_item_fk` FOREIGN KEY (`Id_Venda`) REFERENCES `venda` (`Id_Venda`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
