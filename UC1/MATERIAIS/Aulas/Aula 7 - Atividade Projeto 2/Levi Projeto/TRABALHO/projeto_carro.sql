-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 10-Nov-2023 às 21:10
-- Versão do servidor: 10.4.27-MariaDB
-- versão do PHP: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `projeto_carro`
--
CREATE DATABASE IF NOT EXISTS `projeto_carro` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `projeto_carro`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `agencia`
--

CREATE TABLE `agencia` (
  `cod_agencia` int(11) NOT NULL,
  `end_num` varchar(10) NOT NULL,
  `end_cep` varchar(8) NOT NULL,
  `end_rua` varchar(50) NOT NULL,
  `end_cidade` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `agencia`
--

INSERT INTO `agencia` (`cod_agencia`, `end_num`, `end_cep`, `end_rua`, `end_cidade`) VALUES
(1, 'num1', 'cep1', 'rua1', 'cidadeA'),
(2, 'num2', 'cep2', 'rua2', 'cidadeB'),
(3, 'num3', 'cep3', 'rua3', 'cidadeC');

-- --------------------------------------------------------

--
-- Estrutura da tabela `aluga`
--

CREATE TABLE `aluga` (
  `cod_alugel` int(11) NOT NULL,
  `placa` varchar(15) NOT NULL,
  `cnh` int(11) NOT NULL,
  `dia` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `aluga`
--

INSERT INTO `aluga` (`cod_alugel`, `placa`, `cnh`, `dia`) VALUES
(1, 'placa_1', 111, '2004-02-10'),
(2, 'placa_2', 222, '2004-02-11'),
(3, 'placa_3', 333, '2004-02-12');

-- --------------------------------------------------------

--
-- Estrutura da tabela `carro`
--

CREATE TABLE `carro` (
  `placa` varchar(15) NOT NULL,
  `cod_agencia` int(11) NOT NULL,
  `modelo` varchar(40) NOT NULL,
  `ano` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `carro`
--

INSERT INTO `carro` (`placa`, `cod_agencia`, `modelo`, `ano`) VALUES
('placa_1', 1, 'fusca', '2000'),
('placa_2', 2, 'fusca', '2000'),
('placa_3', 3, 'fusca', '2000');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `cnh` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `cartao` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`cnh`, `nome`, `cartao`) VALUES
(111, 'roberto', '1111-1'),
(222, 'erika', '2222-2'),
(333, 'carlitu', '3333-3');

-- --------------------------------------------------------

--
-- Estrutura da tabela `telefone_cliente`
--

CREATE TABLE `telefone_cliente` (
  `cod_telefone_cliente` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `cnh` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `telefone_cliente`
--

INSERT INTO `telefone_cliente` (`cod_telefone_cliente`, `nome`, `cnh`) VALUES
(1111, 'roberto', 111),
(2222, 'erika', 222),
(3333, 'carlitu', 333);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `agencia`
--
ALTER TABLE `agencia`
  ADD PRIMARY KEY (`cod_agencia`);

--
-- Índices para tabela `aluga`
--
ALTER TABLE `aluga`
  ADD PRIMARY KEY (`cod_alugel`),
  ADD KEY `placa` (`placa`),
  ADD KEY `cnh` (`cnh`);

--
-- Índices para tabela `carro`
--
ALTER TABLE `carro`
  ADD PRIMARY KEY (`placa`),
  ADD KEY `cod_agencia` (`cod_agencia`);

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cnh`);

--
-- Índices para tabela `telefone_cliente`
--
ALTER TABLE `telefone_cliente`
  ADD PRIMARY KEY (`cod_telefone_cliente`),
  ADD KEY `cnh` (`cnh`);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `aluga`
--
ALTER TABLE `aluga`
  ADD CONSTRAINT `aluga_ibfk_1` FOREIGN KEY (`placa`) REFERENCES `carro` (`placa`),
  ADD CONSTRAINT `aluga_ibfk_2` FOREIGN KEY (`cnh`) REFERENCES `cliente` (`cnh`);

--
-- Limitadores para a tabela `carro`
--
ALTER TABLE `carro`
  ADD CONSTRAINT `carro_ibfk_1` FOREIGN KEY (`cod_agencia`) REFERENCES `agencia` (`cod_agencia`);

--
-- Limitadores para a tabela `telefone_cliente`
--
ALTER TABLE `telefone_cliente`
  ADD CONSTRAINT `telefone_cliente_ibfk_1` FOREIGN KEY (`cnh`) REFERENCES `cliente` (`cnh`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
