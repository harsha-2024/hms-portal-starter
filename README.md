
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
