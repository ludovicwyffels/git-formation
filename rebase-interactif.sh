#!/bin/bash

if [ -d "rebase-interactif" ]; then
  rm -rf rebase-interactif
fi

mkdir rebase-interactif

cd rebase-interactif
git init > /dev/null

echo "# Exercice Rebase Interactif" > README.md
git add README.md
git commit -m "chore: commit initial" > /dev/null

mkdir yaml

printf "voiture:\n  marque: Toyota\n  modele: Aygo\n  annee: 2006\n" > yaml/voiture.yaml
git add yaml/voiture.yaml
git commit -m "feat: voiture.yaml" > /dev/null

printf "  dimensions:\n    longueur: 3,41m\n    largeur: 1,62m\n    hauteur: 1,47m\n" >> yaml/voiture.yaml
git add yaml/voiture.yaml
git commit -m "feat: dimensions in voiture.yaml" > /dev/null

printf "societe:\n  siren: 123 456 789\n  immatriculation: 01/01/2022\n" > yaml/societe.yaml
git add yaml/societe.yaml
git commit -m "feat: societe.yaml" > /dev/null

printf "    poids: 800kg\n" >> yaml/voiture.yaml
git add yaml/voiture.yaml
git commit -m "feat: weight in voiture.yaml" > /dev/null

printf "\nL'objectif est d'utiliser la commande \`rebase\` de manière interactive pour simplifier le plus possible l'historique.\n" >> README.md
printf "\n## Déroulé\n\n* Utiliser la commande \`git rebase -i --root\` pour démarrer le rebase interactif (en temps normal on utiliserait \`git rebase -i\` puisque les commits n'auraient pas été poussés vers le dépôt public)\n" >> README.md

printf "\n## Résultat\n\nOn veut que l'historique final ressemble à :\n" >> README.md
printf "\n\`\`\`text" >> README.md
printf "\n5c1ac1a chore: commit initial" >> README.md
printf "\n4edbf0a feat: voiture.yaml" >> README.md
printf "\n3640278 feat: societe.yaml" >> README.md
printf "\n4b3176b feat: énoncé de l'exercice" >> README.md
printf "\n\`\`\`\n" >> README.md

printf "\nL'ordre et les messages des commit sont importants. Chaque commit ne doit porter que sur un seul fichier (à vérifier avec \`git show 4edbf0a\` où \`4edbf0a\` serait le commit hash). Les commit hashes seront bien sûr différents.\n\n" >> README.md

printf "\nVotre historique resembe a ceci:\n" >> README.md
printf "\n\`\`\`text" >> README.md
printf "\n5c1ac1a chore: commit initial" >> README.md
printf "\n4edbf0a feat: voiture.yaml" >> README.md
printf "\n65d91d1 feat: dimensions in voiture.yaml" >> README.md
printf "\n3640278 feat: societe.yaml" >> README.md
printf "\nbf43390 feat: weight in voiture.yaml" >> README.md
printf "\n4b3176b feat: énoncé de l'exercice" >> README.md
printf "\n\`\`\`\n" >> README.md

printf "\nComment pouvez vous modifier votre historique git?\n" >> README.md

printf "\n## Solution\n" >> README.md
printf "\n<details>" >> README.md
printf "\n<summary>" >> README.md
printf "\nLa solution" >> README.md
printf "\n</summary>\n" >> README.md
printf "\n\`\`\`text" >> README.md
printf "\npick 5c1ac1a chore: commit initial" >> README.md
printf "\npick 4edbf0a feat: voiture.yaml" >> README.md
printf "\nsquash 65d91d1 feat: dimensions in voiture.yaml" >> README.md
printf "\nsquash bf43390 feat: weight in voiture.yaml" >> README.md
printf "\npick 3640278 feat: societe.yaml" >> README.md
printf "\npick 4b3176b feat: énoncé de l'exercice" >> README.md
printf "\n\`\`\`" >> README.md
printf "\n\n> Déplacer le commit \`bf43390\` vers la ligne du dessus" >> README.md
printf "\n</details>" >> README.md
printf "\n" >> README.md
git add README.md
git commit -m "feat: énoncé de l'exercice" > /dev/null

echo "Lisez le README.md"
read -p "Press key to continue.. " -n1 -s
