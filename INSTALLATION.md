# 🚀 Guide d'Installation et de Test OwOs

Ce guide complet vous permettra de construire et tester OwOs de A à Z.

## 💻 Prérequis

### Matériel requis :
- **CPU** : 2 cœurs minimum (4 cœurs recommandés)
- **RAM** : 4 Go minimum (8 Go recommandés)
- **Disque** : 20 Go d'espace libre
- **Connexion Internet** : Stable et rapide

### Environnement de build :
Vous pouvez construire OwOs sur :
- ✅ **Debian 12 (Bookworm)** - Recommandé
- ✅ **Ubuntu 22.04/24.04**
- ✅ **Proxmox LXC** (conteneur Debian)
- ❌ **Windows/macOS** (utilisez une VM Linux)

---

## 🛠️ Étape 1 : Préparer l'environnement

### Sur Debian/Ubuntu (bare metal ou VM) :

```bash
# Mettre à jour le système
sudo apt update && sudo apt upgrade -y

# Installer les dépendances
sudo apt install -y git live-build debootstrap xorriso squashfs-tools syslinux-common isolinux

# Vérifier l'installation
lb --version
```

### Sur Proxmox (conteneur LXC) :

1. **Créer un conteneur Debian 12** :
   - Template : `debian-12-standard`
   - RAM : 4096 Mo minimum
   - Disque : 20 Go
   - **Important** : Activer "Nesting" et "FUSE" dans les options

2. **Se connecter au conteneur** :
```bash
pct enter <ID_CONTENEUR>
```

3. **Installer les dépendances** :
```bash
apt update && apt upgrade -y
apt install -y git live-build debootstrap xorriso squashfs-tools syslinux-common isolinux
```

---

## 📋 Étape 2 : Cloner le dépôt

```bash
# Se placer dans le répertoire de travail
cd /root  # ou ~/

# Cloner le dépôt OwOs
git clone https://github.com/sashou03/OwOs.git

# Entrer dans le répertoire
cd OwOs

# Vérifier le contenu
ls -la
```

Vous devriez voir :
```
branding/
build/
scripts/
README.md
WINDOWS-SUPPORT.md
INSTALLATION.md
```

---

## ⚡ Étape 3 : Construire l'ISO

### Méthode automatique (recommandée) :

```bash
# Rendre le script exécutable
chmod +x scripts/build.sh

# Lancer la construction
bash scripts/build.sh
```

### Ce que fait le script :
1. ✅ Nettoie l'environnement précédent
2. ✅ Configure Live-Build
3. ✅ Copie les fichiers de configuration
4. ✅ Intègre le branding OwOs
5. ✅ Ajoute le support Windows
6. ✅ Génère l'ISO

### Temps de construction :
- **Première fois** : 10-30 minutes (selon votre connexion)
- **Reconstructions** : 5-15 minutes

### Suivre la progression :
```bash
# Le script affiche les étapes :
[1/5] Nettoyage de l'environnement précédent...
[2/5] Configuration Live-Build...
[3/5] Copie des fichiers de configuration...
[4/5] Génération de l'ISO (cela peut prendre 10-30 min)...
[5/5] ISO généré avec succès!
[6/6] Ajout du support Windows (Wine + WinApps)...
```

---

## 📦 Étape 4 : Récupérer l'ISO

### Trouver l'ISO généré :

```bash
# L'ISO se trouve dans :
ls -lh build/live-image-amd64.hybrid.iso

# Vérifier la taille (environ 800 Mo - 1.5 Go)
du -h build/live-image-amd64.hybrid.iso
```

### Copier l'ISO depuis Proxmox :

```bash
# Depuis votre machine locale (remplacez 100 par l'ID de votre conteneur)
scp root@proxmox-ip:/var/lib/lxc/100/rootfs/root/OwOs/build/live-image-amd64.hybrid.iso ~/OwOs.iso
```

### Ou utiliser l'interface Proxmox :
1. Copier l'ISO vers `/var/lib/vz/template/iso/`
2. Accéder via l'interface web Proxmox

---

## 🧪 Étape 5 : Tester en VM

### Option A : VirtualBox

1. **Créer une nouvelle VM** :
   - Nom : OwOs Test
   - Type : Linux
   - Version : Debian (64-bit)
   - RAM : 2048 Mo minimum
   - Disque : 20 Go (optionnel pour test Live)

2. **Configuration** :
   - Système > Activer EFI
   - Stockage > Contrôleur IDE > Ajouter l'ISO
   - Affichage > Mémoire vidéo : 128 Mo
   - Accélération 3D : Activée

3. **Démarrer la VM**

### Option B : Proxmox VM

```bash
# Créer une VM depuis l'interface web :
# - OS : OwOs ISO
# - CPU : 2 cœurs
# - RAM : 2048 Mo
# - Disque : 20 Go
# - BIOS : UEFI
```

### Option C : QEMU (ligne de commande)

```bash
# Test rapide en mode Live
qemu-system-x86_64 \
  -enable-kvm \
  -m 2048 \
  -cdrom build/live-image-amd64.hybrid.iso \
  -boot d
```

---

## ✅ Étape 6 : Premier démarrage

### Au démarrage de l'ISO :

1. **Menu de boot** :
   - Sélectionner : `OwOs Live (amd64)`
   - Appuyer sur Entrée

2. **Chargement** :
   - Attendre 30-60 secondes
   - GNOME devrait se lancer automatiquement

3. **Session Live** :
   - Utilisateur : `user` (auto-login)
   - Pas de mot de passe requis

### 🔍 Ce qu'il faut tester :

#### Interface :
- ☑️ Design flat avec palette noir/blanc/gris
- ☑️ Dock en bas de l'écran
- ☑️ Thème clair activé par défaut
- ☑️ Logo OwOs visible

#### Système :
```bash
# Ouvrir un terminal (Activités > Terminal)

# Vérifier l'identité OwOs
cat /etc/os-release
# Devrait afficher : NAME="OwOs"

# Tester neofetch
neofetch
# Logo OwOs avec infos système

# Vérifier les performances
htop
```

#### Applications préinstallées :
- ☑️ Firefox
- ☑️ VLC
- ☑️ LibreOffice
- ☑️ Outils bureautiques

---

## 🪟 Tester le support Windows (optionnel)

```bash
# Dans la session Live, ouvrir un terminal

# Lancer le script d'installation
sudo install-windows-support.sh

# Choisir une option :
# 1) Wine uniquement
# 2) WinApps uniquement  
# 3) Les deux

# Tester Wine
wine --version
winecfg  # Ouvre la configuration
```

---

## 💾 Installation permanente

Si tu veux installer OwOs sur le disque :

1. **Lancer l'installateur** :
   - Activités > "Install"
   - Suivre l'assistant Debian Installer

2. **Partitionnement** :
   - Automatique recommandé
   - Ou manuel si besoin

3. **Après installation** :
   - Redémarrer
   - Retirer l'ISO
   - Profiter d'OwOs !

---

## ⚠️ Dépannage

### Le build échoue :

```bash
# Nettoyer complètement
cd /root/OwOs
rm -rf build
mkdir build

# Réessayer
bash scripts/build.sh
```

### Problèmes réseau pendant le build :

```bash
# Vérifier la connexion
ping -c 3 deb.debian.org

# Changer de miroir si nécessaire
nano build/config/archives/debian.list.chroot
```

### L'ISO ne boot pas :

- Vérifier que le BIOS/UEFI est correctement configuré
- Essayer en mode Legacy au lieu d'UEFI
- Vérifier l'intégrité de l'ISO : `md5sum build/live-image-*.iso`

### Proxmox LXC : permission denied :

```bash
# Activer les features nécessaires
pct set <ID> -features nesting=1,fuse=1
pct reboot <ID>
```

---

## 📊 Récapitulatif des commandes

```bash
# Installation complète en 6 commandes :
sudo apt update && sudo apt install -y git live-build debootstrap xorriso squashfs-tools
git clone https://github.com/sashou03/OwOs.git
cd OwOs
chmod +x scripts/build.sh
bash scripts/build.sh
ls -lh build/live-image-amd64.hybrid.iso
```

---

## 📚 Ressources supplémentaires

- 📖 [README.md](README.md) - Présentation générale
- 🪟 [WINDOWS-SUPPORT.md](WINDOWS-SUPPORT.md) - Guide Wine/WinApps
- 🐛 [Issues GitHub](https://github.com/sashou03/OwOs/issues) - Signaler un problème

---

## 🎉 Félicitations !

Tu as maintenant construit et testé OwOs ! N'hésite pas à :
- Personnaliser davantage le système
- Contribuer au projet
- Partager tes retours

---

*OwOs - Simple, rapide, élégant - Inspiré de macOS*
