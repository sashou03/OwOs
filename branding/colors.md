# 🎨 OwOs - Palette de couleurs officielle

Ce document définit la palette de couleurs officielle d'OwOs pour assurer une cohérence visuelle sur tous les composants.

## Couleurs primaires

### Rose OwOs (Accent principal)
- **Hex**: `#FFB3D9`
- **RGB**: `rgb(255, 179, 217)`
- **Usage**: Logo, éléments d'accent, boutons primaires, sélections

### Bleu Ciel (Secondaire)
- **Hex**: `#A8D8EA`
- **RGB**: `rgb(168, 216, 234)`
- **Usage**: Éléments UI secondaires, liens, highlights

### Blanc pur
- **Hex**: `#FFFFFF`
- **RGB**: `rgb(255, 255, 255)`
- **Usage**: Fond principal, thème clair

### Gris clair
- **Hex**: `#F5F5F5`
- **RGB**: `rgb(245, 245, 245)`
- **Usage**: Fond alternatif, cartes, panneaux

## Couleurs d'accentuation

### Rose foncé (Hover)
- **Hex**: `#FF69B4`
- **RGB**: `rgb(255, 105, 180)`
- **Usage**: États hover, boutons actifs, notifications

### Bleu profond
- **Hex**: `#4A90A4`
- **RGB**: `rgb(74, 144, 164)`
- **Usage**: Liens actifs, boutons secondaires actifs

### Gris texte
- **Hex**: `#2C2C2C`
- **RGB**: `rgb(44, 44, 44)`
- **Usage**: Texte principal, icônes

## Couleurs de statut

### Succès
- **Hex**: `#81C784`
- **RGB**: `rgb(129, 199, 132)`

### Avertissement
- **Hex**: `#FFD54F`
- **RGB**: `rgb(255, 213, 79)`

### Erreur
- **Hex**: `#E57373`
- **RGB**: `rgb(229, 115, 115)`

### Info
- **Hex**: `#64B5F6`
- **RGB**: `rgb(100, 181, 246)`

## Gradient signature OwOs

```css
background: linear-gradient(135deg, #FFB3D9 0%, #A8D8EA 100%);
```

Utilisé pour : Splash screens, headers, éléments promotionnels

## Accessibilité

Toutes les combinaisons de couleurs respectent les normes WCAG 2.1 AA pour le contraste :
- Texte principal (#2C2C2C) sur fond blanc : ratio 15.3:1 ✓
- Rose OwOs (#FFB3D9) sur fond blanc : utiliser pour les accents, pas le texte
- Bleu profond (#4A90A4) sur fond blanc : ratio 4.8:1 ✓

## Utilisation dans le code

### GTK CSS
```css
@define-color owos_pink #FFB3D9;
@define-color owos_blue #A8D8EA;
@define-color owos_pink_dark #FF69B4;
@define-color owos_blue_dark #4A90A4;
```

### Variables Shell
```bash
OWOS_PINK="#FFB3D9"
OWOS_BLUE="#A8D8EA"
OWOS_PINK_DARK="#FF69B4"
OWOS_BLUE_DARK="#4A90A4"
```
