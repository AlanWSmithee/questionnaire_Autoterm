-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 02 fév. 2023 à 13:29
-- Version du serveur : 5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `autothermbddcnam`
--
CREATE DATABASE IF NOT EXISTS `autothermbddcnam` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `autothermbddcnam`;

-- --------------------------------------------------------

--
-- Structure de la table `patients`
--

DROP TABLE IF EXISTS `patients`;
CREATE TABLE IF NOT EXISTS `patients` (
  `id_pat` int(6) NOT NULL AUTO_INCREMENT,
  `nom_pat` varchar(150) DEFAULT NULL,
  `prenom_pat` varchar(150) DEFAULT NULL,
  `ddn_pat` date DEFAULT NULL,
  `sexe_pat` varchar(10) DEFAULT NULL,
  `email_pat` varchar(100) DEFAULT NULL,
  `mp_pat` varchar(100) DEFAULT NULL,
  `phenray_pat` varchar(50) DEFAULT NULL,
  `annee_phenray_pat` int(4) DEFAULT NULL,
  `touchant_pat` varchar(50) DEFAULT NULL,
  `ref_dossier_pat` varchar(100) DEFAULT NULL,
  `dateconn` datetime DEFAULT NULL,
  `accord_pat` varchar(10) DEFAULT NULL,
  `repondu_ok` int(2) DEFAULT NULL,
  PRIMARY KEY (`id_pat`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `tablepdr`
--

DROP TABLE IF EXISTS `tablepdr`;
CREATE TABLE IF NOT EXISTS `tablepdr` (
  `id_pdr` int(6) NOT NULL AUTO_INCREMENT,
  `id_pat` int(6) DEFAULT NULL,
  `pdrq1` varchar(50) DEFAULT NULL,
  `pdrq2libre` varchar(100) DEFAULT NULL,
  `pdrq9` varchar(50) DEFAULT NULL,
  `pdrq9libre` varchar(100) DEFAULT NULL,
  `pdrq10` varchar(50) DEFAULT NULL,
  `pdrq10libre` varchar(100) DEFAULT NULL,
  `date_saisie` datetime DEFAULT NULL,
  PRIMARY KEY (`id_pdr`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `tableqdv`
--

DROP TABLE IF EXISTS `tableqdv`;
CREATE TABLE IF NOT EXISTS `tableqdv` (
  `id_qvie` int(6) NOT NULL AUTO_INCREMENT,
  `id_pat` int(6) DEFAULT NULL,
  `q1_qvie` varchar(50) DEFAULT NULL,
  `q2_qvie` varchar(50) DEFAULT NULL,
  `q3a_qvie` varchar(50) DEFAULT NULL,
  `q3b_qvie` varchar(50) DEFAULT NULL,
  `q3c_qvie` varchar(50) DEFAULT NULL,
  `q4a_qvie` varchar(50) DEFAULT NULL,
  `q4b_qvie` varchar(50) DEFAULT NULL,
  `q4c_qvie` varchar(50) DEFAULT NULL,
  `q4d_qvie` varchar(50) DEFAULT NULL,
  `q5a_qvie` varchar(50) DEFAULT NULL,
  `q5b_qvie` varchar(50) DEFAULT NULL,
  `q5c_qvie` varchar(50) DEFAULT NULL,
  `q5d_qvie` varchar(50) DEFAULT NULL,
  `date_saisie` datetime DEFAULT NULL,
  PRIMARY KEY (`id_qvie`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id_user` int(6) NOT NULL AUTO_INCREMENT,
  `email_user` varchar(100) DEFAULT NULL,
  `mp_user` varchar(100) DEFAULT NULL,
  `droit_user` int(11) DEFAULT NULL,
  `dateconn` datetime DEFAULT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
COMMIT;




ALTER TABLE tablepdr ADD CONSTRAINT fk_pdr FOREIGN KEY (id_pat) REFERENCES patients(id_pat); 
ALTER TABLE tableqdv ADD CONSTRAINT fk_qdv FOREIGN KEY (id_pat) REFERENCES patients(id_pat); 
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

INSERT INTO `patients` (`nom_pat`, `prenom_pat`, `ddn_pat`, `sexe_pat`, `email_pat`, `mp_pat`, `phenray_pat`, `annee_phenray_pat`, `touchant_pat`, `ref_dossier_pat`, `dateconn`, `accord_pat`, `repondu_ok`) VALUES
('Dupond', 'Fabrice', '1984-03-25', 'homme', 'fab.dup@yahoo.com', NULL, 'Idiopathique', 2012, 'Pied & main', 'DUP_FAB_25_3_1984_1', now(), 'acceptÃ©', NULL);
