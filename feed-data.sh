#!/bin/bash

# As prereq, install the pup tool: https://github.com/EricChiang/pup

input_file=semailles-2022.csv
output_file=semailles-2022-enriched.csv

link_formula='=HYPERLINK(INDIRECT("F2:F"),INDIRECT("B2:B"))'
query='https://www.semaille.com/fr/recherche?search_query='

echo "Nom;Référence;Famille;Date semis;Prix unitaire (hors remise);Lien;Référence+lien" > "$output_file"

tail -n +2 "$input_file" | while IFS=, read -r name ref family date price _
do
    # Query the web site of semailles.com to get the HTTP response containing the link to the item page
    echo "querying item: $ref"
    item_hyperlink=$(curl -s $query$ref | pup -c 'a[class='product_img_link'] attr{href}'| cut -d '?' -f 1)
    echo "$name;$ref;$family;$date;$price;$item_hyperlink;$link_formula" >> $output_file
done