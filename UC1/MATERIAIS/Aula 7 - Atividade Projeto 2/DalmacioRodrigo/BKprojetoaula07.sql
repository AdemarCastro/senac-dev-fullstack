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
-- Banco de dados: `projetoaula07`
--
CREATE DATABASE IF NOT EXISTS `projetoaula07` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `projetoaula07`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `agencia`
--

CREATE TABLE `agencia` (
  `cod_agencia` int(11) NOT NULL,
  `end_cep` varchar(10) DEFAULT NULL,
  `end_rua` varchar(20) DEFAULT NULL,
  `end_numero` varchar(5) DEFAULT NULL,
  `end_cidade` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `agencia`
--

INSERT INTO `agencia` (`cod_agencia`, `end_cep`, `end_rua`, `end_numero`, `end_cidade`) VALUES
(10, '69042150', 'Djalma Batista', '101', 'Manaus'),
(11, '69042150', 'COnstantino Nery', '102', 'Manaus'),
(12, '69042150', ' Anhanguera', '103', 'Sao Paulo'),
(13, '69042150', 'Anahia Melo', '104', 'Sao Paulo'),
(14, '69042150', 'Rodoanel', '105', 'Rio de Janeiro');

-- --------------------------------------------------------

--
-- Estrutura da tabela `carro`
--

CREATE TABLE `carro` (
  `placa` varchar(7) NOT NULL,
  `modelo` varchar(15) NOT NULL,
  `ano` int(11) NOT NULL,
  `cod_age` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `carro`
--

INSERT INTO `carro` (`placa`, `modelo`, `ano`, `cod_age`) VALUES
('adr2010', 'ltz completo', 2023, 10),
('aer6543', ' retrô', 1850, 14),
('aert654', ' retrô', 1850, 14),
('uyt1119', 'hibrido', 2020, 11);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `cnh` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `cartao` varchar(11) NOT NULL,
  `cod_fone` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`cnh`, `nome`, `cartao`, `cod_fone`) VALUES
(8888888, 'Naruto', '8888888', 2),
(555555555, 'Hercules', '555555555', 1),
(666666666, 'Jaspion', '666666666', 1),
(777777777, 'Goku', '777777777', 1),
(2147483647, 'Dalmacio', '999999999', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `reserva`
--

CREATE TABLE `reserva` (
  `cod_reserva` int(11) NOT NULL,
  `data_reserva` varchar(20) NOT NULL,
  `cnh_cli` int(11) DEFAULT NULL,
  `placa_carro` varchar(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `reserva`
--

INSERT INTO `reserva` (`cod_reserva`, `data_reserva`, `cnh_cli`, `placa_carro`) VALUES
(666, '12/12/2020', 666666666, 'aer6543'),
(888, '10/10/2020', 8888888, 'uyt1119'),
(999, '10 de janeiro de 202', 2147483647, 'adr2010');

-- --------------------------------------------------------

--
-- Estrutura da tabela `telefone_cliente`
--

CREATE TABLE `telefone_cliente` (
  `codigo` int(11) NOT NULL,
  `numero` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `telefone_cliente`
--

INSERT INTO `telefone_cliente` (`codigo`, `numero`) VALUES
(1, 98989898),
(2, 97979797),
(3, 96969696),
(4, 95959595),
(5, 94949494);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `agencia`
--
ALTER TABLE `agencia`
  ADD PRIMARY KEY (`cod_agencia`);

--
-- Índices para tabela `carro`
--
ALTER TABLE `carro`
  ADD PRIMARY KEY (`placa`),
  ADD KEY `cod_age` (`cod_age`);

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cnh`),
  ADD UNIQUE KEY `cartao` (`cartao`),
  ADD KEY `cod_fone` (`cod_fone`);

--
-- Índices para tabela `reserva`
--
ALTER TABLE `reserva`
  ADD PRIMARY KEY (`cod_reserva`),
  ADD KEY `cnh_cli` (`cnh_cli`),
  ADD KEY `placa_carro` (`placa_carro`);

--
-- Índices para tabela `telefone_cliente`
--
ALTER TABLE `telefone_cliente`
  ADD PRIMARY KEY (`codigo`);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `carro`
--
ALTER TABLE `carro`
  ADD CONSTRAINT `carro_ibfk_1` FOREIGN KEY (`cod_age`) REFERENCES `agencia` (`cod_agencia`);

--
-- Limitadores para a tabela `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`cod_fone`) REFERENCES `telefone_cliente` (`codigo`);

--
-- Limitadores para a tabela `reserva`
--
ALTER TABLE `reserva`
  ADD CONSTRAINT `reserva_ibfk_1` FOREIGN KEY (`cnh_cli`) REFERENCES `cliente` (`cnh`),
  ADD CONSTRAINT `reserva_ibfk_2` FOREIGN KEY (`placa_carro`) REFERENCES `carro` (`placa`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
