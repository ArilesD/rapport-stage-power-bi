# Équipements en Île-de-France - Power BI

Pendant mon stage à la Préfecture de la Seine-Saint-Denis, j’ai conçu un rapport pour comparer les équipements des départements et communes franciliens : situation en 2024 et évolution depuis 2019.

**Outils :** Power BI, Power Query, DAX, SQLite, DBeaver et Talend Open Studio.

## Aperçu du projet

![Comparaison des équipements en 2019 et 2024 dans l’onglet Évolution des départements.](docs/apercu.png)

## Télécharger et ouvrir

1. Installe [Power BI Desktop](https://powerbi.microsoft.com/desktop/) si besoin.
2. [Télécharge le projet en ZIP](https://github.com/ArilesD/rapport-stage-power-bi/archive/refs/heads/main.zip) et fais **Extraire tout**.
3. Ouvre le dossier extrait et double-clique sur **OUVRIR.cmd**, ou ouvre directement **Equipements-IDF-Stage.pbix**.

Les données sont déjà enregistrées dans le rapport : tu peux parcourir les pages et utiliser les filtres dès l’ouverture.

## Explorer le rapport

| Page | Ce qu’elle montre |
| --- | --- |
| Départements - 2024 | Volumes, densités et répartition des équipements par domaine |
| Évolution des départements | Comparaison de 2019 et 2024 |
| Communes - 2024 | Comparaisons communales avec la population et les salaires de 2014 |
| Évolution des communes | Évolution des équipements par commune |
| Communes du 93 | Comparaison des communes de Seine-Saint-Denis |

Paris est masqué à l’ouverture pour mieux lire les écarts entre les autres départements. Tu peux le sélectionner dans **Secteur géographique**.

## Mon travail

- Préparer et harmoniser les données avec Power Query.
- Concevoir la base SQLite dans DBeaver et charger les tables avec Talend Open Studio.
- Relier les tables dans Power BI, puis créer les mesures DAX et les graphiques.

Données : [Insee - Base permanente des équipements 2024](https://www.insee.fr/fr/metadonnees/source/operation/s2216/bases-donnees-ligne) · [API Géo](https://geo.api.gouv.fr/).
