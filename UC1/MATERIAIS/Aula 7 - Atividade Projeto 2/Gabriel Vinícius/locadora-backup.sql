-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 10-Nov-2023 às 21:22
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
-- Banco de dados: `locadora`
--
CREATE DATABASE IF NOT EXISTS `locadora` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `locadora`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `agencia`
--

CREATE TABLE `agencia` (
  `cod_ag` int(11) NOT NULL,
  `end_cep` varchar(9) NOT NULL,
  `end_rua` varchar(60) NOT NULL,
  `end_num` varchar(5) NOT NULL,
  `end_bairro` varchar(40) NOT NULL,
  `end_cidade` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `agencia`
--

INSERT INTO `agencia` (`cod_ag`, `end_cep`, `end_rua`, `end_num`, `end_bairro`, `end_cidade`) VALUES
(1, '000000000', 'Rua 1', '10', 'Bairro A', 'Manaus'),
(2, '999999999', 'Rua 2', '11', 'Bairro B', 'São Paulo'),
(3, '888888888', 'Rua 3', '12', 'Bairro C', 'Rio de Janeiro');

-- --------------------------------------------------------

--
-- Estrutura da tabela `aluguel`
--

CREATE TABLE `aluguel` (
  `cod_aluguel` int(11) NOT NULL,
  `cnh` int(11) NOT NULL,
  `placa` varchar(7) NOT NULL,
  `data_aluguel` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `aluguel`
--

INSERT INTO `aluguel` (`cod_aluguel`, `cnh`, `placa`, `data_aluguel`) VALUES
(1, 111111111, '1234567', '0000-00-00 00:00:00'),
(4, 111111111, '1234567', NULL),
(5, 222222222, '1111111', NULL),
(6, 333333333, '2222222', NULL),
(10, 111111111, '1234567', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `carro`
--

CREATE TABLE `carro` (
  `placa` varchar(7) NOT NULL,
  `cod_ag` int(11) NOT NULL,
  `modelo` varchar(20) NOT NULL,
  `ano` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `carro`
--

INSERT INTO `carro` (`placa`, `cod_ag`, `modelo`, `ano`) VALUES
('1111111', 2, 'Modelo B', 2021),
('1234567', 1, 'Modelo A', 2020),
('2222222', 3, 'Modelo C', 2022);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `cnh` int(9) NOT NULL,
  `nome` varchar(80) NOT NULL,
  `cartao` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`cnh`, `nome`, `cartao`) VALUES
(111111111, 'Gabriel', '1111111111111'),
(222222222, 'Turing', '2222222222222'),
(333333333, 'Boole', '3333333333333');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tel_cli`
--

CREATE TABLE `tel_cli` (
  `cod_tel_cli` int(11) NOT NULL,
  `cod_cli` int(11) NOT NULL,
  `numero` varchar(13) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `tel_cli`
--

INSERT INTO `tel_cli` (`cod_tel_cli`, `cod_cli`, `numero`) VALUES
(1, 111111111, '4444444444444'),
(2, 222222222, '5555555555555'),
(3, 333333333, '6666666666666');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `agencia`
--
ALTER TABLE `agencia`
  ADD PRIMARY KEY (`cod_ag`);

--
-- Índices para tabela `aluguel`
--
ALTER TABLE `aluguel`
  ADD PRIMARY KEY (`cod_aluguel`),
  ADD KEY `cnh` (`cnh`),
  ADD KEY `placa` (`placa`);

--
-- Índices para tabela `carro`
--
ALTER TABLE `carro`
  ADD PRIMARY KEY (`placa`),
  ADD KEY `cod_ag` (`cod_ag`);

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cnh`),
  ADD UNIQUE KEY `cartao` (`cartao`);

--
-- Índices para tabela `tel_cli`
--
ALTER TABLE `tel_cli`
  ADD PRIMARY KEY (`cod_tel_cli`),
  ADD KEY `cod_cli` (`cod_cli`);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `aluguel`
--
ALTER TABLE `aluguel`
  ADD CONSTRAINT `aluguel_ibfk_1` FOREIGN KEY (`cnh`) REFERENCES `cliente` (`cnh`),
  ADD CONSTRAINT `aluguel_ibfk_2` FOREIGN KEY (`placa`) REFERENCES `carro` (`placa`);

--
-- Limitadores para a tabela `carro`
--
ALTER TABLE `carro`
  ADD CONSTRAINT `carro_ibfk_1` FOREIGN KEY (`cod_ag`) REFERENCES `agencia` (`cod_ag`);

--
-- Limitadores para a tabela `tel_cli`
--
ALTER TABLE `tel_cli`
  ADD CONSTRAINT `tel_cli_ibfk_1` FOREIGN KEY (`cod_cli`) REFERENCES `cliente` (`cnh`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
