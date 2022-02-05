---
theme: gaia
_class: lead
paginate: false
backgroundColor: #fff
backgroundImage: url('https://marp.app/assets/hero-background.jpg')
marp: true
_paginate: false

---

<style>
img[alt~="center"] {
  display: block;
  margin: 0 auto;
}
</style>

![bg left:40% 80%](https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fcdn.freebiesupply.com%2Flogos%2Flarge%2F2x%2Fgit-icon-logo-png-transparent.png&f=1&nofb=1)

# **Git**

---
<!--
_class: lead
-->

![bg right:50% 100%](https://www.w3docs.com/uploads/media/default/0001/03/a62cf03969b5e023300fca0e686b2d4b35b1dca8.png)

# **git stash**

---

## git stash

La commmande `git stash` prend vos changements de non-comité (stagés et non stagés), les enregistre pour une utilisation utlérieure, puis les remplace dans votre copie de travail.

Notez que le stash est local pour votre dépôt Git. Les stashs ne sont pas transférés au serveur lors d'un push

---

```shell
$ git status
On branch main
Changes to be committed:

    new file:   style.css

Changes not staged for commit:

    modified:   index.html

$ git stash
Saved working directory and index state WIP on main: 5002d47 our new homepage
HEAD is now at 5002d47 our new homepage

$ git status
On branch main
nothing to commit, working tree clean
```

---

### Appliquer à nouveau vos changements stashés

Vous pouvez réappliquer vos changements stashés en utilisant la commande: `git stash pop`. 
L'apparition de votre stash __supprime__ les changements qu'il contient et les réapplique à votre copie de travail.

Vous pouvez également réappliquer les changements à votre copie de travail et les __conserver__ dans votre stash avec la commande: `git stash apply`

---

## git stash pop

```shell
$ git status
On branch main
nothing to commit, working tree clean
$ git stash pop
On branch main
Changes to be committed:

    new file:   style.css

Changes not staged for commit:

    modified:   index.html

Dropped refs/stash@{0} (32b3aa1d185dfe6d57b3c3cc3b32cbf3e380cc6a)
```

---

## git stash apply

```shell
$ git stash apply
On branch main
Changes to be committed:

    new file:   style.css

Changes not staged for commit:

    modified:   index.html
```

> C'est utile si vous souhaitez appliquer les mêmes changements stashés à plusieurs branches.

---

### Faire un stash des fichiers non trackés ou ignorés

Par défaut, la commande `git stash` ignore les fichiers non trackés et les fichiers ignorés.

Il faut ajouter l'option `-u` (ou `--include-untracked`) pour que la commande `git stash` inclue les fichiers non trackés.

Vous pouvez aussi ajouter l'option `-a` (ou `--all`) pour que la commande `git stash` inclue tous les fichiers.

---

### Gérer plusieurs stashes

Pour consulter la liste des stashes, utilisez la commande `git stash list`.

Pour donner plus de contexte, il peut être utile d'annoter vos stashes avec une descripton comme ceci: `git stash save "My stash"`

Par défaut, `git stash pop` réapplique les changements du dernier stash (`stash@{0}`).
Vous pouvez utiliser la commande `git stash apply stash@{n}` pour réappliquer le stash n.

---

### Nettoyez votre stash

Si vous décidez que vous n'avez plus besoin d'un stash spécifique, vous pouvez le supprimer avec la commande `git stash drop`.

```shell
$ git stash drop stash@{1}
Dropped stash@{1} (17e2697fd8251df6163117cb3d58c1f62a5e7cdb)
```

Vous pouvez également supprimer tous les stashes avec la commande `git stash drop --all` ou `git stash clear`.

---

### Affichage des comparaisons entre stashes

Vous pouvez afficher les différences entre deux stashes avec la commande `git stash show stash@{n}` ou `git stash show stash@{n} stash@{m}`.

Ou ajoutez l'option `-p` (ou `--patch`) pour afficher les différences entre deux stashes en format patch.

---
<!--
_class: lead
-->

![bg right:40% 100%](https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fclipart-library.com%2Fimages_k%2Fcherry-transparent%2Fcherry-transparent-16.png&f=1&nofb=1)

# **git cherry-pick**

---

## git cherry-pick

La commande `git cherry-pick` permet de récupérer les changements d'une branche à l'autre.

Et pour annuler un cherry-pick, utilisez la commande `git cherry-pick --abort`.

---

```text
a - b - c - d   Main
     \
      e - f - g  Feature
```

```shell
$ git switch main
$ git cherry-pick f
```

Nous avons récupéré le commit `f` de la branche `Feature` et l'ajouté à la branche `Main`.

```text
a - b - c - d - f   Main
     \
      e - f - g  Feature
```

---
<!--
_class: lead
-->

![bg right:40% 100%](https://wac-cdn.atlassian.com/dam/jcr:15447956-9d33-4817-9dc6-fd6c86f24240/hero.svg?cdnVersion=185)

# **git merge**

---
 
## git merge

La solution la plus simple consiste à faire un merge de la branche principal (main) dans la branch feature.

```shell
$ git switch feature
$ git merge main
```

Vous pouvez également condenser cette commande en une ligne:

```shell
$ git merge feature main
```

---

![h:400 center](https://wac-cdn.atlassian.com/dam/jcr:4639eeb8-e417-434a-a3f8-a972277fc66a/02%20Merging%20main%20into%20the%20feature%20branh.svg?cdnVersion=185)

Le merge est une opération intéressante, car elle est non destructive. Les branches existantes ne sont pas modifiées. Cela permet d'éviter les pièges potentiels du rebase.

---
<!--
_class: lead
-->

![bg right:40% 100%](https://wac-cdn.atlassian.com/dam/jcr:15447956-9d33-4817-9dc6-fd6c86f24240/hero.svg?cdnVersion=185)

# **git rebase**

---

## git rebase

Plutôt que de faire un merge, vous pouvez faire un rebase de la branche de feature vers la branche main.

```shell
$ git checkout feature
$ git rebase main
```

Toute la branche de feature sera ainsi déplacée sur la pointe de la branche main, et tous les nouveaux commits seront intégrés à la branche main.

---

![h:400 center](https://wac-cdn.atlassian.com/dam/jcr:3bafddf5-fd55-4320-9310-3d28f4fca3af/03%20Rebasing%20the%20feature%20branch%20into%20main.svg?cdnVersion=185)

Cependant, au lieu d'utiliser un commit de merge, le rebase consiste à réécrire l'historique du projet en créant de nouveaux commmits pour chaque commit de la branche d'origine.

---

### Avantages

Le principal avantage du rebase est que l'historique de votre projet sera nettement plus propre.

Premièrement, cette opération permet de supprimer les commits de merge superflus requis par la commande git merge.

Deuxièmement, comme l'illustre le schéma ci-dessus, vous obtenez un historique de projet parfaitement linéaire, qui vous permettra de suivre la pointe de la branche de fonctionnalité à toutes les étapes du projet à partir de son commencement.

---

## Rebase interactif

Le rebase interactif vous donne la possibilité de modifier des commits lorsqu'ils sont déplacés vers la nouvelle branche. 

Cette opération est plus efficace qu'un rebase automatique, puisqu'elle permet de contrôler l'intégralité de l'historique des commits de la branche.

Le plus souvent, le rebase interactif est utilisé pour nettoyer un historique désordonné avant de faire un merge d'une branche de fonctionnalité dans main.

---

Pour lancer une session de rebase interactif, ajoutez l'option i à la commande git rebase :

```shell
$ git checkout feature
$ git rebase -i main
```

Cette commande ouvre un éditeur de texte répertoriant tous les commits qui seront déplacés.

```text
pick 33d5b7a Message for commit #1
pick 9480b3d Message for commit #2
pick 5c67e61 Message for commit #3
```

---

Cette liste détermine précisément quelle sera la structure de la branche après le rebase. En modifiant la commande pick et/ou en réorganisant les entrées, vous pouvez agencer l'historique de la branche comme bon vous semble. 

Par exemple, si le deuxième commit résout un petit problème dans le premier, vous pouvez les merger en un seul grâce à la commande fixup :

```text
pick 33d5b7a Message for commit #1
fixup 9480b3d Message for commit #2
pick 5c67e61 Message for commit #3
```

---

Lorsque vous enregistrez et fermez le fichier, Git effectue le rebase conformément à vos instructions et vous obtenez un historique de projet semblable au suivant :

![h:450 center](https://wac-cdn.atlassian.com/dam/jcr:a712e238-6cb9-4c8c-8ef7-1975dca49be3/04%20Squashing%20a%20commit%20with%20an%20interactive%20rebase.svg?cdnVersion=185)

---

### Force-push

Si vous tentez de pusher à nouveau la branche principale (main) rebasé vers un dépôt distant, Git vous en empêchera, car elle entre en conflit avec la branche principale (main) distante. Vous pouvez toutefois forcer ce push en utilisant l'argument --force :

```shell
# Soyez très prudent avec cete commande!
$ git push --force
```

---

<!--
_class: lead
-->

![bg right:40% 100%](https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Falexey-anufriev.com%2Fwp-content%2Fuploads%2Fposts%2Fgit-debug%2Fgit-debug.png&f=1&nofb=1)

# **git bisect**

---

## git bisect

La commande `git bisect`permet de déterminer quel commit pécis a causé une anomalie au moyen d'une recherche dichotomique.

En pratique, il faut donner à Git un minimum de deux commits, et il vous permettra de déterminer quel commit a causé l'anomalie.

- le dernier commit où l'anomalie n'est pas présente
- un commit où il a été remarqué que ça ne fonctionne plus, c'est-à-dire que l'anomalie que vous cherchez est apparue (souvent le commit actuel, **HEAD**)

---

### Démarrer la "bisection"

```shell
## Démarrage de la "bisection"
$ git bisect start

## Donner à git un commit là où il n'y a pas de bug
$ git bisect good <commit>

## Donner à git un commit là où il y a un bug
$ git bisect bad <commit>
```

Ou en une seule ligne :

```shell
$ git bisect start HEAD <commit>
```

---

### Déterminer si le commit contient l'anomalie

Maintenant que git nous a mis le commit qui n'a pas l'anomalie, nous pouvons tester si le commit contient l'anomalie.

Nous déterminons manuellement si le commit contient l'anomalie (bab) ou non (good), par exemple via l'exécution de tests automatisés ou bien via un test manuel de l'application.

```shell
$ git bisect good # ou
$ git bisect bad
```

Et répéter, jusqu'à trouver le commmit fautif.

---

### Terminer

Git a donc déterminé que le commit _f5d930f_ contient l'anomalie.

Pour retourner à un état normal, nous terminons la procédure par:

```shell
$ git bisect reset
```

Pour aller plus loin, regarder la [documentation](https://git-scm.com/docs/git-bisect)

```shell
## déterminer automatiquement si le commit est bon ou pas
$ git bisect run ./test.sh 

## restreindre la recherche (seuls les commits affectant ce chemain seront évalués)
$ git bisect start — src/main/java/ 
```

---

### Référence

- Documentation officielle de Git
  - [Git - Documentation (en)](https://git-scm.com/docs)

- Atlassian
  - [Devenez un expert de Git](https://www.atlassian.com/fr/git/tutorials)
  - [Become a git guru (en)](https://www.atlassian.com/git/tutorials)
- [Grafikart](https://grafikart.fr/tutoriels?technology=git)
- GitLab
  - [Git](https://docs.gitlab.com/ee/topics/git/index.html)
  - [Git Cheat Sheet](https://about.gitlab.com/images/press/git-cheat-sheet.pdf)
