-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 10-Nov-2023 às 21:54
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
-- Banco de dados: `alugueldecarros`
--
CREATE DATABASE IF NOT EXISTS `alugueldecarros` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `alugueldecarros`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `agencia`
--

CREATE TABLE `agencia` (
  `num_agencia` int(11) NOT NULL,
  `end_cep` varchar(10) DEFAULT NULL,
  `end_rua` varchar(20) DEFAULT NULL,
  `end_num` varchar(5) DEFAULT NULL,
  `end_cidade` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `agencia`
--

INSERT INTO `agencia` (`num_agencia`, `end_cep`, `end_rua`, `end_num`, `end_cidade`) VALUES
(0, '33333', 'rua C', '444', 'Manaus'),
(98, '09876', 'Carros', '111', 'Manaus'),
(111, '66666', 'Rua De Aluguel', '999', 'Manaus');

-- --------------------------------------------------------

--
-- Estrutura da tabela `aluguel`
--

CREATE TABLE `aluguel` (
  `cnh_cli` int(11) NOT NULL,
  `placa_carro` int(11) NOT NULL,
  `data_aluguel` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `aluguel`
--

INSERT INTO `aluguel` (`cnh_cli`, `placa_carro`, `data_aluguel`) VALUES
(123456789, 789, '01/02/03'),
(13467901, 123, '04/05/23'),
(94657895, 456, '05/06/23');

-- --------------------------------------------------------

--
-- Estrutura da tabela `carro`
--

CREATE TABLE `carro` (
  `placa` int(11) NOT NULL,
  `modelo` varchar(100) NOT NULL,
  `ano` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `carro`
--

INSERT INTO `carro` (`placa`, `modelo`, `ano`) VALUES
(0, 'nissan', '2023'),
(123, 'nissan', '2023'),
(456, 'honda', '2023'),
(789, 'volkswagen', '2023');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `cnh` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cartao` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`cnh`, `nome`, `cartao`) VALUES
(13467901, 'Joao', 456123),
(94657895, 'Lucas', 1020304),
(123456789, 'Gabriel', 987654321);

-- --------------------------------------------------------

--
-- Estrutura da tabela `telefone_cliente`
--

CREATE TABLE `telefone_cliente` (
  `codigo_tel` int(11) NOT NULL,
  `numero` varchar(13) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `agencia`
--
ALTER TABLE `agencia`
  ADD PRIMARY KEY (`num_agencia`);

--
-- Índices para tabela `aluguel`
--
ALTER TABLE `aluguel`
  ADD KEY `cnh_cli` (`cnh_cli`),
  ADD KEY `placa_carro` (`placa_carro`);

--
-- Índices para tabela `carro`
--
ALTER TABLE `carro`
  ADD PRIMARY KEY (`placa`);

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cnh`);

--
-- Índices para tabela `telefone_cliente`
--
ALTER TABLE `telefone_cliente`
  ADD PRIMARY KEY (`codigo_tel`);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `aluguel`
--
ALTER TABLE `aluguel`
  ADD CONSTRAINT `aluguel_ibfk_1` FOREIGN KEY (`cnh_cli`) REFERENCES `cliente` (`cnh`),
  ADD CONSTRAINT `aluguel_ibfk_2` FOREIGN KEY (`placa_carro`) REFERENCES `carro` (`placa`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
