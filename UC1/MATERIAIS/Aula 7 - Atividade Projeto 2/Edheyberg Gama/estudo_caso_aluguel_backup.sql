-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 10/11/2023 às 21:05
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
-- Banco de dados: `estudo_caso_aluguel`
--
CREATE DATABASE IF NOT EXISTS `estudo_caso_aluguel` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `estudo_caso_aluguel`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `agencia`
--

CREATE TABLE `agencia` (
  `numAg` int(11) NOT NULL,
  `nome` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `agencia`
--

INSERT INTO `agencia` (`numAg`, `nome`) VALUES
(1, 'Agencia 1'),
(2, 'Agencia B'),
(3, 'Terceira Agencia');

-- --------------------------------------------------------

--
-- Estrutura para tabela `agencia_endereco`
--

CREATE TABLE `agencia_endereco` (
  `codigo` int(11) NOT NULL,
  `cod_agencia` int(11) NOT NULL,
  `cep` varchar(8) NOT NULL,
  `rua` varchar(50) NOT NULL,
  `numero` varchar(4) NOT NULL,
  `cidade` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `agencia_endereco`
--

INSERT INTO `agencia_endereco` (`codigo`, `cod_agencia`, `cep`, `rua`, `numero`, `cidade`) VALUES
(1, 1, '12345678', 'Rua A', '22', 'Manaus'),
(2, 2, '64002222', 'Rua Dois ', '122', 'Manaus'),
(3, 3, '62003333', 'Rua Central', '9', 'Manacapuru');

-- --------------------------------------------------------

--
-- Estrutura para tabela `aluguel`
--

CREATE TABLE `aluguel` (
  `codigo` int(11) NOT NULL,
  `cnh_cliente` varchar(11) NOT NULL,
  `placa_carro` varchar(9) NOT NULL,
  `data_aluguel` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `aluguel`
--

INSERT INTO `aluguel` (`codigo`, `cnh_cliente`, `placa_carro`, `data_aluguel`) VALUES
(1, '12345678902', '222222222', '2023-11-10'),
(2, '32345678901', '222222222', '2023-11-09'),
(3, '32345678901', '333333333', '2023-11-02');

-- --------------------------------------------------------

--
-- Estrutura para tabela `carro`
--

CREATE TABLE `carro` (
  `placa` varchar(9) NOT NULL,
  `cod_agencia` int(11) NOT NULL,
  `ano_fabricado` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `carro`
--

INSERT INTO `carro` (`placa`, `cod_agencia`, `ano_fabricado`) VALUES
('123456789', 1, '1994'),
('222222222', 2, '2022'),
('333333333', 2, '2020');

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `cnh` varchar(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `cartao` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `cliente`
--

INSERT INTO `cliente` (`cnh`, `nome`, `cartao`) VALUES
('12345678901', 'André', '123456789012'),
('12345678902', 'Beto', '223456789012'),
('32345678901', 'Carlos', '323456789012');

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente_telefone`
--

CREATE TABLE `cliente_telefone` (
  `codigo` int(11) NOT NULL,
  `cnh_cliente` varchar(11) NOT NULL,
  `telefone` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `cliente_telefone`
--

INSERT INTO `cliente_telefone` (`codigo`, `cnh_cliente`, `telefone`) VALUES
(1, '12345678901', '12345678901'),
(2, '12345678902', '22222222222'),
(3, '12345678902', '33333333333');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `agencia`
--
ALTER TABLE `agencia`
  ADD PRIMARY KEY (`numAg`);

--
-- Índices de tabela `agencia_endereco`
--
ALTER TABLE `agencia_endereco`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `cod_agencia` (`cod_agencia`);

--
-- Índices de tabela `aluguel`
--
ALTER TABLE `aluguel`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `cnh_cliente` (`cnh_cliente`),
  ADD KEY `placa_carro` (`placa_carro`);

--
-- Índices de tabela `carro`
--
ALTER TABLE `carro`
  ADD PRIMARY KEY (`placa`),
  ADD KEY `cod_agencia` (`cod_agencia`);

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cnh`),
  ADD UNIQUE KEY `cartao` (`cartao`);

--
-- Índices de tabela `cliente_telefone`
--
ALTER TABLE `cliente_telefone`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `cnh_cliente` (`cnh_cliente`);

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `agencia_endereco`
--
ALTER TABLE `agencia_endereco`
  ADD CONSTRAINT `agencia_endereco_ibfk_1` FOREIGN KEY (`cod_agencia`) REFERENCES `agencia` (`numAg`);

--
-- Restrições para tabelas `aluguel`
--
ALTER TABLE `aluguel`
  ADD CONSTRAINT `aluguel_ibfk_1` FOREIGN KEY (`cnh_cliente`) REFERENCES `cliente` (`cnh`),
  ADD CONSTRAINT `aluguel_ibfk_2` FOREIGN KEY (`placa_carro`) REFERENCES `carro` (`placa`);

--
-- Restrições para tabelas `carro`
--
ALTER TABLE `carro`
  ADD CONSTRAINT `carro_ibfk_1` FOREIGN KEY (`cod_agencia`) REFERENCES `agencia` (`numAg`);

--
-- Restrições para tabelas `cliente_telefone`
--
ALTER TABLE `cliente_telefone`
  ADD CONSTRAINT `cliente_telefone_ibfk_1` FOREIGN KEY (`cnh_cliente`) REFERENCES `cliente` (`cnh`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
