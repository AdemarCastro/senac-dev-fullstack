-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 10-Nov-2023 às 21:55
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
-- Banco de dados: `projeto2`
--
CREATE DATABASE IF NOT EXISTS `projeto2` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `projeto2`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `agencia`
--

CREATE TABLE `agencia` (
  `num_age` varchar(60) NOT NULL,
  `end_rua` varchar(60) DEFAULT NULL,
  `end_num` varchar(45) DEFAULT NULL,
  `end_bairro` varchar(45) DEFAULT NULL,
  `end_cidade` varchar(45) DEFAULT NULL,
  `end_cep` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `agencia`
--

INSERT INTO `agencia` (`num_age`, `end_rua`, `end_num`, `end_bairro`, `end_cidade`, `end_cep`) VALUES
('1', 'Rua A', '12', 'JTEXAS', 'Manaus', '690888'),
('2', 'Rua B', '10', 'PONTA NEGRA', 'Rio de Janeiro', '690888810'),
('3', 'Rua C', '15', 'ALVORADA', 'SAO Paulo', '697411');

-- --------------------------------------------------------

--
-- Estrutura da tabela `aluga`
--

CREATE TABLE `aluga` (
  `cnh` int(11) NOT NULL,
  `placa` varchar(60) DEFAULT NULL,
  `data_aluguel` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `carro`
--

CREATE TABLE `carro` (
  `placa` varchar(60) NOT NULL,
  `num_age` varchar(60) DEFAULT NULL,
  `modelo` varchar(60) DEFAULT NULL,
  `ano` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `cnh` int(11) NOT NULL,
  `nome` varchar(60) DEFAULT NULL,
  `cartao` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`cnh`, `nome`, `cartao`) VALUES
(88524, 'Anne Freitas', '1456465'),
(445566, 'Bruna Pires', '123456789'),
(48541122, 'Maria Helena', '9988755');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente_telefone`
--

CREATE TABLE `cliente_telefone` (
  `codigo` int(11) NOT NULL,
  `cnh_cliente` int(11) NOT NULL,
  `telefone` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `cliente_telefone`
--

INSERT INTO `cliente_telefone` (`codigo`, `cnh_cliente`, `telefone`) VALUES
(1, 445566, '45566698'),
(2, 88524, '98542741'),
(3, 48541122, '93952874');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `agencia`
--
ALTER TABLE `agencia`
  ADD PRIMARY KEY (`num_age`);

--
-- Índices para tabela `aluga`
--
ALTER TABLE `aluga`
  ADD KEY `cnh` (`cnh`),
  ADD KEY `placa` (`placa`);

--
-- Índices para tabela `carro`
--
ALTER TABLE `carro`
  ADD PRIMARY KEY (`placa`),
  ADD KEY `num_age` (`num_age`);

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cnh`);

--
-- Índices para tabela `cliente_telefone`
--
ALTER TABLE `cliente_telefone`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `cnh_cliente` (`cnh_cliente`);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `aluga`
--
ALTER TABLE `aluga`
  ADD CONSTRAINT `aluga_ibfk_1` FOREIGN KEY (`cnh`) REFERENCES `cliente` (`cnh`),
  ADD CONSTRAINT `aluga_ibfk_2` FOREIGN KEY (`placa`) REFERENCES `carro` (`placa`);

--
-- Limitadores para a tabela `carro`
--
ALTER TABLE `carro`
  ADD CONSTRAINT `carro_ibfk_1` FOREIGN KEY (`num_age`) REFERENCES `agencia` (`num_age`);

--
-- Limitadores para a tabela `cliente_telefone`
--
ALTER TABLE `cliente_telefone`
  ADD CONSTRAINT `cliente_telefone_ibfk_1` FOREIGN KEY (`cnh_cliente`) REFERENCES `cliente` (`cnh`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
