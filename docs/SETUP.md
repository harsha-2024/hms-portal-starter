
# Setup Guide

This guide walks you through turning this starter into a working solution.

## Prerequisites
- Power Platform environment with Dataverse
- Maker permissions
- (Optional) SharePoint integration for documents
- (Optional) Azure AD B2C / External Identities for Power Pages

## Steps
1. Create a **Solution** in Power Apps (e.g., `HMS Sample`).
2. Create a **Publisher** (e.g., `HMS`, prefix `hms`).
3. Add tables as per JSON specs in `dataverse/schema/`.
   - In the Maker Portal, create each table and columns matching the JSON.
   - Enable **Files** on tables that store documents.
   - Configure **Relationships** as listed in `dataverse/schema/RELATIONSHIPS.md`.
4. Create **Choices** matching `dataverse/choices/*.json`.
5. Configure **Security Roles** from `security/roles.yaml` and **Field Security** from `security/field_security.yaml`.
6. Build **Model‑Driven App** using `model_driven_app/sitemap.yaml` as reference.
7. Provision **Power Pages** site and add pages from `power_pages/pages/`.
   - Create web roles from `power_pages/web_roles/*.json`.
   - Configure table permissions accordingly.
8. Import sample data from `seed/*.csv` using Dataflows or the Data Import wizard.
9. Create **Power Automate** flows from `flows/*.json` (import or re‑create using definitions).
10. Test end‑to‑end scenarios.

## Notes
- Replace placeholders like `<<ENVIRONMENT_URL>>`, `<<PORTAL_URL>>`, and `<<PREFIX>>`.
- For production, enable Auditing on PHI tables.
