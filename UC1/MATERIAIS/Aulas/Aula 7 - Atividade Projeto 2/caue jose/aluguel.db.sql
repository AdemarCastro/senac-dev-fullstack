-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 10/11/2023 às 21:20
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
-- Banco de dados: `aluguel`
--
CREATE DATABASE IF NOT EXISTS `aluguel` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `aluguel`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `agencia`
--

CREATE TABLE `agencia` (
  `id` int(11) NOT NULL,
  `cep` varchar(45) NOT NULL,
  `rua` varchar(45) NOT NULL,
  `cidade` varchar(45) NOT NULL,
  `numero` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `agencia`
--

INSERT INTO `agencia` (`id`, `cep`, `rua`, `cidade`, `numero`) VALUES(1, '88745-652', 'Sao Sebastiao', 'Manaus', '11');
INSERT INTO `agencia` (`id`, `cep`, `rua`, `cidade`, `numero`) VALUES(2, '88215-612', 'Sao Francisco', 'Manaus', '12');

-- --------------------------------------------------------

--
-- Estrutura para tabela `aluga`
--

CREATE TABLE `aluga` (
  `id` int(11) NOT NULL,
  `cnh_cliente` int(11) NOT NULL,
  `data_aluguel` varchar(45) NOT NULL,
  `placa` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `aluga`
--

INSERT INTO `aluga` (`id`, `cnh_cliente`, `data_aluguel`, `placa`) VALUES(1, 17427230, '20230401', 'ZBT93232301');
INSERT INTO `aluga` (`id`, `cnh_cliente`, `data_aluguel`, `placa`) VALUES(2, 2147483647, '20230403', '12T93232301');

-- --------------------------------------------------------

--
-- Estrutura para tabela `carro`
--

CREATE TABLE `carro` (
  `placa` varchar(50) NOT NULL,
  `id_agencia` int(11) NOT NULL,
  `modelo` varchar(45) DEFAULT NULL,
  `ano` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `carro`
--

INSERT INTO `carro` (`placa`, `id_agencia`, `modelo`, `ano`) VALUES('12T93232301', 1, 'camaro', '2027');
INSERT INTO `carro` (`placa`, `id_agencia`, `modelo`, `ano`) VALUES('ZBT93232301', 2, 'onix', '2023');

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `cnh` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `cartao` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cliente`
--

INSERT INTO `cliente` (`cnh`, `nome`, `cartao`) VALUES(17427230, 'Gilce', '15471212152');
INSERT INTO `cliente` (`cnh`, `nome`, `cartao`) VALUES(2147483647, 'Caue Jose', '85471214785');

-- --------------------------------------------------------

--
-- Estrutura para tabela `telefone`
--

CREATE TABLE `telefone` (
  `id` int(11) NOT NULL,
  `cnh_cliente` int(11) NOT NULL,
  `telefone_1` varchar(45) NOT NULL,
  `telefone_2` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `agencia`
--
ALTER TABLE `agencia`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `aluga`
--
ALTER TABLE `aluga`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cnh_cliente` (`cnh_cliente`),
  ADD KEY `placa` (`placa`);

--
-- Índices de tabela `carro`
--
ALTER TABLE `carro`
  ADD PRIMARY KEY (`placa`),
  ADD KEY `id_agencia` (`id_agencia`);

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cnh`);

--
-- Índices de tabela `telefone`
--
ALTER TABLE `telefone`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cnh_cliente` (`cnh_cliente`);

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `aluga`
--
ALTER TABLE `aluga`
  ADD CONSTRAINT `aluga_ibfk_1` FOREIGN KEY (`cnh_cliente`) REFERENCES `cliente` (`cnh`),
  ADD CONSTRAINT `aluga_ibfk_2` FOREIGN KEY (`placa`) REFERENCES `carro` (`placa`);

--
-- Restrições para tabelas `carro`
--
ALTER TABLE `carro`
  ADD CONSTRAINT `carro_ibfk_1` FOREIGN KEY (`id_agencia`) REFERENCES `agencia` (`id`);

--
-- Restrições para tabelas `telefone`
--
ALTER TABLE `telefone`
  ADD CONSTRAINT `telefone_ibfk_1` FOREIGN KEY (`cnh_cliente`) REFERENCES `cliente` (`cnh`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
