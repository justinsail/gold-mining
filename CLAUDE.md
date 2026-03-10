# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

```bash
npm start              # Start Expo dev server (scan QR with Expo Go)
npm run ios            # Open in iOS simulator
npm run android        # Open in Android emulator
npm run web            # Open in browser
```

**Supabase schema changes:**
```bash
# Create a new migration
supabase migration new <name>

# Push migrations to remote (requires SUPABASE_ACCESS_TOKEN env var)
SUPABASE_ACCESS_TOKEN=<token> supabase db push

# Link project (one-time, per machine)
SUPABASE_ACCESS_TOKEN=<token> supabase link --project-ref vxxgjyrwhnwsghrlzaox
```

## Environment

Requires a `.env` file in the project root (see `.env.example`). Supabase project is named **"purpose mapping app"**, hosted at `https://vxxgjyrwhnwsghrlzaox.supabase.co`.

All Supabase env vars must be prefixed `EXPO_PUBLIC_` to be accessible in the React Native bundle.

## Architecture

**Entry point:** `index.ts` → `App.tsx` → `src/navigation/AppNavigator.tsx`

**Navigation** (`src/navigation/`): Single `AppNavigator` using React Navigation native stack. All screen types are declared in `RootStackParamList`. Headers are hidden globally. Current flow: Onboarding → Login/SignUp → Dashboard → Questionnaire. As auth state is added, this will split into auth and app stacks.

**Screens** (`src/screens/`): Organized by feature domain — `auth/`, `onboarding/`, `dashboard/`, `questionnaire/`. All screens are currently placeholder shells.

**Supabase client** (`src/lib/supabase.ts`): Single shared client instance, imported wherever database or auth calls are needed.

**Components** (`src/components/common/`): Shared UI components go here. Currently empty — build out as screens are implemented.

**Database** (`supabase/migrations/`): Schema is managed via Supabase CLI migrations. All 10 tables have Row Level Security enabled. Users are linked to `auth.users` via foreign key — always create a `public.users` row on signup.

## Key product context

This app is for the **Gold Mining Circle Foundation**. The core data model is the **Purpose Map** — 7 questions (Purpose, Vision, BHAG, Milestone, Next Action, Habits, Celebration). Users complete it via direct entry or AI-guided journaling (Claude API). See `Gold Mining Circle App - Project Plan.md` for the full phase plan and `Purpose Mapping Model.md` for the 7-question framework.

## Git workflow

- `main` is always stable. Feature branches: `feature/<name>`, fixes: `fix/<name>`
- PRs required for all changes — Justin reviews before merge
- Never push directly to `main`
