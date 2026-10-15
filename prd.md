PRD — Genetic Algorithm Timetable Generator

Product Name: SmartSched
Product Type: University Timetable Management & Optimization System
Platform: Flutter (Dart) + Python Backend
Version: 1.0
Target Users: University administrators, department coordinators, timetable managers, teachers
Primary Goal: Automatically generate conflict-free university timetables using a Genetic Algorithm while minimizing undesirable gaps and late slots.

---

1. Product Overview

SmartSched is a timetable generation application that helps universities create optimized class schedules automatically.

Instead of manually assigning every course to a teacher, room, and time slot, the system uses a Genetic Algorithm (GA) to generate and improve possible timetables.

The application will allow an administrator to:

Add/manage courses

Add teachers

Add rooms

Add sections

Define available time slots

Define hard and soft constraints

Configure Genetic Algorithm parameters

Generate timetables

Detect conflicts

View fitness results

Compare multiple GA runs

Export timetables and reports

The application should feel like a real university management product, not a student/demo AI interface.

---

2. Product Goals

Primary Goals

1. Generate valid university timetables automatically.

2. Eliminate hard constraint conflicts.

3. Minimize soft constraint penalties.

4. Provide an easy-to-use timetable management interface.

5. Visualize Genetic Algorithm convergence.

6. Allow administrators to compare different GA parameter settings.

7. Provide detailed conflict reports.

8. Export final timetables to CSV/Excel.

9. Keep the interface clean, professional and practical.

Academic Goals

The project must demonstrate:

Genetic Algorithm encoding

Population initialization

Fitness function

Selection

Crossover

Mutation

Elitism

Constraint modeling

Stochastic optimization

Parameter experimentation

Fitness visualization

---

3. Technology Architecture

┌─────────────────────────────────────┐
│ Flutter App │
│ Dart UI │
│ │
│ Dashboard │
│ Courses / Teachers / Rooms │
│ Constraints │
│ Generate Timetable │
│ Results │
│ Reports │
└─────────────────┬───────────────────┘
│
REST API
│
▼
┌─────────────────────────────────────┐
│ Python Backend │
│ │
│ Genetic Algorithm Engine │
│ Encoding │
│ Fitness │
│ Selection │
│ Crossover │
│ Mutation │
│ Elitism │
│ Constraint Validator │
└─────────────────┬───────────────────┘
│
▼
┌─────────────────────────────────────┐
│ SQLite │
│ │
│ Courses │
│ Teachers │
│ Rooms │
│ Sections │
│ Time Slots │
│ Constraints │
│ Generated Timetables │
│ GA Runs │
└─────────────────────────────────────┘

---

4. User Roles

Administrator

Main user of the system.

Can:

Manage all data

Add/edit/delete courses

Manage teachers

Manage rooms

Manage sections

Configure constraints

Run Genetic Algorithm

View generated timetables

Export reports

Compare runs

Department Coordinator

Can:

View timetable

Modify selected constraints

Generate timetable

Review conflicts

Export timetable

Teacher

Optional future role.

Can:

View personal timetable

View assigned courses

View room and time

---

5. Navigation Structure

The main Flutter navigation should use a clean sidebar on desktop/tablet and a bottom navigation bar on mobile.

Main Navigation

Dashboard
Timetable
Courses
Teachers
Rooms
Sections
Time Slots
Constraints
Generate
Experiments
Reports
Settings

Avoid excessive menus.

---

6. UI/UX Design Direction

The UI should look like a modern university SaaS application.

Design Principles

Clean

Professional

Minimal

Spacious

Easy to scan

Consistent

No unnecessary animations

No excessive gradients

No giant AI/robot illustrations

No "AI-powered magic" style wording

No excessive rounded cards

No fake statistics

No clutter

The user should immediately understand:

> What is the current timetable status?

and

> Can I generate a valid timetable?

---

7. Color System

Use a restrained professional palette.

Primary

Deep navy / dark blue.

Secondary

Slate blue/gray.

Success

Green.

Warning

Amber.

Error

Red.

Background

Very light gray/white.

The application should use color mainly for status, not decoration.

Example:

Hard Conflicts
0
✓ Valid

Green indicates valid.

Hard Conflicts
4
!
Needs attention

Red indicates problems.

---

8. Typography

Recommended:

Inter

or

Roboto

Hierarchy:

Page title 26–30px
Section heading 18–20px
Card heading 15–17px
Body 14–15px
Secondary text 12–13px

Avoid oversized headings.

---

9. Dashboard

The dashboard is the application's home screen.

Header

Good morning

Timetable Management
Fall Semester 2026

[ Generate Timetable ]

Summary Cards

Four compact cards:

Courses
24

Teachers
18

Rooms
8

Time Slots
25

Then:

Timetable Status

✓ No hard conflicts
Soft penalty: 14
Last generated: Today, 10:42 AM

---

10. Dashboard Analytics

A simple chart:

Fitness Progress

Line chart:

Fitness
│
│\
│ \
│ \
│ \_**\_
│ \_\_**
│ \_\_
└──────────────────
Generations

Legend:

Best Fitness

Average Fitness

Don't overload the dashboard with charts.

---

11. Timetable Screen

This is the most important screen.

Header

Timetable

Semester: Fall 2026
Section: BSCS-5A

[Section ▼] [Teacher ▼] [Room ▼] [Export]

Timetable Grid

Monday Tuesday Wednesday Thursday Friday

08:00 CS-301 DB-302 AI-305 Free OS-301
Room 101 Room 204 Lab 2 Room 101

09:00 Free CS-303 Free DB-304 AI-305

10:00 SE-301 Free CS-301 Free DB-302

11:00 ...

Each class cell should display:

CS-301
Data Structures

Dr. Ahmed
Room 101

Clicking a class opens a detail panel.

---

12. Timetable Class Details

When user taps a class:

Data Structures

Course
CS-301

Teacher
Dr. Ahmed

Section
BSCS-5A

Room
Room 101

Time
Monday
08:00 – 09:00

Status
✓ No conflict

---

13. Courses Screen

Table:

## Course ID | Course | Teacher | Section | Duration

CS-301 | Data Structures | Ahmed | BSCS-5A | 1
CS-302 | Database | Ali | BSCS-5A | 1
CS-303 | AI | Usman | BSCS-5B | 2

Top-right:

- Add Course

---

14. Add Course Screen

Fields:

Course Code
[ CS-301 ]

Course Name
[ Data Structures ]

Teacher
[ Select Teacher ▼ ]

Section
[ Select Section ▼ ]

Duration
[ 1 slot ▼ ]

Students
[ 45 ]

Room Type
[ Classroom ▼ ]

[ Cancel ] [ Save Course ]

Validation should happen immediately.

Example:

Course code already exists.

---

15. Teachers Screen

Display:

Teachers

Search teachers...

## Name Department Courses

Dr. Ahmed Computer Science 3
Dr. Ali Computer Science 4
Dr. Usman Software Eng. 2

Teacher detail:

Dr. Ahmed

Courses
3

Available Slots
18

Unavailable Slots
7

---

16. Rooms Screen

Room cards/table:

Room 101
Capacity: 50
Type: Classroom
Status: Available

Room 201
Capacity: 30
Type: Lab
Status: Available

Room fields:

Room name

Capacity

Type

Available slots

---

17. Sections Screen

Example:

BSCS-5A
Students: 42
Courses: 6

BSCS-5B
Students: 38
Courses: 6

---

18. Time Slots Screen

Allow administrator to define:

Monday
08:00 – 09:00
09:00 – 10:00
10:00 – 11:00
11:00 – 12:00

Tuesday
...

The system should automatically calculate total available slots.

---

19. Constraint Management

This is one of the most important screens.

Separate constraints into:

Hard Constraints

These should normally be mandatory.

✓ Teacher cannot teach two classes simultaneously

✓ Room cannot host two classes simultaneously

✓ Section cannot attend two classes simultaneously

✓ Room capacity must accommodate students

Soft Constraints

These affect the fitness score.

☑ Minimize teacher gaps

☑ Minimize section gaps

☑ Minimize late classes

☑ Prefer balanced daily schedules

☑ Avoid unnecessary consecutive classes

Each constraint can have a weight:

Teacher gap penalty
Weight: [ 5 ]

Late slot penalty
Weight: [ 3 ]

Section gap penalty
Weight: [ 4 ]

---

20. Generate Timetable Screen

This screen should clearly explain the parameters.

Genetic Algorithm Settings

Population Size
[ 100 ]

Generations
[ 500 ]

Crossover Rate
[ 0.80 ]

Mutation Rate
[ 0.05 ]

Elitism
[ 5 ]

Selection
[ Tournament ▼ ]

Then:

[ Generate Timetable ]

---

21. Generation Progress

After clicking Generate:

Generating timetable...

Generation
247 / 500

Best Fitness
18

Average Fitness
34

Hard Conflicts
0

━━━━━━━━━━━━━━━━━━━━ 49%

Show a live progress indicator.

Don't use unnecessary "AI is thinking..." messages.

Use technical but understandable wording.

---

22. Genetic Algorithm Result

After completion:

Generation Complete

Hard Conflicts
0

Soft Penalty
18

Best Fitness
18

Generations
500

Execution Time
3.8 sec

Then buttons:

[ View Timetable ]

[ Conflict Report ]

[ Export Excel ]

[ Export CSV ]

[ Run Again ]

---

23. Convergence Chart

Screen:

Fitness Convergence

Fitness
100 ┤\
 80 ┤ \
 60 ┤ \
 40 ┤ \_\_
20 ┤ \_**\_
0 ┤****\_\_\_\_******
100 200 300 400 500
Generation

Two lines:

Best fitness

Average fitness

The chart should update based on actual GA results.

---

24. Conflict Report

This screen should clearly separate hard and soft issues.

Summary

Hard Constraints
0 violations

Soft Constraints
7 penalties

Detailed report

## Type Course Issue

Hard CS-301 Teacher conflict
Hard DB-302 Room conflict
Soft AI-305 Late slot
Soft SE-301 Teacher gap

If there are zero hard conflicts:

✓ No hard constraint violations detected.

---

25. Experiments Screen

This directly satisfies the requirement for testing multiple parameter settings.

Example:

Experiment Results

## Run Population Mutation Generations Hard Soft

1 50 0.05 500 0 26
2 100 0.05 500 0 18
3 150 0.05 500 0 21
4 100 0.10 500 0 20
5 100 0.02 500 0 24

User can select two or more runs to view their raw metrics and convergence curves side by side.

The system should not label one configuration as "best" automatically unless the project specification defines a formal objective criterion.

---

26. Export

Export options:

Export Timetable

○ CSV
○ Excel

[ Export ]

Excel workbook can contain:

Sheet 1

Timetable

Sheet 2

Conflicts

Sheet 3

GA Parameters

Sheet 4

Fitness History

Sheet 5

Experiment Results

---

27. Settings

Settings

General
├── Semester
├── Academic Year
└── Department

GA Defaults
├── Population
├── Generations
├── Mutation Rate
└── Crossover Rate

Data
├── Import CSV
└── Export Data

Application
├── Theme
└── About

---

28. Backend API

Python backend can use FastAPI.

Example endpoints:

GET /api/courses
POST /api/courses
PUT /api/courses/{id}
DELETE /api/courses/{id}

GET /api/teachers
POST /api/teachers

GET /api/rooms
POST /api/rooms

GET /api/sections
POST /api/sections

GET /api/time-slots
POST /api/time-slots

GET /api/constraints
PUT /api/constraints

POST /api/timetable/generate

GET /api/timetable/{id}

GET /api/timetable/{id}/conflicts

GET /api/experiments

POST /api/experiments/run

GET /api/experiments/{id}

---

29. Genetic Algorithm Core

The Python backend should contain:

genetic_algorithm.py

initialize_population()
evaluate_population()
calculate_fitness()

selection()
crossover()
mutation()

apply_elitism()

validate_constraints()

generate_timetable()

Flow

Input Data
↓
Create Initial Population
↓
Calculate Fitness
↓
Check Hard Constraints
↓
Selection
↓
Crossover
↓
Mutation
↓
Elitism
↓
New Population
↓
Repeat Until Generations Complete
↓
Final Validation
↓
Timetable + Metrics

---

30. Chromosome Design

Recommended chromosome representation:

Chromosome
[
Gene 1,
Gene 2,
Gene 3,
...
Gene 15
]

Each gene represents one class assignment:

Gene:
{
course_id,
section_id,
teacher_id,
room_id,
slot_id
}

For example:

Class 1 → Room 2, Slot 7
Class 2 → Room 1, Slot 10
Class 3 → Room 4, Slot 12

The exact encoding should be documented in the project report.

---

31. Fitness Specification

The system should calculate separately:

Hard Constraint Count

Teacher conflicts
Room conflicts
Section conflicts
Capacity violations
Unavailable-slot violations

Soft Penalty

Teacher gaps
Section gaps
Late slots
Unbalanced schedules
Other configured preferences

Then produce:

Hard Constraint Count = 0
Soft Penalty = 18

This separation is important because the project specifically requires both values.

---

32. Data Requirements

Minimum synthetic dataset:

Classes ≥ 15
Rooms ≥ 5
Teachers ≥ 8
Time Slots ≥ 20

Example:

15 Classes
8 Teachers
5 Rooms
20 Time Slots
5 Sections

This data should be included in the project repository.

---

33. Database Structure

SQLite tables:

users
teachers
rooms
courses
sections
time_slots
constraints
timetables
schedule_entries
ga_runs
fitness_history

Relationship:

Teacher ─── Courses
Section ─── Courses
Course ─── Schedule Entry
Room ─── Schedule Entry
Time Slot ─── Schedule Entry
Timetable ─── Schedule Entries
GA Run ─── Fitness History

---

34. Error Handling

The application should prevent invalid input.

Examples:

No rooms

No rooms are available.
Add at least one room before generating a timetable.

Insufficient slots

Available time slots are insufficient for the selected courses.

Missing teacher

Every course must have an assigned teacher.

Invalid population

Population size must be greater than 0.

---

35. Empty States

Avoid empty screens.

Example:

No courses yet

Add your first course to start building
the department timetable.

[ Add Course ]

Not:

> "Oops! Nothing here!"

Keep the language professional.

---

36. Loading States

Use subtle progress indicators.

Example:

Generating timetable

Generation 186 / 500

Best fitness: 24
Hard conflicts: 0

Avoid flashy animations.

---

37. Responsive Design

Desktop

Sidebar + main content.

Tablet

Collapsible sidebar.

Mobile

Bottom navigation:

Home | Timetable | Generate | Reports | More

Timetable should become horizontally scrollable rather than squeezing columns.

---

38. Security

For the academic version:

Validate API inputs.

Do not expose database credentials.

Sanitize imported data.

Restrict admin functions if authentication is implemented.

Do not store unnecessary personal information.

---

39. Performance Requirements

For the required synthetic dataset:

15+ classes
5+ rooms
8+ teachers
20+ slots

The application should generate results without freezing the Flutter interface.

For larger datasets, the Python backend should run the GA separately from the UI request thread, with progress/status reporting if needed.

---

40. Non-Functional Requirements

Usability

A new administrator should understand the basic workflow without training.

Reliability

The final timetable must be validated independently after GA completion.

Maintainability

GA logic should be separated from API and UI code.

Scalability

The architecture should allow more courses, rooms, teachers and departments later.

---

41. Six-Week Development Plan

Week 1 — Data & UI Foundation

Build:

Flutter project

Navigation

Dashboard

Courses

Teachers

Rooms

Sections

Time slots

SQLite/database structure

---

Week 2 — Encoding

Build Python:

Data models

Chromosome

Gene

Population initialization

Random timetable generation

---

Week 3 — Fitness

Implement:

Hard constraints

Soft constraints

Fitness calculation

Conflict detection

Validation

Target:

Input → Random timetable → Fitness → Conflict report

---

Week 4 — Genetic Algorithm

Implement:

Selection

Crossover

Mutation

Elitism

Generations

Best solution tracking

---

Week 5 — Experiments

Implement:

5+ runs

Parameter settings

Fitness history

Best/average fitness

Convergence chart

Run comparison

---

Week 6 — Final Product

Complete:

UI polish

Reports

Excel/CSV export

Testing

Screenshots

Documentation

Presentation

Demo

---

42. Final User Journey

The complete application flow should be:

Login
↓
Dashboard
↓
Add Department Data
↓
Courses
Teachers
Rooms
Sections
Time Slots
↓
Configure Constraints
↓
GA Settings
↓
Generate Timetable
↓
Genetic Algorithm
↓
Validation
↓
Results
├── Timetable
├── Conflict Report
├── Fitness Chart
└── Statistics
↓
Experiments
↓
Export

---

43. Final Project Stack

Frontend

Flutter + Dart

Backend

Python + FastAPI

Genetic Algorithm

Pure Python + NumPy

Data Processing

pandas

Visualization

Matplotlib

Excel

openpyxl

Database

SQLite

API Format

JSON / REST

---

44. MVP vs Future Version

MVP — Required for your university project

Courses

Teachers

Rooms

Sections

Time slots

Hard constraints

Soft constraints

Genetic Algorithm

Fitness

Selection

Crossover

Mutation

Elitism

Timetable

Conflict report

Convergence chart

5+ experiments

CSV/Excel export

Future Version

Login/authentication

Multiple departments

Multiple semesters

Teacher availability

Drag-and-drop timetable editing

Manual timetable adjustment

PDF export

Notifications

Teacher mobile view

Cloud deployment

Multi-user access

---

Final UI Style

The most important design direction is:

Don't make it look like an "AI project." Make it look like a real university scheduling product.

Use wording such as:

> Generate Timetable

instead of:

> ✨ Let AI Create Your Perfect Schedule!

Use:

> 0 Hard Conflicts

instead of:

> 🤖 AI Successfully Fixed Everything!

And use real data, restrained colors, consistent spacing, practical tables, clear forms, and useful status indicators. That will make the application feel much more like a genuine software product than an AI-generated student demo.
