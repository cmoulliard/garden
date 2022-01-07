# Garden

Projet qui contient sous format csv la liste des légumes, plantes aromatiques, fleurs, etc du catalogue de [semailles.com](https://semailes.com)
ainsi que le script bash permettant de récupérer pour chaque semence le lien sur le site semailles correspondant à sa fiche.

Pour générer un nouveau fichier, il faut tout d'abord exporter du document google sheet suivant - [semailles](https://docs.google.com/spreadsheets/d/1y8EeFDYmEHcsBP5SBT0h9k3I57COkKZTR-O6rI28WoU)
les données au format csv vers le fichier `semailles-2022.csv`.

Ensuite, exécutez le bash script `feed-data.sh` qui va récupérer pour chaque référence `L0606S` et la requête `https://www.semaille.com/fr/recherche?search_query=` 
le lien de l'article sur le site.

Les données sont sauvegardées dans un nouveau fichier `semailles-2022-enriched.csv` qui inclut aussi comme colonne additionnelle la formule `=HYPERLINK(INDIRECT("F2:F"),INDIRECT("B2:B"))`
permettant à Google sheet de créer l'hyperlien pour la référence.

**NOTE** Si le nombre de colonnes changent dans le futur, veuillez metre à jour le script bash et la formule !

Lorsque le fichier a été créé, importez le dans le Google sheet comme nouvelle `sheet` et utilisez comme séparateur `;`.




