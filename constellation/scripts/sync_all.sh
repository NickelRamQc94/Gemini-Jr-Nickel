#!/bin/bash
# =====================================================================
# CONSTELLATION - Sync All Projects Script
# Script principal pour cloner et synchroniser tous les submodules
# =====================================================================

set -e

# Couleurs pour l'affichage
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}🌌 ============================================${NC}"
echo -e "${BLUE}🌌   CONSTELLATION - Sync All Projects${NC}"
echo -e "${BLUE}🌌 ============================================${NC}\n"

# Vérifier si Git est installé
if ! command -v git &> /dev/null; then
    echo -e "${RED}❌ Git n'est pas installé. Veuillez installer Git d'abord.${NC}"
    exit 1
fi

echo -e "${GREEN}✅ Git trouvé${NC}"
echo ""

# Étape 1: Clone le repository principal si nécessaire
if [ ! -d ".git" ]; then
    echo -e "${YELLOW}📍 Clonage du dépôt Constellation...${NC}"
    git clone --recursive https://github.com/NickelRamQc94/Constellation.git .
else
    echo -e "${GREEN}✅ Dépôt déjà cloné${NC}"
fi

echo ""

# Étape 2: Initialiser et mettre à jour les submodules
echo -e "${YELLOW}📍 Initialisation des submodules...${NC}"
git submodule update --init --recursive

echo -e "${YELLOW}📍 Mise à jour des submodules...${NC}"
git submodule foreach git pull origin main

echo ""

# Étape 3: Afficher un rapport
echo -e "${BLUE}📊 ============================================${NC}"
echo -e "${BLUE}📊   RAPPORT DE SYNCHRONISATION${NC}"
echo -e "${BLUE}📊 ============================================${NC}\n"

# Compter les submodules
SUBMODULE_COUNT=$(grep -c '\[submodule' .gitmodules 2>/dev/null || echo "0")

echo -e "${GREEN}✅ Submodules synchronisés: $SUBMODULE_COUNT${NC}"
echo ""

# Lister les répertoires de projets
echo -e "${YELLOW}📁 Projets disponibles:${NC}"
if [ -d "projects" ]; then
    cd projects
    for dir in */; do
        if [ -d "$dir/.git" ]; then
            echo -e "  ${GREEN}✓${NC} $dir"
        fi
    done
    cd ..
fi

echo ""
echo -e "${GREEN}🎉 Synchronisation terminée!${NC}"
echo ""
echo -e "${BLUE}ℹ️  Prochaines étapes:${NC}"
echo "  1. cd projects/<project-name>"
echo "  2. Explorez le projet"
echo "  3. Contribuez ou signalez des problèmes"
echo ""
echo -e "${BLUE}📚 Pour plus d'info, consultez GETTING_STARTED.md${NC}\n"
