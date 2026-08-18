# 🚀 Guide de Démarrage - Constellation

## Bienvenue dans Constellation ! 🌌

Ce guide te montre comment démarrer rapidement avec le hub centralisé de tous tes projets.

---

## ⚡ Démarrage Ultra-Rapide (2 minutes)

### Pour les pressés :
```bash
git clone --recursive https://github.com/NickelRamQc94/Constellation.git
cd Constellation
chmod +x scripts/sync_all.sh
./scripts/sync_all.sh
```

**C'est tout !** Tous les projets sont maintenant clonés et prêts à explorer.

---

## 📋 Prérequis

- ✅ Git installé (v2.10+)
- ✅ Bash (pour les scripts)
- ✅ Environ 5GB d'espace disque (pour tous les submodules)
- ✅ Connexion Internet

### Vérifier Git :
```bash
git --version
```

---

## 🔧 Installation Détaillée

### Étape 1 : Cloner le dépôt
```bash
git clone https://github.com/NickelRamQc94/Constellation.git
cd Constellation
```

### Étape 2 : Initialiser les submodules

**Option A : Automatique (Recommandé)**
```bash
chmod +x scripts/sync_all.sh
./scripts/sync_all.sh
```

**Option B : Manuelle**
```bash
git submodule update --init --recursive
git submodule foreach git pull origin main
```

### Étape 3 : Vérifier l'installation
```bash
./scripts/health_check.sh
```

Tu devrais voir :
```
✓ gemini-jr-nickel (branche: main) - SAIN
✓ golden-axe-theory (branche: main) - SAIN
✓ 1st-symbiotic-artificial (branche: main) - SAIN
...
```

---

## 📂 Structure du Dépôt

```
Constellation/
├── README.md                 # Vue d'ensemble
├── PROJECTS.md              # Index complet des projets
├── ARCHITECTURE.md          # Diagrammes & structure
├── GETTING_STARTED.md       # Ce fichier
├── ROADMAP.md               # Vision à long terme
│
├── projects/                # Tous les submodules
│   ├── gemini-jr-nickel/
│   ├── golden-axe-theory/
│   ├── 1st-symbiotic-artificial/
│   └── ... (27+ autres)
│
├── scripts/                 # Scripts d'automatisation
│   ├── sync_all.sh         # Clone et synchronise
│   ├── update_all.sh       # Mise à jour
│   └── health_check.sh     # Vérification santé
│
├── diagrams/                # Architecture visuelle
│   └── architecture.md
│
└── docs/                    # Documentation avancée
    ├── FAQ.md
    └── CONTRIBUTING.md
```

---

## 🎯 Cas d'Usage Courants

### 📖 Je veux explorer les projets
```bash
cd projects/gemini-jr-nickel
ls -la
```

### 🔄 Je veux mettre à jour tous les projets
```bash
./scripts/update_all.sh
```

### 🏥 Je veux vérifier la santé de l'écosystème
```bash
./scripts/health_check.sh
```

### 🤝 Je veux contribuer à un projet
1. Entre dans le répertoire du projet
2. Crée une branche
3. Fais tes modifications
4. Crée une pull request

Voir `docs/CONTRIBUTING.md` pour plus de détails.

### 🔍 Je cherche un projet spécifique
Consulte `PROJECTS.md` qui contient l'index complet avec liens.

---

## 🛠️ Scripts Disponibles

### `sync_all.sh`
**Objectif** : Clone et synchronise tout

```bash
./scripts/sync_all.sh
```

**Fait** :
- Clone le repo s'il n'existe pas
- Initialise tous les submodules
- Télécharge les dernières versions
- Affiche un rapport

### `update_all.sh`
**Objectif** : Mise à jour complète

```bash
./scripts/update_all.sh
```

**Fait** :
- Met à jour chaque submodule
- Récupère toutes les branches
- Switche sur main

### `health_check.sh`
**Objectif** : Vérifier l'intégrité

```bash
./scripts/health_check.sh
```

**Affiche** :
- État de chaque projet
- Branches actuelles
- Changements non validés
- Résumé de santé

---

## 📊 Documentation Complète

| Document | Lire si... |
|----------|----------|
| **README.md** | Tu veux une vue d'ensemble |
| **ARCHITECTURE.md** | Tu veux comprendre comment tout est connecté |
| **PROJECTS.md** | Tu cherches un projet spécifique |
| **ROADMAP.md** | Tu veux voir la vision future |
| **docs/FAQ.md** | Tu as des questions |
| **docs/CONTRIBUTING.md** | Tu veux contribuer |

---

## ⚠️ Dépannage Courant

### "Git submodule not found"
```bash
# Réinitialiser les submodules
git submodule deinit -all
git submodule update --init --recursive
```

### "Permission denied" sur les scripts
```bash
chmod +x scripts/*.sh
```

### "Disk space" insuffisant
Assure-toi d'avoir au moins 5GB de libre. Si tu veux cloner que certains projets :
```bash
# Clone sans submodules
git clone https://github.com/NickelRamQc94/Constellation.git --no-recurse-submodules
```

### "Network error"
Attends un peu et réessaie, ou utilise un VPN si nécessaire.

---

## 🚀 Prochaines Étapes

1. ✅ Cloner Constellation
2. ✅ Lire `ARCHITECTURE.md`
3. ✅ Consulter `PROJECTS.md`
4. ✅ Explorer les projets
5. ✅ Contribuer ou signaler des problèmes
6. ✅ Lire `docs/CONTRIBUTING.md`

---

## 💡 Tips & Tricks

### Mettre à jour rapidement un seul projet
```bash
cd projects/gemini-jr-nickel
git pull origin main
cd ../..
```

### Voir tous les commits récents
```bash
for dir in projects/*/; do
  echo "\n=== $(basename $dir) ==="
  cd "$dir"
  git log --oneline -3
  cd ../..
done
```

### Chercher du texte dans tous les projets
```bash
git grep "term" -- projects/
```

---

## 📞 Support

- **Questions ?** Voir `docs/FAQ.md`
- **Bug ?** Créer une issue
- **Contribution ?** Voir `docs/CONTRIBUTING.md`

---

**Bienvenue dans Constellation !** 🌌  
**Bon développement !** 🚀
