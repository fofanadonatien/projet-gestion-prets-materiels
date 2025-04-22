# projet-gestion-prets-materiels

-- Binomes : @Mahamat        @Fofana         @Diallo
-- Date : 22/04/2025
## README pour le Projet de Gestion de Prêts de Matériel

## Description du Projet
Ce projet consiste en la conception et l'implémentation d'une base de données complète pour la gestion des prêts de matériels au sein d'un comité d'entreprise. Le système permet de gérer efficacement le catalogue de matériels, les employés, les réservations et les emprunts.

# Fonctionnalités principales

Gestion de matériel : Catégorisation hiérarchique des matériels avec un système de sous-catégories
Suivi des exemplaires : Chaque exemplaire est suivi individuellement avec son état et sa disponibilité
Système de réservation : Les employés peuvent réserver du matériel pour une période définie
Gestion des emprunts : Suivi des périodes réelles d'utilisation et des retours
Limitations d'utilisation : Mise en place de quotas par catégorie de matériel
Rapports et statistiques : Vues SQL pour surveiller les emprunts en cours

# Technologies utilisées

Modélisation UML pour la conception
SQLite comme système de gestion de base de données
SQL pour l'implémentation et les requêtes

## Structure du projet
Le projet est divisé en deux grandes parties :
# Partie 1 : Conception

Modèle conceptuel UML
Diagramme d'objets UML

# Partie 2 : Implémentation

Modèle relationnel
Scripts de création de tables
Scripts de transfert de données
Vues SQL pour le monitoring
Requêtes SQL complexes pour l'analyse des données

## Détails techniques
Structure de la base de données
Le système comprend les tables principales suivantes :

Categories : Gestion des catégories et sous-catégories de matériel
Materiels_base : Catalogue des différents types de matériels
Exemplaires : Instances physiques de chaque matériel
Employes_base : Registre des employés autorisés à emprunter
Reservations : Historique et suivi des réservations et emprunts
Indisponibilites : Gestion des indisponibilités temporaires des exemplaires

Vues

Materiels : Vue enrichie des matériels avec leur nombre d'emprunts en cours
Employes : Vue des employés avec leur nombre d'emprunts en cours

## Requêtes notables
Le projet met en œuvre des requêtes SQL avancées pour :

L'analyse des habitudes d'emprunt par employé
Le suivi des matériels les plus demandés
L'identification des emprunts de longue durée
Le contrôle du respect des quotas par catégorie

## Compétences démontrées

Conception de bases de données relationnelles
Modélisation UML
Normalisation des données
SQL avancé (vues, sous-requêtes, agrégations)
Analyse de données et reporting
Gestion des contraintes d'intégrité

## Installation et utilisation

Cloner le dépôt
Exécuter le script CREATES pour créer la structure de la base de données
Les requêtes d'analyse sont disponibles dans le script QUERY

## Contexte académique
Ce projet a été réalisé dans le cadre du cours INF403 - Gestion de données relationnelles et applications à l'Université Grenoble Alpes (UGA), L2 Informatique, année 2024-2025.
