---
title: n8n Automation Studio
emoji: ⚡
colorFrom: purple
colorTo: blue
sdk: docker
app_port: 7860
pinned: true
---

# n8n Automation Server

This is the manual setup for running n8n on Hugging Face Spaces with a PostgreSQL backend (Neon.tech or Supabase).

### Setup Instructions
1. Upload this `Dockerfile` and `README.md` to your Hugging Face Space.
2. In your Space **Settings -> Variables and secrets**, add the following Secrets:
   - `DB_POSTGRESDB_HOST` = (Your Neon/Supabase DB Host)
   - `DB_POSTGRESDB_USER` = (Your DB User)
   - `DB_POSTGRESDB_PASSWORD` = (Your DB Password)
   - `DB_POSTGRESDB_DATABASE` = (Your DB Name)
   - `N8N_ENCRYPTION_KEY` = (A random text string)
   - `WEBHOOK_URL` = `https://your-space-url.hf.space/`
   - `N8N_EDITOR_BASE_URL` = `https://your-space-url.hf.space/`
