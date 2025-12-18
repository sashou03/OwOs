# OwOs

<div align="center">
  <h3>🐾 Un OS Debian GNOME minimal et optimisé avec un design flat moderne 🐾</h3>
  <p><em>Simple, rapide, élégant - inspiré de macOS</em></p>
</div>

## 🎯 Objectif

OwOs est une distribution Linux basée sur **Debian stable (Bookworm)** avec un environnement GNOME minimal, optimisé pour offrir une expérience utilisateur fluide et moderne.

### ✨ Caractéristiques

- 🎨 **Design flat moderne** avec thème clair par défaut
- 📦 **GNOME minimal** (gnome-core) sans bloatware
- 🐾 **Dock en bas** à la macOS (Dash to Dock préconfiguré)
- ⚡ **Optimisé pour les performances** (indexation désactivée, animations limitées)
- 💻 **Applications essentielles** : Firefox, VLC, outils bureautique
- 🔧 **Utilisateur final** : idéal pour usage quotidien (web, multimédia, bureautique)

---

## 🛠️ Prérequis

### Pour construire l'ISO

Vous avez besoin d'une **machine Debian ou Ubuntu** avec :

```bash
apt update
apt install -y git live-build debootstrap squashfs-tools xorriso
```

### Pour tester

- **VM** : QEMU, VirtualBox, VMware
- **Clé USB** : 8 Go minimum
- **PC physique** : 2 Go RAM minimum (4 Go recommandé)

---

## 📍 Construction de l'ISO

### Étape 1 : Cloner le repo

```bash
git clone https://github.com/sashou03/OwOs.git
cd OwOs
```

### Étape 2 : Exécuter le script de build

```bash
chmod +x scripts/build.sh
./scripts/build.sh
```

Le script va :
1. Vérifier les dépendances
2. Configurer Live-Build
3. Générer l'ISO (10-30 min selon votre machine)

➡️ L'ISO finale sera dans : `build/live-image-amd64.hybrid.iso`

---

## 🖥️ Test de l'ISO

### Option 1 : QEMU (rapide)

```bash
qemu-system-x86_64 -cdrom build/live-image-amd64.hybrid.iso -m 2G -enable-kvm
```

### Option 2 : VirtualBox

1. Créer une nouvelle VM Linux (Debian 64-bit)
2. Allouer 2 Go RAM minimum
3. Attacher l'ISO comme disque optique
4. Démarrer

### Option 3 : Clé USB bootable

⚠️ **Attention** : cela effacera toutes les données sur la clé USB !

```bash
dd
```

Remplacez `/dev/sdX` par votre clé USB (vérifiez avec `lsblk`).

---

## 📚 Structure du projet

```
OwOs/
├── build/
│   └── config/
│       ├── package-lists/
│       │   └── owos-desktop.list.chroot  # Liste des paquets GNOME
│       └── includes.chroot/
│           └── etc/skel/.config/
│               └── owos-setup.sh  # Config thème + dock
├── scripts/
│   └── build.sh  # Script de build automatique
└── README.md
```

---

## 🆘 FAQ

### Comment personnaliser les paquets installés ?

Éditez `build/config/package-lists/owos-desktop.list.chroot` et ajoutez/retirez des paquets.

### Comment changer le thème ou le dock ?

Éditez `build/config/includes.chroot/etc/skel/.config/owos-setup.sh`.

### Ça ne marche pas !

Vérifiez que :
- Vous êtes sur Debian/Ubuntu
- `live-build` est installé
- Vous êtes connecté en root
- Vous avez assez d'espace disque (5 Go minimum)

---

## 🤝 Contribution

Les contributions sont les bienvenues ! N'hésitez pas à :
- Ouvrir une issue
- Proposer une pull request
- Partager vos idées

---

## 📜 Licence

OwOs est sous licence MIT. Utilisez-le librement !

---

<div align="center">
  <p>Fait avec ❤️ par <a href="https://github.com/sashou03">sashou03</a></p>
</div>
