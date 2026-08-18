#!/bin/bash
# =====================================================================
# CONSTELLATION - Health Check Script
# Vérifie l'intégrité et l'état de tous les submodules
# =====================================================================

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}🏥 ============================================${NC}"
echo -e "${BLUE}🏥   CONSTELLATION - Health Check${NC}"
echo -e "${BLUE}🏥 ============================================${NC}\n"

HEALTHY=0
UNHEALTHY=0

echo -e "${YELLOW}Vérification des submodules...${NC}\n"

if [ -d "projects" ]; then
    cd projects
    
    for dir in */; do
        PROJECT_NAME="${dir%/}"
        
        if [ -d "$PROJECT_NAME/.git" ]; then
            cd "$PROJECT_NAME"
            
            # Vérifier le statut
            STATUS=$(git status --porcelain)
            BRANCH=$(git rev-parse --abbrev-ref HEAD)
            
            if [ -z "$STATUS" ]; then
                echo -e "  ${GREEN}✓${NC} $PROJECT_NAME (branche: $BRANCH) - SAIN"
                ((HEALTHY++))
            else
                echo -e "  ${RED}✗${NC} $PROJECT_NAME (branche: $BRANCH) - CHANGEMENTS NON VALIDÉS"
                ((UNHEALTHY++))
            fi
            
            cd ..
        fi
    done
    
    cd ..
fi

echo ""
echo -e "${BLUE}📊 ============================================${NC}"
echo -e "${BLUE}📊   RÉSUMÉ DE SANTÉ${NC}"
echo -e "${BLUE}📊 ============================================${NC}\n"

echo -e "  ${GREEN}Projets sains:${NC} $HEALTHY"
echo -e "  ${RED}Projets problématiques:${NC} $UNHEALTHY"

echo ""

if [ $UNHEALTHY -eq 0 ]; then
    echo -e "${GREEN}🎉 Tous les projets sont en bon état!${NC}\n"
else
    echo -e "${YELLOW}⚠️  Certains projets ont besoin d'attention.${NC}\n"
fi
