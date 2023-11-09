# macOS-Init

Ce script permet d'automatiser l'installation et la mise à jour via [Homebrew](https://brew.sh "Homebrew — The missing package manager for macOS") des logiciels que j'utilise habituellement sur Mac.

## Prérequis

- Être administrateur du Mac
- Être connecté au préalable à l'App Store
- Les apps à installer depuis l'App Store doivent déjà être associées à votre compte Apple

## Dépendances

- [Homebrew](https://brew.sh "Homebrew — The missing package manager for macOS")
- [mas](https://github.com/mas-cli/mas) pour installer les apps de l'App Store

## Exécution

- Téléchargez la dernière version du projet ([lien direct](https://github.com/juliennicouleaud/macOS-init/archive/master.zip))
- Ouvrez les fichiers `post-install.sh` et `Brewfile`, et modifiez ce qui est installé par défaut
- Ou lancez directement son exécution :

```shell
curl -sfL https://raw.githubusercontent.com/juliennicouleaud/macOS-init/master/run.sh | sh
```

Le script fonctionnera largement sans votre intervention, sauf :

- pour valider l'installation de Homebrew
- pour saisir le mot de passe administrateur pour Homebrew
- pour certains logiciels qui nécessitent un accès admin

## Support

- Version actuelle testée sur macOS Ventura (Architecture M1)
- *Testé auparavant sur macOS Big Sur, High Sierra, Mojave, Catalina - Intel*

## Crédits

Ce script est adapté et emprunté à [Nicolas Hoizey](https://github.com/nhoizey/macOS-init) et [Boris Schapira](https://github.com/borisschapira/macOS-init). Il est très largement inspiré de [celui de Nicolas Furno](https://github.com/nicolinuxfr/macOS-post-installation), qu'il a [décrit dans un article MacGénération](https://www.macg.co/logiciels/2017/01/un-script-pour-configurer-automatiquement-un-nouveau-mac-96652).
