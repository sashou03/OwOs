#!/bin/bash
# Script de build automatique OwOs ISO
# Ce script génère l'image ISO d'OwOs avec GNOME minimal optimisé

set -e

echo "======================================"
echo "  OwOs Build Script - ISO Generator  "
echo "======================================"
echo ""

# Vérifier les dépendances
if ! command -v lb &> /dev/null; then
    echo "[ERREUR] live-build n'est pas installé."
    echo "Installez-le avec : apt install live-build"
    exit 1
fi

echo "[1/5] Nettoyage de l'environnement précédent..."
cd build
lb clean --purge

echo "[2/5] Configuration Live-Build..."
lb config \
    --mode debian \
    --architectures amd64 \
    --distribution bookworm \
    --debian-installer false \
    --archive-areas "main contrib non-free non-free-firmware" \
    --bootappend-live "boot=live components quiet splash" \
    --iso-application "OwOs" \
    --iso-volume "OwOs-1.0"

echo "[3/5] Copie des fichiers de configuration..."
# Les fichiers dans build/config sont déjà en place grâce au repo

echo "[4/5] Génération de l'ISO (cela peut prendre 10-30 min)..."
lb build

echo "[5/5] ISO générée avec succès!"
echo ""
echo "Fichier ISO : build/live-image-amd64.hybrid.iso"
echo ""
echo "Pour tester :"
echo "  qemu-system-x86_64 -cdrom build/live-image-amd64.hybrid.iso -m 2G"
echo ""
echo "Pour graver sur clé USB :"
echo "  dd if=build/live-image-amd64.hybrid.iso of=/dev/sdX bs=4M status=progress"
echo ""

# [6/6] Intégration du support Windows
echo "[6/6] Ajout du support Windows (Wine + WinApps)..."

# Copier le script d'installation Windows
cp scripts/install-windows-support.sh build/config/includes.chroot/usr/local/bin/
chmod +x build/config/includes.chroot/usr/local/bin/install-windows-support.sh

# Copier la configuration Wine
mkdir -p build/config/includes.chroot/etc/owos
cp scripts/wine.reg build/config/includes.chroot/etc/owos/

echo "Support Windows intégré !"
echo "Les utilisateurs pourront installer Wine/WinApps via : install-windows-support.sh"
echo ""
