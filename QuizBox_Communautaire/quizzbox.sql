CREATE TABLE CATEGORIE(id INT PRIMARY KEY NOT NULL, description VARCHAR(500), nom VARCHAR(100), img VARCHAR(500));
CREATE TABLE QUIZZ(id INT PRIMARY KEY NOT NULL, description VARCHAR(500), nom VARCHAR(100), img VARCHAR(500), id_categorie INT);
CREATE TABLE QUESTION (id INT PRIMARY KEY NOT NULL, question VARCHAR(500), repb VARCHAR(500), rep1 VARCHAR(500), rep2 VARCHAR(500), rep3 VARCHAR(500), id_quizz INT);
CREATE TABLE COMMENTAIRE (id INT PRIMARY KEY NOT NULL, commentaire VARCHAR(500), pseudo VARCHAR(500), dateComm VARCHAR(500), note INT, id_quizz INT, id_user INT);



INSERT INTO CATEGORIE (id, description, nom, img) VALUES (1, 'categorie exemple', 'exemple', 'quizz.png');
INSERT INTO CATEGORIE (id, description, nom, img) VALUES (2, 'tous sur les pokemons', 'pokemon', 'pokemon.png');
INSERT INTO CATEGORIE (id, description, nom, img) VALUES (3, 'Javascript c\'est mieux que java', 'Javascript', 'pokemon.png');

INSERT INTO QUIZZ (id, description, nom, img, id_categorie) VALUES (1, 'Premier quizz exemple', 'Quizz exemple', 'quizz.png', 1);
INSERT INTO QUESTION (question, repb, rep1, rep2, rep3, id_quizz) VALUES ('En quelle année François Mitterrand a-t-il été élu président de la République française ?','1981', '1974', '1976', '1984',1);
INSERT INTO QUESTION (question, repb, rep1, rep2, rep3, id_quizz) VALUES ('Quelle est la seconde ville américaine, après Las Vegas, réputée pour être une ville de Jeux ?','Atlantic City', 'Kansas City', 'Oklahoma City', 'La Nouvelle Orlean', 1);
INSERT INTO QUESTION (question, repb, rep1, rep2, rep3, id_quizz) VALUES ('La Lorraine a une frontière commune avec combien d\'autres régions françaises ?','3','1', '2','4', 1);
INSERT INTO QUESTION (question, repb, rep1, rep2, rep3, id_quizz) VALUES ('Qui est le maire de Metz ?','Dominique Gros', 'Laurent Hénard', 'Nicolas Sarkozy', 'Jean-Marie Rausch', 1);
INSERT INTO QUESTION (question, repb, rep1, rep2, rep3, id_quizz) VALUES ('Quelle est la ville la plus habité de lorraine ?','Metz', 'Nancy', 'Thionville', 'GerardMer', 1);
INSERT INTO QUESTION (question, repb, rep1, rep2, rep3, id_quizz) VALUES ('A quelle règne appartiennent les champignons ?','Au règne fongique', 'Au regne animal', 'Au regne vegetal', 'au regne imperial', 1);
INSERT INTO QUESTION (question, repb, rep1, rep2, rep3, id_quizz) VALUES ('Parmi ces comportements de cueilleur, lequel dois-je adopter lorsque je trouve un champignon inconnu ?','le coupe au couteau', 'ne le ramasse pas', 'le cueille entierement', 'le gobe tout rond', 1);

-- INSERT INTO COMMENTAIRE (commentaire, pseudo, dateComm, note, id_quizz, id_user) VALUES ('Tres bon quizz !', 'Test', '22/01/2018', 5, 1, 2);

INSERT INTO QUIZZ (id, description, nom, img, id_categorie) VALUES (2, 'Quizz sur Pokemon Go', 'Pokemon Go',  'pokemon.png', 2);
INSERT INTO QUESTION (question, repb, rep1, rep2, rep3, id_quizz) VALUES ('Dans Pokemon Go, A quel niveau du jeu apparaissent les Superballs ?','Au niveau 12', 'Au niveau 8', 'Au niveau 20', 'Au niveau 32', 2);
INSERT INTO QUESTION (question, repb, rep1, rep2, rep3, id_quizz) VALUES ('Quel est le nom de la société','Niantic', 'Ubisoft', 'Ankama', 'Microsoft', 2);
INSERT INTO QUESTION (question, repb, rep1, rep2, rep3, id_quizz) VALUES ('Combien de Pokémon doivent être capturés au maximum dans une région du globe pour "terminer le jeu" Pokémon Go dans sa première version','142', '328', '129', '56', 2);
INSERT INTO QUESTION (question, repb, rep1, rep2, rep3, id_quizz) VALUES ('Parmi ces Pokémon, lequel est un Pokémon Légendaire ?','Artikodin', 'Aspicot', 'Rattata', 'Roucool', 2);
INSERT INTO QUESTION (question, repb, rep1, rep2, rep3, id_quizz) VALUES ('A quoi sert une Baie Framby dans Pokémon Go?','A faciliter la capture du Pokémon', 'A servir de gouter à un enfant', 'A faire eclore un oeuf', 'A faire evoluer un pokemon', 2);
INSERT INTO QUESTION (question, repb, rep1, rep2, rep3, id_quizz) VALUES ('Pokémon Go : Combien de kilomètres devons-nous parcourir au maximum à pied pour faire éclore un oeuf ?','10 km', '20 km', '5 km', '2 km', 2);
INSERT INTO QUESTION (question, repb, rep1, rep2, rep3, id_quizz) VALUES ('Qu\'est ce que le Pokédex ?','Une encyclopédie des Pokémon', 'Un incubateur de Pokémon', 'Le nom du bar des Pokémon', 'Une superméga Pokéball', 2);
INSERT INTO QUESTION (question, repb, rep1, rep2, rep3, id_quizz) VALUES ('Dans Pokémon Go, A quoi servent les oeufs chance ?','A doubler les points d\'XP', 'A faire une bonne omelette', 'A gagner un combat', 'A poser un leurre', 2);
INSERT INTO QUESTION (question, repb, rep1, rep2, rep3, id_quizz) VALUES ('Record de téléchargements pour Pokémon Go, combien y en a-t-il eu le 1er mois au niveau mondial ?','100 000 000', '15 000 000', '50 000 000', '200 000 000', 2);
INSERT INTO QUESTION (question, repb, rep1, rep2, rep3, id_quizz) VALUES ('Dans Pokémon Go, A quoi sert la poussière d\'étoiles ?','À recharger tes Pokémon', 'A faire evoluer un Pokemon', 'A gagner des pokepieces', 'A gagner 10 000points d\'XP', 2);


INSERT INTO QUIZZ (id, description, nom, img, id_categorie) VALUES (3, 'Quizz sur ronflex', 'Ronflex',  'ronflex.png', 2);
INSERT INTO QUESTION (question, repb, rep1, rep2, rep3, id_quizz) VALUES ('Dans Pokemon Go, A quel niveau du jeu apparaissent les Superballs ?','Au niveau 12', 'Au niveau 8', 'Au niveau 20', 'Au niveau 32', 3);
INSERT INTO QUESTION (question, repb, rep1, rep2, rep3, id_quizz) VALUES ('Quel est le nom de la société','Niantic', 'Ubisoft', 'Ankama', 'Microsoft', 3);
INSERT INTO QUESTION (question, repb, rep1, rep2, rep3, id_quizz) VALUES ('Combien de Pokémon doivent être capturés au maximum dans une région du globe pour "terminer le jeu" Pokémon Go dans sa première version','142', '328', '129', '56', 3);
INSERT INTO QUESTION (question, repb, rep1, rep2, rep3, id_quizz) VALUES ('Parmi ces Pokémon, lequel est un Pokémon Légendaire ?','Artikodin', 'Aspicot', 'Rattata', 'Roucool', 3);
INSERT INTO QUESTION (question, repb, rep1, rep2, rep3, id_quizz) VALUES ('A quoi sert une Baie Framby dans Pokémon Go?','A faciliter la capture du Pokémon', 'A servir de gouter à un enfant', 'A faire eclore un oeuf', 'A faire evoluer un pokemon', 3);
INSERT INTO QUESTION (question, repb, rep1, rep2, rep3, id_quizz) VALUES ('Pokémon Go : Combien de kilomètres devons-nous parcourir au maximum à pied pour faire éclore un oeuf ?','10 km', '20 km', '5 km', '2 km', 3);
INSERT INTO QUESTION (question, repb, rep1, rep2, rep3, id_quizz) VALUES ('Qu\'est ce que le Pokédex ?','Une encyclopédie des Pokémon', 'Un incubateur de Pokémon', 'Le nom du bar des Pokémon', 'Une superméga Pokéball', 3);
INSERT INTO QUESTION (question, repb, rep1, rep2, rep3, id_quizz) VALUES ('Dans Pokémon Go, A quoi servent les oeufs chance ?','A doubler les points d\'XP', 'A faire une bonne omelette', 'A gagner un combat', 'A poser un leurre', 3);
INSERT INTO QUESTION (question, repb, rep1, rep2, rep3, id_quizz) VALUES ('Record de téléchargements pour Pokémon Go, combien y en a-t-il eu le 1er mois au niveau mondial ?','100 000 000', '15 000 000', '50 000 000', '200 000 000', 3);
INSERT INTO QUESTION (question, repb, rep1, rep2, rep3, id_quizz) VALUES ('Dans Pokémon Go, A quoi sert la poussière d\'étoiles ?','À recharger tes Pokémon', 'A faire evoluer un Pokemon', 'A gagner des pokepieces', 'A gagner 10 000points d\'XP', 3);

INSERT INTO QUIZZ (id, description, nom, img, id_categorie) VALUES (4, 'Pikachu', 'Pokemon Go',  'pickachu.png', 2);
INSERT INTO QUESTION (question, repb, rep1, rep2, rep3, id_quizz) VALUES ('Dans Pokemon Go, A quel niveau du jeu apparaissent les Superballs ?','Au niveau 12', 'Au niveau 8', 'Au niveau 20', 'Au niveau 42', 4);
INSERT INTO QUESTION (question, repb, rep1, rep2, rep3, id_quizz) VALUES ('Quel est le nom de la société','Niantic', 'Ubisoft', 'Ankama', 'Microsoft', 4);
INSERT INTO QUESTION (question, repb, rep1, rep2, rep3, id_quizz) VALUES ('Combien de Pokémon doivent être capturés au maximum dans une région du globe pour "terminer le jeu" Pokémon Go dans sa première version','142', '428', '129', '56', 4);
INSERT INTO QUESTION (question, repb, rep1, rep2, rep3, id_quizz) VALUES ('Parmi ces Pokémon, lequel est un Pokémon Légendaire ?','Artikodin', 'Aspicot', 'Rattata', 'Roucool', 4);
INSERT INTO QUESTION (question, repb, rep1, rep2, rep3, id_quizz) VALUES ('A quoi sert une Baie Framby dans Pokémon Go?','A faciliter la capture du Pokémon', 'A servir de gouter à un enfant', 'A faire eclore un oeuf', 'A faire evoluer un pokemon', 4);
INSERT INTO QUESTION (question, repb, rep1, rep2, rep3, id_quizz) VALUES ('Pokémon Go : Combien de kilomètres devons-nous parcourir au maximum à pied pour faire éclore un oeuf ?','10 km', '20 km', '5 km', '2 km', 4);
INSERT INTO QUESTION (question, repb, rep1, rep2, rep3, id_quizz) VALUES ('Qu\'est ce que le Pokédex ?','Une encyclopédie des Pokémon', 'Un incubateur de Pokémon', 'Le nom du bar des Pokémon', 'Une superméga Pokéball', 4);
INSERT INTO QUESTION (question, repb, rep1, rep2, rep3, id_quizz) VALUES ('Dans Pokémon Go, A quoi servent les oeufs chance ?','A doubler les points d\'XP', 'A faire une bonne omelette', 'A gagner un combat', 'A poser un leurre', 4);
INSERT INTO QUESTION (question, repb, rep1, rep2, rep3, id_quizz) VALUES ('Record de téléchargements pour Pokémon Go, combien y en a-t-il eu le 1er mois au niveau mondial ?','100 000 000', '15 000 000', '50 000 000', '200 000 000', 4);
INSERT INTO QUESTION (question, repb, rep1, rep2, rep3, id_quizz) VALUES ('Dans Pokémon Go, A quoi sert la poussière d\'étoiles ?','À recharger tes Pokémon', 'A faire evoluer un Pokemon', 'A gagner des pokepieces', 'A gagner 10 000points d\'XP', 4);


INSERT INTO QUIZZ (id, description, nom, img, id_categorie) VALUES (5, 'Pokemon en general', 'Pokemon Basics',  'pokeball.png', 2);
INSERT INTO QUESTION (question, repb, rep1, rep2, rep3, id_quizz) VALUES ('Dans Pokemon Go, A quel niveau du jeu apparaissent les Superballs ?','Au niveau 12', 'Au niveau 8', 'Au niveau 20', 'Au niveau 52', 5);
INSERT INTO QUESTION (question, repb, rep1, rep2, rep3, id_quizz) VALUES ('Quel est le nom de la société','Niantic', 'Ubisoft', 'Ankama', 'Microsoft', 5);
INSERT INTO QUESTION (question, repb, rep1, rep2, rep3, id_quizz) VALUES ('Combien de Pokémon doivent être capturés au maximum dans une région du globe pour "terminer le jeu" Pokémon Go dans sa première version','152', '528', '129', '56', 5);
INSERT INTO QUESTION (question, repb, rep1, rep2, rep3, id_quizz) VALUES ('Parmi ces Pokémon, lequel est un Pokémon Légendaire ?','Artikodin', 'Aspicot', 'Rattata', 'Roucool', 5);
INSERT INTO QUESTION (question, repb, rep1, rep2, rep3, id_quizz) VALUES ('A quoi sert une Baie Framby dans Pokémon Go?','A faciliter la capture du Pokémon', 'A servir de gouter à un enfant', 'A faire eclore un oeuf', 'A faire evoluer un pokemon', 5);
INSERT INTO QUESTION (question, repb, rep1, rep2, rep3, id_quizz) VALUES ('Pokémon Go : Combien de kilomètres devons-nous parcourir au maximum à pied pour faire éclore un oeuf ?','10 km', '20 km', '5 km', '2 km', 5);
INSERT INTO QUESTION (question, repb, rep1, rep2, rep3, id_quizz) VALUES ('Qu\'est ce que le Pokédex ?','Une encyclopédie des Pokémon', 'Un incubateur de Pokémon', 'Le nom du bar des Pokémon', 'Une superméga Pokéball', 5);
INSERT INTO QUESTION (question, repb, rep1, rep2, rep3, id_quizz) VALUES ('Dans Pokémon Go, A quoi servent les oeufs chance ?','A doubler les points d\'XP', 'A faire une bonne omelette', 'A gagner un combat', 'A poser un leurre', 5);
INSERT INTO QUESTION (question, repb, rep1, rep2, rep3, id_quizz) VALUES ('Record de téléchargements pour Pokémon Go, combien y en a-t-il eu le 1er mois au niveau mondial ?','100 000 000', '15 000 000', '50 000 000', '200 000 000', 5);
INSERT INTO QUESTION (question, repb, rep1, rep2, rep3, id_quizz) VALUES ('Dans Pokémon Go, A quoi sert la poussière d\'étoiles ?','À recharger tes Pokémon', 'A faire evoluer un Pokemon', 'A gagner des pokepieces', 'A gagner 10 000points d\'XP', 5);


INSERT INTO QUIZZ (id, description, nom, img, id_categorie) VALUES (6, 'Etes vous sur d\'etre bon en JS', 'Javascript basics',  'js3.png', 3);
INSERT INTO QUESTION (question, repb, rep1, rep2, rep3, id_quizz) VALUES ('Quel est le rapport entre Java et JavaScript ?','Ce sont deux langages différents, malgré quelques points communs dans la syntaxe', 'Java est une île, ça n\'a rien à voir !', ' Java est une version améliorée de JavaScript.', 'C\'est le même langage, mais le nom JavaScript est utilisé pour le code s\'exécutant dans une page Web.', 6);
INSERT INTO QUESTION (question, repb, rep1, rep2, rep3, id_quizz) VALUES ('Laquelle de ces syntaxes est correcte','if (a != 2) {}', ' if a != 2 {}', 'if (a <> 2) {}', ' if a <> 2 {}', 6);
INSERT INTO QUESTION (question, repb, rep1, rep2, rep3, id_quizz) VALUES ('Quel attribut des noeuds de l\'arbre DOM correspond à l\'attribut (X)HTML class','className', 'CLASS', 'class', 'kiwi', 6);
INSERT INTO QUESTION (question, repb, rep1, rep2, rep3, id_quizz) VALUES ('Dans un fichier JavaScript externe (.js), il faut','Aucune des réponses précédentes.', 'préciser l’encodage du fichier avec la règle @charset.', 'échapper les caractères spéciaux (X)HTML.', 'entourer le code avec les balises <script> et </script>.', 6);
INSERT INTO QUESTION (question, repb, rep1, rep2, rep3, id_quizz) VALUES ('Lequel de ces types d\'événements n\'existe pas','mouseclick', 'load', 'blur', 'mouseout', 6);
INSERT INTO QUESTION (question, repb, rep1, rep2, rep3, id_quizz) VALUES ('Quelle méthode n\'existe pas dans le DOM','document.getElementsByAttribute document.getElementsByClassName', ' document.getElementsByClassName', 'document.getElementsBytagName', ' document.getElementById', 6);
INSERT INTO QUESTION (question, repb, rep1, rep2, rep3, id_quizz) VALUES ('Laquelle de ces propositions est un nom de variable valide en JavaScript','$b' ,'var', '2a', ' NaN', 6);
INSERT INTO QUESTION (question, repb, rep1, rep2, rep3, id_quizz) VALUES ('Dans une boucle, l\'instruction continue permet de', 'continuer l\'exécution du code après la boucle.', 'A gagner un combat', 'supprimer toutes les variables globales.', 'revenir au début de l\'itération courante.', 6);
INSERT INTO QUESTION (question, repb, rep1, rep2, rep3, id_quizz) VALUES ('var iNum = 12; iNum %= 2; A la suite de cette expression, combien vaut iNum ?','0', '14', '0.12', '6', 6);
INSERT INTO QUESTION (question, repb, rep1, rep2, rep3, id_quizz) VALUES ('Quelle méthode permet de comparer deux chaînes texte ?',' localeCompare()', 'indexOf()', 'charCodeAt()', 'charAt()', 6);


INSERT INTO QUIZZ (id, description, nom, img, id_categorie) VALUES (7, 'Javascript funny', 'Funny Js',  'js2.png', 3);
INSERT INTO QUESTION (question, repb, rep1, rep2, rep3, id_quizz) VALUES ('Quel est le rapport entre Java et JavaScript ?','Ce sont deux langages différents, malgré quelques points communs dans la syntaxe', 'Java est une île, ça n\'a rien à voir !', ' Java est une version améliorée de JavaScript.', 'C\'est le même langage, mais le nom JavaScript est utilisé pour le code s\'exécutant dans une page Web.', 7);
INSERT INTO QUESTION (question, repb, rep1, rep2, rep3, id_quizz) VALUES ('Laquelle de ces syntaxes est correcte','if (a != 2) {}', ' if a != 2 {}', 'if (a <> 2) {}', ' if a <> 2 {}', 7);
INSERT INTO QUESTION (question, repb, rep1, rep2, rep3, id_quizz) VALUES ('Quel attribut des noeuds de l\'arbre DOM correspond à l\'attribut (X)HTML class','className', 'CLASS', 'class', 'kiwi', 7);
INSERT INTO QUESTION (question, repb, rep1, rep2, rep3, id_quizz) VALUES ('Dans un fichier JavaScript externe (.js), il faut','Aucune des réponses précédentes.', 'préciser l’encodage du fichier avec la règle @charset.', 'échapper les caractères spéciaux (X)HTML.', 'entourer le code avec les balises <script> et </script>.', 7);
INSERT INTO QUESTION (question, repb, rep1, rep2, rep3, id_quizz) VALUES ('Lequel de ces types d\'événements n\'existe pas','mouseclick', 'load', 'blur', 'mouseout', 7);
INSERT INTO QUESTION (question, repb, rep1, rep2, rep3, id_quizz) VALUES ('Quelle méthode n\'existe pas dans le DOM','document.getElementsByAttribute document.getElementsByClassName', ' document.getElementsByClassName', 'document.getElementsBytagName', ' document.getElementById', 7);
INSERT INTO QUESTION (question, repb, rep1, rep2, rep3, id_quizz) VALUES ('Laquelle de ces propositions est un nom de variable valide en JavaScript','$b' ,'var', '2a', ' NaN', 7);
INSERT INTO QUESTION (question, repb, rep1, rep2, rep3, id_quizz) VALUES ('Dans une boucle, l\'instruction continue permet de', 'continuer l\'exécution du code après la boucle.', 'A gagner un combat', 'supprimer toutes les variables globales.', 'revenir au début de l\'itération courante.', 7);
INSERT INTO QUESTION (question, repb, rep1, rep2, rep3, id_quizz) VALUES ('var iNum = 12; iNum %= 2; A la suite de cette expression, combien vaut iNum ?','0', '14', '0.12', '7', 7);
INSERT INTO QUESTION (question, repb, rep1, rep2, rep3, id_quizz) VALUES ('Quelle méthode permet de comparer deux chaînes texte ?',' localeCompare()', 'indexOf()', 'charCodeAt()', 'charAt()', 7);
