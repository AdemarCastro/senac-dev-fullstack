-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 10-Nov-2023 às 21:02
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
-- Banco de dados: `estudocaso_locadora`
--
CREATE DATABASE IF NOT EXISTS `estudocaso_locadora` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `estudocaso_locadora`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `agencia`
--

CREATE TABLE `agencia` (
  `num_agencia` int(11) NOT NULL,
  `end_cep` varchar(8) NOT NULL,
  `end_rua` varchar(100) NOT NULL,
  `end_num` varchar(10) NOT NULL,
  `end_cidade` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `agencia`
--

INSERT INTO `agencia` (`num_agencia`, `end_cep`, `end_rua`, `end_num`, `end_cidade`) VALUES
(11, '69060661', 'Rua A', 'A-01', 'Cidade A'),
(22, '69060662', 'Rua B', 'B-02', 'Cidade B'),
(33, '69060663', 'Rua C', 'C-03', 'Cidade C');

-- --------------------------------------------------------

--
-- Estrutura da tabela `aluguel_cliente_carro`
--

CREATE TABLE `aluguel_cliente_carro` (
  `cod_aluguel` int(11) NOT NULL,
  `cnh_cliente` int(11) NOT NULL,
  `placa_carro` int(11) NOT NULL,
  `data_aluguel` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `aluguel_cliente_carro`
--

INSERT INTO `aluguel_cliente_carro` (`cod_aluguel`, `cnh_cliente`, `placa_carro`, `data_aluguel`) VALUES
(11000, 1, 100, '10/11/2021'),
(22000, 2, 200, '10/11/2022'),
(33000, 3, 300, '10/11/2023');

-- --------------------------------------------------------

--
-- Estrutura da tabela `carro`
--

CREATE TABLE `carro` (
  `placa_carro` int(11) NOT NULL,
  `num_agencia` int(11) NOT NULL,
  `modelo_carro` varchar(50) NOT NULL,
  `ano_carro` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `carro`
--

INSERT INTO `carro` (`placa_carro`, `num_agencia`, `modelo_carro`, `ano_carro`) VALUES
(100, 11, 'Modelo A', '2001'),
(200, 22, 'Modelo B', '2002'),
(300, 33, 'Modelo C', '2003');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `cnh_cliente` int(11) NOT NULL,
  `nome_cliente` varchar(100) NOT NULL,
  `cartao_cliente` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`cnh_cliente`, `nome_cliente`, `cartao_cliente`) VALUES
(1, 'Cliente A', 'Cartao-01'),
(2, 'Cliente B', 'Cartao-02'),
(3, 'Cliente C', 'Cartao-03');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente_telefone`
--

CREATE TABLE `cliente_telefone` (
  `codigotelefone_cliente` int(11) NOT NULL,
  `cnh_cliente` int(11) NOT NULL,
  `numero_telefone_cliente` varchar(13) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `cliente_telefone`
--

INSERT INTO `cliente_telefone` (`codigotelefone_cliente`, `cnh_cliente`, `numero_telefone_cliente`) VALUES
(1, 1, '92999999991'),
(2, 2, '92999999992'),
(3, 3, '92999999993');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `agencia`
--
ALTER TABLE `agencia`
  ADD PRIMARY KEY (`num_agencia`);

--
-- Índices para tabela `aluguel_cliente_carro`
--
ALTER TABLE `aluguel_cliente_carro`
  ADD PRIMARY KEY (`cod_aluguel`),
  ADD KEY `cnh_cliente` (`cnh_cliente`),
  ADD KEY `placa_carro` (`placa_carro`);

--
-- Índices para tabela `carro`
--
ALTER TABLE `carro`
  ADD PRIMARY KEY (`placa_carro`),
  ADD KEY `num_agencia` (`num_agencia`);

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cnh_cliente`),
  ADD UNIQUE KEY `cartao_cliente` (`cartao_cliente`);

--
-- Índices para tabela `cliente_telefone`
--
ALTER TABLE `cliente_telefone`
  ADD PRIMARY KEY (`codigotelefone_cliente`),
  ADD KEY `cnh_cliente` (`cnh_cliente`);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `aluguel_cliente_carro`
--
ALTER TABLE `aluguel_cliente_carro`
  ADD CONSTRAINT `aluguel_cliente_carro_ibfk_1` FOREIGN KEY (`cnh_cliente`) REFERENCES `cliente` (`cnh_cliente`),
  ADD CONSTRAINT `aluguel_cliente_carro_ibfk_2` FOREIGN KEY (`placa_carro`) REFERENCES `carro` (`placa_carro`);

--
-- Limitadores para a tabela `carro`
--
ALTER TABLE `carro`
  ADD CONSTRAINT `carro_ibfk_1` FOREIGN KEY (`num_agencia`) REFERENCES `agencia` (`num_agencia`);

--
-- Limitadores para a tabela `cliente_telefone`
--
ALTER TABLE `cliente_telefone`
  ADD CONSTRAINT `cliente_telefone_ibfk_1` FOREIGN KEY (`cnh_cliente`) REFERENCES `cliente` (`cnh_cliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
