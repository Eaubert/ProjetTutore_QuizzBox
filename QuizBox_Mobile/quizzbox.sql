/*
Navicat MariaDB Data Transfer

Source Server         : Developpement-Local
Source Server Version : 100208
Source Host           : localhost:3307
Source Database       : quizzbox

Target Server Type    : MariaDB
Target Server Version : 100208
File Encoding         : 65001

Date: 2018-03-28 21:52:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for categorie
-- ----------------------------
DROP TABLE IF EXISTS `categorie`;
CREATE TABLE `categorie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(500) DEFAULT NULL,
  `nom` varchar(100) DEFAULT NULL,
  `img` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of categorie
-- ----------------------------
INSERT INTO `categorie` VALUES ('1', 'categorie exemple', 'exemple', 'quizz.png');
INSERT INTO `categorie` VALUES ('2', 'tous sur les pokemons', 'pokemon', 'pokemon.png');
INSERT INTO `categorie` VALUES ('3', 'Javascript c\'est mieux que java', 'Javascript', 'js.png');

-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(500) DEFAULT NULL,
  `repb` varchar(500) DEFAULT NULL,
  `rep1` varchar(500) DEFAULT NULL,
  `rep2` varchar(500) DEFAULT NULL,
  `rep3` varchar(500) DEFAULT NULL,
  `id_quizz` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=89 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES ('26', 'En quelle année François Mitterrand a-t-il été élu président de la République française ?', '1981', '1974', '1976', '1984', '1');
INSERT INTO `question` VALUES ('27', 'Quelle est la seconde ville américaine, après Las Vegas, réputée pour être une ville de Jeux ?', 'Atlantic City', 'Kansas City', 'Oklahoma City', 'La Nouvelle Orlean', '1');
INSERT INTO `question` VALUES ('28', 'La Lorraine a une frontière commune avec combien d\'autres régions françaises ?', '3', '1', '2', '4', '1');
INSERT INTO `question` VALUES ('29', 'Qui est le maire de Metz ?', 'Dominique Gros', 'Laurent Hénard', 'Nicolas Sarkozy', 'Jean-Marie Rausch', '1');
INSERT INTO `question` VALUES ('30', 'Quelle est la ville la plus habité de lorraine ?', 'Metz', 'Nancy', 'Thionville', 'GerardMer', '1');
INSERT INTO `question` VALUES ('31', 'A quelle règne appartiennent les champignons ?', 'Au règne fongique', 'Au regne animal', 'Au regne vegetal', 'au regne imperial', '1');
INSERT INTO `question` VALUES ('32', 'Parmi ces comportements de cueilleur, lequel dois-je adopter lorsque je trouve un champignon inconnu ?', 'le coupe au couteau', 'ne le ramasse pas', 'le cueille entierement', 'le gobe tout rond', '1');
INSERT INTO `question` VALUES ('33', 'Dans Pokemon Go, A quel niveau du jeu apparaissent les Superballs ?', 'Au niveau 12', 'Au niveau 8', 'Au niveau 20', 'Au niveau 32', '2');
INSERT INTO `question` VALUES ('34', 'Quel est le nom de la société', 'Niantic', 'Ubisoft', 'Ankama', 'Microsoft', '2');
INSERT INTO `question` VALUES ('35', 'Combien de Pokémon doivent être capturés au maximum dans une région du globe pour \"terminer le jeu\" Pokémon Go dans sa première version', '142', '328', '129', '56', '2');
INSERT INTO `question` VALUES ('36', 'Parmi ces Pokémon, lequel est un Pokémon Légendaire ?', 'Artikodin', 'Aspicot', 'Rattata', 'Roucool', '2');
INSERT INTO `question` VALUES ('37', 'A quoi sert une Baie Framby dans Pokémon Go?', 'A faciliter la capture du Pokémon', 'A servir de gouter à un enfant', 'A faire eclore un oeuf', 'A faire evoluer un pokemon', '2');
INSERT INTO `question` VALUES ('38', 'Pokémon Go : Combien de kilomètres devons-nous parcourir au maximum à pied pour faire éclore un oeuf ?', '10 km', '20 km', '5 km', '2 km', '2');
INSERT INTO `question` VALUES ('39', 'Qu\'est ce que le Pokédex ?', 'Une encyclopédie des Pokémon', 'Un incubateur de Pokémon', 'Le nom du bar des Pokémon', 'Une superméga Pokéball', '2');
INSERT INTO `question` VALUES ('40', 'Dans Pokémon Go, A quoi servent les oeufs chance ?', 'A doubler les points d\'XP', 'A faire une bonne omelette', 'A gagner un combat', 'A poser un leurre', '2');
INSERT INTO `question` VALUES ('41', 'Dans Pokémon Go, A quoi sert la poussière d\'étoiles ?', 'À recharger tes Pokémon', 'A faire evoluer un Pokemon', 'A gagner des pokepieces', 'A gagner 10 000points d\'XP', '2');
INSERT INTO `question` VALUES ('42', 'Dans Pokemon Go, A quel niveau du jeu apparaissent les Superballs ?', 'Au niveau 12', 'Au niveau 8', 'Au niveau 20', 'Au niveau 32', '3');
INSERT INTO `question` VALUES ('43', 'Quel est le nom de la société', 'Niantic', 'Ubisoft', 'Ankama', 'Microsoft', '3');
INSERT INTO `question` VALUES ('44', 'Combien de Pokémon doivent être capturés au maximum dans une région du globe pour \"terminer le jeu\" Pokémon Go dans sa première version', '142', '328', '129', '56', '3');
INSERT INTO `question` VALUES ('45', 'Parmi ces Pokémon, lequel est un Pokémon Légendaire ?', 'Artikodin', 'Aspicot', 'Rattata', 'Roucool', '3');
INSERT INTO `question` VALUES ('46', 'A quoi sert une Baie Framby dans Pokémon Go?', 'A faciliter la capture du Pokémon', 'A servir de gouter à un enfant', 'A faire eclore un oeuf', 'A faire evoluer un pokemon', '3');
INSERT INTO `question` VALUES ('47', 'Pokémon Go : Combien de kilomètres devons-nous parcourir au maximum à pied pour faire éclore un oeuf ?', '10 km', '20 km', '5 km', '2 km', '3');
INSERT INTO `question` VALUES ('48', 'Qu\'est ce que le Pokédex ?', 'Une encyclopédie des Pokémon', 'Un incubateur de Pokémon', 'Le nom du bar des Pokémon', 'Une superméga Pokéball', '3');
INSERT INTO `question` VALUES ('49', 'Dans Pokémon Go, A quoi servent les oeufs chance ?', 'A doubler les points d\'XP', 'A faire une bonne omelette', 'A gagner un combat', 'A poser un leurre', '3');
INSERT INTO `question` VALUES ('50', 'Dans Pokémon Go, A quoi sert la poussière d\'étoiles ?', 'À recharger tes Pokémon', 'A faire evoluer un Pokemon', 'A gagner des pokepieces', 'A gagner 10 000points d\'XP', '3');
INSERT INTO `question` VALUES ('51', 'Dans Pokemon Go, A quel niveau du jeu apparaissent les Superballs ?', 'Au niveau 12', 'Au niveau 8', 'Au niveau 20', 'Au niveau 42', '4');
INSERT INTO `question` VALUES ('52', 'Quel est le nom de la société', 'Niantic', 'Ubisoft', 'Ankama', 'Microsoft', '4');
INSERT INTO `question` VALUES ('53', 'Combien de Pokémon doivent être capturés au maximum dans une région du globe pour \"terminer le jeu\" Pokémon Go dans sa première version', '142', '428', '129', '56', '4');
INSERT INTO `question` VALUES ('54', 'Parmi ces Pokémon, lequel est un Pokémon Légendaire ?', 'Artikodin', 'Aspicot', 'Rattata', 'Roucool', '4');
INSERT INTO `question` VALUES ('55', 'A quoi sert une Baie Framby dans Pokémon Go?', 'A faciliter la capture du Pokémon', 'A servir de gouter à un enfant', 'A faire eclore un oeuf', 'A faire evoluer un pokemon', '4');
INSERT INTO `question` VALUES ('56', 'Pokémon Go : Combien de kilomètres devons-nous parcourir au maximum à pied pour faire éclore un oeuf ?', '10 km', '20 km', '5 km', '2 km', '4');
INSERT INTO `question` VALUES ('57', 'Qu\'est ce que le Pokédex ?', 'Une encyclopédie des Pokémon', 'Un incubateur de Pokémon', 'Le nom du bar des Pokémon', 'Une superméga Pokéball', '4');
INSERT INTO `question` VALUES ('58', 'Dans Pokémon Go, A quoi servent les oeufs chance ?', 'A doubler les points d\'XP', 'A faire une bonne omelette', 'A gagner un combat', 'A poser un leurre', '4');
INSERT INTO `question` VALUES ('59', 'Dans Pokémon Go, A quoi sert la poussière d\'étoiles ?', 'À recharger tes Pokémon', 'A faire evoluer un Pokemon', 'A gagner des pokepieces', 'A gagner 10 000points d\'XP', '4');
INSERT INTO `question` VALUES ('60', 'Dans Pokemon Go, A quel niveau du jeu apparaissent les Superballs ?', 'Au niveau 12', 'Au niveau 8', 'Au niveau 20', 'Au niveau 52', '5');
INSERT INTO `question` VALUES ('61', 'Quel est le nom de la société', 'Niantic', 'Ubisoft', 'Ankama', 'Microsoft', '5');
INSERT INTO `question` VALUES ('62', 'Combien de Pokémon doivent être capturés au maximum dans une région du globe pour \"terminer le jeu\" Pokémon Go dans sa première version', '152', '528', '129', '56', '5');
INSERT INTO `question` VALUES ('63', 'Parmi ces Pokémon, lequel est un Pokémon Légendaire ?', 'Artikodin', 'Aspicot', 'Rattata', 'Roucool', '5');
INSERT INTO `question` VALUES ('64', 'A quoi sert une Baie Framby dans Pokémon Go?', 'A faciliter la capture du Pokémon', 'A servir de gouter à un enfant', 'A faire eclore un oeuf', 'A faire evoluer un pokemon', '5');
INSERT INTO `question` VALUES ('65', 'Pokémon Go : Combien de kilomètres devons-nous parcourir au maximum à pied pour faire éclore un oeuf ?', '10 km', '20 km', '5 km', '2 km', '5');
INSERT INTO `question` VALUES ('66', 'Qu\'est ce que le Pokédex ?', 'Une encyclopédie des Pokémon', 'Un incubateur de Pokémon', 'Le nom du bar des Pokémon', 'Une superméga Pokéball', '5');
INSERT INTO `question` VALUES ('67', 'Dans Pokémon Go, A quoi servent les oeufs chance ?', 'A doubler les points d\'XP', 'A faire une bonne omelette', 'A gagner un combat', 'A poser un leurre', '5');
INSERT INTO `question` VALUES ('68', 'Dans Pokémon Go, A quoi sert la poussière d\'étoiles ?', 'À recharger tes Pokémon', 'A faire evoluer un Pokemon', 'A gagner des pokepieces', 'A gagner 10 000points d\'XP', '5');
INSERT INTO `question` VALUES ('69', 'Quel est le rapport entre Java et JavaScript ?', 'Ce sont deux langages différents, malgré quelques points communs dans la syntaxe', 'Java est une île, ça n\'a rien à voir !', ' Java est une version améliorée de JavaScript.', 'C\'est le même langage, mais le nom JavaScript est utilisé pour le code s\'exécutant dans une page Web.', '6');
INSERT INTO `question` VALUES ('70', 'Laquelle de ces syntaxes est correcte', 'if (a != 2) {}', ' if a != 2 {}', 'if (a <> 2) {}', ' if a <> 2 {}', '6');
INSERT INTO `question` VALUES ('71', 'Quel attribut des noeuds de l\'arbre DOM correspond à l\'attribut (X)HTML class', 'className', 'CLASS', 'class', 'kiwi', '6');
INSERT INTO `question` VALUES ('72', 'Dans un fichier JavaScript externe (.js), il faut', 'Aucune des réponses précédentes.', 'préciser l’encodage du fichier avec la règle @charset.', 'échapper les caractères spéciaux (X)HTML.', 'entourer le code avec les balises <script> et </script>.', '6');
INSERT INTO `question` VALUES ('73', 'Lequel de ces types d\'événements n\'existe pas', 'mouseclick', 'load', 'blur', 'mouseout', '6');
INSERT INTO `question` VALUES ('74', 'Quelle méthode n\'existe pas dans le DOM', 'document.getElementsByAttribute document.getElementsByClassName', ' document.getElementsByClassName', 'document.getElementsBytagName', ' document.getElementById', '6');
INSERT INTO `question` VALUES ('75', 'Laquelle de ces propositions est un nom de variable valide en JavaScript', '$b', 'var', '2a', ' NaN', '6');
INSERT INTO `question` VALUES ('76', 'Dans une boucle, l\'instruction continue permet de', 'continuer l\'exécution du code après la boucle.', 'A gagner un combat', 'supprimer toutes les variables globales.', 'revenir au début de l\'itération courante.', '6');
INSERT INTO `question` VALUES ('77', 'var iNum = 12; iNum %= 2; A la suite de cette expression, combien vaut iNum ?', '0', '14', '0.12', '6', '6');
INSERT INTO `question` VALUES ('78', 'Quelle méthode permet de comparer deux chaînes texte ?', ' localeCompare()', 'indexOf()', 'charCodeAt()', 'charAt()', '6');
INSERT INTO `question` VALUES ('79', 'Quel est le rapport entre Java et JavaScript ?', 'Ce sont deux langages différents, malgré quelques points communs dans la syntaxe', 'Java est une île, ça n\'a rien à voir !', ' Java est une version améliorée de JavaScript.', 'C\'est le même langage, mais le nom JavaScript est utilisé pour le code s\'exécutant dans une page Web.', '7');
INSERT INTO `question` VALUES ('80', 'Laquelle de ces syntaxes est correcte', 'if (a != 2) {}', ' if a != 2 {}', 'if (a <> 2) {}', ' if a <> 2 {}', '7');
INSERT INTO `question` VALUES ('81', 'Quel attribut des noeuds de l\'arbre DOM correspond à l\'attribut (X)HTML class', 'className', 'CLASS', 'class', 'kiwi', '7');
INSERT INTO `question` VALUES ('82', 'Dans un fichier JavaScript externe (.js), il faut', 'Aucune des réponses précédentes.', 'préciser l’encodage du fichier avec la règle @charset.', 'échapper les caractères spéciaux (X)HTML.', 'entourer le code avec les balises <script> et </script>.', '7');
INSERT INTO `question` VALUES ('83', 'Lequel de ces types d\'événements n\'existe pas', 'mouseclick', 'load', 'blur', 'mouseout', '7');
INSERT INTO `question` VALUES ('84', 'Quelle méthode n\'existe pas dans le DOM', 'document.getElementsByAttribute document.getElementsByClassName', ' document.getElementsByClassName', 'document.getElementsBytagName', ' document.getElementById', '7');
INSERT INTO `question` VALUES ('85', 'Laquelle de ces propositions est un nom de variable valide en JavaScript', '$b', 'var', '2a', ' NaN', '7');
INSERT INTO `question` VALUES ('86', 'Dans une boucle, l\'instruction continue permet de', 'continuer l\'exécution du code après la boucle.', 'A gagner un combat', 'supprimer toutes les variables globales.', 'revenir au début de l\'itération courante.', '7');
INSERT INTO `question` VALUES ('87', 'var iNum = 12; iNum %= 2; A la suite de cette expression, combien vaut iNum ?', '0', '14', '0.12', '7', '7');
INSERT INTO `question` VALUES ('88', 'Quelle méthode permet de comparer deux chaînes texte ?', ' localeCompare()', 'indexOf()', 'charCodeAt()', 'charAt()', '7');

-- ----------------------------
-- Table structure for quizz
-- ----------------------------
DROP TABLE IF EXISTS `quizz`;
CREATE TABLE `quizz` (
  `id` int(11) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `nom` varchar(100) DEFAULT NULL,
  `img` varchar(500) DEFAULT NULL,
  `id_categorie` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of quizz
-- ----------------------------
INSERT INTO `quizz` VALUES ('1', 'Premier quizz exemple', 'Quizz exemple', 'quizz.png', '1');
INSERT INTO `quizz` VALUES ('2', 'Quizz sur Pokemon Go', 'Pokemon Go', 'pokemon.png', '2');
INSERT INTO `quizz` VALUES ('3', 'Quizz sur ronflex', 'Ronflex', 'ronflex.png', '2');
INSERT INTO `quizz` VALUES ('4', 'Pikachu', 'Pokemon Go', 'pickachu.png', '2');
INSERT INTO `quizz` VALUES ('5', 'Pokemon en general', 'Pokemon Basics', 'pokeball.png', '2');
INSERT INTO `quizz` VALUES ('6', 'Etes vous sur d\'etre bon en JS', 'Javascript basics', 'js3.png', '3');
INSERT INTO `quizz` VALUES ('7', 'Javascript funny', 'Funny Js', 'js2.png', '3');

-- ----------------------------
-- Table structure for room
-- ----------------------------
DROP TABLE IF EXISTS `room`;
CREATE TABLE `room` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `capacite` int(11) NOT NULL,
  `joueurs` int(11) NOT NULL DEFAULT 0,
  `joueurs_pret` int(11) NOT NULL DEFAULT 0,
  `mdp` varchar(255) DEFAULT NULL,
  `id_quizz` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=328 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of room
-- ----------------------------

-- ----------------------------
-- Table structure for score
-- ----------------------------
DROP TABLE IF EXISTS `score`;
CREATE TABLE `score` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_quizz` int(11) NOT NULL,
  `pseudo` varchar(255) NOT NULL,
  `score` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of score
-- ----------------------------
