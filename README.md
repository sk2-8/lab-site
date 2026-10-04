# Last Minute Lab (prototype)

Single-page static site (`index.html`). Responses and anonymous usage events are stored in Supabase.

## Setup
1. Supabase: create a project, open SQL Editor, run `supabase-setup.sql`.
2. Supabase > Project Settings > API: copy the Project URL and the `anon` public key.
3. Paste them into `const SB={url:'',key:''}` near the top of the script in `index.html`.
4. Push to GitHub, then import the repo in Vercel (Framework preset: Other, no build command).

Never put the `service_role` key in this file.
