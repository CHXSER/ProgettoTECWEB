-- Delete delle tabelle se esistono
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `utente`;
DROP TABLE IF EXISTS `disegni`;
DROP TABLE IF EXISTS `metodopagamento`;
SET FOREIGN_KEY_CHECKS = 1;

--
-- Struttura della tabella `disegni`
--
CREATE TABLE `disegni` (
  `nome` varchar(40) NOT NULL,
  `disegno` varchar(40),
  `descrizione` text,
  `autore` varchar(40),
  PRIMARY KEY(nome)
);

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

--
-- Struttura della tabella `metodopagamento`
--
CREATE TABLE `metodopagamento` (
  `id` int AUTO_INCREMENT PRIMARY KEY NOT NULL,
  `metodopagamento` varchar(30),
  `nomedisegno` varchar(30),
  `nomeordinante` varchar(40),
  `nomebeneficiario` varchar(40),
  `numerocarta` varchar(16),
  `datascadenza` date,
  `cvc` varchar(3),
  FOREIGN KEY (nomedisegno) REFERENCES disegni(nome) ON DELETE CASCADE ON UPDATE CASCADE
);

--
-- Dump dei dati per la tabella `metodopagamento`
--
INSERT INTO `metodopagamento` (`metodopagamento`, `nomedisegno`, `nomeordinante`, `nomebeneficiario`, `numerocarta`, `datascadenza`, `cvc`) VALUES
('carta', 'felice distorto', 'Marco', 'Francesco', '1513766270350508', '2025-05-12', '438'),
('carta', 'sorriso con gli occhiali', 'Luca', 'Chiara', '6029916024957293', '2025-09-03', '264'),
('carta', 'non soddisfatto', 'Stefano', 'Sofia', '8995918624320528', '2025-11-21', '427'),
('carta', 'wow', 'Giovanni', 'Giorgia', '9350791418136922', '2026-03-07', '527'),
('carta', 'non impressionato', 'Laura', 'Elena', '0954444877704974', '2026-07-18', '665'),
('carta', 'una roccia', 'Paolo', 'Martina', '0967356306490846', '2023-04-15', '117'),
('carta', 'sguardo fisso', 'Davide', 'Luca', '5796213327187679', '2023-08-02', '039'),
('carta', 'cane', 'Francesco', 'Marco', '6089308417790668', '2023-11-22', '016'),
('carta', 'sorriso inquietante', 'Mauro', 'Alessandro', '8213238592311246', '2024-03-10', '646'),
('carta', 'sguardo accattivante', 'Franco', 'Massimiliano', '3058022108081899', '2024-06-28', '601');

--
-- Struttura della tabella `utente`
--
CREATE TABLE `utente` (
  `id` int AUTO_INCREMENT PRIMARY KEY NOT NULL,
  `username` varchar(30) NOT NULL,
  `nome` varchar(30),
  `cognome` varchar(30),
  `password` varchar(20),
  `email` varchar(30),
  FOREIGN KEY (id) REFERENCES metodopagamento(id) ON DELETE CASCADE ON UPDATE CASCADE
);

--
-- Dump dei dati per la tabella `utente`
--
INSERT INTO `utente` (`username`, `nome`, `cognome`, `password`, `email`) VALUES
('BlueSkyWalker', 'Marco', 'Rossi', 'ETZYvza5BMiYwX4', 'BlueSkyWalker@gmail.com'),
('CipherNomad', 'Paolo', 'De Luca', 'STsabw9BbUijrbo', 'CipherNomad@gmail.com'),
('EchoRhythm', 'Franco', 'Russo', 'eXS94ByU5Sl5vrW', 'EchoRhythm@gmail.com'),
('LunaHarmony', 'Giovanni', 'Moretti', 't8CIvU4DxT0iXZU', 'LunaHarmony@gmail.com'),
('MidnightSerenade', 'Davide', 'Santoro', 'Pt5xVlwEYOCHvL2', 'MidnightSerenade@gmail.com'),
('NebulaDreamer', 'Laura', 'Marini', 't1aCKMhZyovJJdW', 'NebulaDreamer@gmail.com'),
('PixelPioneer', 'Stefano', 'Bianchi', '96YvHmFBwxV7vqb', 'PixelPioneer@gmail.com'),
('QuantumJazz', 'Luca', 'Conti', 'Dd6lb4f38xVuEBX', 'QuantumJazz@gmail.com'),
('SolarFlareQuest', 'Francesco', 'Lombardi', 'BkkM3h58wrpfZ2Y', 'SolarFlareQuest@gmail.com'),
('ZenithWhisperer', 'Mauro', 'Ferrara', 'lEko1RWez1sno6U', 'ZenithWhisperer@gmail.com');
