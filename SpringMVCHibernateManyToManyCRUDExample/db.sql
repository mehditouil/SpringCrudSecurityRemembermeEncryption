-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Sam 17 Décembre 2016 à 20:49
-- Version du serveur :  5.7.14
-- Version de PHP :  5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `db`
--

-- --------------------------------------------------------

--
-- Structure de la table `app_user`
--

CREATE TABLE `app_user` (
  `id` int(11) NOT NULL,
  `sso_id` varchar(25) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `password` varchar(250) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `app_user`
--

INSERT INTO `app_user` (`id`, `sso_id`, `first_name`, `last_name`, `password`, `email`) VALUES
(21, 'sam', 'Sam', 'Smith', '$2a$10$4eqIF5s/ewJwHK1p8lqlFOEm2QIA0S8g6./Lok.pQxqcxaBZYChRm', 'samy@xyz.com'),
(22, '344', 'mehdi', 'touil', '$2a$10$8zATbcqkliWsDw5hAp85TeWmTGmn0PnwP5Lh05PdLn/cixSgYqUVC', 'm@m.com');

-- --------------------------------------------------------

--
-- Structure de la table `app_user_user_profile`
--

CREATE TABLE `app_user_user_profile` (
  `user_id` int(11) NOT NULL,
  `user_profile_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `app_user_user_profile`
--

INSERT INTO `app_user_user_profile` (`user_id`, `user_profile_id`) VALUES
(21, 21),
(21, 24),
(21, 25),
(22, 25);

-- --------------------------------------------------------

--
-- Structure de la table `exam_result`
--

CREATE TABLE `exam_result` (
  `id` int(11) NOT NULL,
  `st_name` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `persistent_logins`
--

CREATE TABLE `persistent_logins` (
  `username` varchar(64) NOT NULL,
  `series` varchar(64) NOT NULL,
  `token` varchar(64) NOT NULL,
  `last_used` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `user_profile`
--

CREATE TABLE `user_profile` (
  `id` int(11) NOT NULL,
  `type` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `user_profile`
--

INSERT INTO `user_profile` (`id`, `type`) VALUES
(24, 'ADMIN'),
(25, 'DBA'),
(21, 'USER');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `app_user`
--
ALTER TABLE `app_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sso_id` (`sso_id`);

--
-- Index pour la table `app_user_user_profile`
--
ALTER TABLE `app_user_user_profile`
  ADD PRIMARY KEY (`user_id`,`user_profile_id`),
  ADD KEY `FK_USER_PROFILE` (`user_profile_id`);

--
-- Index pour la table `exam_result`
--
ALTER TABLE `exam_result`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `persistent_logins`
--
ALTER TABLE `persistent_logins`
  ADD PRIMARY KEY (`series`);

--
-- Index pour la table `user_profile`
--
ALTER TABLE `user_profile`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `type` (`type`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `app_user`
--
ALTER TABLE `app_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT pour la table `exam_result`
--
ALTER TABLE `exam_result`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `user_profile`
--
ALTER TABLE `user_profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `app_user_user_profile`
--
ALTER TABLE `app_user_user_profile`
  ADD CONSTRAINT `FK_APP_USER` FOREIGN KEY (`user_id`) REFERENCES `app_user` (`id`),
  ADD CONSTRAINT `FK_USER_PROFILE` FOREIGN KEY (`user_profile_id`) REFERENCES `user_profile` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
