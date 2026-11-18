USE bibliotheque;
SELECT * FROM auteur;
SELECT COUNT(*) FROM auteur;
SELECT nom AS NomAbonne, email AS Courriel FROM abonne;
SELECT * FROM emprunt WHERE date_debut > '2025-06-01';

SELECT titre FROM ouvrage WHERE disponible = TRUE ORDER BY titre ASC;

SELECT titre, nb_pages FROM ouvrage WHERE nb_pages > 300;
SELECT nom FROM auteur WHERE nom COLLATE utf8_general_ci = 'Dupont';
SELECT * FROM emprunt WHERE date_fin IS NOT NULL AND date_fin < '2025-12-31';
SELECT nom FROM abonne WHERE email LIKE '%@gmail.com' OR email LIKE '%@yahoo.fr';
SELECT nom FROM auteur WHERE NOT (nom LIKE 'A%');
SELECT email FROM abonne WHERE email LIKE '%@example.com';
SELECT nom FROM auteur WHERE BINARY nom LIKE 'Dup%';
SELECT nom FROM abonne WHERE id IN (1, 3, 5, 7);
SELECT * FROM emprunt WHERE date_debut BETWEEN '2025-05-01' AND '2025-05-31';
SELECT * FROM emprunt WHERE date_fin IS NULL;
SELECT * FROM emprunt WHERE date_fin IS NOT NULL;
SELECT COUNT(*) AS nb_disponibles FROM ouvrage WHERE disponible = TRUE;
SELECT auteur_id, COUNT(*) AS nb_ouvrages FROM ouvrage GROUP BY auteur_id HAVING nb_ouvrages > 5;
--Exercices:
SELECT * FROM ouvrage ORDER BY id DESC LIMIT 3; --Selection les 3 ouvrages trié par leur id descendant
SELECT * FROM auteur WHERE CHAR_LENGTH(nom) >= 5;-- Selection des auteurs ayant dans leurs noms plus de 5 caractéres
SELECT nom, email FROM abonne WHERE email NOT LIKE '%@example.com' AND email NOT LIKE '%@test.org';--Récuperation des abonne ayant des emails differants de @example.com et @test.org
SELECT * FROM emprunt WHERE date_fin_prevue < CURDATE() AND date_retour_effective IS NULL;--Selectionner l'emprunt en retard 
SELECT a.id, a.nom, COUNT(o.id) AS total_ouvrages, SUM(CASE WHEN o.disponible = TRUE THEN 1 ELSE 0 END) AS disponibles FROM auteur a JOIN ouvrage o ON a.id = o.auteur_id GROUP BY a.id, a.nom;--identifier pour chaque auteur le nombre d'ouvrages disponibles
