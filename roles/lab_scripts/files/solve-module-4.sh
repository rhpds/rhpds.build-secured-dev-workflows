#!/bin/bash
#
# Script: solve-module-4.sh
# Purpose: Complete all Module 4 steps automatically
#
# This script runs:
# - configure-acs.sh: Configure ACS-Quay integration
# - test-image-scanning.sh: Test image scanning and policy checks

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "========================================"
echo "Solving Module 4: Policy Enforcement"
echo "========================================"
echo ""

# Step 1: Configure ACS-Quay Integration
echo "Running: configure-acs.sh"
echo "----------------------------------------"
"${SCRIPT_DIR}/configure-acs.sh"
echo ""

# Step 2: Test Image Scanning
echo "Running: test-image-scanning.sh"
echo "----------------------------------------"
"${SCRIPT_DIR}/test-image-scanning.sh"
echo ""

echo "========================================"
echo "Module 4 Complete!"
echo "========================================"
echo ""
echo "Summary:"
echo "  ✓ ACS-Quay integration configured"
echo "  ✓ Image scanning tested"
echo "  ✓ Policy checks verified"
echo ""
echo "You can now use ACS to scan images and enforce"
echo "policies as part of your delivery pipeline."
echo ""
