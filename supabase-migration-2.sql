-- Run once in Supabase > SQL Editor. Adds the new survey columns to the existing table.
-- Old columns (likelihood, missing) are left in place and simply unused; your existing rows are untouched.
alter table public.survey_responses
  add column if not exists interest     smallint check (interest between 1 and 5),
  add column if not exists others_value smallint check (others_value between 1 and 5),
  add column if not exists experience   smallint check (experience between 1 and 5),
  add column if not exists comments     text     check (char_length(comments) <= 2000);
