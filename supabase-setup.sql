-- Last Minute Lab: run once in Supabase > SQL Editor > New query > Run.
-- Public visitors (the "anon" key) can ONLY insert rows. They cannot read, edit or delete anything.
-- You read the data in Supabase > Table Editor (or export CSV).

create table public.survey_responses (
  id           bigint generated always as identity primary key,
  created_at   timestamptz not null default now(),
  session_id   text     check (char_length(session_id) <= 64),
  role         text     check (char_length(role) <= 60),
  how_find     text     check (char_length(how_find) <= 120),
  likelihood   smallint check (likelihood between 1 and 5),
  pay_per_hour numeric  check (pay_per_hour between 0 and 100000),
  email        text     check (char_length(email) <= 200),
  missing      text     check (char_length(missing) <= 2000)
);

create table public.events (
  id         bigint generated always as identity primary key,
  created_at timestamptz not null default now(),
  session_id text  not null check (char_length(session_id) <= 64),
  event      text  not null check (char_length(event) <= 50),
  props      jsonb not null default '{}' check (pg_column_size(props) < 2000)
);

alter table public.survey_responses enable row level security;
alter table public.events           enable row level security;

create policy "anon can insert survey" on public.survey_responses
  for insert to anon with check (true);
create policy "anon can insert events" on public.events
  for insert to anon with check (true);

revoke all on public.survey_responses, public.events from anon, authenticated;
grant insert on public.survey_responses, public.events to anon;
