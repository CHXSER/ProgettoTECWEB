-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Creato il: Nov 29, 2023 alle 23:25
-- Versione del server: 8.2.0
-- Versione PHP: 8.2.8

--
-- Database: `ciao`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `disegni`
--
ALTER TABLE IF EXISTS `disegni`
  DROP PRIMARY KEY;
DROP TABLE IF EXISTS `disegni`;
CREATE TABLE `disegni` (
  `nome` varchar(40) NOT NULL,
  `disegno` varchar(40),
  `descrizione` text,
  `autore` varchar(40),
  PRIMARY KEY(nome)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `disegni`
--

INSERT INTO `disegni` (`nome`, `disegno`, `descrizione`, `autore`) VALUES
('felice distorto', '..\images\immagini\1.png', 'felice distorto', 'bilal'),
('sorriso con gli occhiali', '..\images\immagini\2.png', 'sorriso con gli occhiali', 'bilal'),
('non soddisfatto', '..\images\immagini\3.png', 'non soddisfatto', 'osama'),
('wow', '..\images\immagini\4.png', 'wow', 'rupi'),
('non impressionato', '..\images\immagini\5.png', 'non impressionato', 'bilal'),
('una roccia', '..\images\immagini\6.png', 'una roccia', 'osama'),
('sguardo fisso', '..\images\immagini\7.png', 'sguardo fisso', 'rupi'),
('cane', '..\images\immagini\8.png', 'cane', 'bilal'),
('sorriso inquietante', '..\images\immagini\9.png', 'sorriso inquietante', 'osama'),
('sguardo accattivante', '..\images\immagini\10.png', 'sguardo accattivante', 'rupi');

-- --------------------------------------------------------

--
-- Struttura della tabella `metodopagamento`
--
ALTER TABLE IF EXISTS `metodopagamento`
  DROP PRIMARY KEY;
ALTER TABLE IF EXISTS `metodopagamento`
  DROP FOREIGN KEY FK_DisegniMetodoPagamento;
DROP TABLE IF EXISTS `metodopagamento`;
CREATE TABLE `metodopagamento` (
  `id` int AUTO_INCREMENT NOT NULL,
  `metodopagamento` varchar(30),
  `nomedisegno` varchar(30),
  `nomeordinante` varchar(40),
  `nomebeneficiario` varchar(40),
  `causale` text,
  `iban` varchar(30),
  `numerocarta` varchar(16),
  `datascadenza` date,
  `cvc` varchar(3),
  PRIMARY KEY(id),
  CONSTRAINT FK_DisegniMetodoPagamento FOREIGN KEY (nomedisegno) REFERENCES disegni(nome) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `metodopagamento`
--

INSERT INTO `metodopagamento` (`id`, `metodopagamento`, `nomedisegno`, `nomeordinante`, `nomebeneficiario`, `causale`, `iban`, `numerocarta`, `datascadenza`, `cvc`) VALUES
(1, 'bonifico', 'felice distorto', 'Marco', 'Francesco', 'disegno molto bello', '602055086243080061197717896', NULL, NULL, NULL),
(2, 'bonifico', 'sorriso con gli occhiali', 'Luca', 'Chiara', 'disegno molto bello', '443452499420729341725556817', NULL, NULL, NULL),
(3, 'bonifico', 'non soddisfatto', 'Stefano', 'Sofia', 'disegno molto bello', '824973621874492601795221598', NULL, NULL, NULL),
(4, 'bonifico', 'wow', 'Giovanni', 'Giorgia', 'disegno molto bello', '077216626817659395352971672', NULL, NULL, NULL),
(5, 'bonifico', 'non impressionato', 'Laura', 'Elena', 'disegno molto bello', '836506052144180062211296010', NULL, NULL, NULL),
(6, 'carta', 'una roccia', 'Paolo', 'Martina', NULL, NULL, '0967356306490846', '2023-04-15', '117'),
(7, 'carta', 'sguardo fisso', 'Davide', 'Luca', NULL, NULL, '5796213327187679', '2023-08-02', '039'),
(8, 'carta', 'cane', 'Francesco', 'Marco', NULL, NULL, '6089308417790668', '2023-11-22', '016'),
(9, 'carta', 'sorriso inquietante', 'Mauro', 'Alessandro', NULL, NULL, '8213238592311246', '2024-03-10', '646'),
(10, 'carta', 'sguardo accattivante', 'Franco', 'Massimiliano', NULL, NULL, '3058022108081899', '2024-06-28', '601');

-- --------------------------------------------------------

--
-- Struttura della tabella `utente`
--
ALTER TABLE IF EXISTS `utente`
  DROP PRIMARY KEY;
ALTER TABLE IF EXISTS `utente`
  DROP FOREIGN KEY FK_MetodoPagamentoUtente;
DROP TABLE IF EXISTS `utente`;
CREATE TABLE `utente` (
  `id` int AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `nome` varchar(30),
  `cognome` varchar(30),
  `PASSWORD` varchar(20),
  `email` varchar(30),
  PRIMARY KEY(username),
  CONSTRAINT FK_MetodoPagamentoUtente FOREIGN KEY (id) REFERENCES metodopagamento(id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `utente`
--

INSERT INTO `utente` (`id`, `username`, `nome`, `cognome`, `PASSWORD`, `email`) VALUES
(1, 'BlueSkyWalker', 'Marco', 'Rossi', 'ETZYvza5BMiYwX4', 'BlueSkyWalker@gmail.com'),
(6, 'CipherNomad', 'Paolo', 'De Luca', 'STsabw9BbUijrbo', 'CipherNomad@gmail.com'),
(10, 'EchoRhythm', 'Franco', 'Russo', 'eXS94ByU5Sl5vrW', 'EchoRhythm@gmail.com'),
(4, 'LunaHarmony', 'Giovanni', 'Moretti', 't8CIvU4DxT0iXZU', 'LunaHarmony@gmail.com'),
(7, 'MidnightSerenade', 'Davide', 'Santoro', 'Pt5xVlwEYOCHvL2', 'MidnightSerenade@gmail.com'),
(5, 'NebulaDreamer', 'Laura', 'Marini', 't1aCKMhZyovJJdW', 'NebulaDreamer@gmail.com'),
(3, 'PixelPioneer', 'Stefano', 'Bianchi', '96YvHmFBwxV7vqb', 'PixelPioneer@gmail.com'),
(2, 'QuantumJazz', 'Luca', 'Conti', 'Dd6lb4f38xVuEBX', 'QuantumJazz@gmail.com'),
(8, 'SolarFlareQuest', 'Francesco', 'Lombardi', 'BkkM3h58wrpfZ2Y', 'SolarFlareQuest@gmail.com'),
(9, 'ZenithWhisperer', 'Mauro', 'Ferrara', 'lEko1RWez1sno6U', 'ZenithWhisperer@gmail.com');
