
# Setup Guide (Extended)

Follow these steps to realize the extended HMS app in your Solution.
1) Create Solution + Publisher (prefix `hms`).
2) Create tables and columns per JSON under `dataverse/schema/`.
3) Create choices from `dataverse/choices/`.
4) Configure roles & field security under `security/`.
5) Build Model‑Driven App sitemap using `model_driven_app/sitemap.yaml` as reference.
6) Provision Power Pages; add pages; set web roles & table permissions.
7) Create BPFs mirroring `bpf/*.json`, then Activate them.
8) Recreate the flows from `flows/*.json`.
9) Import `seed/*.csv` for demo data.
