-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 16 mars 2021 à 09:49
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `system`
--

-- --------------------------------------------------------

--
-- Structure de la table `association`
--

DROP TABLE IF EXISTS `association`;
CREATE TABLE IF NOT EXISTS `association` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num_partenaire` int(11) DEFAULT NULL,
  `num_de_projet` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `num_de_projet` (`num_de_projet`),
  KEY `num_partenaire` (`num_partenaire`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `asso_2`
--

DROP TABLE IF EXISTS `asso_2`;
CREATE TABLE IF NOT EXISTS `asso_2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num_partenaire` int(11) DEFAULT NULL,
  `num_paye` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `num_partenaire` (`num_partenaire`),
  KEY `num_paye` (`num_paye`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `categorie_pro`
--

DROP TABLE IF EXISTS `categorie_pro`;
CREATE TABLE IF NOT EXISTS `categorie_pro` (
  `num_categori` int(11) NOT NULL,
  `nom_catego` varchar(50) DEFAULT NULL,
  `montant` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`num_categori`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `dirige`
--

DROP TABLE IF EXISTS `dirige`;
CREATE TABLE IF NOT EXISTS `dirige` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num_emploi` int(11) DEFAULT NULL,
  `num_de_projet` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `num_de_projet` (`num_de_projet`),
  KEY `num_emploi` (`num_emploi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `emploiyes`
--

DROP TABLE IF EXISTS `emploiyes`;
CREATE TABLE IF NOT EXISTS `emploiyes` (
  `num_emploi` int(11) NOT NULL,
  `nom_emp` varchar(50) DEFAULT NULL,
  `sexe` varchar(50) DEFAULT NULL,
  `num_servic` int(11) NOT NULL,
  `num_servic_1` int(11) NOT NULL,
  `num_categori` int(11) NOT NULL,
  PRIMARY KEY (`num_emploi`),
  KEY `num_servic_1` (`num_servic_1`),
  KEY `num_servic` (`num_servic`),
  KEY `num_categori` (`num_categori`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `partenaire_`
--

DROP TABLE IF EXISTS `partenaire_`;
CREATE TABLE IF NOT EXISTS `partenaire_` (
  `num_partenaire` int(11) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `num_type` int(11) NOT NULL,
  PRIMARY KEY (`num_partenaire`),
  KEY `num_type` (`num_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `paye`
--

DROP TABLE IF EXISTS `paye`;
CREATE TABLE IF NOT EXISTS `paye` (
  `num_paye` int(11) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`num_paye`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `projet`
--

DROP TABLE IF EXISTS `projet`;
CREATE TABLE IF NOT EXISTS `projet` (
  `num_de_projet` int(11) NOT NULL,
  `nom__projet` varchar(50) DEFAULT NULL,
  `budjet` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`num_de_projet`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `service`
--

DROP TABLE IF EXISTS `service`;
CREATE TABLE IF NOT EXISTS `service` (
  `num_servic` int(11) NOT NULL,
  `nom_ser` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`num_servic`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `type_partenaire`
--

DROP TABLE IF EXISTS `type_partenaire`;
CREATE TABLE IF NOT EXISTS `type_partenaire` (
  `num_type` int(11) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`num_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `association`
--
ALTER TABLE `association`
  ADD CONSTRAINT `association_ibfk_1` FOREIGN KEY (`num_de_projet`) REFERENCES `projet` (`num_de_projet`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `association_ibfk_2` FOREIGN KEY (`num_partenaire`) REFERENCES `partenaire_` (`num_partenaire`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `asso_2`
--
ALTER TABLE `asso_2`
  ADD CONSTRAINT `asso_2_ibfk_1` FOREIGN KEY (`num_partenaire`) REFERENCES `partenaire_` (`num_partenaire`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `asso_2_ibfk_2` FOREIGN KEY (`num_paye`) REFERENCES `paye` (`num_paye`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `dirige`
--
ALTER TABLE `dirige`
  ADD CONSTRAINT `dirige_ibfk_1` FOREIGN KEY (`num_de_projet`) REFERENCES `projet` (`num_de_projet`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `dirige_ibfk_2` FOREIGN KEY (`num_emploi`) REFERENCES `emploiyes` (`num_emploi`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `emploiyes`
--
ALTER TABLE `emploiyes`
  ADD CONSTRAINT `emploiyes_ibfk_1` FOREIGN KEY (`num_servic`) REFERENCES `service` (`num_servic`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `emploiyes_ibfk_2` FOREIGN KEY (`num_categori`) REFERENCES `categorie_pro` (`num_categori`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `partenaire_`
--
ALTER TABLE `partenaire_`
  ADD CONSTRAINT `partenaire__ibfk_1` FOREIGN KEY (`num_type`) REFERENCES `type_partenaire` (`num_type`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
