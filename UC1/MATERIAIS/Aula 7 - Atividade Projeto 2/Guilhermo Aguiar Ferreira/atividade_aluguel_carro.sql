-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 10-Nov-2023 às 20:31
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
-- Banco de dados: `atividade_aluguel_carro`
--
CREATE DATABASE IF NOT EXISTS `atividade_aluguel_carro` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `atividade_aluguel_carro`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `agencia`
--

CREATE TABLE `agencia` (
  `NumAg` int(11) NOT NULL,
  `cep` int(11) DEFAULT NULL,
  `rua` varchar(50) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `cidade` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `agencia`
--

INSERT INTO `agencia` (`NumAg`, `cep`, `rua`, `num`, `cidade`) VALUES
(1, 69090544, 'rua conde do visconde', 5, 'manaus'),
(2, 69090544, 'rua conde de intanhaein', 10, 'manaus'),
(3, 70707029, 'alameda das decepcoes', 4545, 'manacapuru');

-- --------------------------------------------------------

--
-- Estrutura da tabela `aluga`
--

CREATE TABLE `aluga` (
  `codigo` int(11) NOT NULL,
  `CNH` int(11) NOT NULL,
  `placa` varchar(10) NOT NULL,
  `dia` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `aluga`
--

INSERT INTO `aluga` (`codigo`, `CNH`, `placa`, `dia`) VALUES
(1, 11111, 'JXB-5656', '2023-11-11'),
(2, 33333, 'B4T3U0WO', '2023-10-09'),
(3, 222222, 'B4T3U0WO', '2023-12-10');

-- --------------------------------------------------------

--
-- Estrutura da tabela `carro`
--

CREATE TABLE `carro` (
  `placa` varchar(10) NOT NULL,
  `modelo` varchar(20) NOT NULL,
  `ano` int(11) NOT NULL,
  `codigo_agencia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `carro`
--

INSERT INTO `carro` (`placa`, `modelo`, `ano`, `codigo_agencia`) VALUES
('AAA-0000', 'XEVET', 2024, 2),
('B4T3U0WO', 'ROLLS ROYCE', 754, 3),
('JXB-5656', 'FIAT UNICO', 1940, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `CNH` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cartao` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`CNH`, `nome`, `cartao`) VALUES
(11111, 'Anabele', '123123-321'),
(33333, 'Cristian', '3141632'),
(222222, 'Bruce', '2225558788');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente_telefone`
--

CREATE TABLE `cliente_telefone` (
  `codigo` int(11) NOT NULL,
  `cnh_cliente` int(11) NOT NULL,
  `numero` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `cliente_telefone`
--

INSERT INTO `cliente_telefone` (`codigo`, `cnh_cliente`, `numero`) VALUES
(1, 11111, '9293445544'),
(2, 11111, '9293446544'),
(3, 33333, '0800151516');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `agencia`
--
ALTER TABLE `agencia`
  ADD PRIMARY KEY (`NumAg`);

--
-- Índices para tabela `aluga`
--
ALTER TABLE `aluga`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `CNH` (`CNH`),
  ADD KEY `placa` (`placa`);

--
-- Índices para tabela `carro`
--
ALTER TABLE `carro`
  ADD PRIMARY KEY (`placa`),
  ADD KEY `codigo_agencia` (`codigo_agencia`);

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`CNH`);

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
  ADD CONSTRAINT `aluga_ibfk_1` FOREIGN KEY (`CNH`) REFERENCES `cliente` (`CNH`),
  ADD CONSTRAINT `aluga_ibfk_2` FOREIGN KEY (`placa`) REFERENCES `carro` (`placa`);

--
-- Limitadores para a tabela `carro`
--
ALTER TABLE `carro`
  ADD CONSTRAINT `carro_ibfk_1` FOREIGN KEY (`codigo_agencia`) REFERENCES `agencia` (`NumAg`);

--
-- Limitadores para a tabela `cliente_telefone`
--
ALTER TABLE `cliente_telefone`
  ADD CONSTRAINT `cliente_telefone_ibfk_1` FOREIGN KEY (`cnh_cliente`) REFERENCES `cliente` (`CNH`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
