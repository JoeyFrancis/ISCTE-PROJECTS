-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 15-Dez-2021 às 00:14
-- Versão do servidor: 10.4.21-MariaDB
-- versão do PHP: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `projeto_parte2`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `andar`
--

CREATE TABLE `andar` (
  `Numero` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

--
-- Extraindo dados da tabela `andar`
--

INSERT INTO `andar` (`Numero`) VALUES
(1),
(2),
(3),
(4),
(6);

-- --------------------------------------------------------

--
-- Estrutura da tabela `area_tematica`
--

CREATE TABLE `area_tematica` (
  `Id` int(11) NOT NULL,
  `Nome` varchar(50) NOT NULL,
  `Area_Tematica_superior_Id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

--
-- Extraindo dados da tabela `area_tematica`
--

INSERT INTO `area_tematica` (`Id`, `Nome`, `Area_Tematica_superior_Id`) VALUES
(89, 'Geografia', NULL),
(1, 'Matemática', NULL),
(12, 'Programação', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `armario`
--

CREATE TABLE `armario` (
  `Andar_Numero` tinyint(4) NOT NULL,
  `Espaco_de_arrumacao_Id` int(11) NOT NULL,
  `Letra` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

--
-- Extraindo dados da tabela `armario`
--

INSERT INTO `armario` (`Andar_Numero`, `Espaco_de_arrumacao_Id`, `Letra`) VALUES
(1, 1, 'A'),
(4, 12, 'C'),
(3, 123, 'B');

-- --------------------------------------------------------

--
-- Estrutura da tabela `autor`
--

CREATE TABLE `autor` (
  `id` int(11) NOT NULL,
  `Nome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

--
-- Extraindo dados da tabela `autor`
--

INSERT INTO `autor` (`id`, `Nome`) VALUES
(3, 'Fernando Grupo de Pessoas'),
(2, 'Peca Pernanbeca'),
(1, 'Ze Pevides');

-- --------------------------------------------------------

--
-- Estrutura da tabela `autoria_de_livro`
--

CREATE TABLE `autoria_de_livro` (
  `Autor_id_` int(11) NOT NULL,
  `Livro_Id_` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

--
-- Extraindo dados da tabela `autoria_de_livro`
--

INSERT INTO `autoria_de_livro` (`Autor_id_`, `Livro_Id_`) VALUES
(3, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `autoria_de_monografia`
--

CREATE TABLE `autoria_de_monografia` (
  `Autor_id_` int(11) NOT NULL,
  `Monografia_Id_` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

-- --------------------------------------------------------

--
-- Estrutura da tabela `capitulo_ou_artigo`
--

CREATE TABLE `capitulo_ou_artigo` (
  `Publicacao_Id` int(11) NOT NULL,
  `Numero` tinyint(4) NOT NULL,
  `Nome` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

-- --------------------------------------------------------

--
-- Estrutura da tabela `documento_de_identificao`
--

CREATE TABLE `documento_de_identificao` (
  `Utente_numero` int(11) NOT NULL,
  `Tipo` char(4) NOT NULL CHECK (`Tipo` in ('CC','Pssp')),
  `Numero` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

--
-- Extraindo dados da tabela `documento_de_identificao`
--

INSERT INTO `documento_de_identificao` (`Utente_numero`, `Tipo`, `Numero`) VALUES
(56984, 'CC', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `edicao_de_livro`
--

CREATE TABLE `edicao_de_livro` (
  `Livro_Id` int(11) NOT NULL,
  `Publicacao_Id` int(11) NOT NULL,
  `Numero` tinyint(4) NOT NULL,
  `ISBN` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

--
-- Extraindo dados da tabela `edicao_de_livro`
--

INSERT INTO `edicao_de_livro` (`Livro_Id`, `Publicacao_Id`, `Numero`, `ISBN`) VALUES
(3, 6, 45, 756434),
(7, 438, 127, 1234),
(33, 1, 2, 123);

-- --------------------------------------------------------

--
-- Estrutura da tabela `edicao_de_periodico`
--

CREATE TABLE `edicao_de_periodico` (
  `Periodico_Editora_ou_Periodico_Id` int(11) NOT NULL,
  `Publicacao_Id` int(11) NOT NULL,
  `Numero` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

--
-- Extraindo dados da tabela `edicao_de_periodico`
--

INSERT INTO `edicao_de_periodico` (`Periodico_Editora_ou_Periodico_Id`, `Publicacao_Id`, `Numero`) VALUES
(3245, 1, 54);

-- --------------------------------------------------------

--
-- Estrutura da tabela `editora`
--

CREATE TABLE `editora` (
  `Editora_ou_Periodico_Id` int(11) NOT NULL,
  `Nome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

--
-- Extraindo dados da tabela `editora`
--

INSERT INTO `editora` (`Editora_ou_Periodico_Id`, `Nome`) VALUES
(3, 'Jorge fumado'),
(5, 'madalena fumada'),
(89, 'Oá Dori'),
(4985, 'diogo fumado');

-- --------------------------------------------------------

--
-- Estrutura da tabela `editora_ou_periodico`
--

CREATE TABLE `editora_ou_periodico` (
  `Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

--
-- Extraindo dados da tabela `editora_ou_periodico`
--

INSERT INTO `editora_ou_periodico` (`Id`) VALUES
(3),
(5),
(7),
(89),
(324),
(1245),
(3245),
(4985),
(76543);

-- --------------------------------------------------------

--
-- Estrutura da tabela `emprestimo`
--

CREATE TABLE `emprestimo` (
  `Numero` int(11) NOT NULL,
  `Data_hora` datetime NOT NULL,
  `Publicacao_Id` int(11) NOT NULL,
  `Exemplar_Nr` tinyint(4) NOT NULL,
  `Utente_Numero` int(11) NOT NULL,
  `Data_de_devolucao_limite` date NOT NULL,
  `Qtd_de_prolongamentos` tinyint(4) DEFAULT NULL,
  `Data_de_devolucao` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

--
-- Extraindo dados da tabela `emprestimo`
--

INSERT INTO `emprestimo` (`Numero`, `Data_hora`, `Publicacao_Id`, `Exemplar_Nr`, `Utente_Numero`, `Data_de_devolucao_limite`, `Qtd_de_prolongamentos`, `Data_de_devolucao`) VALUES
(532, '2021-11-06 16:39:34', 6, 123, 2, '2021-12-15', NULL, '2021-12-01 17:39:34'),
(8889, '2021-12-03 18:12:41', 4, 32, 2, '2021-12-07', NULL, '2021-12-01 18:12:41');

-- --------------------------------------------------------

--
-- Estrutura da tabela `emprestimo_com_multa`
--

CREATE TABLE `emprestimo_com_multa` (
  `Numero` int(11) NOT NULL,
  `Valor_actual_por_atraso` decimal(5,2) DEFAULT NULL,
  `Valor_por_extravio` decimal(5,2) DEFAULT NULL,
  `Valor_total` decimal(5,2) DEFAULT NULL,
  `Multa_paga` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

-- --------------------------------------------------------

--
-- Estrutura da tabela `espaco_de_arrumacao`
--

CREATE TABLE `espaco_de_arrumacao` (
  `Id` int(11) NOT NULL,
  `Nivel_de_ocupacao` tinyint(4) DEFAULT NULL,
  `Area_Tematica_Id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

--
-- Extraindo dados da tabela `espaco_de_arrumacao`
--

INSERT INTO `espaco_de_arrumacao` (`Id`, `Nivel_de_ocupacao`, `Area_Tematica_Id`) VALUES
(1, 79, 1),
(12, 25, 1),
(34, 98, 89),
(123, 24, 89);

-- --------------------------------------------------------

--
-- Estrutura da tabela `estado_de_conservacao`
--

CREATE TABLE `estado_de_conservacao` (
  `Nome` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

--
-- Extraindo dados da tabela `estado_de_conservacao`
--

INSERT INTO `estado_de_conservacao` (`Nome`) VALUES
('extraviado'),
('novito'),
('Velho pa xuxu');

-- --------------------------------------------------------

--
-- Estrutura da tabela `exemplar`
--

CREATE TABLE `exemplar` (
  `Publicacao_Id` int(11) NOT NULL,
  `Nr` tinyint(4) NOT NULL,
  `Codigo_de_barras` int(11) DEFAULT NULL,
  `Data_de_aquisicao` date DEFAULT NULL,
  `RFID` int(11) DEFAULT NULL,
  `Pode_ser_emprestado` tinyint(1) DEFAULT NULL,
  `Estado_de_conservacao_Nome` varchar(20) DEFAULT NULL,
  `Localizacao_Andar_Numero` tinyint(4) DEFAULT NULL,
  `Localizacao_Armario_Letra` char(1) DEFAULT NULL,
  `Localizacao_Prateleira_Numero` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

--
-- Extraindo dados da tabela `exemplar`
--

INSERT INTO `exemplar` (`Publicacao_Id`, `Nr`, `Codigo_de_barras`, `Data_de_aquisicao`, `RFID`, `Pode_ser_emprestado`, `Estado_de_conservacao_Nome`, `Localizacao_Andar_Numero`, `Localizacao_Armario_Letra`, `Localizacao_Prateleira_Numero`) VALUES
(2, 1, 563, '2021-04-06', 256, 1, 'Velho pa xuxu', 1, 'A', 1),
(4, 32, NULL, NULL, NULL, NULL, NULL, 1, 'A', 1),
(6, 123, 2351, NULL, 12451, 1, 'Velho pa xuxu', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `feed`
--

CREATE TABLE `feed` (
  `Endereco` varchar(255) NOT NULL,
  `Editora_ou_Periodico_Id` int(11) NOT NULL,
  `Periodicidade_Nome` varchar(50) DEFAULT NULL,
  `Area_Tematica_Id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

--
-- Extraindo dados da tabela `feed`
--

INSERT INTO `feed` (`Endereco`, `Editora_ou_Periodico_Id`, `Periodicidade_Nome`, `Area_Tematica_Id`) VALUES
('yauuslkdhgslkjglskjf', 324, 'anual', 89);

-- --------------------------------------------------------

--
-- Estrutura da tabela `lista_de_leitura`
--

CREATE TABLE `lista_de_leitura` (
  `Utente_Numero` int(11) NOT NULL,
  `Nome` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

--
-- Extraindo dados da tabela `lista_de_leitura`
--

INSERT INTO `lista_de_leitura` (`Utente_Numero`, `Nome`) VALUES
(1, 'Programação'),
(2, 'Matematica Aplicada'),
(5, 'Algebra'),
(78326, 'Livros de bebés');

-- --------------------------------------------------------

--
-- Estrutura da tabela `livro`
--

CREATE TABLE `livro` (
  `Id` int(11) NOT NULL,
  `Nome` varchar(100) DEFAULT NULL,
  `Editora_Nome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

--
-- Extraindo dados da tabela `livro`
--

INSERT INTO `livro` (`Id`, `Nome`, `Editora_Nome`) VALUES
(1, 'Programação ', 'madalena fumada'),
(3, 'tau tau', 'madalena fumada'),
(7, 'oh oh oh ', 'Oá Dori'),
(33, 'Álgebra Linear', 'diogo fumado');

-- --------------------------------------------------------

--
-- Estrutura da tabela `livro_em_lista_leitura`
--

CREATE TABLE `livro_em_lista_leitura` (
  `Edicao_de_Livro_Livro_Id_` int(11) NOT NULL,
  `Edicao_de_Livro_Numero_` tinyint(4) NOT NULL,
  `Lista_de_leitura_Utente_Numero_` int(11) NOT NULL,
  `Lista_de_leitura_Nome_` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

--
-- Extraindo dados da tabela `livro_em_lista_leitura`
--

INSERT INTO `livro_em_lista_leitura` (`Edicao_de_Livro_Livro_Id_`, `Edicao_de_Livro_Numero_`, `Lista_de_leitura_Utente_Numero_`, `Lista_de_leitura_Nome_`) VALUES
(3, 45, 78326, 'Livros de bebés'),
(33, 2, 5, 'Algebra');

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `media`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `media` (
`DiferencaDias` decimal(31,0)
,`NumPubs` bigint(21)
,`DiferencaDiasMax` bigint(10)
,`DiferencaDiasMin` bigint(10)
);

-- --------------------------------------------------------

--
-- Estrutura da tabela `monografia`
--

CREATE TABLE `monografia` (
  `Publicacao_Id` int(11) NOT NULL,
  `Tipo_de_monografia_Nome` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

--
-- Extraindo dados da tabela `monografia`
--

INSERT INTO `monografia` (`Publicacao_Id`, `Tipo_de_monografia_Nome`) VALUES
(4, 'Jorge fumado'),
(34, 'Jornal'),
(1234, 'madalena fumada');

-- --------------------------------------------------------

--
-- Estrutura da tabela `palavra_chave_descreve_publicacao`
--

CREATE TABLE `palavra_chave_descreve_publicacao` (
  `Palavra_chave_` varchar(50) NOT NULL,
  `Publicacao_Id_` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

--
-- Extraindo dados da tabela `palavra_chave_descreve_publicacao`
--

INSERT INTO `palavra_chave_descreve_publicacao` (`Palavra_chave_`, `Publicacao_Id_`) VALUES
('SLB', 6);

-- --------------------------------------------------------

--
-- Estrutura da tabela `palavra_chave_tag`
--

CREATE TABLE `palavra_chave_tag` (
  `Palavra` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

--
-- Extraindo dados da tabela `palavra_chave_tag`
--

INSERT INTO `palavra_chave_tag` (`Palavra`) VALUES
('SCP'),
('SLB');

-- --------------------------------------------------------

--
-- Estrutura da tabela `periodicidade`
--

CREATE TABLE `periodicidade` (
  `Nome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

--
-- Extraindo dados da tabela `periodicidade`
--

INSERT INTO `periodicidade` (`Nome`) VALUES
('anual'),
('mensal'),
('semanal'),
('semestral'),
('trimestral');

-- --------------------------------------------------------

--
-- Estrutura da tabela `periodico`
--

CREATE TABLE `periodico` (
  `Editora_Nome` varchar(50) NOT NULL,
  `Editora_ou_Periodico_Id` int(11) NOT NULL,
  `Periodicidade_Nome` varchar(50) NOT NULL,
  `ISSN` int(11) DEFAULT NULL,
  `Sigla` char(8) DEFAULT NULL,
  `Nome` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

--
-- Extraindo dados da tabela `periodico`
--

INSERT INTO `periodico` (`Editora_Nome`, `Editora_ou_Periodico_Id`, `Periodicidade_Nome`, `ISSN`, `Sigla`, `Nome`) VALUES
('diogo fumado', 89, 'mensal', 5843, 'DG', 'ALALALAL'),
('Oá Dori', 324, 'trimestral', 95723, 'GK', 'iscte iscte conas abertas caralhos em pé\r\n'),
('Jorge fumado', 3245, 'mensal', 392854, 'FKJG', 'ALALALALLA\r\n');

-- --------------------------------------------------------

--
-- Estrutura da tabela `prateleira`
--

CREATE TABLE `prateleira` (
  `Andar_Numero` tinyint(4) NOT NULL,
  `Armario_Letra` char(1) NOT NULL,
  `Espaco_de_arrumacao_Id` int(11) NOT NULL,
  `Numero` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

--
-- Extraindo dados da tabela `prateleira`
--

INSERT INTO `prateleira` (`Andar_Numero`, `Armario_Letra`, `Espaco_de_arrumacao_Id`, `Numero`) VALUES
(1, 'A', 1, 1),
(3, 'B', 123, 5);

-- --------------------------------------------------------

--
-- Estrutura da tabela `publicacao`
--

CREATE TABLE `publicacao` (
  `Id` int(11) NOT NULL,
  `Nome` varchar(255) DEFAULT NULL,
  `Nome_abreviado` varchar(100) DEFAULT NULL,
  `Codigo` int(11) DEFAULT NULL,
  `Data_de_publicacao` date DEFAULT NULL,
  `Ano_de_publicacao` smallint(6) DEFAULT NULL,
  `Nr_Pags` smallint(6) DEFAULT NULL,
  `Capa` varchar(255) DEFAULT NULL,
  `Capa_em_miniatura` varchar(255) DEFAULT NULL,
  `Qtd_Emprestimos` smallint(6) DEFAULT 0,
  `Qtd_Acessos` smallint(6) DEFAULT 0,
  `Data_de_aquisicao` date DEFAULT NULL,
  `Area_Tematica_Id` int(11) DEFAULT NULL,
  `relevancia` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

--
-- Extraindo dados da tabela `publicacao`
--

INSERT INTO `publicacao` (`Id`, `Nome`, `Nome_abreviado`, `Codigo`, `Data_de_publicacao`, `Ano_de_publicacao`, `Nr_Pags`, `Capa`, `Capa_em_miniatura`, `Qtd_Emprestimos`, `Qtd_Acessos`, `Data_de_aquisicao`, `Area_Tematica_Id`, `relevancia`) VALUES
(1, 'Algebra Linear e Cálculo', 'ALEC', 1324, '2021-12-07', 2005, 659, NULL, NULL, 34, 125, '2021-12-08', 12, 4),
(2, 'Educação\r\n', 'CR', 3, '2021-09-07', 1246, 234, 'puto, obrigado', 'madalena', 235, 123, '2021-09-08', 89, 2),
(4, 'Alemão', 'JFJG', 3512, '2021-11-02', 1985, 128, 'lalala', 'lelele', 235, 12, '2021-11-09', 89, 2),
(6, 'Vida e Obra de Diogo', 'DF', 96857432, '2021-01-01', 1245, 943, 'eeee', 'oooo', 1240, 6543, '2021-01-02', 1, 1),
(34, 'Osddf', 'as', 134, '2001-12-06', 2931, 123, 'lala', 'lasdk', NULL, NULL, '2021-12-13', NULL, 4),
(438, 'Joaosss', 'J', 1234, '2021-12-05', 2021, 3214, '', '', 1, 3, '2021-12-14', 1, 1),
(1234, 'Publicação', 'José', 2184, '2021-12-09', 2021, 245, 'alal', 'lasjf', 3, 2, '2021-12-07', 1, 3),
(394985, 'Kiko', 'jsjf', 91, '2021-12-06', 2021, 123, '', '', 23, 3, '2021-12-13', 1, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `publicacao_digital`
--

CREATE TABLE `publicacao_digital` (
  `Publicacao_Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

-- --------------------------------------------------------

--
-- Estrutura da tabela `publicacao_fisica`
--

CREATE TABLE `publicacao_fisica` (
  `Publicacao_Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

--
-- Extraindo dados da tabela `publicacao_fisica`
--

INSERT INTO `publicacao_fisica` (`Publicacao_Id`) VALUES
(2),
(4),
(6);

-- --------------------------------------------------------

--
-- Estrutura da tabela `reserva`
--

CREATE TABLE `reserva` (
  `Publicacao_Id_` int(11) NOT NULL,
  `Utente_Numero_` int(11) NOT NULL,
  `Data_e_Hora` datetime DEFAULT NULL,
  `Exemplar_escolhido_Publicacao_Id` int(11) DEFAULT NULL,
  `Exemplar_Nr` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

--
-- Extraindo dados da tabela `reserva`
--

INSERT INTO `reserva` (`Publicacao_Id_`, `Utente_Numero_`, `Data_e_Hora`, `Exemplar_escolhido_Publicacao_Id`, `Exemplar_Nr`) VALUES
(4, 78326, '2021-03-03 17:11:56', 4, 32),
(6, 2, '2021-11-29 19:59:59', 2, 1),
(6, 78326, '2021-04-01 17:00:23', NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `revista`
--

CREATE TABLE `revista` (
  `Periodico_Editora_ou_Periodico_Id` int(11) NOT NULL,
  `Qtd_edicoes_nao_emprestaveis` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

--
-- Extraindo dados da tabela `revista`
--

INSERT INTO `revista` (`Periodico_Editora_ou_Periodico_Id`, `Qtd_edicoes_nao_emprestaveis`) VALUES
(324, 5);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_de_monografia`
--

CREATE TABLE `tipo_de_monografia` (
  `Nome` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

--
-- Extraindo dados da tabela `tipo_de_monografia`
--

INSERT INTO `tipo_de_monografia` (`Nome`) VALUES
('Jorge fumado'),
('Jornal'),
('madalena fumada');

-- --------------------------------------------------------

--
-- Estrutura da tabela `utente`
--

CREATE TABLE `utente` (
  `Numero` int(11) NOT NULL,
  `Nome` varchar(255) NOT NULL,
  `Telefone` int(11) NOT NULL,
  `Morada` varchar(255) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Tipo_Doc_Identificacao` char(4) NOT NULL,
  `Nr_Doc_Identificacao` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

--
-- Extraindo dados da tabela `utente`
--

INSERT INTO `utente` (`Numero`, `Nome`, `Telefone`, `Morada`, `Email`, `Tipo_Doc_Identificacao`, `Nr_Doc_Identificacao`) VALUES
(1, 'Madalena', 9387513, 'kjdhfds', 'kejdgwjns', '1299', 218741352),
(2, 'João Desmonteiro', 985632, 'Praceta das gomas', 'yau@gmail.com', 'CC', 985632),
(5, 'Diogo', 93147581, 'jsdhgb', 'skodjgn', '145', 1231235321),
(78326, 'Jorge', 98576132, 'JIEWUHG', 'MDOGNB2', 'cc', 12598751);

-- --------------------------------------------------------

--
-- Estrutura da tabela `utente_suspenso`
--

CREATE TABLE `utente_suspenso` (
  `Numero` int(11) NOT NULL,
  `Data_inicio` date NOT NULL,
  `Data_fim` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

--
-- Extraindo dados da tabela `utente_suspenso`
--

INSERT INTO `utente_suspenso` (`Numero`, `Data_inicio`, `Data_fim`) VALUES
(2, '2021-11-29', '2022-11-16');

-- --------------------------------------------------------

--
-- Estrutura para vista `media`
--
DROP TABLE IF EXISTS `media`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `media`  AS SELECT sum(`p`.`Data_de_aquisicao` - `p`.`Data_de_publicacao`) AS `DiferencaDias`, count(0) AS `NumPubs`, max(`p`.`Data_de_aquisicao` - `p`.`Data_de_publicacao`) AS `DiferencaDiasMax`, min(`p`.`Data_de_aquisicao` - `p`.`Data_de_publicacao`) AS `DiferencaDiasMin` FROM `publicacao` AS `p` WHERE `p`.`Data_de_publicacao` is not null AND `p`.`Data_de_aquisicao` is not null ;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `andar`
--
ALTER TABLE `andar`
  ADD PRIMARY KEY (`Numero`),
  ADD UNIQUE KEY `Numero` (`Numero`);

--
-- Índices para tabela `area_tematica`
--
ALTER TABLE `area_tematica`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Id` (`Id`),
  ADD UNIQUE KEY `AK_Nome_em_Area_superior` (`Nome`,`Area_Tematica_superior_Id`),
  ADD KEY `FK_Area_Tematica_noname_Area_Tematica` (`Area_Tematica_superior_Id`);

--
-- Índices para tabela `armario`
--
ALTER TABLE `armario`
  ADD PRIMARY KEY (`Andar_Numero`,`Letra`),
  ADD UNIQUE KEY `AK_Armario_Espaco_de_arrumacao` (`Espaco_de_arrumacao_Id`);

--
-- Índices para tabela `autor`
--
ALTER TABLE `autor`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `Nome` (`Nome`);

--
-- Índices para tabela `autoria_de_livro`
--
ALTER TABLE `autoria_de_livro`
  ADD PRIMARY KEY (`Autor_id_`,`Livro_Id_`),
  ADD KEY `FK_Livro_Autoria_de_Livro_Autor_` (`Livro_Id_`);

--
-- Índices para tabela `autoria_de_monografia`
--
ALTER TABLE `autoria_de_monografia`
  ADD PRIMARY KEY (`Autor_id_`,`Monografia_Id_`),
  ADD KEY `FK_Monografia_Autoria_de_Monografia_Autor_` (`Monografia_Id_`);

--
-- Índices para tabela `capitulo_ou_artigo`
--
ALTER TABLE `capitulo_ou_artigo`
  ADD PRIMARY KEY (`Publicacao_Id`,`Numero`),
  ADD UNIQUE KEY `Capitulo_ou_Artigo___Unique_Numero_em_Publicacao` (`Publicacao_Id`,`Numero`),
  ADD UNIQUE KEY `Capitulo_ou_Artigo___Unique_Nome_em_Publicacao` (`Publicacao_Id`,`Nome`);

--
-- Índices para tabela `documento_de_identificao`
--
ALTER TABLE `documento_de_identificao`
  ADD PRIMARY KEY (`Utente_numero`),
  ADD UNIQUE KEY `AK_Doc_Id___Nr_and_Tipo` (`Tipo`,`Numero`);

--
-- Índices para tabela `edicao_de_livro`
--
ALTER TABLE `edicao_de_livro`
  ADD PRIMARY KEY (`Livro_Id`,`Numero`),
  ADD UNIQUE KEY `Numero` (`Numero`),
  ADD UNIQUE KEY `ISBN` (`ISBN`),
  ADD KEY `FK_Edicao_de_Livro_Publicacao` (`Publicacao_Id`);

--
-- Índices para tabela `edicao_de_periodico`
--
ALTER TABLE `edicao_de_periodico`
  ADD PRIMARY KEY (`Periodico_Editora_ou_Periodico_Id`,`Numero`),
  ADD UNIQUE KEY `Numero` (`Numero`),
  ADD KEY `FK_Edicao_de_Periodico_Publicacao` (`Publicacao_Id`);

--
-- Índices para tabela `editora`
--
ALTER TABLE `editora`
  ADD PRIMARY KEY (`Nome`),
  ADD UNIQUE KEY `Editora_ou_Periodico_Id` (`Editora_ou_Periodico_Id`),
  ADD UNIQUE KEY `Nome` (`Nome`);

--
-- Índices para tabela `editora_ou_periodico`
--
ALTER TABLE `editora_ou_periodico`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Id` (`Id`);

--
-- Índices para tabela `emprestimo`
--
ALTER TABLE `emprestimo`
  ADD PRIMARY KEY (`Numero`),
  ADD UNIQUE KEY `Numero` (`Numero`),
  ADD KEY `FK_Emprestimo_noname_Exemplar` (`Publicacao_Id`,`Exemplar_Nr`),
  ADD KEY `FK_Emprestimo_noname_Utente` (`Utente_Numero`);

--
-- Índices para tabela `emprestimo_com_multa`
--
ALTER TABLE `emprestimo_com_multa`
  ADD PRIMARY KEY (`Numero`);

--
-- Índices para tabela `espaco_de_arrumacao`
--
ALTER TABLE `espaco_de_arrumacao`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FK_Espaco_de_arrumacao_noname_Area_Tematica` (`Area_Tematica_Id`);

--
-- Índices para tabela `estado_de_conservacao`
--
ALTER TABLE `estado_de_conservacao`
  ADD PRIMARY KEY (`Nome`),
  ADD UNIQUE KEY `Nome` (`Nome`);

--
-- Índices para tabela `exemplar`
--
ALTER TABLE `exemplar`
  ADD PRIMARY KEY (`Publicacao_Id`,`Nr`),
  ADD UNIQUE KEY `Codigo_de_barras` (`Codigo_de_barras`),
  ADD UNIQUE KEY `RFID` (`RFID`),
  ADD KEY `FK_Exemplar_noname_Estado_de_conservacao` (`Estado_de_conservacao_Nome`),
  ADD KEY `FK_Exemplar_noname_Prateleira` (`Localizacao_Andar_Numero`,`Localizacao_Armario_Letra`,`Localizacao_Prateleira_Numero`);

--
-- Índices para tabela `feed`
--
ALTER TABLE `feed`
  ADD PRIMARY KEY (`Endereco`),
  ADD UNIQUE KEY `Endereco` (`Endereco`),
  ADD KEY `FK_Feed_noname_Area_Tematica` (`Area_Tematica_Id`),
  ADD KEY `FK_Feed_noname_Editora_ou_Periodico` (`Editora_ou_Periodico_Id`),
  ADD KEY `FK_Feed_noname_Periodicidade` (`Periodicidade_Nome`);

--
-- Índices para tabela `lista_de_leitura`
--
ALTER TABLE `lista_de_leitura`
  ADD PRIMARY KEY (`Utente_Numero`,`Nome`);

--
-- Índices para tabela `livro`
--
ALTER TABLE `livro`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FK_Livro_noname_Editora` (`Editora_Nome`);

--
-- Índices para tabela `livro_em_lista_leitura`
--
ALTER TABLE `livro_em_lista_leitura`
  ADD PRIMARY KEY (`Edicao_de_Livro_Livro_Id_`,`Edicao_de_Livro_Numero_`,`Lista_de_leitura_Utente_Numero_`,`Lista_de_leitura_Nome_`),
  ADD KEY `FK_Lista_de_leitura_Livro_em_Lista_leitura_Edicao_de_Livro_` (`Lista_de_leitura_Utente_Numero_`,`Lista_de_leitura_Nome_`);

--
-- Índices para tabela `monografia`
--
ALTER TABLE `monografia`
  ADD PRIMARY KEY (`Publicacao_Id`),
  ADD KEY `FK_Monografia_noname_Tipo_de_monografia` (`Tipo_de_monografia_Nome`);

--
-- Índices para tabela `palavra_chave_descreve_publicacao`
--
ALTER TABLE `palavra_chave_descreve_publicacao`
  ADD PRIMARY KEY (`Palavra_chave_`,`Publicacao_Id_`),
  ADD KEY `FK_Publicacao_Palavra_chave_descreve_Publicacao_` (`Publicacao_Id_`);

--
-- Índices para tabela `palavra_chave_tag`
--
ALTER TABLE `palavra_chave_tag`
  ADD PRIMARY KEY (`Palavra`);

--
-- Índices para tabela `periodicidade`
--
ALTER TABLE `periodicidade`
  ADD PRIMARY KEY (`Nome`),
  ADD UNIQUE KEY `Nome` (`Nome`);

--
-- Índices para tabela `periodico`
--
ALTER TABLE `periodico`
  ADD PRIMARY KEY (`Editora_ou_Periodico_Id`),
  ADD UNIQUE KEY `ISSN` (`ISSN`),
  ADD UNIQUE KEY `Sigla` (`Sigla`),
  ADD UNIQUE KEY `Nome` (`Nome`),
  ADD KEY `FK_Periodico_noname_Editora` (`Editora_Nome`),
  ADD KEY `FK_Periodico_noname_Periodicidade` (`Periodicidade_Nome`);

--
-- Índices para tabela `prateleira`
--
ALTER TABLE `prateleira`
  ADD PRIMARY KEY (`Andar_Numero`,`Armario_Letra`,`Numero`),
  ADD UNIQUE KEY `AK_Prateleira_Espaco_de_arrumacao` (`Espaco_de_arrumacao_Id`);

--
-- Índices para tabela `publicacao`
--
ALTER TABLE `publicacao`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Nome` (`Nome`),
  ADD UNIQUE KEY `Nome_abreviado` (`Nome_abreviado`),
  ADD UNIQUE KEY `Codigo` (`Codigo`),
  ADD KEY `FK_Publicacao_Publicacao_em_Area_Area_Tematica` (`Area_Tematica_Id`);

--
-- Índices para tabela `publicacao_digital`
--
ALTER TABLE `publicacao_digital`
  ADD PRIMARY KEY (`Publicacao_Id`),
  ADD UNIQUE KEY `Publicacao_Id` (`Publicacao_Id`);

--
-- Índices para tabela `publicacao_fisica`
--
ALTER TABLE `publicacao_fisica`
  ADD PRIMARY KEY (`Publicacao_Id`),
  ADD UNIQUE KEY `Publicacao_Id` (`Publicacao_Id`);

--
-- Índices para tabela `reserva`
--
ALTER TABLE `reserva`
  ADD PRIMARY KEY (`Publicacao_Id_`,`Utente_Numero_`),
  ADD UNIQUE KEY `Data_e_Hora` (`Data_e_Hora`),
  ADD KEY `FK_Reserva_noname_Exemplar` (`Exemplar_escolhido_Publicacao_Id`,`Exemplar_Nr`),
  ADD KEY `FK_Utente_Reserva_Publicacao_fisica_` (`Utente_Numero_`);

--
-- Índices para tabela `revista`
--
ALTER TABLE `revista`
  ADD PRIMARY KEY (`Periodico_Editora_ou_Periodico_Id`);

--
-- Índices para tabela `tipo_de_monografia`
--
ALTER TABLE `tipo_de_monografia`
  ADD PRIMARY KEY (`Nome`),
  ADD UNIQUE KEY `Nome` (`Nome`);

--
-- Índices para tabela `utente`
--
ALTER TABLE `utente`
  ADD PRIMARY KEY (`Numero`),
  ADD UNIQUE KEY `Numero` (`Numero`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD UNIQUE KEY `AK_Nr_doc_id_and_Tipo_doc_id` (`Tipo_Doc_Identificacao`,`Nr_Doc_Identificacao`);

--
-- Índices para tabela `utente_suspenso`
--
ALTER TABLE `utente_suspenso`
  ADD PRIMARY KEY (`Numero`);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `area_tematica`
--
ALTER TABLE `area_tematica`
  ADD CONSTRAINT `FK_Area_Tematica_noname_Area_Tematica` FOREIGN KEY (`Area_Tematica_superior_Id`) REFERENCES `area_tematica` (`Id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Limitadores para a tabela `armario`
--
ALTER TABLE `armario`
  ADD CONSTRAINT `FK_Armario_Espaco_de_arrumacao` FOREIGN KEY (`Espaco_de_arrumacao_Id`) REFERENCES `espaco_de_arrumacao` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Armario_noname_Andar` FOREIGN KEY (`Andar_Numero`) REFERENCES `andar` (`Numero`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `autoria_de_livro`
--
ALTER TABLE `autoria_de_livro`
  ADD CONSTRAINT `FK_Autor_Autoria_de_Livro_Livro_` FOREIGN KEY (`Autor_id_`) REFERENCES `autor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Livro_Autoria_de_Livro_Autor_` FOREIGN KEY (`Livro_Id_`) REFERENCES `livro` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `autoria_de_monografia`
--
ALTER TABLE `autoria_de_monografia`
  ADD CONSTRAINT `FK_Autor_Autoria_de_Monografia_Monografia_` FOREIGN KEY (`Autor_id_`) REFERENCES `autor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Monografia_Autoria_de_Monografia_Autor_` FOREIGN KEY (`Monografia_Id_`) REFERENCES `monografia` (`Publicacao_Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `capitulo_ou_artigo`
--
ALTER TABLE `capitulo_ou_artigo`
  ADD CONSTRAINT `FK_Capitulo_ou_Artigo_noname_Publicacao` FOREIGN KEY (`Publicacao_Id`) REFERENCES `publicacao` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `edicao_de_livro`
--
ALTER TABLE `edicao_de_livro`
  ADD CONSTRAINT `FK_Edicao_de_Livro_Publicacao` FOREIGN KEY (`Publicacao_Id`) REFERENCES `publicacao` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Edicao_de_Livro_noname_Livro` FOREIGN KEY (`Livro_Id`) REFERENCES `livro` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `edicao_de_periodico`
--
ALTER TABLE `edicao_de_periodico`
  ADD CONSTRAINT `FK_Edicao_de_Periodico_Publicacao` FOREIGN KEY (`Publicacao_Id`) REFERENCES `publicacao` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Edicao_de_Periodico_noname_Periodico` FOREIGN KEY (`Periodico_Editora_ou_Periodico_Id`) REFERENCES `periodico` (`Editora_ou_Periodico_Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `editora`
--
ALTER TABLE `editora`
  ADD CONSTRAINT `FK_Editora_Editora_ou_Periodico` FOREIGN KEY (`Editora_ou_Periodico_Id`) REFERENCES `editora_ou_periodico` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `emprestimo`
--
ALTER TABLE `emprestimo`
  ADD CONSTRAINT `FK_Emprestimo_noname_Exemplar` FOREIGN KEY (`Publicacao_Id`,`Exemplar_Nr`) REFERENCES `exemplar` (`Publicacao_Id`, `Nr`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Emprestimo_noname_Utente` FOREIGN KEY (`Utente_Numero`) REFERENCES `utente` (`Numero`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `emprestimo_com_multa`
--
ALTER TABLE `emprestimo_com_multa`
  ADD CONSTRAINT `FK_Emprestimo_com_multa_Emprestimo` FOREIGN KEY (`Numero`) REFERENCES `emprestimo` (`Numero`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `espaco_de_arrumacao`
--
ALTER TABLE `espaco_de_arrumacao`
  ADD CONSTRAINT `FK_Espaco_de_arrumacao_noname_Area_Tematica` FOREIGN KEY (`Area_Tematica_Id`) REFERENCES `area_tematica` (`Id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Limitadores para a tabela `exemplar`
--
ALTER TABLE `exemplar`
  ADD CONSTRAINT `FK_Exemplar_noname_Estado_de_conservacao` FOREIGN KEY (`Estado_de_conservacao_Nome`) REFERENCES `estado_de_conservacao` (`Nome`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Exemplar_noname_Prateleira` FOREIGN KEY (`Localizacao_Andar_Numero`,`Localizacao_Armario_Letra`,`Localizacao_Prateleira_Numero`) REFERENCES `prateleira` (`Andar_Numero`, `Armario_Letra`, `Numero`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Exemplar_noname_Publicacao_fisica` FOREIGN KEY (`Publicacao_Id`) REFERENCES `publicacao_fisica` (`Publicacao_Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `feed`
--
ALTER TABLE `feed`
  ADD CONSTRAINT `FK_Feed_noname_Area_Tematica` FOREIGN KEY (`Area_Tematica_Id`) REFERENCES `area_tematica` (`Id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Feed_noname_Editora_ou_Periodico` FOREIGN KEY (`Editora_ou_Periodico_Id`) REFERENCES `editora_ou_periodico` (`Id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Feed_noname_Periodicidade` FOREIGN KEY (`Periodicidade_Nome`) REFERENCES `periodicidade` (`Nome`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Limitadores para a tabela `lista_de_leitura`
--
ALTER TABLE `lista_de_leitura`
  ADD CONSTRAINT `FK_Lista_de_leitura_noname_Utente` FOREIGN KEY (`Utente_Numero`) REFERENCES `utente` (`Numero`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `livro`
--
ALTER TABLE `livro`
  ADD CONSTRAINT `FK_Livro_noname_Editora` FOREIGN KEY (`Editora_Nome`) REFERENCES `editora` (`Nome`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `livro_em_lista_leitura`
--
ALTER TABLE `livro_em_lista_leitura`
  ADD CONSTRAINT `FK_Edicao_de_Livro_Livro_em_Lista_leitura_Lista_de_leitura_` FOREIGN KEY (`Edicao_de_Livro_Livro_Id_`,`Edicao_de_Livro_Numero_`) REFERENCES `edicao_de_livro` (`Livro_Id`, `Numero`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Lista_de_leitura_Livro_em_Lista_leitura_Edicao_de_Livro_` FOREIGN KEY (`Lista_de_leitura_Utente_Numero_`,`Lista_de_leitura_Nome_`) REFERENCES `lista_de_leitura` (`Utente_Numero`, `Nome`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `monografia`
--
ALTER TABLE `monografia`
  ADD CONSTRAINT `FK_Monografia_Publicacao` FOREIGN KEY (`Publicacao_Id`) REFERENCES `publicacao` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Monografia_noname_Tipo_de_monografia` FOREIGN KEY (`Tipo_de_monografia_Nome`) REFERENCES `tipo_de_monografia` (`Nome`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `palavra_chave_descreve_publicacao`
--
ALTER TABLE `palavra_chave_descreve_publicacao`
  ADD CONSTRAINT `FK_Palavra_chave_tag_Palavra_chave_descreve_Publicacao_` FOREIGN KEY (`Palavra_chave_`) REFERENCES `palavra_chave_tag` (`Palavra`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Publicacao_Palavra_chave_descreve_Publicacao_` FOREIGN KEY (`Publicacao_Id_`) REFERENCES `publicacao` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `periodico`
--
ALTER TABLE `periodico`
  ADD CONSTRAINT `FK_Periodico_Editora_ou_Periodico` FOREIGN KEY (`Editora_ou_Periodico_Id`) REFERENCES `editora_ou_periodico` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Periodico_noname_Editora` FOREIGN KEY (`Editora_Nome`) REFERENCES `editora` (`Nome`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Periodico_noname_Periodicidade` FOREIGN KEY (`Periodicidade_Nome`) REFERENCES `periodicidade` (`Nome`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `prateleira`
--
ALTER TABLE `prateleira`
  ADD CONSTRAINT `FK_Prateleira_Espaco_de_arrumacao` FOREIGN KEY (`Espaco_de_arrumacao_Id`) REFERENCES `espaco_de_arrumacao` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Prateleira_noname_Armario` FOREIGN KEY (`Andar_Numero`,`Armario_Letra`) REFERENCES `armario` (`Andar_Numero`, `Letra`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `publicacao`
--
ALTER TABLE `publicacao`
  ADD CONSTRAINT `FK_Publicacao_Publicacao_em_Area_Area_Tematica` FOREIGN KEY (`Area_Tematica_Id`) REFERENCES `area_tematica` (`Id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Limitadores para a tabela `publicacao_digital`
--
ALTER TABLE `publicacao_digital`
  ADD CONSTRAINT `FK_Publicacao_digital_Publicacao` FOREIGN KEY (`Publicacao_Id`) REFERENCES `publicacao` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `publicacao_fisica`
--
ALTER TABLE `publicacao_fisica`
  ADD CONSTRAINT `FK_Publicacao_fisica_Publicacao` FOREIGN KEY (`Publicacao_Id`) REFERENCES `publicacao` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `reserva`
--
ALTER TABLE `reserva`
  ADD CONSTRAINT `FK_Publicacao_fisica_Reserva_Utente_` FOREIGN KEY (`Publicacao_Id_`) REFERENCES `publicacao_fisica` (`Publicacao_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Reserva_noname_Exemplar` FOREIGN KEY (`Exemplar_escolhido_Publicacao_Id`,`Exemplar_Nr`) REFERENCES `exemplar` (`Publicacao_Id`, `Nr`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Utente_Reserva_Publicacao_fisica_` FOREIGN KEY (`Utente_Numero_`) REFERENCES `utente` (`Numero`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `revista`
--
ALTER TABLE `revista`
  ADD CONSTRAINT `FK_Revista_Periodico` FOREIGN KEY (`Periodico_Editora_ou_Periodico_Id`) REFERENCES `periodico` (`Editora_ou_Periodico_Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `utente_suspenso`
--
ALTER TABLE `utente_suspenso`
  ADD CONSTRAINT `FK_Utente_Suspenso_Utente` FOREIGN KEY (`Numero`) REFERENCES `utente` (`Numero`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
