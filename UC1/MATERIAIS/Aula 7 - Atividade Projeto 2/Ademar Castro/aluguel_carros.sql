-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 10/11/2023 às 21:01
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
-- Banco de dados: `aluguel_carros`
--
CREATE DATABASE IF NOT EXISTS `aluguel_carros` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `aluguel_carros`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `agencia`
--

CREATE TABLE `agencia` (
  `numAg` int(11) NOT NULL,
  `end_cep` varchar(9) NOT NULL,
  `end_rua` varchar(70) NOT NULL,
  `end_num` varchar(45) NOT NULL,
  `end_cidade` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `agencia`
--

INSERT INTO `agencia` (`numAg`, `end_cep`, `end_rua`, `end_num`, `end_cidade`) VALUES
(1, '56991-001', 'Avenida A', '001', 'Cidade A'),
(2, '56991-002', 'Avenida B', '002', 'Cidade B'),
(3, '56991-003', 'Avenida C', '003', 'Cidade C');

-- --------------------------------------------------------

--
-- Estrutura para tabela `carro`
--

CREATE TABLE `carro` (
  `placa` varchar(7) NOT NULL,
  `modelo` varchar(100) NOT NULL,
  `ano` varchar(5) NOT NULL,
  `cod_numAg` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `carro`
--

INSERT INTO `carro` (`placa`, `modelo`, `ano`, `cod_numAg`) VALUES
('ABC-001', 'MODELO A', '2001', 1),
('ABC-002', 'MODELO B', '2002', 1),
('ABC-003', 'MODELO C', '2003', 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `CNH` varchar(9) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cartao` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `cliente`
--

INSERT INTO `cliente` (`CNH`, `nome`, `cartao`) VALUES
('123456781', 'ADEMAR CASTRO', '1234568791-1'),
('123456782', 'JOSE DA SILVA', '1234568791-2'),
('123456783', 'GUILHERME DA CRUZ', '1234568791-3');

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente_carro`
--

CREATE TABLE `cliente_carro` (
  `cli_CNH` varchar(9) NOT NULL,
  `car_placa` varchar(45) NOT NULL,
  `data_aluguel` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `cliente_carro`
--

INSERT INTO `cliente_carro` (`cli_CNH`, `car_placa`, `data_aluguel`) VALUES
('123456781', 'ABC-001', '2023-11-10 19:56:04'),
('123456782', 'ABC-002', '2023-11-10 19:56:04'),
('123456783', 'ABC-003', '2023-11-10 19:56:04');

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente_telefone`
--

CREATE TABLE `cliente_telefone` (
  `codigo` int(11) NOT NULL,
  `telefone` varchar(16) DEFAULT NULL,
  `cli_CNH` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `cliente_telefone`
--

INSERT INTO `cliente_telefone` (`codigo`, `telefone`, `cli_CNH`) VALUES
(1, '(92) 9 5555-0001', '123456781'),
(2, '(92) 9 5555-0002', '123456782'),
(3, '(92) 9 5555-0003', '123456783');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `agencia`
--
ALTER TABLE `agencia`
  ADD PRIMARY KEY (`numAg`);

--
-- Índices de tabela `carro`
--
ALTER TABLE `carro`
  ADD PRIMARY KEY (`placa`),
  ADD KEY `cod_numAg` (`cod_numAg`);

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`CNH`);

--
-- Índices de tabela `cliente_carro`
--
ALTER TABLE `cliente_carro`
  ADD PRIMARY KEY (`cli_CNH`),
  ADD KEY `car_placa` (`car_placa`);

--
-- Índices de tabela `cliente_telefone`
--
ALTER TABLE `cliente_telefone`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `cli_CNH` (`cli_CNH`);

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `carro`
--
ALTER TABLE `carro`
  ADD CONSTRAINT `carro_ibfk_1` FOREIGN KEY (`cod_numAg`) REFERENCES `agencia` (`numAg`);

--
-- Restrições para tabelas `cliente_carro`
--
ALTER TABLE `cliente_carro`
  ADD CONSTRAINT `cliente_carro_ibfk_1` FOREIGN KEY (`cli_CNH`) REFERENCES `cliente` (`CNH`),
  ADD CONSTRAINT `cliente_carro_ibfk_2` FOREIGN KEY (`car_placa`) REFERENCES `carro` (`placa`);

--
-- Restrições para tabelas `cliente_telefone`
--
ALTER TABLE `cliente_telefone`
  ADD CONSTRAINT `cliente_telefone_ibfk_1` FOREIGN KEY (`cli_CNH`) REFERENCES `cliente` (`CNH`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
