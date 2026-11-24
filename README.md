# Équipements en Île-de-France - Power BI

Pendant mon stage à la Préfecture de la Seine-Saint-Denis, j’ai conçu un rapport pour comparer les équipements des départements et communes franciliens : situation en 2024 et évolution depuis 2019.

**Outils :** Power BI, Power Query, DAX, SQLite, DBeaver et Talend Open Studio.

## Aperçu du projet

![Comparaison des équipements en 2019 et 2024 dans l’onglet Évolution des départements.](docs/apercu.png)

[Voir l’image en grand format](docs/apercu.png)

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
| Communes - 2024 | Comparaisons communales avec la population et les salaires disponibles |
| Évolution des communes | Évolution des équipements par commune |
| Communes du 93 | Comparaison des communes de Seine-Saint-Denis |

Paris est masqué à l’ouverture pour mieux lire les écarts entre les autres départements. Tu peux le sélectionner dans **Secteur géographique**.

L’évolution compare seulement les équipements comparables entre 2019 et 2024. L’enseignement couvre ici l’enseignement agricole ; le tourisme est limité aux types suivis sur les deux années. Les densités dépendent du modèle de population du stage, dont le millésime n’est pas documenté.

## Mon travail

- Préparer et harmoniser les données avec Power Query.
- Concevoir la base SQLite dans DBeaver et charger les tables avec Talend Open Studio.
- Relier les tables dans Power BI, puis créer les mesures DAX et les graphiques.

<details>
<summary>Sources, limites et actualisation</summary>

### Sources et limites

- Dénombrement des équipements en 2024 et évolution de 2019 à 2024. [Insee - Base permanente des équipements 2024](https://www.insee.fr/fr/metadonnees/source/operation/s2216/bases-donnees-ligne)
- Référentiel géographique des communes. [API Géo](https://geo.api.gouv.fr/)
- Population par commune et par tranche d’âge utilisée pendant le stage. Le millésime de la population importée n’est pas indiqué dans le modèle Power BI. La mesure régionale d’origine inclut aussi la population de douze codes communaux absents du référentiel utilisé. Les densités sont les résultats du modèle de stage et doivent se lire avec cette réserve.
- Salaires horaires nets moyens de 2014 agrégés à l’échelle communale. Le fichier utilisé en stage provient d’un jeu de données Insee republié sur Kaggle sous CC0. [Kaggle - French employment by town](https://www.kaggle.com/datasets/etiennelq/french-employment-by-town) · [Insee - Historique des salaires horaires nets](https://www.insee.fr/fr/statistiques/8629963)

Les densités comparent le nombre d’équipements à la population. Elles ne mesurent ni la capacité d’accueil ni le temps de trajet. Pour actualiser les tables, il faut disposer de la base SQLite du stage et configurer sa connexion ODBC `LBD_Equipements`. Les deux cartes d’origine utilisent Bing Maps, dont Power BI annonce le retrait. [Microsoft Learn - Cartes choroplèthes](https://learn.microsoft.com/fr-fr/power-bi/visuals/power-bi-visualization-filled-maps-choropleths)

Sur le premier onglet, la sélection initiale contient **368 904** équipements. En ajoutant Paris, le total atteint **498 225**. L’indicateur **IDF entière / 10 000 hab.** inclut Paris dans les deux cas.

[Insee - Comparabilité de la BPE en évolution](https://www.insee.fr/fr/metadonnees/source/operation/s2216/coherence-comparabilite) · [Extrait de la page Départements 2024](apercu-departements.png)

Dans Power Query, l’harmonisation porte notamment sur les codes des arrondissements parisiens et le code communal `75056`.

</details>
