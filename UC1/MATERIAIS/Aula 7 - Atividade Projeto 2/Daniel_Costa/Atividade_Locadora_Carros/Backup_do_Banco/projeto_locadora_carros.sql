-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 10-Nov-2023 às 21:41
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
-- Banco de dados: `projeto_locadora_carros`
--
CREATE DATABASE IF NOT EXISTS `projeto_locadora_carros` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `projeto_locadora_carros`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `agencia`
--

CREATE TABLE `agencia` (
  `num_ag` int(11) NOT NULL,
  `end_cep` varchar(8) NOT NULL,
  `end_rua` varchar(45) NOT NULL,
  `end_num` varchar(10) NOT NULL,
  `end_cidade` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `agencia`
--

INSERT INTO `agencia` (`num_ag`, `end_cep`, `end_rua`, `end_num`, `end_cidade`) VALUES
(1, '69000000', 'Rua 1', 'Casa 1', 'Cidade 1'),
(2, '69111111', 'Rua 2', 'Casa 2', 'Cidade 2'),
(3, '69222222', 'Rua 3', 'Casa 3', 'Cidade 3');

-- --------------------------------------------------------

--
-- Estrutura da tabela `aluguel`
--

CREATE TABLE `aluguel` (
  `data_aluguel` datetime NOT NULL,
  `placa` varchar(11) NOT NULL,
  `cnh` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `aluguel`
--

INSERT INTO `aluguel` (`data_aluguel`, `placa`, `cnh`) VALUES
('2023-02-23 13:00:00', 'PHZ0000', '11111111111'),
('2023-03-24 14:00:00', 'QZB1111', '22222222222'),
('2023-04-25 15:00:00', 'PCL2222', '33333333333');

-- --------------------------------------------------------

--
-- Estrutura da tabela `carro`
--

CREATE TABLE `carro` (
  `placa` varchar(7) NOT NULL,
  `modelo` varchar(50) NOT NULL,
  `ano` varchar(4) NOT NULL,
  `num_ag` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `carro`
--

INSERT INTO `carro` (`placa`, `modelo`, `ano`, `num_ag`) VALUES
('PCL2222', 'ONIX', '2021', 3),
('PHZ0000', 'GOL', '2022', 1),
('QZB1111', 'MOBI', '2023', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `cnh` varchar(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `cartao` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`cnh`, `nome`, `cartao`) VALUES
('11111111111', 'Fulano', '1234567891234567'),
('22222222222', 'Siclano', '2345678912345678'),
('33333333333', 'Beltrano', '3456789123456789');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente_telefone`
--

CREATE TABLE `cliente_telefone` (
  `cod_telefone` int(11) NOT NULL,
  `numero` varchar(11) DEFAULT NULL,
  `cnh` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `cliente_telefone`
--

INSERT INTO `cliente_telefone` (`cod_telefone`, `numero`, `cnh`) VALUES
(1, '92981818181', '11111111111'),
(2, '92992929292', '22222222222'),
(3, '92984848484', '33333333333');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `agencia`
--
ALTER TABLE `agencia`
  ADD PRIMARY KEY (`num_ag`);

--
-- Índices para tabela `aluguel`
--
ALTER TABLE `aluguel`
  ADD KEY `cnh` (`cnh`),
  ADD KEY `placa` (`placa`);

--
-- Índices para tabela `carro`
--
ALTER TABLE `carro`
  ADD PRIMARY KEY (`placa`),
  ADD KEY `num_ag` (`num_ag`);

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
  ADD KEY `cnh` (`cnh`);

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
  ADD CONSTRAINT `carro_ibfk_1` FOREIGN KEY (`num_ag`) REFERENCES `agencia` (`num_ag`);

--
-- Limitadores para a tabela `cliente_telefone`
--
ALTER TABLE `cliente_telefone`
  ADD CONSTRAINT `cliente_telefone_ibfk_1` FOREIGN KEY (`cnh`) REFERENCES `cliente` (`cnh`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
