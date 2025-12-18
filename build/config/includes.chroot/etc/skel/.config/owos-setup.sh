#!/bin/bash
# Script de configuration OwOs - Thème clair + Dock en bas
# Exécuté au premier login de l'utilisateur

# Attendre que GNOME Shell soit prêt
sleep 3

# Configuration du thème clair (mode light)
gsettings set org.gnome.desktop.interface color-scheme 'default'
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita'
gsettings set org.gnome.desktop.interface icon-theme 'Adwaita'

# Configuration Dash to Dock - Position en bas
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position 'BOTTOM'
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed true
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 48
gsettings set org.gnome.shell.extensions.dash-to-dock transparency-mode 'FIXED'
gsettings set org.gnome.shell.extensions.dash-to-dock background-opacity 0.8

# Activer Dash to Dock
gnome-extensions enable dash-to-dock@micxgx.gmail.com

# Fond d'écran clair/minimal
gsettings set org.gnome.desktop.background picture-uri 'file:///usr/share/backgrounds/gnome/adwaita-day.jpg'
gsettings set org.gnome.desktop.background picture-uri-dark 'file:///usr/share/backgrounds/gnome/adwaita-day.jpg'

# Performance - Désactiver animations lourdes
gsettings set org.gnome.desktop.interface enable-animations false

# Désactiver indexation Tracker (gourmand en ressources)
gsettings set org.freedesktop.Tracker3.Miner.Files crawling-interval -2
gsettings set org.freedesktop.Tracker3.Miner.Files enable-monitors false
