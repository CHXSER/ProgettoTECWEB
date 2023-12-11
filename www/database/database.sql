-- Delete delle tabelle se esistono
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `utente`;
DROP TABLE IF EXISTS `admin`;
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
  `prezzo` int,
  PRIMARY KEY(nome)
);

--
-- Dump dei dati per la tabella `disegni`
--
INSERT INTO `disegni` (`nome`, `disegno`, `descrizione`, `autore`,`prezzo`) VALUES
('Felice Distorto', '1.png', 'felice distorto', 'Bilal El Moutaren',14),
('Sorriso Con Gli Occhiali', '2.png', 'sorriso con gli occhiali', 'Bilal El Moutaren',13),
('Non Soddisfatto', '3.png', 'non soddisfatto', 'Osama Chelhaoui',28),
('WOW', '4.png', 'wow', 'Ricardo Anton Rupi',25),
('Non Impressionato', '5.png', 'non impressionato', 'Bilal El Moutaren',22),
('Una Roccia', '6.png', 'una roccia', 'Osama Chelhaoui',19),
('Sguardo Fisso', '7.png', 'sguardo fisso', 'Ricardo Anton Rupi',23),
('Cane', '8.png', 'cane', 'Bilal El Moutaren',20),
('Sorriso Inquietante', '9.png', 'sorriso inquietante', 'Osama Chelhaoui',24),
('Sguardo Accattivante', '10.png', 'sguardo accattivante', 'Ricardo Anton Rupi',12);


--
-- Struttura della tabella `utente`
--
CREATE TABLE `utente`(
  `username` varchar(30) NOT NULL,
  `password` varchar(20),
  `email` varchar(30),
  PRIMARY KEY(username)
);

--
-- Dump dei dati per la tabella `utente`
--
INSERT INTO `utente` (`username`, `password`, `email`) VALUES
('BlueSkyWalker', 'ETZYvza5BMiYwX4', 'BlueSkyWalker@gmail.com'),
('CipherNomad', 'STsabw9BbUijrbo', 'CipherNomad@gmail.com'),
('EchoRhythm', 'eXS94ByU5Sl5vrW', 'EchoRhythm@gmail.com'),
('LunaHarmony', 't8CIvU4DxT0iXZU', 'LunaHarmony@gmail.com'),
('MidnightSerenade', 'Pt5xVlwEYOCHvL2', 'MidnightSerenade@gmail.com'),
('NebulaDreamer', 't1aCKMhZyovJJdW', 'NebulaDreamer@gmail.com'),
('PixelPioneer', '96YvHmFBwxV7vqb', 'PixelPioneer@gmail.com'),
('QuantumJazz', 'Dd6lb4f38xVuEBX', 'QuantumJazz@gmail.com'),
('SolarFlareQuest', 'BkkM3h58wrpfZ2Y', 'SolarFlareQuest@gmail.com'),
('ZenithWhisperer', 'lEko1RWez1sno6U', 'ZenithWhisperer@gmail.com');

--
-- Struttura della tabella `admin`
CREATE TABLE `admin` (
  `username` varchar(30) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY(username)
);

--
-- Dump dei dati per la tabella `admin`
--
INSERT INTO `admin` (`username`, `password`) VALUES
('admin', 'password'),
('CHXSER', 'password'),
('oslaman', 'password'),
('gogetashenron', 'password');

CREATE TABLE `acquisti` (
  `IDAcquisto` int AUTO_INCREMENT,
  `username` varchar(30),
  `disegno` varchar(40),
  `dataAcquisto`date,
  `quantita` int,
  PRIMARY KEY(IDAcquisto),
  FOREIGN KEY(username) REFERENCES utente(username) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY(disegno) REFERENCES disegni(nome) ON DELETE CASCADE ON UPDATE CASCADE
);


INSERT INTO acquisti (username, disegno, dataAcquisto, quantita) VALUES
  ('BlueSkyWalker', 'felice distorto', '2023-05-15', 1),
  ('QuantumJazz', 'sorriso con gli occhiali', '2023-06-20', 2),
  ('PixelPioneer', 'non soddisfatto', '2023-07-10', 3),
  ('LunaHarmony', 'wow', '2023-08-05', 1),
  ('NebulaDreamer', 'non impressionato', '2023-09-12', 1),
  ('CipherNomad', 'una roccia', '2023-10-25', 2),
  ('MidnightSerenade', 'sguardo fisso', '2023-11-30', 3),
  ('SolarFlareQuest', 'cane', '2023-12-15', 1),
  ('ZenithWhisperer', 'sorriso inquietante', '2024-01-02', 1),
  ('EchoRhythm', 'sguardo accattivante', '2024-02-18', 1),
  ('BlueSkyWalker', 'sguardo accattivante', '2024-03-15', 1),
  ('QuantumJazz', 'non soddisfatto', '2024-04-02', 1),
  ('PixelPioneer', 'wow', '2024-05-10', 1),
  ('LunaHarmony', 'felice distorto', '2024-06-18', 1),
  ('MidnightSerenade', 'sguardo accattivante', '2024-07-25', 1);
