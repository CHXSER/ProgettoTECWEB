SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

--
-- Name: disegni; Type: TABLE; Schema: public; Owner: -
--

DROP TABLE IF EXISTS `disegni`;
CREATE TABLE public.disegni (
    nome character varying(40) NOT NULL,
    disegno varbinary(max),
    descrizione text,
    autore character varying(40),
    PRIMARY KEY(nome),
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


--
-- Name: metodopagamento; Type: TABLE; Schema: public; Owner: -
--
DROP TABLE IF EXISTS `metodopagamento`;
CREATE TABLE public.metodopagamento (
    id serial NOT NULL,
    metodopagamento character varying(30),
    nomedisegno character varying(30),
    nomeordinante character varying(40),
    nomebeneficiario character varying(40),
    causale text,
    iban character varying(30),
    numerocarta character varying(16),
    datascadenza date,
    cvc character varying(3),
    PRIMARY KEY(id),
    CONSTRAINT metodopagamento_nomedisegno_fkey FOREIGN KEY (nomedisegno) REFERENCES public.disegni(nome) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


--
-- Name: utente; Type: TABLE; Schema: public; Owner: -
--
DROP TABLE IF EXISTS `utente`;
CREATE TABLE public.utente (
    id serial,
    username character varying(30) NOT NULL,
    nome character varying(30),
    cognome character varying(30),
    password character varying(20),
    email character varying(30),
    PRIMARY KEY(username)
    CONSTRAINT utente_id_fkey FOREIGN KEY (id) REFERENCES public.metodopagamento(id) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO disegni
        VALUES
        (1, (SELECT * from Openrowset (BULK '..\images\immagini\1.png', Single_Blob) as T), 'aaaaaaaaaa','bilal'),
        (2, (SELECT * from Openrowset (BULK '..\images\immagini\2.png', Single_Blob) as T), 'aaaaaaaaaa','osama'),
        (3, (SELECT * from Openrowset (BULK '..\images\immagini\3.png', Single_Blob) as T), 'aaaaaaaaaa','rupi'),
        (4, (SELECT * from Openrowset (BULK '..\images\immagini\4.png', Single_Blob) as T), 'aaaaaaaaaaa','bilal'),
        (5, (SELECT * from Openrowset (BULK '..\images\immagini\5.png', Single_Blob) as T), 'aaaaaaaaaaaa','osama'),
        (6, (SELECT * from Openrowset (BULK '..\images\immagini\6.png', Single_Blob) as T), 'aaaaaaaaaaaa','rupi'),
        (7, (SELECT * from Openrowset (BULK '..\images\immagini\7.png', Single_Blob) as T), 'aaaaaaaaaaaa','bilal'),
        (8, (SELECT * from Openrowset (BULK '..\images\immagini\8.png', Single_Blob) as T), 'aaaaaaaaaaaaa','osama'),
        (9, (SELECT * from Openrowset (BULK '..\images\immagini\9.png', Single_Blob) as T), 'aaaaaaaaaaaaa','rupi'),
        (10, (SELECT * from Openrowset (BULK '..\images\immagini\10.png', Single_Blob) as T), 'aaaaaaaaaaaaaa','bilal');

INSERT INTO metodopagamento
    (metodopagamento, nomedisegno, nomeordinante, nomebeneficiario, causale, iban)
VALUES
    ('bonifico', '1', 'Marco','Francesco','aaaaaaaaaaaaaaaa','1234567890'),
    ('bonifico', '2', 'Luca', 'Chiara','aaaaaaaaaaaaaaaa','12345678890'),
    ('bonifico', '3', 'Stefano','Sofia','aaaaaaaaaaaaaaaaaaa','1234567890'),
    ('bonifico', '4', 'Giovanni','Giorgia','aaaaaaaaaaaaaaaaaaa','1234567890'),
    ('bonifico', '5', 'Laura','Elena','aaaaaaaaaaaaaaaaaaaa','1234567890');

INSERT INTO metodopagamento
    (metodopagamento, nomedisegno, nomeordinante, nomebeneficiario, numerocarta, datascadenza, cvc)
VALUES
    ('carta', '6', 'Paolo','Martina','0967356306490846','2023-04-15','117'),
    ('carta', '7','Davide','Luca','5796213327187679','2023-08-02','039'),
    ('carta', '8','Francesco','Marco','6089308417790668','2023-11-22','016'),
    ('carta', '9','Mauro','Alessandro','8213238592311246','2024-03-10','646'),
    ('carta', '10','Franco','Massimiliano','3058022108081899','2024-06-28','601');

INSERT INTO utente
        VALUES
        ('BlueSkyWalker','Marco','Rossi','ETZYvza5BMiYwX4','BlueSkyWalker@gmail.com'),
        ('QuantumJazz','Luca','Conti','Dd6lb4f38xVuEBX','QuantumJazz@gmail.com'),
        ('PixelPioneer','Stefano','Bianchi','96YvHmFBwxV7vqb','PixelPioneer@gmail.com'),
        ('LunaHarmony','Giovanni','Moretti','t8CIvU4DxT0iXZU','LunaHarmony@gmail.com'),
        ('NebulaDreamer','Laura','Marini','t1aCKMhZyovJJdW','NebulaDreamer@gmail.com'),
        ('CipherNomad','Paolo','De Luca','STsabw9BbUijrbo','CipherNomad@gmail.com'),
        ('MidnightSerenade','Davide','Santoro','Pt5xVlwEYOCHvL2','MidnightSerenade@gmail.com'),
        ('SolarFlareQuest','Francesco','Lombardi','BkkM3h58wrpfZ2Y','SolarFlareQuest@gmail.com'),
        ('ZenithWhisperer','Mauro','Ferrara','lEko1RWez1sno6U','ZenithWhisperer@gmail.com'),
        ('EchoRhythm','Franco','Russo','eXS94ByU5Sl5vrW','EchoRhythm@gmail.com');
