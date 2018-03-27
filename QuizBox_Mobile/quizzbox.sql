CREATE TABLE CATEGORIE(id INT PRIMARY KEY NOT NULL, description VARCHAR(500), nom VARCHAR(100), img VARCHAR(500));
CREATE TABLE QUIZZ(id INT PRIMARY KEY NOT NULL, description VARCHAR(500), nom VARCHAR(100), img VARCHAR(500), id_categorie INT);
CREATE TABLE QUESTION (id INT PRIMARY KEY NOT NULL, question VARCHAR(500), repb VARCHAR(500), rep1 VARCHAR(500), rep2 VARCHAR(500), rep3 VARCHAR(500), id_quizz INT);


INSERT INTO CATEGORIE (id, description, nom, img) VALUES (1, 'categorie exemple', 'exemple', 'http://idata.over-blog.com/1/18/02/12/QUIZZ.png');
INSERT INTO CATEGORIE (id, description, nom, img) VALUES (2, 'tous sur les pokemons', 'pokemon', 'https://www.freepnglogos.com/uploads/pokemon-go-png-logo/pokemon-go-apk-png-logo-9.png');

INSERT INTO QUIZZ (id, description, nom, img, id_categorie) VALUES (1, 'Premier quizz exemple', 'QUizz exemple', 'http://idata.over-blog.com/1/18/02/12/QUIZZ.png', 1);
INSERT INTO QUESTION (question, repb, rep1, rep2, rep3, id_quizz) VALUES ('En quelle année François Mitterrand a-t-il été élu président de la République française ?','1981', '1974', '1976', '1984',1);
INSERT INTO QUESTION (question, repb, rep1, rep2, rep3, id_quizz) VALUES ('Quelle est la seconde ville américaine, après Las Vegas, réputée pour être une ville de Jeux ?','Atlantic City', 'Kansas City', 'Oklahoma City', 'La Nouvelle Orlean', 1);
INSERT INTO QUESTION (question, repb, rep1, rep2, rep3, id_quizz) VALUES ('La Lorraine a une frontière commune avec combien d\'autres régions françaises ?','3','1', '2','4', 1);
INSERT INTO QUESTION (question, repb, rep1, rep2, rep3, id_quizz) VALUES ('Qui est le maire de Metz ?','Dominique Gros', 'Laurent Hénard', 'Nicolas Sarkozy', 'Jean-Marie Rausch', 1);
INSERT INTO QUESTION (question, repb, rep1, rep2, rep3, id_quizz) VALUES ('Quelle est la ville la plus habité de lorraine ?','Metz', 'Nancy', 'Thionville', 'GerardMer', 1);
INSERT INTO QUESTION (question, repb, rep1, rep2, rep3, id_quizz) VALUES ('A quelle règne appartiennent les champignons ?','Au règne fongique', 'Au regne animal', 'Au regne vegetal', 'au regne imperial', 1);
INSERT INTO QUESTION (question, repb, rep1, rep2, rep3, id_quizz) VALUES ('Parmi ces comportements de cueilleur, lequel dois-je adopter lorsque je trouve un champignon inconnu ?','le coupe au couteau', 'ne le ramasse pas', 'le cueille entierement', 'le gobe tout rond', 1);


INSERT INTO QUIZZ (id, description, nom, img, id_categorie) VALUES (2, 'Quizz sur Pokemon Go', 'Pokemon Go',  'https://pre00.deviantart.net/06a5/th/pre/i/2016/268/d/7/pokemon_go_icon_by_urnauzao-daiwf2s.png', 2);
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


INSERT INTO QUIZZ (id, description, nom, img, id_categorie) VALUES (3, 'deuxieme Quizz sur Pokemon Go (le même)', 'Pokemon Go',  'https://pre00.deviantart.net/06a5/th/pre/i/2016/268/d/7/pokemon_go_icon_by_urnauzao-daiwf2s.png', 2);
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