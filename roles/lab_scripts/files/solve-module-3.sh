#!/bin/bash
#
# Script: solve-module-3.sh
# Purpose: Complete all steps for Module 3
# Steps: Create Developer User + Create ConfigMap + Create Pipeline Secrets
#

set -e

echo "========================================="
echo "Solving Module 3: Developer Setup"
echo "========================================="
echo ""

# Step 0: Reset Module 3
echo "Running Step 0: Reset Module 3..."
echo "=================================="
bash ~/lab-assets/reset-module-3.sh
echo ""

# Step 1: Create Developer User
echo "Running Step 1: Create Developer User..."
echo "========================================="
bash ~/lab-assets/create-developer-user.sh
echo ""

# Step 2: Create Dev Spaces ConfigMap
echo "Running Step 2: Create Dev Spaces ConfigMap..."
echo "==============================================="
bash ~/lab-assets/create-devspaces-configmap.sh
echo ""

# Step 3: Create Pipeline Secrets
echo "Running Step 3: Create Pipeline Secrets..."
echo "==========================================="
bash ~/lab-assets/create-pipeline-secrets.sh
echo ""

echo "========================================="
echo "Module 3 Complete!"
echo "========================================="
echo ""
echo "Summary:"
echo "  ✓ Developer user created in Keycloak"
echo "  ✓ User assigned to tssc and users groups"
echo "  ✓ Dev Spaces ConfigMap created with TAS URLs"
echo "  ✓ Pipeline secrets created:"
echo "    - tpa-secret (RHTPA authentication)"
echo "    - gitlab-auth-secret (GitLab authentication)"
echo ""
echo "The developer environment is now fully configured!"
echo ""
