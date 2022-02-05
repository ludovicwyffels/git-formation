#!/bin/bash

if [ -d "merge" ]; then
  rm -rf merge
fi

mkdir merge

cd merge
git init > /dev/null


printf "\n# Exercice Branches\n" >>README.md

printf "\n## Ajouter créer une branche\n" >>README.md

printf "\nUtiliser la commande checkout pour créer un nouvelle branche \`feat/velo\` en partant de \`master\`\n" >>README.md

printf "\n## Ajouter des commit dans feat/velo\n" >>README.md

printf "\nCréer un fichier \`velo.yaml\` dans le dossier \`yaml\` avec comme contenu :\n" >>README.md

printf "\n\`\`\`yaml" >>README.md
printf "\nvelo:" >>README.md
printf "\n  marque: Look" >>README.md
printf "\n  modele: 576" >>README.md
printf "\n\`\`\`\n" >>README.md

printf "\nAjouter ce fichier à l'index et créer un commit avec le message \`feat: velo.yaml\`\n" >>README.md

printf "\n## Merge Fast Forward\n" >>README.md

printf "\nPlacer vous sur la branche master\n" >>README.md

printf "\nVisualiser votre historique pré-fusion avec \`git log --oneline --graph --all\`\n" >>README.md

printf "\nUtiliser la commande \`git merge --ff-only feat/velo\` pour fusionner la branche \`feat/velo\` sur la branch \`master\`\n" >>README.md

printf "\nVisualiser votre historique post-fusion avec \`git log --oneline --graph --all\`\n" >>README.md

printf "\n## Merge Recursive\n" >>README.md

printf "\nDéfaire le dernier commit avec \`git reset HEAD~1 --hard\`\n" >>README.md

printf "\nVisualiser votre historique pré-fusion avec \`git log --oneline --graph --all\`\n" >>README.md

printf "\nUtiliser la commande \`git merge --no-ff feat/velo\` pour fusionner la branche \`feat/velo\` sur la branch \`master\`\n" >>README.md

printf "\nVisualiser votre historique post-fusion avec \`git log --oneline --graph --all\`\n" >>README.md

printf "\n## Merge par défault\n" >>README.md

printf "\nDéfaire le dernier commit avec \`git reset HEAD~1 --hard\`\n" >>README.md

printf "\nSur la branch \`master\` modifier le fichier \`contact.yaml\` en changeant par exemple le prénom.\n" >>README.md

printf "\nCréer un commit \`feat: fix prenom in contact.yaml\` sur master\n" >>README.md

printf "\nVisualiser votre historique pré-fusion avec \`git log --oneline --graph --all\`\n" >>README.md

printf "\nUtiliser la commande \`git merge feat/velo\` pour fusionner la branche \`feat/velo\` sur la branch \`master\`\n" >>README.md

printf "\nVisualiser votre historique post-fusion avec \`git log --oneline --graph --all\`\n" >>README.md

printf "\n## Rebase\n" >>README.md

printf "\nDéfaire le dernier commit avec \`git reset HEAD~1 --hard\`\n" >>README.md

printf "\nVisualiser votre historique pré-fusion avec \`git log --oneline --graph --all\`\n" >>README.md

printf "\nPlacer vous sur la branche \`feat/velo\` avec \`git checkout feat/velo\`\n" >>README.md

printf "\nUtiliser la commande \`git rebase master\` pour réécrire l'historique de la branche \`feat/velo\` à partir de la branche \`master\`\n" >>README.md

printf "\nPlacer vous sur la branche \`master\` avec \`git checkout master\`\n" >>README.md

printf "\nUtiliser la commande \`git merge --ff-only feat/velo\` pour fusionner la branche \`feat/velo\` sur la branch \`master\`\n" >>README.md

printf "\nVisualiser votre historique post-fusion avec \`git log --oneline --graph --all\`\n" >>README.md

printf "\n## Rebase preserve merge\n" >>README.md

printf "\nDéfaire les 2 derniers commit avec \`git reset HEAD~2 --hard\`\n" >>README.md

printf "\nUtiliser la commande \`git merge --no-ff feat/velo\` pour fusionner la branche \`feat/velo\` sur la branch \`master\` avec la stratégie récursive\n" >>README.md

printf "\nVisualiser votre historique pré-fusion avec \`git log --oneline --graph --all\`\n" >>README.md

printf "\nRetourner dans la branch feat/velo \n" >>README.md

printf "\nModifier le fichier vélo et faire un commit\n" >>README.md

printf "\nRevenir sur master\n" >>README.md

printf "\nModifier le fichier contact et faire un commit\n" >>README.md

printf "\nUtiliser la commande \`git rebase --preserve-merges feat/velo\` pour fusionner la branche \`feat/velo\` sur la branch \`master\`\n" >>README.md

printf "\nVisualiser votre historique post-fusion avec \`git log --oneline --graph --all\`\n" >>README.md




git add README.md
git commit -m "feat: énoncé de l'exercice" > /dev/null

echo "Lisez le README.md"
read -p "Press key to continue.. " -n1 -s
