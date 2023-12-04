-- Delete delle tabelle se esistono
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `utente`;
DROP TABLE IF EXISTS `disegni`;
DROP TABLE IF EXISTS `carta`;
DROP TABLE IF EXISTS `acquisti`;
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
('felice distorto', '1.png', 'felice distorto', 'bilal'),
('sorriso con gli occhiali', '2.png', 'sorriso con gli occhiali', 'bilal'),
('non soddisfatto', '3.png', 'non soddisfatto', 'osama'),
('wow', '4.png', 'wow', 'rupi'),
('non impressionato', '5.png', 'non impressionato', 'bilal'),
('una roccia', '6.png', 'una roccia', 'osama'),
('sguardo fisso', '7.png', 'sguardo fisso', 'rupi'),
('cane', '8.png', 'cane', 'bilal'),
('sorriso inquietante', '9.png', 'sorriso inquietante', 'osama'),
('sguardo accattivante', '10.png', 'sguardo accattivante', 'rupi');


--
-- Struttura della tabella `utente`
--
CREATE TABLE `utente`(
  `username` varchar(30) NOT NULL,
  `nome` varchar(30),
  `cognome` varchar(30),
  `password` varchar(20),
  `email` varchar(30),
  PRIMARY KEY(username)
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

--
-- Struttura della tabella `carta`
--
CREATE TABLE `carta` (
  `username` varchar(30),
  `numerocarta` varchar(16),
  `datascadenza` date,
  `cvc` varchar(3),
  PRIMARY KEY(numerocarta),
  FOREIGN KEY (username) REFERENCES utente(username) ON DELETE CASCADE ON UPDATE CASCADE
);

--
-- Dump dei dati per la tabella `carta`
--
INSERT INTO `carta` (`username`,`numerocarta`, `datascadenza`, `cvc`) VALUES
('BlueSkyWalker', '1513766270350508', '2025-05-12', '438'),
('QuantumJazz', '6029916024957293', '2025-09-03', '264'),
('PixelPioneer', '8995918624320528', '2025-11-21', '427'),
('LunaHarmony', '9350791418136922', '2026-03-07', '527'),
('NebulaDreamer', '0954444877704974', '2026-07-18', '665'),
('CipherNomad', '0967356306490846', '2023-04-15', '117'),
('MidnightSerenade', '5796213327187679', '2023-08-02', '039'),
('SolarFlareQuest', '6089308417790668', '2023-11-22', '016'),
('ZenithWhisperer', '8213238592311246', '2024-03-10', '646'),
('EchoRhythm', '3058022108081899', '2024-06-28', '601');

CREATE TABLE `acquisti` (
  `IDAcquisto` int AUTO_INCREMENT,
  `username` varchar(30),
  `disegno` varchar(40),
  `dataAcquisto`date,
  `prezzo` int,
  PRIMARY KEY(IDAcquisto),
  FOREIGN KEY(username) REFERENCES utente(username) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY(disegno) REFERENCES disegni(nome) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO acquisti (username, disegno, dataAcquisto, prezzo) VALUES
  ('BlueSkyWalker', 'felice distorto', '2023-05-15', 20),
  ('QuantumJazz', 'sorriso con gli occhiali', '2023-06-20', 15),
  ('PixelPioneer', 'non soddisfatto', '2023-07-10', 30),
  ('LunaHarmony', 'wow', '2023-08-05', 25),
  ('NebulaDreamer', 'non impressionato', '2023-09-12', 18),
  ('CipherNomad', 'una roccia', '2023-10-25', 12),
  ('MidnightSerenade', 'sguardo fisso', '2023-11-30', 22),
  ('SolarFlareQuest', 'cane', '2023-12-15', 35),
  ('ZenithWhisperer', 'sorriso inquietante', '2024-01-02', 28),
  ('EchoRhythm', 'sguardo accattivante', '2024-02-18', 19),
  ('BlueSkyWalker', 'sguardo accattivante', '2024-03-15', 25),
  ('QuantumJazz', 'non soddisfatto', '2024-04-02', 30),
  ('PixelPioneer', 'wow', '2024-05-10', 22),
  ('LunaHarmony', 'felice distorto', '2024-06-18', 18),
  ('MidnightSerenade', 'sguardo accattivante', '2024-07-25', 35);
