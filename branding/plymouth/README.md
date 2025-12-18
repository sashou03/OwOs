# 🚀 Thème Plymouth OwOs

Ce dossier contient le thème Plymouth pour l'écran de boot d'OwOs.

## Description

Le thème Plymouth affiche le logo OwOs avec une animation de chargement minimaliste pendant le démarrage du système.

**Caractéristiques :**
- Logo OWO centré
- Animation de chargement élégante (spinner)
- Design noir/blanc/gris monochrome
- Compatible avec tous types d'écrans

## Fichiers

```
branding/plymouth/
├── owos-logo.png          # Logo OwOs haute résolution (512x512)
├── owos.plymouth          # Fichier de configuration Plymouth
└── owos.script            # Script d'animation
```

## Installation

Le thème Plymouth sera installé automatiquement lors du build de l'ISO.

Pour l'installer manuellement sur un système existant :

```bash
# Copier le thème
sudo cp -r branding/plymouth/owos /usr/share/plymouth/themes/

# Mettre à jour initramfs
sudo update-alternatives --install /usr/share/plymouth/themes/default.plymouth default.plymouth /usr/share/plymouth/themes/owos/owos.plymouth 100

# Sélectionner le thème
sudo update-alternatives --config default.plymouth
# Choisir owos

# Mettre à jour initramfs
sudo update-initramfs -u
```

## Aperçu

Au démarrage, l'utilisateur verra :
1. Fond blanc
2. Logo OWO centré
3. Animation de chargement en dessous
4. Transition fluide vers GDM

## Personnalisation

Pour modifier le thème :
1. Éditer `owos.script` pour changer l'animation
2. Remplacer `owos-logo.png` pour changer le logo
3. Modifier les couleurs dans le script

## Note technique

Le thème utilise le moteur "script" de Plymouth pour une flexibilité maximale et des animations fluides.
