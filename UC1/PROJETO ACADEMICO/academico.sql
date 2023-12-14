-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 14-Dez-2023 às 21:04
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
-- Banco de dados: `academico`
--
CREATE DATABASE IF NOT EXISTS `academico` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `academico`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `matricula` varchar(3) NOT NULL,
  `nome` varchar(120) NOT NULL,
  `email` varchar(120) NOT NULL,
  `senha` varchar(32) NOT NULL,
  `estatus` varchar(120) NOT NULL,
  `painel` varchar(80) NOT NULL,
  `data_cadastro` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `matricula`, `nome`, `email`, `senha`, `estatus`, `painel`, `data_cadastro`) VALUES
(2, '002', 'João Gomes', 'joao.gomes@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 'Inativa', 'Aluno', '2023-12-14 19:28:40'),
(3, '003', 'Lucas Luco', 'lucas.luco@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Ativo', 'Professor', '2023-12-14 19:28:40'),
(4, '004', 'Maria Silva', 'maria.silva@gmail.com', '482c811da5d5b4bc6d497ffa98491e38', 'Ativo', 'Aluno', '2023-12-14 19:28:40'),
(5, '005', 'Pedro Almeida', 'pedro.almeida@gmail.com', '6ce4719c871a2374dc5b837cc390c4f7', 'Inativo', 'Professor', '2023-12-14 19:28:40'),
(6, '006', 'Ana Sousa', 'ana.sousa@gmail.com', 'e7d80ffeefa212b7c5c55700e4f7193e', 'Ativo', 'Aluno', '2023-12-14 19:28:40'),
(7, '007', 'Carlos Oliveira', 'carlos.oliveira@gmail.com', 'c2e378e5060a5f590daf9ba5238203be', 'Ativo', 'Aluno', '2023-12-14 19:28:40'),
(8, '008', 'Mariana Santos', 'mariana.santos@gmail.com', '3d7fcc75ff6bfcbc40127078aa3760d5', 'Inativo', 'Professor', '2023-12-14 19:28:40'),
(9, '009', 'Rafaela Costa', 'rafaela.costa@gmail.com', '3f00ca522e10ba50e34747b98349bead', 'Ativo', 'Aluno', '2023-12-14 19:28:40'),
(10, '010', 'Fernando Vieira', 'fernando.vieira@gmail.com', 'a906449d5769fa7361d7ecc6aa3f6d28', 'Inativo', 'Aluno', '2023-12-14 19:28:40'),
(11, '011', 'Patrícia Ferreira', 'patricia.ferreira@gmail.com', '6381c8fae8ef86266a33cb9c877191e3', 'Ativo', 'Professor', '2023-12-14 19:28:40'),
(12, '012', 'Gabriel Ramos', 'gabriel.ramos@gmail.com', 'bbee168538cd29507cefacf48c986e3c', 'Ativo', 'Aluno', '2023-12-14 19:28:40'),
(13, '013', 'Sofia Martins', 'sofia.martins@gmail.com', '286b249d741cd73c65ea8a38aef14279', 'Inativo', 'Aluno', '2023-12-14 19:28:40'),
(14, '014', 'Daniel Costa', 'daniel.costa@gmail.com', '25e4ba566516114a4c0b3b29042d5113', 'Ativo', 'Professor', '2023-12-14 19:28:40'),
(15, '015', 'Laura Fernandes', 'laura.fernandes@gmail.com', '744b5d9baee51dea1a57244fca9d88c5', 'Ativo', 'Aluno', '2023-12-14 19:28:40'),
(16, '016', 'Mateus Lima', 'mateus.lima@gmail.com', '922e2856edee3b65b1d557ee0b6aeecd', 'Inativo', 'Aluno', '2023-12-14 19:28:40'),
(17, '017', 'Camila Pereira', 'camila.pereira@gmail.com', 'bedef3c982f9e4279b133f712e073b9b', 'Ativo', 'Aluno', '2023-12-14 19:28:40'),
(18, '018', 'Gustavo Oliveira', 'gustavo.oliveira@gmail.com', '5f52ae33960c679d09a18a07b0221fae', 'Inativo', 'Professor', '2023-12-14 19:28:40'),
(19, '019', 'Isabela Rodrigues', 'isabela.rodrigues@gmail.com', 'cd9dc9ceabd94afbb0a3de7978491eb1', 'Ativo', 'Aluno', '2023-12-14 19:28:40'),
(20, '020', 'Henrique Sousa', 'henrique.sousa@gmail.com', 'ad933965ff962198799243abe6b2f026', 'Ativo', 'Aluno', '2023-12-14 19:28:40');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `matricula` (`matricula`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
