# lab_scripts

Generate self-contained scripts for Advanced Developer Suite (ADS) RHTPA deployment and SBOM upload.

## Description

This Ansible role generates two self-contained bash scripts:

1. **install-rhtpa.sh** - Installs Red Hat Trusted Profile Analyzer (RHTPA) on OpenShift
2. **upload-sbom.sh** - Uploads an SBOM to RHTPA using the API

These scripts are self-contained and do not rely on external Ansible roles or dependencies beyond basic OpenShift CLI tools.

## Requirements

- OpenShift cluster with admin access
- `oc` command-line tool installed and configured
- Red Hat Build of Keycloak (RHBK) installed and accessible
- For upload-sbom.sh: `curl` and `jq` commands available

## Role Variables

### Namespace Configuration
- `lab_scripts_namespace`: Namespace for RHTPA (default: `trusted-profile-analyzer`)
- `lab_scripts_keycloak_namespace`: Namespace for Keycloak (default: `sso`)

### Script Output
- `lab_scripts_output_dir`: Directory where scripts are generated (default: `/tmp/ads-scripts`)

### Operator Configuration
- `lab_scripts_channel`: Operator channel (default: `stable-v1.0`)
- `lab_scripts_catalogsource_image`: Catalog source image
- `lab_scripts_catalogsource_tag`: Catalog source tag

### Database Configuration
- `lab_scripts_pgsql_password`: PostgreSQL password
- `lab_scripts_pgsql_database`: PostgreSQL database name (default: `trustify`)
- `lab_scripts_pgsql_user`: PostgreSQL user (default: `trustify`)

### Keycloak Configuration
- `lab_scripts_keycloak_realm`: Keycloak realm name (default: `tpa`)
- `lab_scripts_admin_username`: RHTPA admin username
- `lab_scripts_admin_password`: RHTPA admin password
- `lab_scripts_cli_client_secret`: Keycloak CLI client secret

### SBOM Configuration
- `lab_scripts_example_sbom_path`: Default SBOM file path
- `lab_scripts_sbom_id`: Default SBOM identifier

## Dependencies

None. This role is self-contained.

## Example Playbook

```yaml
---
- name: Generate ADS RHTPA scripts
  hosts: localhost
  gather_facts: false

  roles:
    - role: lab_scripts
      vars:
        lab_scripts_namespace: trusted-profile-analyzer
        lab_scripts_admin_password: "mySecurePassword"
```

## Generated Scripts

### install-rhtpa.sh

This script performs the following steps:

1. Creates the RHTPA namespace
2. Creates CatalogSource for the RHTPA operator
3. Creates OperatorGroup
4. Creates Subscription for the operator
5. Waits for operator to be ready
6. Creates PostgreSQL PVC, Secret, Deployment, and Service
7. Waits for PostgreSQL to be ready
8. Imports Keycloak realm configuration
9. Waits for Keycloak realm import to complete
10. Creates TPA CLI credentials secret
11. Creates RHTPA instance Custom Resource
12. Waits for RHTPA server to be ready

**Usage:**
```bash
./install-rhtpa.sh
```

### upload-sbom.sh

This script performs the following steps:

1. Discovers Keycloak token endpoint
2. Obtains access token from Keycloak using client credentials
3. Uploads SBOM to RHTPA via API

**Usage:**
```bash
# Upload using default SBOM file and ID
./upload-sbom.sh

# Upload custom SBOM file with custom ID
./upload-sbom.sh -f /path/to/sbom.json -i my-app-v1

# Show help
./upload-sbom.sh --help
```

**Options:**
- `-f, --file FILE`: Path to SBOM file
- `-i, --id ID`: SBOM identifier
- `-h, --help`: Show help message

## Script Output Location

By default, scripts are generated in `/tmp/ads-scripts/`:
- `/tmp/ads-scripts/install-rhtpa.sh`
- `/tmp/ads-scripts/upload-sbom.sh`

## User Information Saved

The role saves the following information via `agnosticd_user_info`:

- `rhtpa_install_script`: Path to install script
- `rhtpa_upload_script`: Path to upload script
- `tpa_admin_username`: RHTPA admin username
- `tpa_admin_password`: RHTPA admin password
- `tpa_cli_client_secret`: Keycloak CLI client secret
- `tpa_realm`: Keycloak realm name
- `tpa_server_url`: RHTPA server URL

## License

BSD

## Author Information

Red Hat GPTE
