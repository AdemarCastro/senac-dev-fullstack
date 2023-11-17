-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 10-Nov-2023 às 21:11
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
-- Banco de dados: `projeto2_locadora`
--
CREATE DATABASE IF NOT EXISTS `projeto2_locadora` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `projeto2_locadora`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `agencia`
--

CREATE TABLE `agencia` (
  `n_agencia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `agencia`
--

INSERT INTO `agencia` (`n_agencia`) VALUES
(123),
(213),
(321);

-- --------------------------------------------------------

--
-- Estrutura da tabela `agencia_endereco`
--

CREATE TABLE `agencia_endereco` (
  `cep` int(11) NOT NULL,
  `cod_agencia` int(11) NOT NULL,
  `end_num` varchar(5) DEFAULT NULL,
  `end_rua` varchar(50) NOT NULL,
  `end_cidade` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `agencia_endereco`
--

INSERT INTO `agencia_endereco` (`cep`, `cod_agencia`, `end_num`, `end_rua`, `end_cidade`) VALUES
(69043001, 213, '37', 'Rua B', 'Cidade Y'),
(69043453, 321, '99', 'Rua C', 'Cidade Z'),
(69043567, 123, '12', 'Rua A', 'Cidade W');

-- --------------------------------------------------------

--
-- Estrutura da tabela `aluga`
--

CREATE TABLE `aluga` (
  `cod_cnh` int(11) NOT NULL,
  `cod_placa` varchar(7) NOT NULL,
  `data_aluguel` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `aluga`
--

INSERT INTO `aluga` (`cod_cnh`, `cod_placa`, `data_aluguel`) VALUES
(111111111, 'A1G4544', '09/2020'),
(333333333, 'B749DHH', '02/2023'),
(555555555, 'CK56OFG', '08/2022');

-- --------------------------------------------------------

--
-- Estrutura da tabela `carro`
--

CREATE TABLE `carro` (
  `placa` varchar(7) NOT NULL,
  `cod_agencia` int(11) NOT NULL,
  `modelo` varchar(50) NOT NULL,
  `ano` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `carro`
--

INSERT INTO `carro` (`placa`, `cod_agencia`, `modelo`, `ano`) VALUES
('A1G4544', 123, 'Modelo A', '2020'),
('B749DHH', 213, 'Modelo B', '2016'),
('CK56OFG', 321, 'Modelo C', '2009');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `cnh` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cartao` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`cnh`, `nome`, `cartao`) VALUES
(111111111, 'Alex Silva', '2222222222222'),
(333333333, 'Beatriz Monteiro', '4444444444444'),
(555555555, 'Carlos Morais', '6666666666666');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente_telefone`
--

CREATE TABLE `cliente_telefone` (
  `cod_telefone` int(11) NOT NULL,
  `cod_cnh` int(11) NOT NULL,
  `numero` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `cliente_telefone`
--

INSERT INTO `cliente_telefone` (`cod_telefone`, `cod_cnh`, `numero`) VALUES
(1, 111111111, '092111111111'),
(2, 333333333, '092222222222'),
(3, 555555555, '092333333333');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `agencia`
--
ALTER TABLE `agencia`
  ADD PRIMARY KEY (`n_agencia`);

--
-- Índices para tabela `agencia_endereco`
--
ALTER TABLE `agencia_endereco`
  ADD PRIMARY KEY (`cep`),
  ADD KEY `cod_agencia` (`cod_agencia`);

--
-- Índices para tabela `aluga`
--
ALTER TABLE `aluga`
  ADD KEY `cod_cnh` (`cod_cnh`),
  ADD KEY `cod_placa` (`cod_placa`);

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
-- Índices para tabela `cliente_telefone`
--
ALTER TABLE `cliente_telefone`
  ADD PRIMARY KEY (`cod_telefone`),
  ADD KEY `cod_cnh` (`cod_cnh`);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `agencia_endereco`
--
ALTER TABLE `agencia_endereco`
  ADD CONSTRAINT `agencia_endereco_ibfk_1` FOREIGN KEY (`cod_agencia`) REFERENCES `agencia` (`n_agencia`);

--
-- Limitadores para a tabela `aluga`
--
ALTER TABLE `aluga`
  ADD CONSTRAINT `aluga_ibfk_1` FOREIGN KEY (`cod_cnh`) REFERENCES `cliente` (`cnh`),
  ADD CONSTRAINT `aluga_ibfk_2` FOREIGN KEY (`cod_placa`) REFERENCES `carro` (`placa`);

--
-- Limitadores para a tabela `carro`
--
ALTER TABLE `carro`
  ADD CONSTRAINT `carro_ibfk_1` FOREIGN KEY (`cod_agencia`) REFERENCES `agencia` (`n_agencia`);

--
-- Limitadores para a tabela `cliente_telefone`
--
ALTER TABLE `cliente_telefone`
  ADD CONSTRAINT `cliente_telefone_ibfk_1` FOREIGN KEY (`cod_cnh`) REFERENCES `cliente` (`cnh`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
