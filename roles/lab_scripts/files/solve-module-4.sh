#!/bin/bash
#
# Script: solve-module-4.sh
# Purpose: Complete all steps for Module 4
# Steps: Configure ACS + Test Image Scanning
#

set -e

echo "========================================="
echo "Solving Module 4: Policy Enforcement"
echo "========================================="
echo ""

# Step 0: Reset Module 4
echo "Running Step 0: Reset Module 4..."
echo "=================================="
bash ~/lab-assets/reset-module-4.sh
echo ""

# Step 1: Configure ACS-Quay Integration
echo "Running Step 1: Configure ACS..."
echo "================================="
bash ~/lab-assets/configure-acs.sh
echo ""

# Step 2: Test Image Scanning
echo "Running Step 2: Test Image Scanning..."
echo "======================================="
bash ~/lab-assets/test-image-scanning.sh
echo ""

echo "========================================="
echo "Module 4 Complete!"
echo "========================================="
echo ""
echo "Summary:"
echo "  ✓ ACS-Quay integration configured"
echo "  ✓ Image scanning tested with roxctl"
echo "  ✓ Policy checks verified"
echo "  ✓ Ready for supply chain policy enforcement"
echo ""
