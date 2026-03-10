# Gold Mining Circle App — Project Plan

**Version:** 1.0
**Date:** March 9, 2026
**Team:** Justin, Daniel, Kevin, Shane

---

## What We're Building

A mobile app for the Gold Mining Circle Foundation that helps people discover their life's purpose and pursue it with community accountability. The app has four pillars:

1. **Purpose Mapping Questionnaire** — two paths: direct entry (for those who already have answers) and AI-guided journaling (for those discovering their purpose)
2. **Goal Tracking & Milestones** — BHAG → 90-day milestones → daily/weekly habits → next tiny actions, with notifications at key moments
3. **Groups & Accountability** — circles of people who share goals, check in on each other, and celebrate wins together
4. **Communication** — group chat, 1-on-1 accountability conversations, and push notifications for deadlines and milestones

---

## Tech Stack

| Layer | Tool | Why |
|-------|------|-----|
| **Mobile App** | React Native + Expo | Single codebase for iOS & Android. Expo handles builds, push notifications, and over-the-air updates. Approachable for the whole team. |
| **Backend & Database** | Supabase (Postgres + Auth + Realtime + Storage + Edge Functions) | All-in-one backend with real-time subscriptions for chat, built-in auth, and a generous free tier. Open source. |
| **AI Journaling** | Claude API (Anthropic) | Powers the guided journaling flow where users discover their purpose through conversation. |
| **Push Notifications** | Expo Notifications + Supabase Edge Functions | Expo handles device registration; Supabase triggers notifications on milestones and deadlines. |
| **Source Control** | GitHub | Code hosting, pull requests, issue tracking, project boards. |
| **CI/CD** | GitHub Actions + EAS (Expo Application Services) | Automated builds and app store submissions. |
| **Design** | Figma (free tier) | Collaborative design mockups anyone on the team can contribute to. |
| **Task Tracking** | GitHub Projects | Keeps tasks, issues, and milestones alongside the code. |
| **Communication** | Slack + Zoom | Daily async communication + weekly video syncs. |
| **Testing** | Expo Go + TestFlight | Instant preview on phones during dev; TestFlight for beta distribution. |

---

## Team Roles & Responsibilities

### Justin — Technical Lead & Full-Stack Development
- Set up the GitHub repository, Supabase project, and Expo app scaffold
- Build core app screens and navigation
- Implement Supabase database schema and API integrations
- Integrate Claude API for AI-guided journaling
- Code review Shane's contributions
- Manage CI/CD pipeline and app store submissions

### Daniel — Project Manager & QA Support
- Maintain the GitHub Projects board (create issues, track progress, update statuses)
- Write user stories and acceptance criteria for each feature
- Test builds on Expo Go and report bugs as GitHub issues
- Help with light coding tasks (copy changes, styling tweaks, data entry)
- Coordinate weekly Zoom syncs and write meeting summaries
- Manage the TestFlight beta testing program

### Kevin — Product Vision & Strategy
- Define product requirements and prioritize features
- Review designs in Figma and provide feedback on UX flow
- Represent the Gold Mining Circle Foundation's mission in product decisions
- Coordinate with GMC leaders worldwide for beta testing and feedback
- Write onboarding copy, questionnaire text, and notification messages
- Own the relationship between app features and the Purpose Mapping Model

### Shane — Frontend Development & Vibe Coding
- Build UI components and screens in React Native
- Implement animations, transitions, and visual polish
- Create the chat interface and real-time messaging UI
- Build the questionnaire flows (both direct entry and AI-guided)
- Prototype new features and interactions quickly
- Collaborate with Kevin on translating Figma designs into code

---

## Phase Plan

### Phase 0: Setup (Weeks 1–2)

**Goal:** Everyone has the tools installed and can run the app on their phone.

| Task | Owner | Details |
|------|-------|---------|
| Create GitHub repo with README | Justin | Initialize Expo project, push to GitHub, add team as collaborators |
| Set up Supabase project | Justin | Create project, configure auth (email + social login), set up initial database tables |
| Install dev tools | All | Node.js, Expo CLI, VS Code (or Cursor for Shane), Expo Go on phones |
| GitHub & Git tutorial for team | Justin + Daniel | Short walkthrough: cloning, branches, pull requests, issues |
| Create Figma workspace | Shane + Kevin | Set up shared Figma file with initial wireframes |
| Set up GitHub Projects board | Daniel | Create columns: Backlog, In Progress, Review, Done |
| Define v1 feature scope | Kevin | Write a 1-page product brief: what's in v1, what's not |

**Milestone:** Every team member can clone the repo, run `npx expo start`, and see the app on their phone via Expo Go.

---

### Phase 1: Core Questionnaire (Weeks 3–5)

**Goal:** Users can complete the Purpose Mapping questionnaire via direct entry.

| Task | Owner | Details |
|------|-------|---------|
| Design questionnaire screens | Shane + Kevin | Figma mockups for each question (Purpose, Vision, BHAG, Milestone, Next Action, Habits, Celebration) |
| Build questionnaire UI | Shane | Multi-step form with progress indicator, input validation |
| Create database schema for user profiles & responses | Justin | Supabase tables: users, purpose_maps, milestones, habits, actions |
| Implement auth flow | Justin | Sign up, log in, password reset using Supabase Auth |
| Connect questionnaire to database | Justin | Save/load responses, handle drafts |
| Write questionnaire copy & instructions | Kevin | Clear prompts for each question, help text, examples |
| QA & bug tracking | Daniel | Test all flows, file issues in GitHub |

**Milestone:** A user can sign up, complete the 7-question Purpose Mapping questionnaire, and see their saved responses.

---

### Phase 2: AI-Guided Journaling (Weeks 6–8)

**Goal:** Users who don't have answers yet can journal with AI assistance to discover their purpose.

| Task | Owner | Details |
|------|-------|---------|
| Design AI journaling UX | Shane + Kevin | Chat-like interface with journaling prompts |
| Integrate Claude API | Justin | Backend edge function that manages conversation context and guides users through the Purpose Mapping questions |
| Build journaling chat UI | Shane | Message bubbles, typing indicators, save-to-journal functionality |
| Write AI system prompts | Kevin + Justin | Craft the Claude system prompt that embodies GMC's approach to purpose discovery |
| Extract structured answers from journal | Justin | Parse AI conversation to populate the Purpose Map fields |
| QA journaling flows | Daniel | Test edge cases: incomplete journals, revisiting, editing |

**Milestone:** A user can have a guided conversation with AI, and the app extracts their Purpose Map from the dialogue.

---

### Phase 3: Goal Tracking & Notifications (Weeks 9–11)

**Goal:** Users can track progress on milestones and habits with reminders.

| Task | Owner | Details |
|------|-------|---------|
| Design dashboard & tracking screens | Shane + Kevin | Visual progress on BHAG → milestones → habits → actions |
| Build goal tracking UI | Shane | Progress bars, habit check-ins, milestone countdowns |
| Implement notification system | Justin | Supabase edge functions + Expo push notifications for daily habits, milestone deadlines, celebration triggers |
| Build habit tracking logic | Justin | Daily/weekly check-in system, streak tracking |
| Write notification copy | Kevin | Messages for reminders, encouragements, milestone celebrations |
| QA notifications & tracking | Daniel | Verify notifications arrive on time, test across time zones |

**Milestone:** Users receive daily habit reminders and milestone notifications, and can check in on their progress.

---

### Phase 4: Groups & Accountability (Weeks 12–15)

**Goal:** Users can form circles, chat, and hold each other accountable.

| Task | Owner | Details |
|------|-------|---------|
| Design group & chat screens | Shane + Kevin | Group creation, member list, chat interface, accountability pairings |
| Build real-time group chat | Shane + Justin | Supabase Realtime subscriptions for messaging |
| Create group management system | Justin | Create/join groups, invite links, roles (leader, member) |
| Build accountability pairing | Justin | 1-on-1 check-in conversations, shared milestone visibility |
| Implement group notifications | Justin | Notify when members hit milestones, complete habits, or need encouragement |
| QA group features | Daniel | Test with 4+ users simultaneously, verify real-time updates |

**Milestone:** A group of 4+ people can chat, see each other's progress, and receive notifications about group members' achievements.

---

### Phase 5: Polish & Beta Launch (Weeks 16–18)

**Goal:** App is ready for beta testing with real Gold Mining Circle members.

| Task | Owner | Details |
|------|-------|---------|
| Design app icon, splash screen, onboarding | Shane | First impressions matter |
| Performance optimization | Justin + Shane | Load times, image optimization, offline support |
| Write App Store listing copy | Kevin | Description, screenshots, keywords |
| Set up TestFlight distribution | Justin | Build production app, configure TestFlight |
| Recruit beta testers from GMC community | Kevin | 20–50 testers across multiple circles |
| Run 2-week beta test | Daniel | Collect feedback, triage bugs, prioritize fixes |
| Fix critical bugs from beta | Justin + Shane | Address top issues before wider release |

**Milestone:** 20+ Gold Mining Circle members are actively using the app and providing feedback.

---

## Database Schema (Initial)

```
users
  - id (uuid, primary key)
  - email
  - display_name
  - avatar_url
  - created_at

purpose_maps
  - id (uuid, primary key)
  - user_id (foreign key → users)
  - purpose (text)
  - vision (text)
  - bhag (text)
  - bhag_target_date (date)
  - created_via (enum: 'direct_entry', 'ai_journaling')
  - created_at
  - updated_at

milestones
  - id (uuid, primary key)
  - user_id (foreign key → users)
  - purpose_map_id (foreign key → purpose_maps)
  - title (text)
  - description (text)
  - target_date (date)
  - status (enum: 'active', 'completed', 'paused')
  - completed_at (timestamp)

habits
  - id (uuid, primary key)
  - user_id (foreign key → users)
  - milestone_id (foreign key → milestones)
  - title (text)
  - frequency (enum: 'daily', 'weekly')
  - category (enum: 'health', 'wealth', 'love', 'fulfillment')

habit_checkins
  - id (uuid, primary key)
  - habit_id (foreign key → habits)
  - checked_in_at (timestamp)
  - note (text, optional)

actions
  - id (uuid, primary key)
  - user_id (foreign key → users)
  - milestone_id (foreign key → milestones)
  - title (text)
  - completed (boolean)
  - completed_at (timestamp)

groups
  - id (uuid, primary key)
  - name (text)
  - description (text)
  - invite_code (text, unique)
  - created_by (foreign key → users)
  - created_at

group_members
  - group_id (foreign key → groups)
  - user_id (foreign key → users)
  - role (enum: 'leader', 'member')
  - joined_at

messages
  - id (uuid, primary key)
  - group_id (foreign key → groups, nullable)
  - sender_id (foreign key → users)
  - recipient_id (foreign key → users, nullable — for 1-on-1)
  - content (text)
  - created_at

journal_entries
  - id (uuid, primary key)
  - user_id (foreign key → users)
  - conversation_json (jsonb — full AI conversation)
  - extracted_purpose_map_id (foreign key → purpose_maps, nullable)
  - created_at
```

---

## How We Work Together

### Communication Rhythm
- **Slack** — daily async updates. Post what you worked on, what's blocked, what's next.
- **Zoom** — weekly 30-minute sync every [TBD day]. Screen-share progress, discuss blockers, plan the week.
- **GitHub Issues** — all bugs and feature requests go here, not Slack. Daniel keeps these organized.

### Git Workflow
1. `main` branch is always stable and deployable
2. Create a feature branch for each task: `feature/questionnaire-ui`, `fix/notification-timing`, etc.
3. Open a Pull Request when your work is ready for review
4. Justin reviews all PRs before merging to `main`
5. Never push directly to `main`

### Weekly Rhythm
- **Monday:** Daniel updates the project board with the week's priorities
- **Wednesday:** Weekly Zoom sync
- **Friday:** Everyone posts a quick Slack update on what they accomplished

---

## Getting Started Checklist

Everyone on the team should complete these in the first week:

- [ ] Create a GitHub account (if you don't have one)
- [ ] Accept the invite to the Gold Mining Circle GitHub repository
- [ ] Install VS Code (or Cursor) on your computer
- [ ] Install Node.js (LTS version) from nodejs.org
- [ ] Install Expo Go on your phone (App Store / Google Play)
- [ ] Clone the repository and run `npx expo start`
- [ ] Join the project Slack channel
- [ ] Review this planning document and flag any questions

---

## Key Decisions Still Needed

1. **App name** — "Gold Mining Circle" or something shorter/catchier?
2. **Free vs. paid** — will the app be free for all GMC members? Freemium?
3. **Authentication method** — email/password only, or also Google/Apple sign-in?
4. **AI journaling limits** — how many AI journaling sessions per user? (cost implications)
5. **Moderation** — who moderates group chats? Automated rules or manual?
6. **Multi-language support** — needed for international expansion (Europe, Israel, India, Brazil)?
7. **Offline support** — should the app work without internet for habit check-ins?

---

## Appendix: Purpose Mapping Model (Reference)

The questionnaire is built around these seven questions from the Gold Mining Circle framework:

1. **Purpose** — What is your Purpose: the reason you are on this planet? Why do you exist?
2. **Vision** — What's your Vision of what happens when your Purpose reaches all 8+ billion people?
3. **BHAG** — What's your 3–5 year Big Hairy Audacious Goal?
4. **Milestone** — What's your 90-day Milestone in SMARTER format? (Specific, Measurable, Achievable, Realistic, Time-bound, Ethical & Resourced)
5. **Next Action** — What is your very next Tiny Action Step?
6. **Habits** — What Daily/Weekly Habits will support you? (Health, Wealth, Love & Fulfillment)
7. **Celebration** — What system of accountability, recognition & celebration will you create?
