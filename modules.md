Tumhare SmartSched — Genetic Algorithm Timetable Generator ke complete PRD ko main development modules mein divide kar raha hoon, taake tum Flutter (Dart) aur Python FastAPI use karke step-by-step project bana sako.

Meri recommendation hai ke project ko 12 main modules mein divide karo. Pehle basic data management banao, phir Genetic Algorithm implement karo, aur aakhir mein experiments, charts aur exports add karo.

### SmartSched — Module Breakdown

![Timetable & Substitution Management for Colleges | edumerge](https://images.openai.com/static-rsc-4/4DfOJifpXYWULab-UaErjHdddZhLSfVXzSFJd7oNNA9nuKy1Axg1r9EHRq6KqIkKol8k5VLge-d28PwRnsd407zcTp8GP_iowBr-QGY06SjmkySjmH0MYrb_BAOqXpbd1al3aw6n8iDU4tbxzEzMvMV6BTINaKTar7hOTTmoSoWAS6lLd9EED0AZgcsoyy87?purpose=fullsize)

### Module 1 — Application Foundation & Dashboard

Phase 1

Purpose: Application ka base aur main dashboard tayyar karna.

- Flutter project setup

- Navigation: sidebar aur mobile bottom bar

- Professional theme, colors aur typography

- Dashboard summary cards

- Semester selection

- Timetable status aur recent generation results

- Reusable widgets aur API service structure

Output: Application ka working UI aur dashboard.

![Apex](https://images.openai.com/static-rsc-4/CWpj9WGjJg78IPu0vUmX-jiuXpBpAMMWiRRJmyb60iVEVa3qnTDGxZnP5eDRG0Y0Jf-ne-Il1gR_a8UXcj46lB3yt5j3SIQoGbEW_phIN_NI7owUJXUVKUvsQE8dEY2VYD9UuL7Z18o7TvU9hWgaAhov6TgaQ92gIlzN_mUMdMWHdfxHyGZivkobFrYYEsqz?purpose=fullsize)

### Module 2 — Academic Data Management

Phase 1

Purpose: Timetable banane ke liye zaroori data manage karna.

Is module mein 5 submodules honge:

- Courses Management

- Teachers Management

- Rooms Management

- Sections Management

- Time Slots Management

Features: Add, edit, delete, search, form validation aur SQLite database integration.

Output: GA ke liye complete academic dataset.

![Horarium.ai - Efficient Timetable Creation for Elementary, Middle, and High Schools | Quick and Easy Timetable Creation - Horarium](https://images.openai.com/static-rsc-4/4AoEeKrwhbOGum4ViG9ojAySLsz23SS7sloc64ofQcGobHeEf1Zh0Z5-cskmQyJmmWNHAi3Lpu5R8jpM-Tg0hlwp81tqLIkUUossvYHwVnU5u8zAQYj718hKQrrizxTg68SlprVshLiSP6MjxNg9LLsrswwHzfGEUX0AHQ8st9E9v6E2DbglsUR4KTdFYLOg?purpose=fullsize)

### Module 3 — Constraint Management

Phase 2

Purpose: Timetable ke rules define karna.

Hard constraints

- Teacher ka ek waqt mein sirf ek class hona.

- Room ka ek waqt mein sirf ek class host karna.

- Section ki simultaneous classes na hona.

- Room capacity aur availability validate karna.

Soft constraints

- Teacher aur section ke gaps kam karna.

- Late classes kam karna.

- Daily schedule balance karna.

- Penalty weights configure karna.

Output: Python backend ko validated constraints milenge.

![How to create an easy genetic algorithm in Python | by Aitor Velasco | Predict | Medium](https://images.openai.com/static-rsc-4/IulLBUkUQGvMJ-WL81ggHXWHdcsN8OhLRqRnv6HhKvJXjqT7E0eU7iyhEphOdFV4gi55J_nDUsssKyjM9FSbRYhnFecM5bCKxMA_Q85tFV9u6-C6XFc4nCj6HTHkojGFUfzr7UHjQmQIUuBllevZTsBJYubNwBpiqN1qNANyV94ZUEyk53-pkZL6fDrR1aTq?purpose=fullsize)

### Module 4 — Genetic Algorithm Data Encoding

Phase 2

Purpose: Timetable ko GA ke liye suitable format mein convert karna.

- Gene aur chromosome design

- Class assignments represent karna

- Population initialization

- Random candidate timetables generate karna

- Invalid ya impossible assignments handle karna

Suggested file: `genetic_algorithm/encoding.py`

Output: Timetable candidates ki initial population.

![A Novel Evolutionary Algorithm: One-Dimensional Subspaces Optimization Algorithm (1D-SOA)](https://images.openai.com/static-rsc-4/UR1HQUm2TTLOQg66Iq93qllUQ6ce771vBwD_cdM6vB46XtDAMtzW5_RIuQqDHDdFYW3IkJrGo2ltfsXfi0uFEfoXpA_DzTUW8TG_GEwUE5seCSMqCROvIQXg2yqeW0QQspEx-eXOQsxsHRsOcF8Ib9qLulIPX7stMr1nthh55od09hXyn56nwhzNB3x55ZJ_?purpose=fullsize)

### Module 5 — Fitness & Constraint Evaluation

Phase 2

Purpose: Har candidate timetable ki quality evaluate karna.

- Teacher conflicts detect karna

- Room aur section conflicts detect karna

- Capacity aur availability violations

- Teacher gaps aur section gaps calculate karna

- Late-slot aur balance penalties

- Hard conflicts aur soft penalty alag rakhna

Suggested file: `genetic_algorithm/fitness.py`

Output: Har timetable ka measurable fitness result aur conflict details.

![Machine Learning in Materials Science: Genetic Algorithms for the Improvement
of Inorganic Phosphors](https://images.openai.com/static-rsc-4/KtpJ7FlAyVi5uA5SU2c7bQO7X5q7NHQJ2OVt3xAsM6GEAjRCOqek0u4IHKXh2jKWN6aWL3412jUEQkJVZQLL2uNZwzszDN_e_51sKoN_V3mx2a5emSg4S0rHZ3HLJK9aYSKquKXGsIvhUF_IA6ONasuFwuY1HjxFA16rLdKc_R6cjXUWVbHNS2g2c05jO_Ek?purpose=fullsize)

### Module 6 — Genetic Algorithm Engine

Core Module

Purpose: Candidate timetables ko evolve karke better solutions dhoondhna.

- Selection: Tournament selection

- Crossover: Parents se offspring banana

- Mutation: Assignments mein controlled changes

- Elitism: Best candidates ko preserve karna

- Generations loop

- Best solution tracking

- Stopping conditions

Suggested file: `genetic_algorithm/engine.py`

Output: Optimized candidate timetable.

![GitHub - Ignisolver/The-Optimization-Algorithm-for-the-University-Timetabling-Problem · GitHub](https://images.openai.com/static-rsc-4/cZ5D_vYQhfeF1orxBKoy_11pMB5zG9qzhncJqsmxYZr4c0Y-w_yja6bbYX93pQcoDa9tUZAzEiJhtMgejLSWwvTRsC9n5w0OT44pTg6RH1vfvqwfaLOu_gXbmjj5O_THEPJ0KfGyu4ejzn03FQroDR9GGmRc4vO7TN3h6AWNWfwMsF0-qB79flE4lGXWqews?purpose=fullsize)

### Module 7 — Timetable Viewer & Results

Phase 3

Purpose: Generated timetable ko readable format mein display karna.

- Weekly timetable grid

- Section, teacher aur room filters

- Class detail panel

- Timetable status

- Best fitness aur soft penalty

- Final independent validation

Output: Administrator ke liye usable timetable.

![Multilayer radiation shield for satellite electronic components protection | Scientific Reports](https://images.openai.com/static-rsc-4/2xRNp2PLKiSkV8hQ2RCo0MGbGoM5MrcD9rU9Fd1OmS5mrglWrtGUwYighpSsXGxB8CAyk3yZCceozQFqkc7AV8PE0Ho71VWoli9sEYVsaS0ispg0gBDajf6rMzkK3v_NL22R2QMmyEMB-VxzMVIBrcTaEKyCyZJm0CUJx_mkOrdsRKLw4P-38wMxMNsC3PYy?purpose=fullsize)

### Module 8 — Progress & Fitness Analytics

Phase 3

Purpose: GA ki progress monitor karna.

- Current generation / total generations

- Best fitness

- Average fitness

- Hard conflict count

- Progress bar

- Best aur average fitness convergence chart

- Execution time

Output: Actual GA data par based analytics.

![Ray Tune: Distributed Hyperparameter Optimization at Scale](https://images.openai.com/static-rsc-4/ifbewlmN_Tv2f7XLfnH-XHgtqPi7aJtR0k6CsYZ0FQaR647SVNMIa4y2JMCMMA12G8wfJ9_KY-WKyWAj35t1b_9H6Bs29cvGXRJKzB7cnO20rIKt7s0g8uf7BG6tkjWhYuzlXqTRJPoGfm0bV4hMpA_2GVYxJwl6bV4fX-hlRsL-pGJEkV54iC1mqGSPhzgf?purpose=fullsize)

### Module 9 — Experiments & Parameter Comparison

Phase 3

Purpose: Different GA settings ka effect compare karna.

- Population size change karna

- Mutation aur crossover rates adjust karna

- Generations aur elitism configure karna

- Kam az kam 5 independent runs

- Results table

- Selected runs ke convergence charts compare karna

Output: Academic experimentation aur comparison report.

![How I made my Excel timetable sync to Google Calendar - Tronic247](https://images.openai.com/static-rsc-4/aXvT44rLtJpRhOBG4luc1CkQT2l2ueu6W-q8XoXLidigsctoqgFCd2BRkbBqS3YtXYvQHPJxbs0SG-Zk0pQlLhMjoYuRNGdZjmfsZwYFfxyAxfcTb81mXsihSd8NVBVZNRNERDs8oaSVKMlafH_ofR5fM6zMzd0OMZ2AQ-zhsJyhRe1asN57jUuEFcx0Mf5j?purpose=fullsize)

### Module 10 — Reports & Export

Phase 3

Purpose: Results ko application se bahar use karna.

- Timetable CSV export

- Excel workbook export

- Hard aur soft conflict reports

- GA parameters report

- Fitness history

- Experiment results

Python libraries: `pandas` aur `openpyxl`.

Output: Downloadable aur shareable reports.

![FastAPI Path Operations for Teams - Other Models - SQLModel](https://images.openai.com/static-rsc-4/xQT6YnZ2QzMOZEzNpFJ7fd3EbnQIcAYBNIwC5jkWuaLvS76guEKoc_vRQfooWZRxvSlkoko8h0shVWKb6EZIWXJflSXnF2eqRe0XY7rg43plrhXyi-4VNZy2MmJ9BYoLlQH7MO3sWq44sxXdGPgfeWKV-v-8wipr2kiaU_09yv2SD4VUJ2IqbWOiyjtg276k?purpose=fullsize)

### Module 11 — Backend API & Database Integration

Parallel Development

Purpose: Flutter frontend, Python logic aur database ko connect karna.

- FastAPI endpoints

- SQLite models aur relationships

- CRUD operations

- Request validation

- Timetable generation endpoint

- Run history aur fitness history persistence

- Error handling

Output: Complete data flow from Flutter to Python and SQLite.

![The playwright window maximizes and views responsively. | by GuRu-DGS | Devmap | Jan, 2026 | Medium](https://images.openai.com/static-rsc-4/Qz99xiwvA97T22B1B6FrBkq61ABBVGWagwL_uxUFuREZ5g53JGqT6IPkaDXqTC0oK0SDMaJAVe69RCxBcIRM7NCZuF55kzRfyR1hE5By5D2ZIYGKTqJfrKAX1oB_zj_qwP716viyFBmE6CNAC6TDVEU_954jArSb7AHYLjmQgtzZAeDFnOqwyLt1VsRvDTHu?purpose=fullsize)

### Module 12 — Testing, Settings & Finalization

Final Phase

Purpose: Project ko submission aur demonstration ke liye ready karna.

- Unit tests for GA operators

- Hard-constraint validation tests

- API integration tests

- Responsive UI testing

- Empty, loading aur error states

- Import/export testing

- Settings screen

- Documentation, screenshots aur demo dataset

Output: Tested, documented university project.

### Development order

Is order mein kaam karna sab se practical rahega:

### 01

Foundation

Dashboard, navigation, theme

### 02

Academic data

Courses, teachers, rooms, sections, slots

### 03

GA foundation

Encoding, random population, fitness

### 04

Optimization

Selection, crossover, mutation, elitism

### 05

Validation

Hard conflicts, soft penalties, final checks

### 06

Results

Timetable viewer, progress, convergence chart

### 07

Experiments

5+ runs and parameter comparisons

### 08

Delivery

Exports, testing, reports, presentation

### Recommended project folder structure

```text
SmartSched/
├── frontend/
│   └── lib/
│       ├── main.dart
│       ├── app.dart
│       ├── core/
│       │   ├── theme/
│       │   ├── routing/
│       │   └── services/
│       ├── models/
│       ├── widgets/
│       └── features/
│           ├── dashboard/
│           ├── courses/
│           ├── teachers/
│           ├── rooms/
│           ├── sections/
│           ├── time_slots/
│           ├── constraints/
│           ├── timetable/
│           ├── generate/
│           ├── experiments/
│           ├── reports/
│           └── settings/
│
├── backend/
│   └── app/
│       ├── main.py
│       ├── api/
│       ├── models/
│       ├── schemas/
│       ├── database.py
│       ├── services/
│       └── genetic_algorithm/
│           ├── encoding.py
│           ├── population.py
│           ├── fitness.py
│           ├── selection.py
│           ├── crossover.py
│           ├── mutation.py
│           ├── elitism.py
│           ├── validation.py
│           └── engine.py
│
├── data/
│   └── sample_dataset.json
├── tests/
├── docs/
├── requirements.txt
└── README.md
```

### Sab se important baat

Project ka sab se mushkil aur important hissa Modules 4, 5 aur 6 hain. Sirf achha UI banane se GA project complete nahi hoga. Tumhein chromosome encoding, fitness calculation aur genetic operators ko correctly implement karna hoga.

Ek zaroori technical point: tumhare fitness function mein hard conflicts ko soft penalties se alag evaluate karo. Sirf low soft penalty aane ka matlab ye nahi ke timetable valid bhi hai. Final timetable ko independently validate karna zaroori hai.

Meri recommendation: Sab se pehle Module 1 aur Module 2 complete karo. Uske baad Python mein ek chhota working GA banao jo sample data par timetable generate kare. Phir usko Flutter app ke saath connect karo. Is tarah tumhara project manageable rahega aur debugging bhi asaan hogi.
