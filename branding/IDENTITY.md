# Identité système OwOs

Ce document décrit comment l'identité système d'OwOs a été configurée pour le rendre unique.

## Modifications apportées

### 1. /etc/os-release

Fichier personnalisé remplaçant toutes les références Debian :
- `PRETTY_NAME="OwOs"`
- `NAME="OwOs"`
- `ID=owos`
- `VERSION="1.0 (OWO)"`
- Liens vers le dépôt GitHub

### 2. MOTD (Message of the Day)

Message d'accueil avec logo ASCII OwOs.

### 3. Hostname

Nom d'hôte par défaut : `owos`

### 4. Neofetch

Configuration personnalisée affichant "OwOs" avec palette monochrome (noir/blanc/gris).

### 5. GDM (Ecran de connexion)

Thème CSS personnalisé avec couleurs monochrome pour l'écran de connexion GNOME.

## Fichiers concernés

- `build/config/includes.chroot/etc/os-release`
- `build/config/includes.chroot/etc/motd`
- `build/config/includes.chroot/etc/hostname`
- `build/config/includes.chroot/etc/skel/.config/neofetch/config.conf`
- `build/config/includes.chroot/usr/share/gnome-shell/theme/owos-gdm.css`
