#!/bin/bash
# =====================================================================
# CONSTELLATION - Update All Submodules
# Met à jour tous les submodules vers leurs dernières versions
# =====================================================================

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}🔄 Mise à jour de tous les submodules...${NC}\n"

# Mettre à jour tous les submodules
git submodule foreach 'git fetch --all && git checkout origin/main'

echo ""
echo -e "${GREEN}✅ Tous les submodules ont été mis à jour!${NC}\n"
