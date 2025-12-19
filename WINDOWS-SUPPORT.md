# 🪟 Support des Applications Windows sur OwOs

OwOs offre la possibilité d'exécuter des applications Windows grâce à deux solutions complémentaires.

## 📋 Solutions disponibles

### 1. Wine - Exécution locale

**Wine** permet d'exécuter des applications Windows directement sur OwOs sans avoir besoin d'une machine virtuelle.

#### Caractéristiques :
- ✅ Exécution native (pas de VM)
- ✅ Meilleures performances
- ✅ Intégration complète avec le système
- ⚠️ Compatibilité variable selon les applications

#### Utilisation :
```bash
# Exécuter un programme Windows
wine mon-application.exe

# Configuration de Wine
winecfg

# Installer des composants supplémentaires
winetricks
```

### 2. WinApps - Applications distantes

**WinApps** connecte OwOs à une machine virtuelle Windows (via RDP) et affiche les applications Windows comme si elles étaient natives.

#### Caractéristiques :
- ✅ Compatibilité totale Windows
- ✅ Applications apparaissent dans le menu GNOME
- ✅ Intégration du presse-papier
- ⚠️ Nécessite une VM Windows accessible

#### Prérequis :
- Une machine Windows accessible via RDP
- Connexion réseau stable

## 🚀 Installation

### Installation automatique

Exécutez le script d'installation :

```bash
sudo bash /usr/local/bin/install-windows-support.sh
```

Le script vous proposera :
1. **Wine uniquement** - Pour applications locales
2. **WinApps uniquement** - Pour accès à une VM Windows
3. **Les deux** - Solution complète

### Installation manuelle de Wine

```bash
# Installation
sudo apt update
sudo apt install -y wine wine64 wine32 winetricks

# Configuration
regedit /etc/owos/wine.reg
```

### Installation manuelle de WinApps

```bash
# Cloner le dépôt
git clone https://github.com/Fmstrat/winapps.git
cd winapps

# Configuration
cp ~/.config/winapps/winapps.conf.example ~/.config/winapps/winapps.conf

# Éditer la configuration
nano ~/.config/winapps/winapps.conf
```

## ⚙️ Configuration

### Configuration Wine

Le fichier `/etc/owos/wine.reg` contient les paramètres optimisés :
- Rendu DirectX via OpenGL
- Support DXGI natif
- Mémoire vidéo allouée : 2048 Mo
- Pilotes audio ALSA

### Configuration WinApps

Éditez `~/.config/winapps/winapps.conf` :

```ini
RDP_IP="192.168.1.100"
RDP_USER="votre_utilisateur"
RDP_PASS="votre_mot_de_passe"
RDP_DOMAIN=""
RDP_SCALE=100
RDP_FLAGS=""
```

## 🎯 Applications recommandées

### Avec Wine :
- Notepad++
- 7-Zip
- Applications légères et anciennes

### Avec WinApps :
- Microsoft Office
- Adobe Creative Suite
- Applications métier spécifiques

## 🔧 Dépannage

### Wine ne démarre pas
```bash
# Réinitialiser la configuration Wine
rm -rf ~/.wine
wineboot
```

### WinApps ne se connecte pas
```bash
# Vérifier la connectivité RDP
xfreerdp /v:IP_WINDOWS /u:UTILISATEUR

# Vérifier les logs
cat ~/.local/share/winapps/winapps.log
```

### Problèmes de performances
- Wine : Réduire les effets graphiques dans `winecfg`
- WinApps : Ajuster `RDP_SCALE` dans la configuration

## 📚 Ressources

- [Documentation Wine](https://www.winehq.org/documentation)
- [WinApps sur GitHub](https://github.com/Fmstrat/winapps)
- [Base de données de compatibilité Wine](https://appdb.winehq.org/)

## 💡 Conseils

1. **Testez d'abord avec Wine** pour les applications simples
2. **Utilisez WinApps** pour les applications critiques nécessitant une compatibilité parfaite
3. **Configurez les deux** pour une flexibilité maximale
4. **Maintenez Wine à jour** : `sudo apt update && sudo apt upgrade wine*`

---

*Intégration Windows sur OwOs - Simple, efficace, transparent*
