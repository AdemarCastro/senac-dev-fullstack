-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 10/11/2023 às 21:52
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
-- Banco de dados: `atividade_avaliativa`
--
CREATE DATABASE IF NOT EXISTS `atividade_avaliativa` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `atividade_avaliativa`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `agencia`
--

CREATE TABLE `agencia` (
  `numag` int(11) NOT NULL,
  `end_rua` varchar(200) NOT NULL,
  `end_cep` varchar(12) NOT NULL,
  `end_num` varchar(5) NOT NULL,
  `end_cidade` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `agencia`
--

INSERT INTO `agencia` (`numag`, `end_rua`, `end_cep`, `end_num`, `end_cidade`) VALUES
(1111, 'rua 1', '12345678', '50', 'manaus'),
(2222, 'rua 2', '12378945', '100', 'Porto Ferreira'),
(3333, 'rua 3', '12345678', '4000', 'Manaus');

-- --------------------------------------------------------

--
-- Estrutura para tabela `aluga`
--

CREATE TABLE `aluga` (
  `codigo` int(11) NOT NULL,
  `dia_locacao` varchar(8) NOT NULL,
  `cnh_cliente` varchar(20) NOT NULL,
  `placa_carro` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `aluga`
--

INSERT INTO `aluga` (`codigo`, `dia_locacao`, `cnh_cliente`, `placa_carro`) VALUES
(12345, '25-10-23', '123123123123', 'abc1234'),
(98765, '10-11-20', '222222222222', 'def1234'),
(456123, '28-02-23', '33333333333', 'ghi1234');

-- --------------------------------------------------------

--
-- Estrutura para tabela `carro`
--

CREATE TABLE `carro` (
  `placa` varchar(7) NOT NULL,
  `modelo` varchar(100) NOT NULL,
  `ano` varchar(4) NOT NULL,
  `ag_nro` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `carro`
--

INSERT INTO `carro` (`placa`, `modelo`, `ano`, `ag_nro`) VALUES
('abc1234', 'gol', '2020', 1111),
('def1234', 'corsa', '1995', 2222),
('ghi1234', 'mustang', '2023', 3333);

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `cnh` varchar(20) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cartao` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `cliente`
--

INSERT INTO `cliente` (`cnh`, `nome`, `cartao`) VALUES
('123123123123', 'João da silva', '12341111111'),
('222222222222', 'Maria chiquinha', '22222222222'),
('33333333333', 'Gervásio Silva', '45645645656');

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente_telefone`
--

CREATE TABLE `cliente_telefone` (
  `nro_principal` varchar(25) NOT NULL,
  `cnh_cliente` varchar(20) NOT NULL,
  `numero_2` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `cliente_telefone`
--

INSERT INTO `cliente_telefone` (`nro_principal`, `cnh_cliente`, `numero_2`) VALUES
('000000000', '33333333333', '11111111111'),
('1234567890', '123123123123', '0987654321'),
('7894561230', '222222222222', '0121454789');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `agencia`
--
ALTER TABLE `agencia`
  ADD PRIMARY KEY (`numag`);

--
-- Índices de tabela `aluga`
--
ALTER TABLE `aluga`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `cnh_cliente` (`cnh_cliente`),
  ADD KEY `placa_carro` (`placa_carro`);

--
-- Índices de tabela `carro`
--
ALTER TABLE `carro`
  ADD PRIMARY KEY (`placa`),
  ADD KEY `ag_nro` (`ag_nro`);

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cnh`);

--
-- Índices de tabela `cliente_telefone`
--
ALTER TABLE `cliente_telefone`
  ADD PRIMARY KEY (`nro_principal`),
  ADD KEY `cnh_cliente` (`cnh_cliente`);

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `aluga`
--
ALTER TABLE `aluga`
  ADD CONSTRAINT `aluga_ibfk_1` FOREIGN KEY (`cnh_cliente`) REFERENCES `cliente` (`cnh`),
  ADD CONSTRAINT `aluga_ibfk_2` FOREIGN KEY (`placa_carro`) REFERENCES `carro` (`placa`);

--
-- Restrições para tabelas `carro`
--
ALTER TABLE `carro`
  ADD CONSTRAINT `carro_ibfk_1` FOREIGN KEY (`ag_nro`) REFERENCES `agencia` (`numag`);

--
-- Restrições para tabelas `cliente_telefone`
--
ALTER TABLE `cliente_telefone`
  ADD CONSTRAINT `cliente_telefone_ibfk_1` FOREIGN KEY (`cnh_cliente`) REFERENCES `cliente` (`cnh`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
