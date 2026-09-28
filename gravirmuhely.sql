-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2026. Sze 28. 10:45
-- Kiszolgáló verziója: 10.4.32-MariaDB
-- PHP verzió: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `gravirmuhely`
--

-- --------------------------------------------------------

--
-- `rendeles` tábla szerkezete
--

CREATE TABLE `rendeles` (
  `rendelesid` int(11) NOT NULL,
  `ugyfelid` int(11) NOT NULL,
  `termekid` int(11) NOT NULL,
  `rendelesido` datetime NOT NULL DEFAULT current_timestamp(),
  `mennyiseg` smallint(5) UNSIGNED NOT NULL,
  `rendelesi_egysegar` int(10) UNSIGNED NOT NULL,
  `atveteldatum` date DEFAULT NULL,
  `megjegyzes` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- `rendeles` tábla feltöltése
--

INSERT INTO `rendeles` (`rendelesid`, `ugyfelid`, `termekid`, `rendelesido`, `mennyiseg`, `rendelesi_egysegar`, `atveteldatum`, `megjegyzes`) VALUES
(1, 1, 1, '2025-02-05 10:20:00', 4, 2400, '2025-02-08', 'Monogramot kér mind a négy darabra.'),
(2, 2, 5, '2025-02-14 15:10:00', 2, 3200, '2025-02-17', 'Évfordulós dátum gravírozásával.'),
(3, 3, 18, '2025-03-01 09:45:00', 1, 9500, '2025-03-04', 'A fedél belső oldalára kéri a feliratot.'),
(4, 5, 16, '2025-03-19 14:12:00', 3, 4600, '2025-03-22', NULL),
(5, 6, 12, '2025-04-04 11:30:00', 5, 3800, '2025-04-07', 'Céges logóval és névvel.'),
(6, 7, 39, '2025-04-18 16:05:00', 2, 1600, '2025-04-21', 'Telefonszámot kér a hátoldalra.'),
(7, 9, 10, '2025-05-06 13:40:00', 4, 4300, '2025-05-09', 'Legénybúcsúra készül, egyedi grafikával.'),
(8, 1, 34, '2025-05-21 09:18:00', 6, 2700, '2025-05-24', NULL),
(9, 10, 27, '2025-06-08 12:50:00', 1, 9800, '2025-06-11', 'Dőlt betűtípussal kéri a nevet.'),
(10, 11, 7, '2025-06-25 17:15:00', 6, 3300, '2025-06-28', 'Esküvői koccintó szett.'),
(11, 3, 29, '2025-07-11 10:05:00', 2, 6800, '2025-07-15', NULL),
(12, 12, 22, '2025-07-29 14:33:00', 3, 4900, '2025-08-01', 'Túracsapat emblémájával.'),
(13, 14, 31, '2025-08-14 08:55:00', 4, 3300, '2025-08-17', 'Ballagási idézet kerül az alsó keretlécre.'),
(14, 15, 36, '2025-09-02 15:22:00', 2, 6400, '2025-09-05', NULL),
(15, 7, 25, '2025-09-19 11:10:00', 1, 12500, '2025-09-22', 'Díszcsomagolást is kér mellé.'),
(16, 16, 37, '2025-10-06 16:45:00', 5, 4100, '2025-10-10', 'Szüreti rendezvény ajándékai.'),
(17, 17, 20, '2025-10-21 13:12:00', 2, 5200, '2025-10-24', NULL),
(18, 10, 13, '2025-11-05 09:28:00', 10, 2000, '2025-11-08', 'Pedagógusoknak év végi ajándék.'),
(19, 19, 9, '2025-11-18 14:50:00', 4, 3700, '2025-11-21', 'Különböző becenevekkel.'),
(20, 20, 14, '2025-11-28 11:04:00', 2, 6500, '2025-12-01', 'Karácsonyi átvétellel, díszdobozban.');

-- --------------------------------------------------------

--
-- `ugyfel` tábla szerkezete
--

CREATE TABLE `ugyfel` (
  `ugyfelid` int(11) NOT NULL,
  `nev` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `telefon` varchar(20) DEFAULT NULL,
  `iranyitoszam` char(4) NOT NULL,
  `telepules` varchar(50) NOT NULL,
  `cim` varchar(150) NOT NULL,
  `regisztracio` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- `ugyfel` tábla feltöltése
--

INSERT INTO `ugyfel` (`ugyfelid`, `nev`, `email`, `telefon`, `iranyitoszam`, `telepules`, `cim`, `regisztracio`) VALUES
(1, 'Barta Gergely', 'barta.gergely@example.hu', '+36 30 211 3344', '1052', 'Budapest', 'Deák Ferenc utca 10.', '2025-01-10 10:15:00'),
(2, 'Király Eszter', 'kiraly.eszter@example.hu', '+36 20 334 5566', '1117', 'Budapest', 'Fehérvári út 45.', '2025-01-22 14:30:00'),
(3, 'Németh Balázs', 'nemeth.balazs@example.hu', '+36 70 445 6677', '9021', 'Győr', 'Baross Gábor út 12.', '2025-02-03 09:12:00'),
(4, 'Sipos Viktória', 'sipos.viktoria@example.hu', NULL, '6720', 'Szeged', 'Kárász utca 8.', '2025-02-14 16:20:00'),
(5, 'Fodor Levente', 'fodor.levente@example.hu', '+36 30 556 7788', '4024', 'Debrecen', 'Piac utca 22.', '2025-02-28 11:45:00'),
(6, 'Vörös Nikolett', 'voros.nikolett@example.hu', '+36 20 667 8899', '7621', 'Pécs', 'Király utca 15.', '2025-03-12 13:10:00'),
(7, 'Major Dániel', 'major.daniel@example.hu', '+36 70 778 9900', '3525', 'Miskolc', 'Széchenyi István út 30.', '2025-03-25 15:50:00'),
(8, 'Vincze Ágnes', 'vincze.agnes@example.hu', NULL, '8000', 'Székesfehérvár', 'Fő utca 6.', '2025-04-08 08:40:00'),
(9, 'Antal Richárd', 'antal.richard@example.hu', '+36 30 889 0011', '6000', 'Kecskemét', 'Rákóczi út 19.', '2025-04-19 12:25:00'),
(10, 'Lengyel Csilla', 'lengyel.csilla@example.hu', '+36 20 990 1122', '9400', 'Sopron', 'Várkerület 34.', '2025-05-04 17:05:00'),
(11, 'Hegedűs Márk', 'hegedus.mark@example.hu', '+36 70 112 2334', '8200', 'Veszprém', 'Kossuth Lajos utca 11.', '2025-05-18 10:33:00'),
(12, 'Bíró Patrícia', 'biro.patricia@example.hu', '+36 30 223 3445', '3300', 'Eger', 'Dobó István tér 4.', '2025-06-02 14:18:00'),
(13, 'Kádár Norbert', 'kadar.norbert@example.hu', NULL, '5000', 'Szolnok', 'Tiszaparti sétány 7.', '2025-06-19 09:55:00'),
(14, 'Pálfi Zsuzsanna', 'palfi.zsuzsanna@example.hu', '+36 20 334 4556', '2660', 'Balassagyarmat', 'Rákóczi fejedelem útja 28.', '2025-07-05 11:20:00'),
(15, 'Kelemen Attila', 'kelemen.attila@example.hu', '+36 70 445 5667', '9700', 'Szombathely', 'Fő tér 14.', '2025-07-21 16:42:00'),
(16, 'Gál Bettina', 'gal.bettina@example.hu', '+36 30 556 6778', '2100', 'Gödöllő', 'Dózsa György út 9.', '2025-08-09 13:15:00'),
(17, 'Halász Botond', 'halasz.botond@example.hu', '+36 20 667 7889', '1137', 'Budapest', 'Szent István körút 18.', '2025-08-27 15:08:00'),
(18, 'Faragó Tímea', 'farago.timea@example.hu', NULL, '2000', 'Szentendre', 'Bogdányi út 23.', '2025-09-14 10:47:00'),
(19, 'Szekeres Kristóf', 'szekeres.kristof@example.hu', '+36 70 778 8990', '1092', 'Budapest', 'Ráday utca 31.', '2025-10-03 12:30:00'),
(20, 'Novák Henrietta', 'novak.henrietta@example.hu', '+36 30 889 9001', '2600', 'Vác', 'Március 15. tér 5.', '2025-10-25 14:55:00');

-- --------------------------------------------------------

--
-- `termek` tábla szerkezete
--

CREATE TABLE `termek` (
  `termekid` int(11) NOT NULL,
  `tnev` varchar(100) NOT NULL,
  `anyag` varchar(30) NOT NULL,
  `technologia` varchar(50) DEFAULT NULL,
  `keszlet` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `ajandekdobozos` tinyint(1) DEFAULT NULL,
  `kepurl` varchar(300) DEFAULT NULL,
  `egysegar` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- `termek` tábla feltöltése
--

INSERT INTO `termek` (`termekid`, `tnev`, `anyag`, `technologia`, `keszlet`, `ajandekdobozos`, `kepurl`, `egysegar`) VALUES
(1, 'Kulcstartó', 'acél', 'lézergravírozás', 60, 1, 'kulcstarto_acel.jpg', 2500),
(2, 'Kulcstartó', 'fa', 'lézergravírozás', 85, 0, NULL, 1800),
(3, 'Kulcstartó', 'bőr', 'lézergravírozás', 40, 1, 'kulcstarto_bor.png', 2900),
(4, 'Kulcstartó', 'alumínium', NULL, 50, 0, NULL, 1900),
(5, 'Borospohár', 'üveg', 'homokfúvás', 45, 1, 'borospohar_uveg.jpg', 3200),
(6, 'Borospohár', 'kristály', 'lézergravírozás', 20, 1, NULL, 5500),
(7, 'Pezsgőspohár', 'üveg', 'homokfúvás', 38, 1, 'pezsgospohar_uveg.png', 3400),
(8, 'Pezsgőspohár', 'kristály', NULL, 16, 1, NULL, 5800),
(9, 'Söröskorsó', 'üveg', 'homokfúvás', 32, 0, 'soroskorso_uveg.jpg', 3800),
(10, 'Laposüveg flaska', 'acél', 'gyémántfejes', 28, 1, 'flaska_acel.png', 4500),
(11, 'Laposüveg flaska', 'sárgaréz', 'gyémántfejes', 14, 1, NULL, 5900),
(12, 'Golyóstoll', 'acél', 'lézergravírozás', 55, 1, 'golyostoll_acel.jpg', 3900),
(13, 'Golyóstoll', 'bambusz', 'lézergravírozás', 70, 0, NULL, 2200),
(14, 'Golyóstoll', 'sárgaréz', 'mechanikus marás', 18, 1, 'golyostoll_sargarez.png', 6500),
(15, 'Töltőtoll', 'acél', NULL, 12, 1, NULL, 8900),
(16, 'Vágódeszka', 'fa', 'lézergravírozás', 35, 0, 'vagodeszka_fa.jpg', 4800),
(17, 'Vágódeszka', 'bambusz', 'lézergravírozás', 42, 0, NULL, 4200),
(18, 'Zsebóra', 'sárgaréz', 'gyémántfejes', 11, 1, 'zsebora_sargarez.png', 9500),
(19, 'Zsebóra', 'acél', 'gyémántfejes', 15, 1, NULL, 8500),
(20, 'Viharöngyújtó', 'acél', 'gyémántfejes', 26, 1, 'ongyujto_acel.jpg', 5200),
(21, 'Viharöngyújtó', 'sárgaréz', 'mechanikus marás', 19, 1, NULL, 6200),
(22, 'Termosz', 'acél', 'lézergravírozás', 34, 0, 'termosz_acel.png', 4900),
(23, 'Termosz', 'bambusz', 'lézergravírozás', 22, NULL, NULL, 5400),
(24, 'Karkötő', 'bőr', 'lézergravírozás', 30, 1, 'karkoto_bor.jpg', 3600),
(25, 'Karkötő', 'ezüst', 'gyémántfejes', 10, 1, NULL, 12500),
(26, 'Karkötő', 'acél', NULL, 25, 1, 'karkoto_acel.png', 4400),
(27, 'Nyaklánc medál', 'ezüst', 'gyémántfejes', 14, 1, 'medal_ezust.jpg', 9800),
(28, 'Nyaklánc medál', 'acél', 'lézergravírozás', 36, 1, NULL, 3500),
(29, 'Ékszerdoboz', 'fa', 'lézergravírozás', 18, 1, 'ekszerdoboz_fa.png', 6800),
(30, 'Ékszerdoboz', 'üveg', 'homokfúvás', 9, NULL, NULL, 7900),
(31, 'Képkeret', 'fa', 'lézergravírozás', 44, 0, 'kepkeret_fa.jpg', 3300),
(32, 'Képkeret', 'alumínium', 'mechanikus marás', 28, 0, NULL, 3700),
(33, 'Képkeret', 'üveg', 'homokfúvás', 21, 1, 'kepkeret_uveg.png', 4600),
(34, 'Névjegykártyatartó', 'acél', 'lézergravírozás', 48, 1, NULL, 2800),
(35, 'Névjegykártyatartó', 'bőr', 'lézergravírozás', 31, 1, 'nevjegytarto_bor.jpg', 3400),
(36, 'Zsebkés', 'acél', 'mechanikus marás', 20, 1, 'zsebkes_acel.png', 6400),
(37, 'Bortartó doboz', 'fa', 'lézergravírozás', 27, 0, NULL, 4300),
(38, 'Bortartó doboz', 'bambusz', 'lézergravírozás', 15, 1, 'bortarto_bambusz.jpg', 5100),
(39, 'Kutyabiléta', 'alumínium', 'mechanikus marás', 75, 0, 'kutyabileta_alu.png', 1600),
(40, 'Kutyabiléta', 'sárgaréz', 'gyémántfejes', 40, 0, NULL, 2400);

--
-- indexek
--

--
-- `rendeles` tábla indexei
--
ALTER TABLE `rendeles`
  ADD PRIMARY KEY (`rendelesid`),
  ADD KEY `fk_rendeles_ugyfel` (`ugyfelid`),
  ADD KEY `fk_rendeles_termek` (`termekid`);

--
-- `ugyfel`  tábla indexei
--
ALTER TABLE `ugyfel`
  ADD PRIMARY KEY (`ugyfelid`),
  ADD UNIQUE KEY `uq_ugyfel_email` (`email`),
  ADD UNIQUE KEY `telefon` (`telefon`);

--
-- `termek` tábla indexei
--
ALTER TABLE `termek`
  ADD PRIMARY KEY (`termekid`);

--
-- táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a `rendeles` táblához 
--
ALTER TABLE `rendeles`
  MODIFY `rendelesid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT az `ugyfel` táblához 
--
ALTER TABLE `ugyfel`
  MODIFY `ugyfelid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT a `termek` táblához
--
ALTER TABLE `termek`
  MODIFY `termekid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- megkötések
--

--
-- megkötések a `rendeles` táblához
--
ALTER TABLE `rendeles`
  ADD CONSTRAINT `fk_rendeles_ugyfel` FOREIGN KEY (`ugyfelid`) REFERENCES `ugyfel` (`ugyfelid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_rendeles_termek` FOREIGN KEY (`termekid`) REFERENCES `termek` (`termekid`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
