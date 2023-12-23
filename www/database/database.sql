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
('felice distorto', '1.png', "Il quadro rappresenta una figura il cui volto esprime una gioia così intensa da distorcerne le fattezze, il dipinto enfatizza l'essenza della felicità della persona, rendendo il suo stato d'animo il fulcro della composizione. L'energia positiva si irradia dalla figura, creando un'immagine intensa di gioia senza confini.", 'Bilal El Moutaren',14),
('non soddisfatto', '2.png', "Il quadro ritrae una figura con un'espressione di insoddisfazione evidente. Il volto presenta linee di frustrazione incise. Gli occhi riflettono una mancanza di soddisfazione, forse con un'ombra di tristezza o delusione. Nel complesso, il dipinto cattura il senso palpabile di insoddisfazione, trasmettendo un'emozione intensa di disagio e mancanza di realizzazione.", 'Bilal El Moutaren',13),
('wow', '3.png', "Il quadro ritrae una persona al centro della scena, colta nell'atto della sorpresa. Nel quadro, viene catturato il momento preciso della sorpresa, con un'attenzione particolare ai dettagli che sottolineano la magia e l'incanto dell'istante.", 'Osama Chelhaoui',28),
('non impressionato', '4.png', "Il quadro raffigura una figura in uno stato di totale nonchalance e disinteresse. La persona è dipinta con uno sguardo impassibile, privo di emozioni evidenti. Il volto è serio, senza traccia di sorriso o espressione coinvolta. Gli occhi riflettono un distacco totale, mentre il corpo conserva una postura rilassata e poco coinvolta.", 'Ricardo Anton Rupi',25),
('la roccia', '5.png', "Il quadro raffigura una persona solida come una roccia, con dettagli che catturano la texture e la robustezza dell'elemento geologico. La posa della figura suggerisce stabilità, una persona sicura che non può essere smossa dagli elementi della natura e dalla società che ci circonda.", 'Bilal El Moutaren',22),
('sguardo assassino', '6.png', "Il quadro raffigura una figura umana dallo sguardo assassino, gli occhi penetranti emanano una determinazione fredda e minacciosa. Le sopracciglia aggrottate e la composizione dinamica accentuano l'atmosfera carica di tensione. Il quadro cattura un momento carico di suspense, invitando lo spettatore a interrogarsi sulla storia dietro lo sguardo assassino e sulla complessità emotiva della figura ritratta.", 'Osama Chelhaoui',19),
('cane', '7.png', "Il quadro raffigura la figura di un cane felice di rivedere il proprio padrone, i suoi occhi emanano una grande gioia, si percepisce uno sguardo attento a cosa stia accadendo nell’ambiente circostante e una grande voglia di giocare con il suo amico.", 'Ricardo Anton Rupi',23),
('smiley', '8.png', "Il quadro raffigura un'atmosfera luminosa e gioiosa, con una persona al centro della scena, il cui volto è illuminato da un sorriso radiante e gli occhi brillanti di felicità. La composizione è costituita da elementi leggeri che contribuiscono a enfatizzare la leggerezza e la spensieratezza del momento. Le caratteristiche del volto simboleggiano la serenità del momento. Il contesto è quello di un momento di festa.", 'Bilal El Moutaren',20),
('sorriso malizioso', '9.png', "Il quadro raffigura un'atmosfera intrigante, con una figura centrale il cui volto è accennato da un sorriso malizioso. Gli occhi, pieni di vivacità e complicità, accentuano il carattere enigmatico della persona ritratta. Le tonalità scure e misteriose dominano la composizione, creando un contrasto che sottolinea la malizia nell'espressione. Nel complesso, l'opera cattura un momento giocoso e sfuggente, invitando chi osserva a indagare la storia dietro il sorriso malizioso e a svelare i segreti nascosti nell'espressione della figura.", 'Osama Chelhaoui',24),
('persona spensierata', '10.png', "Il dipinto trasmette un'atmosfera leggera e spensierata, con una figura centrale che si manifesta attraverso un sorriso radiante e occhiali da sole. La composizione è aperta e rilassata, con elementi che suggeriscono un ambiente sereno. Il grande sorriso aggiunge dinamismo e autenticità al dipinto, trasmettendo la spensieratezza del momento. Nel complesso, il quadro cattura l'essenza della spensieratezza, invitando alla condivisione della leggerezza d'animo della figura ritratta.", 'Ricardo Anton Rupi',12);


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
('user', 'user', 'user@user.com'),
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
  ('QuantumJazz', 'non soddisfatto', '2023-06-20', 2),
  ('PixelPioneer', 'wow', '2023-07-10', 3),
  ('LunaHarmony', 'non impressionato', '2023-08-05', 1),
  ('NebulaDreamer', 'la roccia', '2023-09-12', 1),
  ('CipherNomad', 'sguardo assassino', '2023-10-25', 2),
  ('MidnightSerenade', 'cane', '2023-11-30', 3),
  ('SolarFlareQuest', 'smiley', '2023-12-15', 1),
  ('ZenithWhisperer', 'sorriso malizioso', '2024-01-02', 1),
  ('EchoRhythm', 'persona spensierata', '2024-02-18', 1),
  ('BlueSkyWalker', 'felice distorto', '2024-03-15', 1),
  ('QuantumJazz', 'non soddisfatto', '2024-04-02', 1),
  ('PixelPioneer', 'wow', '2024-05-10', 1),
  ('LunaHarmony', 'non impressionato', '2024-06-18', 1),
  ('MidnightSerenade', 'la roccia', '2024-07-25', 1);

