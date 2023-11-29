-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Creato il: Nov 29, 2023 alle 23:25
-- Versione del server: 8.2.0
-- Versione PHP: 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ciao`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `disegni`
--

CREATE TABLE `disegni` (
  `nome` varchar(40) NOT NULL,
  `disegno` longblob,
  `descrizione` text,
  `autore` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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

CREATE TABLE `metodopagamento` (
  `id` int NOT NULL,
  `metodopagamento` varchar(30) DEFAULT NULL,
  `nomedisegno` varchar(30) DEFAULT NULL,
  `nomeordinante` varchar(40) DEFAULT NULL,
  `nomebeneficiario` varchar(40) DEFAULT NULL,
  `causale` text,
  `iban` varchar(30) DEFAULT NULL,
  `numerocarta` varchar(16) DEFAULT NULL,
  `datascadenza` date DEFAULT NULL,
  `cvc` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dump dei dati per la tabella `metodopagamento`
--

INSERT INTO `metodopagamento` (`id`, `metodopagamento`, `nomedisegno`, `nomeordinante`, `nomebeneficiario`, `causale`, `iban`, `numerocarta`, `datascadenza`, `cvc`) VALUES
(1, 'bonifico', '1', 'Marco', 'Francesco', 'disegno molto bello', '602055086243080061197717896', NULL, NULL, NULL),
(2, 'bonifico', '2', 'Luca', 'Chiara', 'disegno molto bello', '443452499420729341725556817', NULL, NULL, NULL),
(3, 'bonifico', '3', 'Stefano', 'Sofia', 'disegno molto bello', '824973621874492601795221598', NULL, NULL, NULL),
(4, 'bonifico', '4', 'Giovanni', 'Giorgia', 'disegno molto bello', '077216626817659395352971672', NULL, NULL, NULL),
(5, 'bonifico', '5', 'Laura', 'Elena', 'disegno molto bello', '836506052144180062211296010', NULL, NULL, NULL),
(6, 'carta', '6', 'Paolo', 'Martina', NULL, NULL, '0967356306490846', '2023-04-15', '117'),
(7, 'carta', '7', 'Davide', 'Luca', NULL, NULL, '5796213327187679', '2023-08-02', '039'),
(8, 'carta', '8', 'Francesco', 'Marco', NULL, NULL, '6089308417790668', '2023-11-22', '016'),
(9, 'carta', '9', 'Mauro', 'Alessandro', NULL, NULL, '8213238592311246', '2024-03-10', '646'),
(10, 'carta', '10', 'Franco', 'Massimiliano', NULL, NULL, '3058022108081899', '2024-06-28', '601');

-- --------------------------------------------------------

--
-- Struttura della tabella `utente`
--

CREATE TABLE `utente` (
  `id` int NOT NULL,
  `username` varchar(30) NOT NULL,
  `nome` varchar(30) DEFAULT NULL,
  `cognome` varchar(30) DEFAULT NULL,
  `PASSWORD` varchar(20) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `disegni`
--
ALTER TABLE `disegni`
  ADD PRIMARY KEY (`nome`);

--
-- Indici per le tabelle `metodopagamento`
--
ALTER TABLE `metodopagamento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `metodopagamento_nomedisegno_fkey` (`nomedisegno`);

--
-- Indici per le tabelle `utente`
--
ALTER TABLE `utente`
  ADD PRIMARY KEY (`username`),
  ADD KEY `utente_id_fkey` (`id`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `metodopagamento`
--
ALTER TABLE `metodopagamento`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT per la tabella `utente`
--
ALTER TABLE `utente`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `metodopagamento`
--
ALTER TABLE `metodopagamento`
  ADD CONSTRAINT `metodopagamento_nomedisegno_fkey` FOREIGN KEY (`nomedisegno`) REFERENCES `disegni` (`nome`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `utente`
--
ALTER TABLE `utente`
  ADD CONSTRAINT `utente_id_fkey` FOREIGN KEY (`id`) REFERENCES `metodopagamento` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
