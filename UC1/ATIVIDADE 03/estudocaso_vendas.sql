-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 08/11/2023 às 21:47
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `estudocaso_vendas`
--
CREATE DATABASE IF NOT EXISTS `estudocaso_vendas` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `estudocaso_vendas`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `codigo` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `end_cep` varchar(9) DEFAULT NULL,
  `end_bairro` varchar(40) DEFAULT NULL,
  `end_rua` varchar(60) DEFAULT NULL,
  `end_numero` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `cliente`
--

INSERT INTO `cliente` (`codigo`, `nome`, `cpf`, `end_cep`, `end_bairro`, `end_rua`, `end_numero`) VALUES
(1, 'ADEMAR ALVES CASTRO FILHO', '12345678910', '00000000', 'Jorge Teixeira', 'Avenida dos Lagos', '1433'),
(2, 'BRUNO VIEIRA ALVES', '12345678911', '78066220', 'Colônia Terra Nova', 'Rua dos Trambiques', '1556'),
(3, 'JORGE DA CRUZ', '12345678912', '79077330', 'Bairro da Paz', 'Avenida do Balão', '1465');

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente_telefone`
--

CREATE TABLE `cliente_telefone` (
  `codigo` int(11) NOT NULL,
  `numero` varchar(16) DEFAULT NULL,
  `cod_cli` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `cliente_telefone`
--

INSERT INTO `cliente_telefone` (`codigo`, `numero`, `cod_cli`) VALUES
(1, '(92) 9999-9999', 1),
(2, '(92) 9999-9990', 2),
(3, '(92) 9999-9991', 3),
(4, '(92) 9999-9922', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `compra`
--

CREATE TABLE `compra` (
  `codigo` int(11) NOT NULL,
  `quantidade_produtos` int(11) NOT NULL,
  `cod_cli` int(11) NOT NULL,
  `cod_fun` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `departamento`
--

CREATE TABLE `departamento` (
  `codigo` int(11) NOT NULL,
  `descricao` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `fornecedor`
--

CREATE TABLE `fornecedor` (
  `codigo` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `telefone` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `funcionario`
--

CREATE TABLE `funcionario` (
  `codigo` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `telefone` varchar(16) DEFAULT NULL,
  `cod_dep` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto`
--

CREATE TABLE `produto` (
  `codigo` int(11) NOT NULL,
  `descricao` varchar(300) NOT NULL,
  `valor` decimal(6,2) NOT NULL,
  `cod_for` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto_compra`
--

CREATE TABLE `produto_compra` (
  `cod_pro` int(11) NOT NULL,
  `cod_com` int(11) NOT NULL,
  `data_criacao` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`codigo`),
  ADD UNIQUE KEY `cpf` (`cpf`);

--
-- Índices de tabela `cliente_telefone`
--
ALTER TABLE `cliente_telefone`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `cod_cli` (`cod_cli`);

--
-- Índices de tabela `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `cod_cli` (`cod_cli`),
  ADD KEY `cod_fun` (`cod_fun`);

--
-- Índices de tabela `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`codigo`);

--
-- Índices de tabela `fornecedor`
--
ALTER TABLE `fornecedor`
  ADD PRIMARY KEY (`codigo`);

--
-- Índices de tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`codigo`),
  ADD UNIQUE KEY `cpf` (`cpf`),
  ADD KEY `cod_dep` (`cod_dep`);

--
-- Índices de tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `cod_for` (`cod_for`);

--
-- Índices de tabela `produto_compra`
--
ALTER TABLE `produto_compra`
  ADD KEY `cod_pro` (`cod_pro`),
  ADD KEY `cod_com` (`cod_com`);

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `cliente_telefone`
--
ALTER TABLE `cliente_telefone`
  ADD CONSTRAINT `cliente_telefone_ibfk_1` FOREIGN KEY (`cod_cli`) REFERENCES `cliente` (`codigo`);

--
-- Restrições para tabelas `compra`
--
ALTER TABLE `compra`
  ADD CONSTRAINT `compra_ibfk_1` FOREIGN KEY (`cod_cli`) REFERENCES `cliente` (`codigo`),
  ADD CONSTRAINT `compra_ibfk_2` FOREIGN KEY (`cod_fun`) REFERENCES `funcionario` (`codigo`);

--
-- Restrições para tabelas `funcionario`
--
ALTER TABLE `funcionario`
  ADD CONSTRAINT `funcionario_ibfk_1` FOREIGN KEY (`cod_dep`) REFERENCES `departamento` (`codigo`);

--
-- Restrições para tabelas `produto`
--
ALTER TABLE `produto`
  ADD CONSTRAINT `produto_ibfk_1` FOREIGN KEY (`cod_for`) REFERENCES `fornecedor` (`codigo`);

--
-- Restrições para tabelas `produto_compra`
--
ALTER TABLE `produto_compra`
  ADD CONSTRAINT `produto_compra_ibfk_1` FOREIGN KEY (`cod_pro`) REFERENCES `produto` (`codigo`),
  ADD CONSTRAINT `produto_compra_ibfk_2` FOREIGN KEY (`cod_com`) REFERENCES `compra` (`codigo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
