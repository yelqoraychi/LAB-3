SELECT * FROM ouvrage ORDER BY id DESC LIMIT 3; --Selection les 3 ouvrages trié par leur id descendant
SELECT * FROM auteur WHERE CHAR_LENGTH(nom) >= 5;-- Selection des auteurs ayant dans leurs noms plus de 5 caractéres
SELECT nom, email FROM abonne WHERE email NOT LIKE '%@example.com' AND email NOT LIKE '%@test.org';--Récuperation des abonne ayant des emails differants de @example.com et @test.org
SELECT * FROM emprunt WHERE date_fin_prevue < CURDATE() AND date_retour_effective IS NULL;--Selectionner l'emprunt en retard 
SELECT a.id, a.nom, COUNT(o.id) AS total_ouvrages, SUM(CASE WHEN o.disponible = TRUE THEN 1 ELSE 0 END) AS disponibles FROM auteur a JOIN ouvrage o ON a.id = o.auteur_id GROUP BY a.id, a.nom;--identifier pour chaque auteur le nombre d'ouvrages disponibles
