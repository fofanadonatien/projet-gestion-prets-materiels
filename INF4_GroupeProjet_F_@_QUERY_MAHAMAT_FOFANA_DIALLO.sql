-- Binomes : @Mahamat      @Fofana             @ Diallo
-- Date : 22/04/2025	
-- Sujet : Projet de base de données
-- Description : Requêtes SQL sur une base de données de gestion de matériel

 ---les requetes 
 
--Requete 1
SELECT M.libelle_materiel
FROM Materiels_Base M JOIN Exemplaires Ex USING (id_materiel)
                      JOIN Reservations R ON ( Ex.id_exemplaire = R.id_exemplaire)
                      JOIN Employes_base E ON ( R.id_employe = E.id_employe)
WHERE E.nom_employe = 'Martin';

--Requete 2
SELECT DISTINCT E.nom_employe
FROM Materiels_Base M JOIN Exemplaires Ex USING (id_materiel)
                      JOIN Reservations R ON ( Ex.id_exemplaire = R.id_exemplaire)
                      JOIN Employes_base E ON ( R.id_employe = E.id_employe)
WHERE M.id_materiel = 37
UNION
SELECT DISTINCT E.nom_employe
FROM Materiels_Base M JOIN Exemplaires Ex USING (id_materiel)
                      JOIN Reservations R ON ( Ex.id_exemplaire = R.id_exemplaire)
                      JOIN Employes_base E ON ( R.id_employe = E.id_employe)
WHERE M.id_materiel = 38;

--Requete 3
SELECT COUNT (DISTINCT E.nom_employe)
FROM Materiels_Base M JOIN Exemplaires Ex USING (id_materiel)
                      JOIN Reservations R ON ( Ex.id_exemplaire = R.id_exemplaire)
                      JOIN Employes_base E ON ( R.id_employe = E.id_employe)
WHERE M.id_materiel = 37 OR M.id_materiel = 38;

--Requete 4

SELECT e.nom_employe
FROM Employes_Base e 
WHERE e.id_employe NOT IN (
	SELECT r.id_employe
	FROM Reservations r JOIN Exemplaires ex ON r.id_exemplaire = ex.id_exemplaire 
	);
	
--5---

SELECT e.id_employe, e.nom_employe
FROM Employes_Base e JOIN Reservations r USING (id_employe)
				JOIN Exemplaires ex USING (id_exemplaire)
				JOIN Materiels_base	m Using (id_materiel) 
				JOIN Categories c USING (id_categorie)
GROUP BY e.id_employe, e.nom_employe
HAVING count(DISTINCT c.id_categorie) = (SELECT count(*) FROM Categories);

--6---

SELECT m.id_materiel, m.libelle_materiel, COUNT(e.id_exemplaire) AS nombre_exemplaires
FROM Materiels_base m JOIN Exemplaires e ON m.id_materiel = e.id_materiel
GROUP BY m.id_materiel, m.libelle_materiel;

--7---

SELECT e.id_employe, e.nom_employe, COUNT(r.id_reservation) AS nombre_reservations
FROM Employes_base e JOIN Reservations r ON e.id_employe = r.id_employe
GROUP BY e.id_employe, e.nom_employe
HAVING COUNT(r.id_reservation) >= 60;

--8---
SELECT e.id_employe, e.nom_employe, COUNT(r.id_reservation) AS nombre_emprunts_reels_perceuse
FROM Employes_base e JOIN Reservations r ON e.id_employe = r.id_employe 
					 JOIN Exemplaires ex ON r.id_exemplaire = ex.id_exemplaire        
WHERE r.date_retour_effective IS NOT NULL  AND ex.id_materiel = 20 AND r.date_emprunt IS NOT NULL
GROUP BY e.id_employe, e.nom_employe
HAVING COUNT(r.id_reservation) >= 2;

--9---
WITH Durees AS (
    SELECT 
        ex.id_materiel,
        m.libelle_materiel,
        r.id_reservation,
        (julianday(r.date_fin) - julianday(r.date_debut)) AS duree
    FROM Reservations r
    JOIN Exemplaires ex ON (r.id_exemplaire = ex.id_exemplaire)
    JOIN Materiels_base m ON (ex.id_materiel = m.id_materiel)
)
SELECT id_materiel, libelle_materiel, id_reservation, duree
FROM Durees
WHERE duree = (SELECT MAX(duree) FROM Durees);

--10---
WITH NbResa AS (
    SELECT 
        e.id_exemplaire,
        m.libelle_materiel,
        COUNT(r.id_reservation) AS nb_reservations
    FROM Reservations r
    JOIN Exemplaires e ON r.id_exemplaire = e.id_exemplaire
    JOIN Materiels_base m ON e.id_materiel = m.id_materiel
    GROUP BY e.id_exemplaire, m.libelle_materiel
)
SELECT *
FROM NbResa
WHERE nb_reservations = (SELECT MAX(nb_reservations) FROM NbResa);
