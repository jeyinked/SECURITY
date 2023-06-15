#!/bin/bash

# Définition des variables

url="http://localhost"  # Remplacez par l'URL de votre serveur NGINX
num_requests=1000         # Nombre de requêtes à envoyer

# Boucle pour envoyer les requêtes
for ((i=1; i<=$num_requests; i++))
do
    echo "Envoi de la requête $i..."
    response=$(curl -s -o /dev/null -w "%{http_code}" "$url")
    echo "Code de réponse HTTP : $response"
    echo
done
