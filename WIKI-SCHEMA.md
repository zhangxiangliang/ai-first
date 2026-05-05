# Wiki Schema

This file is the local schema for applying the [LLM Wiki](LLM-WIKI.md) pattern to AI-first product and software development.

`LLM-WIKI.md` defines the upstream idea. This file defines how agents should operate in this repository.

## Goal

Make project knowledge durable, navigable, and executable so a human or AI agent can enter the repository later and reconstruct:

- what is being built
- why it is being built
- what has been confirmed
- what is still uncertain
- how implementation should proceed
- where source evidence lives
- what reusable knowledge has been promoted to the wiki

This repository should not pretend the AI knows information that was never captured. "Complete knowledge" means complete relative to the recorded raw inputs, workspace documents, wiki pages, and implementation repositories.

## Knowledge Layers

```text
raw inputs
  -> workspace phase documents
  -> reusable wiki knowledge
  -> implementation tasks
```

### Raw Inputs

Raw inputs are original materials and must remain unmodified except for file naming or metadata wrappers needed to preserve provenance.

Examples:

- customer chat transcripts
- bug tickets
- screenshots or exported notes
- meeting notes
- third-party docs
- stakeholder requests

Rules:

- Do not rewrite raw input content.
- Do not remove ambiguity from raw inputs.
- If a raw input needs explanation, add a separate note in `discovery/`, `context/`, or `requirements/`.
- Preserve source, date, author/requestor, and capture method whenever available.

### Workspace Documents

Workspace documents turn raw inputs, research, context, requirements, technical plans, implementation notes, and reviews into durable project knowledge.

Each project, module, or major feature gets a workspace:

```text
workspaces/<workspace-name>/
```

The full reference lifecycle is:

```text
raw-input -> discovery -> context -> requirements -> tech-spec -> implementation -> review
```

This lifecycle is a reference path, not a mandatory sequence. Each phase can be used independently when that is the right amount of process for the task. For example, a workspace may contain only `discovery/`, only `context/`, only `implementation/`, or any subset of phases.

The rule is: choose the lightest phase set that preserves useful traceability.

### Wiki

The wiki stores stable, reusable knowledge that should survive beyond one project phase or workspace.

Examples:

- product concepts that apply across modules
- domain vocabulary
- architecture decisions
- reusable technical patterns
- recurring customer constraints
- confirmed cross-project conclusions

Do not use the wiki as the only place for active project execution state. Active state belongs in the relevant workspace.

Wiki pages should be organized by topic directories as the knowledge base grows. Avoid keeping every page in one flat directory.

Recommended starting categories:

```text
wiki/
├── index.md
├── log.md
├── conventions/
├── design/
├── scaffold/
└── workflow/
```

Add new topic directories when a group of pages has a stable shared theme.

## Workspace Structure

```text
workspaces/<workspace-name>/
├── README.md
├── raw-input/
├── discovery/
├── context/
├── requirements/
├── tech-spec/
├── implementation/
└── review/
```

Create only folders that contain real files. Every created folder should contain a `README.md` explaining its role and current contents.

## Workflow Router

Choose the smallest workflow that preserves traceability.

| Situation | Suggested Path |
|-----------|----------------|
| Clear small implementation | `implementation` |
| Bug or support ticket | `raw-input -> implementation -> review` |
| Bug with unclear expected behavior | `raw-input -> discovery -> requirements -> implementation -> review` |
| Clear product feature | `requirements -> tech-spec -> implementation -> review` |
| Ambiguous product work | `raw-input -> discovery -> context -> requirements` |
| Architecture or cross-module change | `context -> tech-spec -> implementation -> review -> wiki promotion` |
| Research only | `discovery` or `discovery -> context` |
| Documentation or knowledge update | `context -> wiki promotion` |

If the suggested path feels too heavy, record a `Phase Shortcut` or `Phase Scope` instead of forcing the full path.

## Phase Semantics

### 1. Raw Input

Purpose: preserve original source material.

Output:

- unchanged source files
- source metadata
- links to related inputs

Exit criteria:

- source is captured
- provenance is clear
- no interpretation has been mixed into the raw text

### 2. Discovery

Purpose: understand the problem before converting it into requirements.

Discovery may be a standalone task. It does not need to produce requirements if the current goal is only research, investigation, option analysis, or knowledge gathering.

Typical content:

- stakeholder analysis
- open questions
- domain research
- competing interpretations
- assumptions
- risks
- cross-workspace relationships

Exit criteria:

- major unknowns are listed
- key terms are defined or linked
- relevant wiki pages and workspace context are identified
- if no follow-up phase is needed, the stopping point is explicit

### 3. Context

Purpose: give humans and AI enough background to reason correctly.

Context may be created independently to document project, product, domain, or technical background even when there is no immediate implementation task.

Typical content:

- product background
- business rules
- relevant code areas
- current behavior
- known constraints
- related workspaces
- links to reusable wiki pages

Exit criteria:

- an AI agent can understand the module without rereading every raw input
- context distinguishes confirmed facts from assumptions
- cross-project knowledge that is stable has been promoted or linked to the wiki

### 4. Requirements

Purpose: convert raw inputs and discovery into confirmed PRD-style requirements.

Requirements may start directly from a clear user request, ticket, or existing context. They do not always require a separate discovery phase.

Typical content:

- goal
- users or actors
- user stories
- functional requirements
- non-functional requirements
- acceptance criteria
- in scope
- out of scope
- dependencies
- open questions

Exit criteria:

- requirements are unambiguous
- acceptance criteria are testable
- open questions are either resolved or explicitly deferred
- stakeholder approval status is recorded

Do not generate a tech spec from unclear requirements unless the tech spec explicitly marks unresolved assumptions.

### 5. Tech Spec

Purpose: translate confirmed requirements into an implementation design.

Tech specs usually depend on requirements, but for narrow technical changes they may be lightweight or skipped when implementation intent is already explicit.

Typical content:

- current system analysis
- proposed approach
- data model changes
- API changes
- UI changes
- migration plan
- task breakdown
- testing strategy
- rollback plan
- implementation risks

Exit criteria:

- requirements are mapped to technical tasks
- affected repositories and files are identified where possible
- review status is recorded
- unresolved assumptions are visible

Do not treat a tech spec as approved until review status says it is approved.

### 6. Implementation

Purpose: track execution after the tech spec is approved.

Implementation may start directly for small, clear, operational, or user-directed tasks.

Typical content:

- implementation plan
- task status
- session log
- changed files
- test results
- deviations from the tech spec
- decisions made during implementation

Exit criteria:

- all planned tasks are complete or explicitly deferred
- verification evidence is recorded
- deviations are reflected back into requirements, tech spec, or wiki when durable

### 7. Review

Purpose: verify that the implementation satisfies the requirements and tech spec.

Review may also be standalone, such as reviewing an existing implementation, auditing a module, or checking whether current behavior matches known expectations.

Typical content:

- acceptance checklist
- test evidence
- reviewer notes
- bugs found
- sign-off
- follow-up work

Exit criteria:

- acceptance criteria are checked
- test status is recorded
- final decision is explicit: approved, changes requested, or rejected

## Agent Operating Workflows

### Startup Workflow

When beginning work:

1. Read `LLM-WIKI.md`.
2. Read this schema.
3. Read `AGENT-RULES.md` for hard local rules.
4. Identify the active workspace.
5. Read the workspace `README.md`.
6. Read only the relevant phase documents.
7. Read relevant wiki pages through `wiki/index.md`.
8. Read implementation code only after project intent and context are clear.

### Ingest Workflow

Use ingest when new raw material or durable conclusions need to be integrated.

Steps:

1. Capture the source in `raw-input/` if it is original material.
2. Extract key facts, requests, constraints, questions, and contradictions.
3. Update `discovery/` for analysis and unresolved questions.
4. Update `context/` for background needed by future agents.
5. Update `requirements/` only when the statement is ready to become product intent.
6. Promote stable reusable knowledge to `wiki/`.
7. Update `wiki/index.md` if wiki navigation changes.
8. Append `wiki/log.md` when wiki knowledge changes.

Do not skip from raw input directly to implementation unless the task is trivial, already explicit, or the user has intentionally requested direct execution.

When skipping phases, record the reason in the active document. For example:

```md
## Phase Shortcut

**Started At:** implementation
**Skipped Phases:** discovery, requirements, tech-spec
**Reason:** User provided an explicit implementation task with no open product ambiguity.
**Risk:** No formal PRD traceability for this change.
```

### Self-Driven Ingest Queue

Workspace documents should include a visible section when they may produce reusable knowledge:

```md
## Wiki Promotion Candidates

- [ ] wiki/<topic>/<page>.md — Stable conclusion to promote
- [x] wiki/<topic>/<existing-page>.md — Already promoted
```

Then run:

```sh
./scripts/update-ingest-queue.sh
```

This generates `wiki/ingest-queue.md`, which is the queue of pending durable knowledge candidates.

When a candidate has been promoted, check off the item in the source workspace document.

Self-driven ingest does not mean scripts decide what is true. It means the scaffold can automatically surface visible, human-readable promotion candidates that humans or AI agents must review.

### Query Workflow

Use query when answering questions.

Steps:

1. Classify the question: product, requirement, technical, implementation, process, or historical.
2. Read the relevant workspace phase documents.
3. Read relevant wiki pages for reusable knowledge.
4. Read raw inputs only when evidence or exact wording matters.
5. Read code only when implementation truth is needed.
6. Answer with source awareness: distinguish confirmed facts, assumptions, and unknowns.
7. If the answer creates a durable conclusion, propose updating the wiki or workspace.

### Lint Workflow

Use lint to keep the knowledge system healthy.

Check for:

- requirements without raw input or approval status
- tech specs created from unclear requirements
- implementation notes that are not reflected in review
- durable conclusions trapped in workspace documents but missing from wiki
- wiki pages missing from `wiki/index.md`
- stale wiki pages with old claims
- contradictions between raw inputs, requirements, tech specs, and wiki
- missing cross-links between related workspaces
- files that mix raw source text with interpretation

Report findings before making broad rewrites.

## Promotion Rules

Promote information to the wiki when it is:

- reusable across workspaces
- stable enough to guide future work
- a domain concept, decision, pattern, or constraint
- likely to be needed by agents outside the current project

Keep information in the workspace when it is:

- active project state
- a draft requirement
- an unresolved question
- implementation progress
- review feedback
- specific to one module and not yet reusable

## Document Status

Every major lifecycle document should show status near the top:

```md
**Status:** Draft | In Review | Approved | Superseded
**Owner:** <person or agent>
**Updated:** YYYY-MM-DD
```

Use `Superseded` instead of deleting important historical documents.

## Traceability

Traceability should be useful, not ceremonial. Use it to answer: "Where did this claim come from, and what does it affect?"

Record links between:

- raw inputs and discovery observations
- discovery findings and requirements
- requirements and tech spec tasks
- tech spec tasks and implementation notes
- implementation evidence and review decisions
- stable conclusions and wiki pages

For requirements, prefer a source traceability table:

```md
## Source Traceability

| Requirement | Source | Notes |
|-------------|--------|-------|
| ADMIN-REQ-001 | ../raw-input/customer-chat-2026-05-05.md | Confirmed by customer |
```

Requirement and ticket IDs are scoped by workspace to avoid collisions.

Recommended format:

```text
<WORKSPACE-PREFIX>-REQ-001
<WORKSPACE-PREFIX>-TICKET-001
```

Examples:

```text
ADMIN-REQ-001
ADMIN-TICKET-001
CLAIMS-REQ-001
CLAIMS-TICKET-001
```

The prefix should be derived from the workspace name and kept stable. Do not use bare `REQ-001` or `TICKET-001` across multiple workspaces.

## Decisions

Record decisions when a choice affects future work.

Use workspace documents for local decisions and wiki pages for stable reusable decisions.

Recommended format:

```md
## Decisions

| Date | Decision | Reason | Scope |
|------|----------|--------|-------|
| YYYY-MM-DD | [Decision] | [Why] | workspace | wiki | repo |
```

## Knowledge Gaps

Do not hide missing information. Record gaps explicitly.

Recommended format:

```md
## Knowledge Gaps

- [ ] [Missing information]
  - Impact: [What this blocks or risks]
  - How to resolve: [Who or what source can answer it]
```

## Naming

- Persistent files are written in English.
- File names use kebab-case.
- Workspace names use kebab-case.
- Prefer specific file names such as `admin-role-requirements.md` over vague names such as `notes.md`.

## Scaffold Health Checks

Run the scaffold lint script after structural changes:

```sh
./scripts/lint-scaffold.sh
```

The lint script checks required root files, template coverage, workspace phase README files, wiki index coverage, and `git diff --check`.

Wiki index coverage includes nested pages under topic directories.

## Review Gates

Do not advance phases silently.

- Full-flow work: `requirements -> tech-spec` requires requirements to be clear enough to implement.
- Full-flow work: `tech-spec -> implementation` requires tech spec review approval or explicit user instruction.
- Standalone phases are allowed. A workspace may intentionally stop at discovery, context, requirements, tech-spec, implementation, or review.
- Direct implementation work is allowed when the task is small, already clear, operational, or explicitly requested by the user.
- `implementation -> review` requires implementation notes and verification evidence when review is in scope.
- `review -> done` requires acceptance criteria status when review is in scope.

If a user asks to proceed despite missing gates, record the exception in the relevant document.

## Workflow Depth

Choose the lightest workflow that preserves traceability. These are examples, not exhaustive rules.

| Task Type | Minimum Path |
|-----------|--------------|
| Ambiguous product work | `raw-input -> discovery -> context -> requirements -> tech-spec -> implementation -> review` |
| Clear feature with known context | `requirements -> tech-spec -> implementation -> review` |
| Small clear change | `implementation -> review` |
| Bug with a ticket | `raw-input -> requirements -> implementation -> review` |
| Operational cleanup | `implementation` |
| Research only | `discovery -> context` |
| Standalone investigation | `discovery` |
| Context capture only | `context` |
| Requirements drafting only | `requirements` |
| Technical planning only | `tech-spec` |
| Review or audit only | `review` |
| Durable knowledge update | `raw-input -> wiki` or `context -> wiki` |

If a shortcut creates durable knowledge, update the relevant workspace or wiki after implementation.

## Phase Independence

When using a phase independently, record:

```md
## Phase Scope

**Current Phase:** discovery
**Standalone:** Yes
**Reason:** This task is only a research investigation; no implementation is currently requested.
**Inputs:** <raw inputs, wiki pages, code areas, or user prompt>
**Expected Output:** <discovery note, context update, recommendation, etc.>
**Next Phase:** None | context | requirements | tech-spec | implementation | review
```

This keeps flexible work explicit without forcing an artificial end-to-end process.

## Limits

This schema improves continuity, but it does not make the AI actually omniscient. The system is only as complete as the captured materials and maintained documents. If knowledge is missing, the correct behavior is to identify the gap, not invent certainty.
