# Équipements en Île-de-France - rapport Power BI

Pendant mon stage en préfecture, j’ai conçu un rapport pour comparer les équipements recensés en Seine-Saint-Denis et dans les autres départements franciliens. Le rapport présente la situation en 2024 et son évolution entre 2019 et 2024.

## Aperçu du projet

![Capture de l’onglet Évolution des départements dans Power BI Desktop, avec comparaison de 2019 et 2024.](docs/apercu.png)

Capture de l’onglet Évolution des départements dans Power BI Desktop, avec comparaison de 2019 et 2024. Le graphique par domaine précise les limites de comparaison pour l’enseignement et le tourisme.

[Voir la capture en grand format](docs/apercu.png) · [Mon parcours et mes autres projets](https://github.com/ArilesD)

## Télécharger et ouvrir

1. Installe [Power BI Desktop sur Windows](https://powerbi.microsoft.com/desktop/).
2. [Télécharge le projet en ZIP](https://github.com/ArilesD/rapport-stage-power-bi/archive/refs/heads/main.zip) et fais **Extraire tout**.
3. Ouvre le dossier extrait puis double-clique sur **OUVRIR.cmd**, ou ouvre directement **Equipements-IDF-Stage.pbix**.

Les données enregistrées dans le rapport permettent d’utiliser les filtres dès l’ouverture. Pour commencer, ouvre **Départements - 2024** et sélectionne un domaine. L’actualisation des sources demande la connexion SQLite/ODBC décrite plus bas.

[Consulter aussi l’extrait de l’onglet Départements 2024](apercu-departements.png). Les aperçus sont accessibles dans un navigateur sur Windows, macOS et Linux.


## Explorer le rapport

Ouvrir [Equipements-IDF-Stage.pbix](Equipements-IDF-Stage.pbix) dans Power BI Desktop. Les données enregistrées permettent de parcourir les cinq onglets et d’utiliser les filtres dès l’ouverture.

| Onglet | Ce qu’il montre |
| --- | --- |
| Départements - 2024 | Volumes, densités et répartition des équipements par domaine |
| Évolution des départements | Évolution par département et par domaine entre 2019 et 2024 |
| Communes - 2024 | Comparaisons communales avec la population et les salaires moyens disponibles |
| Évolution des communes | Évolution de la présence des équipements par commune |
| Communes du 93 | Comparaison des communes de Seine-Saint-Denis |

Sur le premier onglet, le filtre **Secteur géographique** masque Paris à l’ouverture. Son volume d’équipements élargit l’échelle des graphiques et rend les écarts entre les sept autres départements moins visibles. En cochant Paris, le total passe de **368 904** à **498 225** équipements. La carte **IDF entière / 10 000 hab.** sert de repère régional et inclut Paris dans les deux cas.

L’onglet d’évolution compare les types d’équipement que l’Insee juge comparables entre 2019 et 2024. Dans l’enseignement, le fichier d’évolution couvre uniquement l’enseignement agricole. Pour le tourisme, les chiffres concernent les types suivis sur les deux années. Le graphique affiche les effectifs exacts, y compris ceux inférieurs à 1 000. [Insee - Comparabilité de la BPE en évolution](https://www.insee.fr/fr/metadonnees/source/operation/s2216/coherence-comparabilite)

## Mon travail

- Harmoniser dans Power Query les types de données et les codes géographiques. Certaines sources utilisaient les codes des arrondissements parisiens, d’autres le code communal `75056`.
- Concevoir la base SQLite dans DBeaver et charger les tables avec Talend Open Studio.
- Relier les communes, les départements et la nomenclature des équipements dans Power BI, puis créer des mesures DAX pour rapporter les volumes à 10 000 habitants.

## Sources et limites

- Dénombrement des équipements en 2024 et évolution de 2019 à 2024. [Insee - Base permanente des équipements 2024](https://www.insee.fr/fr/metadonnees/source/operation/s2216/bases-donnees-ligne)
- Référentiel géographique des communes. [API Géo](https://geo.api.gouv.fr/)
- Population par commune et par tranche d’âge utilisée pendant le stage. Le millésime de la population importée n’est pas indiqué dans le modèle Power BI. La mesure régionale d’origine inclut aussi la population de douze codes communaux absents du référentiel utilisé. Les densités sont les résultats du modèle de stage et doivent se lire avec cette réserve.
- Salaires horaires nets moyens de 2014 agrégés à l’échelle communale. Le fichier utilisé en stage provient d’un jeu de données Insee republié sur Kaggle sous CC0. [Kaggle - French employment by town](https://www.kaggle.com/datasets/etiennelq/french-employment-by-town) · [Insee - Historique des salaires horaires nets](https://www.insee.fr/fr/statistiques/8629963)

Les densités comparent le nombre d’équipements à la population. Elles ne mesurent ni la capacité d’accueil ni le temps de trajet. Pour actualiser les tables, il faut disposer de la base SQLite du stage et configurer sa connexion ODBC `LBD_Equipements`. Les deux cartes d’origine utilisent Bing Maps, dont Power BI annonce le retrait. [Microsoft Learn - Cartes choroplèthes](https://learn.microsoft.com/fr-fr/power-bi/visuals/power-bi-visualization-filled-maps-choropleths)
