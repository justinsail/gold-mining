-- =====================
-- CREATE ALL TABLES
-- =====================

create table public.users (
  id uuid primary key references auth.users(id) on delete cascade,
  email text not null,
  display_name text,
  avatar_url text,
  created_at timestamptz default now()
);

create table public.purpose_maps (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references public.users(id) on delete cascade,
  purpose text,
  vision text,
  bhag text,
  bhag_target_date date,
  created_via text check (created_via in ('direct_entry', 'ai_journaling')) default 'direct_entry',
  created_at timestamptz default now(),
  updated_at timestamptz default now()
);

create table public.milestones (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references public.users(id) on delete cascade,
  purpose_map_id uuid references public.purpose_maps(id) on delete set null,
  title text not null,
  description text,
  target_date date,
  status text check (status in ('active', 'completed', 'paused')) default 'active',
  completed_at timestamptz,
  created_at timestamptz default now()
);

create table public.habits (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references public.users(id) on delete cascade,
  milestone_id uuid references public.milestones(id) on delete set null,
  title text not null,
  frequency text check (frequency in ('daily', 'weekly')) default 'daily',
  category text check (category in ('health', 'wealth', 'love', 'fulfillment')),
  created_at timestamptz default now()
);

create table public.habit_checkins (
  id uuid primary key default gen_random_uuid(),
  habit_id uuid not null references public.habits(id) on delete cascade,
  checked_in_at timestamptz default now(),
  note text
);

create table public.actions (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references public.users(id) on delete cascade,
  milestone_id uuid references public.milestones(id) on delete set null,
  title text not null,
  completed boolean default false,
  completed_at timestamptz,
  created_at timestamptz default now()
);

create table public.groups (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  description text,
  invite_code text unique default substr(md5(random()::text), 1, 8),
  created_by uuid not null references public.users(id),
  created_at timestamptz default now()
);

create table public.group_members (
  group_id uuid not null references public.groups(id) on delete cascade,
  user_id uuid not null references public.users(id) on delete cascade,
  role text check (role in ('leader', 'member')) default 'member',
  joined_at timestamptz default now(),
  primary key (group_id, user_id)
);

create table public.messages (
  id uuid primary key default gen_random_uuid(),
  group_id uuid references public.groups(id) on delete cascade,
  sender_id uuid not null references public.users(id),
  recipient_id uuid references public.users(id),
  content text not null,
  created_at timestamptz default now()
);

create table public.journal_entries (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references public.users(id) on delete cascade,
  conversation_json jsonb,
  extracted_purpose_map_id uuid references public.purpose_maps(id) on delete set null,
  created_at timestamptz default now()
);

-- =====================
-- ENABLE RLS
-- =====================

alter table public.users enable row level security;
alter table public.purpose_maps enable row level security;
alter table public.milestones enable row level security;
alter table public.habits enable row level security;
alter table public.habit_checkins enable row level security;
alter table public.actions enable row level security;
alter table public.groups enable row level security;
alter table public.group_members enable row level security;
alter table public.messages enable row level security;
alter table public.journal_entries enable row level security;

-- =====================
-- RLS POLICIES
-- =====================

create policy "Users manage their own profile"
  on public.users for all using (auth.uid() = id);

create policy "Users manage their own purpose maps"
  on public.purpose_maps for all using (auth.uid() = user_id);

create policy "Users manage their own milestones"
  on public.milestones for all using (auth.uid() = user_id);

create policy "Users manage their own habits"
  on public.habits for all using (auth.uid() = user_id);

create policy "Users manage their own check-ins"
  on public.habit_checkins for all
  using (exists (select 1 from public.habits where id = habit_id and user_id = auth.uid()));

create policy "Users manage their own actions"
  on public.actions for all using (auth.uid() = user_id);

create policy "Group members can view their groups"
  on public.groups for select
  using (exists (select 1 from public.group_members where group_id = id and user_id = auth.uid()));

create policy "Anyone can create a group"
  on public.groups for insert with check (auth.uid() = created_by);

create policy "Members can view their group memberships"
  on public.group_members for select using (auth.uid() = user_id);

create policy "Users can view messages in their groups or their DMs"
  on public.messages for select
  using (auth.uid() = sender_id or auth.uid() = recipient_id or
    exists (select 1 from public.group_members where group_id = messages.group_id and user_id = auth.uid()));

create policy "Users can send messages"
  on public.messages for insert with check (auth.uid() = sender_id);

create policy "Users manage their own journal entries"
  on public.journal_entries for all using (auth.uid() = user_id);
