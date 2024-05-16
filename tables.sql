create table public.todos (
  id smallserial primary key,
  title text not null,
  completed boolean not null default false,
  user_id uuid references auth.users(id) on delete cascade not null,
 
  constraint title_length check (char_length(title) <= 32)
)
 
-- Set up Row Level Security (RLS) for the todos table
alter table public.todos
  enable row level security;
 
create policy "Users can view their own todos." on public.todos
  for select to authenticated
  using ((select auth.uid()) = user_id);
 
create policy "Users can insert their own todos." on public.todos
  for insert to authenticated
  with check ((select auth.uid()) = user_id);
 
create policy "Users can update their own todos." on public.todos
  for update to authenticated
  using ((select auth.uid()) = user_id)
  with check ((select auth.uid()) = user_id);
 
create policy "Users can delete their own todos." on public.todos
  for delete to authenticated
  using ((select auth.uid()) = user_id);
