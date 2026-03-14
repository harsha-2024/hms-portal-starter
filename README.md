# Healthcare Management System (HMS) — Model‑Driven Sample (Starter Pack)

**Generated:** 2026-03-14T04:48:23.455858Z

This starter pack contains templates and seed data to help you build a model‑driven healthcare portal solution on **Microsoft Power Platform** (Dataverse + Power Apps + Power Pages + Power Automate).


## Contents
- `dataverse/` — Table schemas (JSON), choice sets, relationships (notes)
- `security/` — Roles and table permissions (YAML templates)
- `model_driven_app/` — Sitemap and app navigation (YAML)
- `power_pages/` — Patient portal page templates (HTML/MD) and web roles
- `flows/` — Power Automate flow skeletons (JSON definitions)
- `seed/` — CSV sample data
- `docs/` — Setup and customization guides

## Publisher Prefix
Default prefix is `hms_`. Change it across files to match your environment publisher prefix.
# HMS Healthcare Portal — Managed Solution Builder

This bundle converts the HMS scaffolding into an **importable managed solution** (.zip) using the **Power Platform CLI** (PAC) and the Dataverse Web API.

**Publisher**
- Name: Harsha Shirali
- Prefix: `harsha` (spaces removed to satisfy Dataverse rules)

## Quick start
```powershell
pac auth create --name HMSDev --url https://YOUR-ENV.crm.dynamics.com
pac auth select --name HMSDev
./scripts/build-managed.ps1 -EnvironmentUrl https://YOUR-ENV.crm.dynamics.com
```

**Generated:** 2026-03-14T05:13:16.693901Z
