#!/bin/sh

## README
# /!\ Ce script d'installation est conçu pour mon usage. Ne le lancez pas sans vérifier chaque commande ! /!\

# Sources :
# https://github.com/nicolinuxfr/macOS-post-installation
# https://www.macg.co/logiciels/2017/02/comment-synchroniser-les-preferences-des-apps-avec-mackup-97442
# https://github.com/OzzyCzech/dotfiles/blob/master/.osx

# Demande du mot de passe administrateur dès le départ
sudo -v

# Keep-alive: met à jour le timestamp de `sudo`
# tant que `post-install.sh` n'est pas terminé
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

## LA BASE : Homebrew et les lignes de commande
if test ! $(which brew)
then
  echo "Installation de Homebrew"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Ajout des binaires Homebrew au PATH
echo 'export PATH="/usr/local/sbin:$PATH"' >> ~/.zshrc

# Mettre à jour la liste des applications disponibles
brew update

# Installer Dropbox au plus tôt pour lancer la synchro des settings
brew install google-backup-and-sync
echo "Ouverture de Google Backup and Sync pour commencer la synchronisation"
open -a Backup\ and\ Sync

# Installer les nouvelles applications du bundle Brewfile
# et mettre à jour celles déjà présentes
brew bundle

# echo "Finalisation de l'installation de The Fuck avec l'alias \"whoops\""
# echo 'eval "$(thefuck --alias whoops)"' >> ~/.zshrc

# echo "Installation des outils de développement Ruby"
# Mise à jour de RubyGems
# sudo gem update --system --silent
# Installation de RVM
# gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
# curl -sSL https://get.rvm.io | bash -s stable --ruby
# Installation de Bundler
# sudo gem install bundler

# echo "Installation des outils de développement Node"
# Installation de composants Node
# npm install -g npm

echo "Installation d'applications en Node"
# De meilleures aides en ligne : http://tldr.sh/
npm install -g tldr
# npm install -g http-serve

# echo "Finalisation de l'installation de PHP"
# echo 'export PATH="$(brew --prefix homebrew/php/php71)/bin:$PATH"' >> ~/.zshrc
# brew services start homebrew/php/php71
# brew services start homebrew/apache/httpd24

## ************************* CONFIGURATION ********************************
## Removed all configuration from this script
## Started using https://github.com/juliennicouleaud/macOS-Defaults instead

## ************ Fin de l'installation *********
echo "Finder et Dock relancés… redémarrage nécessaire pour terminer."
killall Dock
killall Finder

echo "Derniers nettoyages…"
brew cleanup
rm -f -r /Library/Caches/Homebrew/*

echo ""
echo "ET VOILÀ !"
echo "Après synchronisation des données Google Drive (seuls les dossiers « Mackup » et « Settings » sont nécessaires dans un premier temps), lancer le script post-cloud.sh"
