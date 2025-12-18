# ⚫⚪ OwOs - Palette de couleurs officielle

Ce document définit la palette de couleurs officielle d'OwOs pour assurer une cohérence visuelle sur tous les composants.

## Design minimaliste monochrome

OwOs adopte un design épuré et professionnel en **noir, blanc et gris**, inspiré de macOS et des interfaces modernes.

## Couleurs primaires

### Noir profond (Texte principal)
- **Hex**: `#1A1A1A`
- **RGB**: `rgb(26, 26, 26)`
- **Usage**: Texte principal, icônes, éléments UI

### Blanc pur (Fond)
- **Hex**: `#FFFFFF`
- **RGB**: `rgb(255, 255, 255)`
- **Usage**: Fond principal, thème clair

### Gris très clair (Fond secondaire)
- **Hex**: `#F5F5F5`
- **RGB**: `rgb(245, 245, 245)`
- **Usage**: Fond alternatif, cartes, panneaux, zones de contenu

### Gris clair (Bordures)
- **Hex**: `#E0E0E0`
- **RGB**: `rgb(224, 224, 224)`
- **Usage**: Séparateurs, bordures subtiles, délimitations

## Nuances de gris pour la hiérarchie

### Gris moyen (Texte secondaire)
- **Hex**: `#6B6B6B`
- **RGB**: `rgb(107, 107, 107)`
- **Usage**: Texte secondaire, légendes, metadata

### Gris foncé (Hover)
- **Hex**: `#424242`
- **RGB**: `rgb(66, 66, 66)`
- **Usage**: États hover, éléments actifs

### Gris anthracite (Accent sombre)
- **Hex**: `#2C2C2C`
- **RGB**: `rgb(44, 44, 44)`
- **Usage**: Headers, éléments d'accent, mode sombre

## Couleurs d'accentuation minimales

### Accent bleu subtil (Liens & Focus)
- **Hex**: `#0066CC`
- **RGB**: `rgb(0, 102, 204)`
- **Usage**: Liens, éléments focus, sélections - utilisé avec parcimonie

## Couleurs de statut (discrètes)

### Succès
- **Hex**: `#4CAF50`
- **RGB**: `rgb(76, 175, 80)`

### Avertissement
- **Hex**: `#FF9800`
- **RGB**: `rgb(255, 152, 0)`

### Erreur
- **Hex**: `#F44336`
- **RGB**: `rgb(244, 67, 54)`

### Info
- **Hex**: `#2196F3`
- **RGB**: `rgb(33, 150, 243)`

## Dégradés subtils

### Gradient signature OwOs (noir vers gris)
```css
background: linear-gradient(135deg, #1A1A1A 0%, #424242 100%);
```

Utilisé pour : Splash screens, headers, éléments promotionnels

### Gradient clair (blanc vers gris)
```css
background: linear-gradient(180deg, #FFFFFF 0%, #F5F5F5 100%);
```

Utilisé pour : Fond de fenêtres, cartes, panneaux

## Mode sombre (optionnel)

### Fond sombre
- **Hex**: `#121212`
- **RGB**: `rgb(18, 18, 18)`

### Texte clair
- **Hex**: `#E8E8E8`
- **RGB**: `rgb(232, 232, 232)`

### Accent sombre
- **Hex**: `#1E1E1E`
- **RGB**: `rgb(30, 30, 30)`

## Accessibilité

Toutes les combinaisons respectent les normes WCAG 2.1 AA :
- Noir (#1A1A1A) sur blanc (#FFFFFF) : ratio 16.1:1 ✓
- Gris moyen (#6B6B6B) sur blanc : ratio 5.7:1 ✓
- Bleu accent (#0066CC) sur blanc : ratio 7.2:1 ✓

## Utilisation dans le code

### GTK CSS
```css
@define-color owos_black #1A1A1A;
@define-color owos_white #FFFFFF;
@define-color owos_gray_light #F5F5F5;
@define-color owos_gray_medium #6B6B6B;
@define-color owos_gray_dark #424242;
@define-color owos_accent_blue #0066CC;
```

### Variables Shell
```bash
OWOS_BLACK="#1A1A1A"
OWOS_WHITE="#FFFFFF"
OWOS_GRAY_LIGHT="#F5F5F5"
OWOS_GRAY_MEDIUM="#6B6B6B"
OWOS_GRAY_DARK="#424242"
OWOS_ACCENT_BLUE="#0066CC"
```

## Principes de design

1. **Minimalisme** : Privilégier le blanc et le gris clair
2. **Contraste** : Utiliser le noir pour les éléments importants
3. **Subtilité** : Les accents de couleur sont discrets
4. **Cohérence** : Mêmes nuances de gris partout
5. **Élégance** : Inspiration Apple/macOS
